<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js'></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<!-- https://zelkun.tistory.com/entry/004-jQuery-%EC%8B%9C%EB%8F%84%EC%8B%9C%EA%B5%B0%EA%B5%AC%EC%9D%8D%EB%A9%B4%EB%8F%99%EC%9D%84-%EC%9D%B4%EC%9A%A9%ED%95%9C-selectbox-%EC%A0%9C%EC%96%B4-with-%EA%B8%B0%EC%83%81%EC%B2%AD-%EB%8F%99%EB%84%A4%EC%98%88%EB%B3%B4 -->
<script type="application/javascript" src="../res/hangjungdong.js"></script>
<link rel='stylesheet' href='../res/project.css'>
<script src='../res/projectJs.js'></script>
<script>
let isParticipationCancel = false

$(() => {
	//sido option 추가
	jQuery.each(hangjungdong.sido, function (idx, code) {
		//append를 이용하여 option 하위에 붙여넣음
		jQuery('#sido').append(fn_option(code.sido, code.codeNm));
	});
	
	//sido 변경시 시군구 option 추가
	jQuery('#sido').change(function () {
		jQuery('#sigugun').show();
		jQuery('#sigugun').empty();
		jQuery('#sigugun').append(fn_option('', '시/군/구')); //
		jQuery.each(hangjungdong.sigugun, function (idx, code) {
			if (jQuery('#sido > option:selected').val() == code.sido)
				jQuery('#sigugun').append(fn_option(code.sigugun, code.codeNm));
		});
		
		//세종특별자치시 예외처리
		//옵션값을 읽어 비교
		if (jQuery('#sido option:selected').val() == '36') {
			jQuery('#sigugun').hide();
			//index를 이용해서 selected 속성(attr)추가
			//기본 선택 옵션이 최상위로 index 0을 가짐
			jQuery('#sigugun option').eq(1).attr('selected', 'selected');
			//trigger를 이용해 change 실행
			jQuery('#sigugun').trigger('change');
		}
		
		jQuery('#dong').empty();
		jQuery('#dong').prepend(fn_option('', '읍/면/동'));
		jQuery('#dong option').eq(0).attr('selected', 'selected');
	});
	
	//시군구 변경시 행정동 옵션추가
	jQuery('#sigugun').change(function () {
		//option 제거
		jQuery('#dong').empty();
		jQuery.each(hangjungdong.dong, function (idx, code) {
			if (jQuery('#sido > option:selected').val() == code.sido && jQuery('#sigugun > option:selected').val() == code.sigugun)
				jQuery('#dong').append(fn_option(code.dong, code.codeNm));
		});
		//option의 맨앞에 추가
		jQuery('#dong').prepend(fn_option('', '읍/면/동'));
		//option중 선택을 기본으로 선택
		jQuery('#dong option').eq(0).attr('selected', 'selected');
	});
	
	jQuery('#dong').change(function () {
		var sido = jQuery('#sido option:selected');
		var sigugun = jQuery('#sigugun option:selected');
		var dong = jQuery('#dong option:selected');
		
		var addressText = sido.text() + ' ' + sigugun.text() + ' ' + dong.text(); // 시도/시군구/읍면동 이름
		jQuery('#addressText').text(addressText);
		$('#sidoNm').text(sido.text())
		$('#sigugunNm').text(sigugun.text())
		$('#dongNm').text(dong.text())
		
		var addressCode = sido.val() + ' ' + sigugun.val() + ' ' + dong.val(); // 읍면동코드
		jQuery('#addressCode').text(addressCode);
	});
})

function fn_option(code, name) {
    return '<option value="' + code + '">' + name + '</option>';
}

function processMeetingData() {
	$.ajax({
		url: 'get',
		dataType: 'json', // response body 안에 있는 데이터 타입. 생략가능
		// method 생략: get
		success: meeting => {
			$('#meetingTitle').text(meeting.meetingTitle)
			$('#meetingContent').val(meeting.meetingContent)
			$('#meetingDateTime').val(meeting.meetingTime)
			$('#recruitmentNumber').text(meeting.recruitmentNumber)
			$('#applicantNumber').text(meeting.applicantNumber)
			$('#userId').text(meeting.userId)
			$('#sido').val(meeting.sidoId).trigger('change')
			$('#sigugun').val(meeting.sigunguId).trigger('change')
			$('#dong').val(meeting.dongId).trigger('change')
			
			let recruited = parseInt($('#applicantNumber').text())
			let totalRecruitment = parseInt($('#recruitmentNumber').text())
			let percentage = 100 * recruited / totalRecruitment
			$('.progress-bar').eq(0).text(Math.floor(percentage) + '%')
			$('.progress-bar').eq(0).css('width', percentage + '%')
			
			// 모집중, 마감, 완료
			let completionStatusMsg
			if (new Date() > new Date($('#meetingDateTime').val())) {
				completionStatusMsg = '완료'
			} else if (recruited == totalRecruitment) {
				completionStatusMsg = '마감'
			} else {
				completionStatusMsg = '모집중'
			}
			$('#completionStatus').text(completionStatusMsg)
			
			if ("${userId}" == meeting.userId) {
				$('#editBtn').show()
				$('#deleteBtn').show()
				$('#participateBtn').hide()
			} else {
				$('#editBtn').hide()
				$('#deleteBtn').hide()
				$('#participateBtn').show()
			}
			
//			$('#userId').css("display", "none")
//			$('#sido').css("display", "none")
			$('#sigugun').css("display", "none")
//			$('#dong').css("display", "none")
		}
	})
	
	let info = {
		meetingId: ${lastMeetingId},
		userId: "${userId}"
	}
	
	$.ajax({
		url: 'getMeetingByIdAndParticipant',
		method: 'post',
		data: info,
		dataType: 'json',
		error: meeting => {
			isParticipationCancel = false
			$('#participateBtn').text('참여신청')
			$('#participateBtn').addClass('btn-orange')
			$('#participateBtn').removeClass('btn-secondary')
		},
		success: meeting => {
			isParticipationCancel = true
			$('#participateBtn').text('참여취소')
			$('#participateBtn').removeClass('btn-orange')
			$('#participateBtn').addClass('btn-secondary')
		}
	})
}

function moveToMain() {
	window.location.href = "/"
}

function init() {
	processMeetingData()
	
	$('#editBtn').click(() => {
		window.location.href = "fix"
	})
	
	$('#deleteBtn').click(() => {
		yesNoModal('모임을 삭제하시겠습니까?')
	})
	
	$('#okBtn').click(() => {
		$.ajax({
			url: 'del/' + "${lastMeetingId}",
			method: 'delete',
			success: moveToMain
		})
		
		$('#modal').modal('hide')
	})
	
	$('#participateBtn').click(() => {
		if (isParticipationCancel) {
			if (new Date() > new Date($('#meetingDateTime').val())) {
				confirmModal('모임이 완료되었습니다.')
			} else {
				let info = {
						meetingId: ${lastMeetingId},
						userId: "${userId}",
						applicantNumber: parseInt($('#applicantNumber').text()) - 1 
				}
				
				$.ajax({
					url: '../participant/delParticipant',
					method: 'post',
					data: info,
					success: processMeetingData
				})
				
				$.ajax({
					url: '../participant/fixApplicantNumber',
					method: 'post',
					data: info,
					success: processMeetingData
				})
			}
		} else {
			if (new Date() > new Date($('#meetingDateTime').val())) {
				confirmModal('모임이 완료되었습니다.')
			} else if (isParticipationCancel == false && $('#recruitmentNumber').text() == $('#applicantNumber').text()) {
				confirmModal('모임이 마감되었습니다.')
			} else {
				let info = {
						meetingId: ${lastMeetingId},
						userId: "${userId}",
						applicantNumber: parseInt($('#applicantNumber').text()) + 1 
				}
				
				$.ajax({
					url: '../participant/addParticipant',
					method: 'post',
					data: info,
					success: processMeetingData
				})
				
				$.ajax({
					url: '../participant/fixApplicantNumber',
					method: 'post',
					data: info,
					success: processMeetingData
				})
			}
		}
	})
}

$(init)
</script>
<title>모임</title>
<style>
</style>
</head>
<body>
	<div class='row d-flex justify-content-end'>
		<nav class="navbar fixed-top bg-orange p-3">
			<div class='row'>
				<div class='col d-flex justify-content-start'>
					<i class='bi bi-chevron-left' onclick="history.back();"></i>
				</div>
			</div>
			<div class='col text-center me-4'>
				<b>모임상세조회</b>
			</div>
		</nav>
	</div>
<div class='container'>
<div class='row'>
	<div class='col'>
		<div class='row pt-3' style='background-color: rgb(245, 244, 252);'>
			<div class='col'>
				<div class='mb-3 text-center text-secondary'>
					<h6><b><mark class="bg-orange">
						<span id='completionStatus'></span></mark>
						<span id='meetingTitle'></span></b>
					</h6>
				</div>
			</div>
		</div>
		<hr>
		<div class='row'>
			<div class='col'>
				<div class='row'>
					<div class='col-2 p-2 text-center'>
						<b>장 소</b>
					</div>
					<div class='col p-2'>
						<span id='sidoNm'></span>
						<span id='sigugunNm'></span>
						<span id='dongNm'></span>
					</div>
				</div>
			</div>
		</div>
		<div class='row'>
			<div class='col'>
				<div class='row'>
					<div class='col-2 p-2 text-center'>
						<label for='meetingDateTime'><b>일 시</b></label>
					</div>
					<div class='col'>
						<input type='datetime-local' class='form-control' name='meetingDateTime' id='meetingDateTime' style='border:none; background: none;' disabled/>
					</div>
				</div>
			</div>
		</div>
		<div class='row d-flex justify-content-center'>
			<div class='col-9'>
				<div class='mb-3 p-1'>
					<div class='progress'>
						<div class='progress-bar progress-bar-striped progress-bar-animated' role='progressbar' style='width: 0%; font-size: 1rem;'></div>
					</div>
				</div>
			</div>
			<div class='col-3'>
				<div class='mb-3 align-baseline d-flex justify-content-start' id='participantStatus'>
					<a href="/participant/participantView" style="text-decoration: none; color: black;"><b class="text-primary">
						<span id='applicantNumber'></span>/<span id='recruitmentNumber'></span>
					</b><small>참여중</small></a>
				</div>
			</div>
		</div>
		<div class='row'>
			<div class='col'>
				<div class='mb-3'>
					<textarea class='form-control' rows='10' name='meetingContent' id='meetingContent' style='background: none;' disabled></textarea>
				</div>
			</div>
		</div>
		<div class='row'>
			<div class='col'>
				<div class='d-grid d-flex justify-content-end mb-3'>
					<div class='col-10'>
						<div class='d-grid d-flex justify-content-end mb-4'>
							<button type='button' class='btn btn-muted btn-sm' id='editBtn'>
								수정
							</button>
							<button type='button' class='btn btn-muted btn-sm' id='deleteBtn'>
								삭제
							</button>
						</div>
					</div>
					<div class='col p-1' onclick="location.replace(/comment/+ ${lastMeetingId})">
						<small>댓글</small>
						<i class="bi bi-chat-square-text"></i>
					</div>
				</div>
			</div>
		</div>
		<div class='row'>
			<div class='col'>
				<div class='d-grid gap-2 mb-3'>
					<button type='button' class='btn' id='participateBtn'>
					</button>
				</div>
			</div>
		</div>
		<div class='row'>
			<div class='col'>
				<span id='userId' style='display:none;'></span>
				<div class='row'>
					<div class='col'>
						<select class='form-select' name='sido' id='sido' style='display:none;'>
							<option value=''>시/도</option>
						</select>
					</div>
					<div class='col'>
						<select class='form-select' name='sigugun' id='sigugun' style='display:none;'>
							<option value=''>시/군/구</option>
						</select>
					</div>
					<div class='col'>
						<select class='form-select' name='dong' id='dong' style='display:none;'>
							<option value=''>읍/면/동</option>
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<div class='modal fade' id='modal'>
	<div class='modal-dialog modal-dialog-centered'>
		<div class='modal-content'>
			<div class='modal-header'>
				<button type='button' class='btn-close' data-bs-dismiss="modal"></button>
			</div>
			<div class='modal-body'>
				<p id='modalMsg'></p>
			</div>
			<div class='modal-footer' id='modalBtn'>
				<button type='button' class='btn btn-orange' id='confirmBtn' data-bs-dismiss="modal">확인</button>
			</div>
			<div class='modal-footer' id='modalBtnDouble'>
				<button type='button' class='btn btn-lightgray' id='noBtn' data-bs-dismiss="modal">
					아니오
				</button>
				<button type='button' class='btn btn-orange' id='okBtn' data-bs-dismiss="modal">네</button>
			</div>
		</div>
	</div>
</div>
<nav class="navbar fixed-bottom bg-orange">
    <div class="container-fluid pt-3">
        <div>
            <li class="nav-item" type="button" onclick="location.href='/meeting/add'">
                <span class="material-symbols-outlined">
                    add
                </span>
            </li>
        </div>
        <div>
            <li class="nav-item" type="button" onclick="location.href='/'">
                <span class="material-symbols-outlined">
                    format_list_bulleted
                </span>
            </li>
        </div>
        <div>
            <li class="nav-item" type="button" onclick="location.href='../user/mypage'">
                <span class="material-symbols-outlined">
                    person
                </span>
            </li>    
        </div>
    </div>
</nav>
</body>
</html>