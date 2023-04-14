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
<script type="application/javascript" src="res/hangjungdong.js"></script>
<title>main</title>
<style>

</style>
<script>
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
		url: 'meeting/getMeetings',
		method: 'post',
		data: address,
		dataType: 'json',
		success: meetings => {
			if(meetings.length) {
				const meetingArr = []
				
				$.each(meetings, (i, meeting) => {
					meetingArr.push(
						`<div class='mb-2'>
							<div class="card" type="button" onclick="location.href='meeting/` + meeting.meetingId + `'">
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
	getMeetingsByAddress(undefined, undefined, undefined)
}

$(init)
</script>
</head>
<body onunload="">
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
            <span type='button' class="material-symbols-outlined" onclick='location.href="./notice"'>
                campaign
            </span>
            <span type='button' class="material-symbols-outlined" onclick="location.href='./alarm'">
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
            <li class="nav-item" type="button" onclick="location.href='./user/mypage'">
                <span class="material-symbols-outlined">
                    person
                </span>
            </li>    
        </div>
    </div>
</nav>
</body>
</html>