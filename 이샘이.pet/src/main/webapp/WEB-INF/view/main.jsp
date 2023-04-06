<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%
	String userId = (String)session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel='stylesheet' href='res/project.css'>
<script src='res/projectJs.js'></script>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<!-- https://zelkun.tistory.com/entry/004-jQuery-%EC%8B%9C%EB%8F%84%EC%8B%9C%EA%B5%B0%EA%B5%AC%EC%9D%8D%EB%A9%B4%EB%8F%99%EC%9D%84-%EC%9D%B4%EC%9A%A9%ED%95%9C-selectbox-%EC%A0%9C%EC%96%B4-with-%EA%B8%B0%EC%83%81%EC%B2%AD-%EB%8F%99%EB%84%A4%EC%98%88%EB%B3%B4 -->
<script type="application/javascript" src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
<title>main</title>
<style>

</style>
<script>
$(() => {
	let completionStatusMsg = '마감'
	$('.completionStatus').eq(0).text(completionStatusMsg)
	completionStatusMsg = '모집중'
	$('.completionStatus').eq(1).text(completionStatusMsg)
	
	let title = '4시에 신원시장 앞 산책해요!'
	$('.meetingTitle').eq(0).text(title)
	title = '퍼피퍼니 애견카페 2시 모임!'
	$('.meetingTitle').eq(1).text(title)
	
	let meetingDateTime = '2025-03-15 오후 4:00'
	$('.meetingDateTime').eq(0).text(meetingDateTime)
	meetingDateTime = '2025-03-16 오후 2:00'
	$('.meetingDateTime').eq(1).text(meetingDateTime)
	
	let recruited = 5
	let totalRecruitment = 5
	let percentage = 100 * recruited / totalRecruitment
	$('.progress-bar').eq(0).text(Math.floor(percentage) + '%')
	$('.progress-bar').eq(0).css('width', percentage + '%')
	$('.participantStatus').eq(0).text('인원 ' + recruited + '/' + totalRecruitment)
	recruited = 2
	totalRecruitment = 4
	percentage = 100 * recruited / totalRecruitment
	$('.progress-bar').eq(1).text(Math.floor(percentage) + '%')
	$('.progress-bar').eq(1).css('width', percentage + '%')
	$('.participantStatus').eq(1).text('인원 ' + recruited + '/' + totalRecruitment)
	
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
		
		var addressCode = sido.val() + ' ' + sigugun.val() + ' ' + dong.val(); // 읍면동코드
		jQuery('#addressCode').text(addressCode);
		
		getMeetingsByAddress(sido.val(), sigugun.val(), dong.val())
	});
})

function fn_option(code, name) {
    return '<option value="' + code + '">' + name + '</option>';
}

function getMeetingsByAddress(sido, sigugun, dong) {
	$('#meetings').empty()
	
	let address = {
		sidoId: sido,
		sigunguId: sigugun,
		dongId: dong
	}
	
	$.ajax({
		url: 'meeting/getMeetingsByAddress',
		method: 'post',
		data: address,
		dataType: 'json',
		success: meetings => {
			if(meetings.length) {
				const meetingArr = []
				
				$.each(meetings, (i, meeting) => {
					meetingArr.push(
						`<div class='mb-2'>
							<div class="card" type="button" onclick="location.href='meeting/viewById/` + meeting.meetingId + `'">
								<div class="card-body">
									<div class='row'>
										<div class='col'>
											<div class='row'>
												<div class='col-3'>
													<b><mark class='bg-orange'><span class='completionStatus'>` + 
													(new Date() > new Date(meeting.meetingTime) ? "완료" : meeting.applicantNumber == meeting.recruitmentNumber ? "마감" : "모집중") +
													`</span></mark></b>
												</div>
												<div class='col'>
													<h6 class="card-title"><b><span class='meetingTitle'>` + meeting.meetingTitle + `</span></b></h6>
												</div>
											</div>
											<div class="row">
												<div class='col-3'></div>
												<div class='col'>
													<input type='datetime-local' class='form-control' name='meetingDateTime' id='meetingDateTime' style='border:none; background: none;' value='` + meeting.meetingTime + `' disabled/>
												</div>
											</div>
											<div class='row'>
												<div class="col-8 pt-1">
													<div class='progress'>
														<div class='progress-bar progress-bar-striped progress-bar-animated bg-primary' role='progressbar' ` + 
														"style='width:" + 100 * meeting.applicantNumber / meeting.recruitmentNumber + '%' + ";'>" +
														Math.floor(100 * meeting.applicantNumber / meeting.recruitmentNumber) + '%' + `</div>
													</div>
												</div>
												<div class="col-4 d-flex justify-content-center">
													<div class='mt-1 align-baseline d-flex justify-content-start participantStatus'>` +
													'인원 ' + meeting.applicantNumber + '/' + meeting.recruitmentNumber + `</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>`
					)
				})
				
				$('#meetings').append(meetingArr.join(''))
			} else {
				$('#meetings').append(`<p class='text-center text-secondary mt-3'>모임이 없습니다.</p>`)
			}
		}
	})
}

function getAllMeetingsData() {
	$.ajax({
		url: 'meeting/getAllMeetings',
		dataType: 'json',
		success: meetings => {
			if(meetings.length) {
				const meetingArr = []
				
				$.each(meetings, (i, meeting) => {
					meetingArr.push(
						`<div class='mb-2'>
							<div class="card" type="button" onclick="location.href='meeting/viewById/` + meeting.meetingId + `'">
								<div class="card-body">
									<div class='row'>
										<div class='col'>
											<div class='row'>
												<div class='col-3'>
													<b><mark class='bg-orange'><span class='completionStatus'>` + 
													(new Date() > new Date(meeting.meetingTime) ? "완료" : meeting.applicantNumber == meeting.recruitmentNumber ? "마감" : "모집중") +
													`</span></mark></b>
												</div>
												<div class='col'>
													<h6 class="card-title"><b><span class='meetingTitle'>` + meeting.meetingTitle + `</span></b></h6>
												</div>
											</div>
											<div class="row">
												<div class='col-3'></div>
												<div class='col'>
													<input type='datetime-local' class='form-control' name='meetingDateTime' id='meetingDateTime' style='border:none; background: none;' value='` + meeting.meetingTime + `' disabled/>
												</div>
											</div>
											<div class='row'>
												<div class="col-8 pt-1">
													<div class='progress'>
														<div class='progress-bar progress-bar-striped progress-bar-animated bg-primary' role='progressbar' ` + 
														"style='width:" + 100 * meeting.applicantNumber / meeting.recruitmentNumber + '%' + ";'>" +
														Math.floor(100 * meeting.applicantNumber / meeting.recruitmentNumber) + '%' + `</div>
													</div>
												</div>
												<div class="col-4 d-flex justify-content-center">
													<div class='mt-1 align-baseline d-flex justify-content-start participantStatus'>` +
													'인원 ' + meeting.applicantNumber + '/' + meeting.recruitmentNumber + `</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>`
					)
				})
				
				$('#meetings').append(meetingArr.join(''))
			} else {
				$('#meetings').append(`<p class='text-center text-secondary mt-3'>모임이 없습니다.</p>`)
			}
		}
	})
}

function init() {
	getAllMeetingsData()
}

$(init)
</script>
</head>
<body>
<div class='row d-flex justify-content-end'>
    <nav class="navbar fixed-top bg-orange p-2">
<%
if(userId == null) {
%>
	 <form action='login'>
	       <button type='submit' class="loginBtn navbar-brand link-black">로그인</button>   
	 </form>
<%} else {%>
 	<a href='logout' class='logoutBtn'>로그아웃</a>
<%} %>
        <div class='col text-center me-4'>
            <b>산책하개</b>
        </div>
        <div class='mt-2 mb-1'>
            <span type='button' class="material-symbols-outlined" onclick='location.href="./notice/01.html"'>
                campaign
            </span>
            <span type='button' class="material-symbols-outlined" onclick="location.href='./alarm/01.html'">
                notifications
            </span>
        </div>
    </nav>
</div>
<div class='container'>
<div class='row'>
    <div class='col'>
        <form method='post'>
            <div class='row'>
                <div class='col mt-2'>
                    <div class='row mt-4 '>
                        <div class='col'>
                            <h5><b>지역선택</b></h5>
                        </div>
                    </div>
                    <div class='row'>
                        <div class='col'>
                            <div class='row'>
                                <div class='col'>
                                    <select class='form-select' name='sido' id='sido'>
                                        <option value=''>시/도</option>
                                    </select>
                                </div>
                                <div class='col'>
                                    <select class='form-select' name='sigugun' id='sigugun'>
                                        <option value=''>시/군/구</option>
                                    </select>
                                </div>
                                <div class='col'>
                                    <select class='form-select' name='dong' id='dong'>
                                        <option value=''>읍/면/동</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class='row mt-5 mb-1'>
                <div class='col'>
                    <h5><b>모임</b></h5>
                </div>
            </div>
            <div class='row mt-auto'>
                <div class='col'>
                    <div id='meetings'>
                    </div>
                </div>
            </div>
        </form>   
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
            <li class="nav-item" type="button" onclick="location.href='./user/mypage.html'">
                <span class="material-symbols-outlined">
                    person
                </span>
            </li>    
        </div>
    </div>
</nav>
</body>
</html>