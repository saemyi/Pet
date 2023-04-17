<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC' crossorigin='anonymous'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js' integrity='sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM' crossorigin='anonymous'></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'>
<script src='../../res/projectJs.js'></script>
<link rel='stylesheet' href='../../res/admin.css'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script type="application/javascript" src="../../res/hangjungdong.js"></script>
<title>유저상세</title>
<style>
 td {
 	text-align: left;
 } 
</style>
<script>
let imageFilename;
$(() => {
	$('#fixLogo').click(() => {
        logoModal( '<form id="logoForm" encType="multipart/form-data" action="../../../logo/add"  method="post">' + 
        				'<input type="file" name="file" id="imageFilename"/>'+
        		   '</form>' 
        )
    })
    
    $('#fixBtn').click(() => {
    	 let logo ={
    		imageFilename: $('#imageFilename').val() 
    	} 
     	$.ajax({
         	url: 'logo/add',
         	method: 'post',
         	data: logo,
         	success: $('#logoForm').submit() 	   
    	 })
    	 location.replace("/admin")
     })
        
    let name = '${user.userProfileImageFilename}'
    
    if(name) {
    	$('#profile').html(`<img class="image-thumbnail pt-1" src ="/attach/${user.userProfileImageFilename}"/>`)
    }else {
    	$('#profile').html(`<div class='box text-center image-box' id='userProfileImage'></div>
		        <div class='col-7 mb-3'>
	            <h5><b id='userNickname'></b></h5><hr>
	            <p id='userIntro'></p>
	        	</div>`)
	    $('#profile').html("<p class='mt-5'>프로필이미지</p>")
    }
    let userIntro = `${user.userIntro}`
    if(!userIntro) {
    	userIntro = '유저 소개가 없습니다.'
    } 
    $('#userIntro').text(userIntro)
    
    let isSuspended = ${user.isSuspended}
    let hasAdminRights = ${user.hasAdminRights}
    let str = '${user.phone}'
    let phone = str.substring(0,3) + '-' + str.substring(3,7) + '-' + str.substring(7,11)
    $('#phone').text(phone)
    if(hasAdminRights == 1) {
    	$('#isSuspended').text('관리자')
    	$('#changeAdmin').text('관리자권한 해제')
    	$('#addBenUser').css('display', 'none')
    }else if(isSuspended == 1){
    	$('#isSuspended').text('이용정지')
    	$('#addBenUser').text('이용정지 해제')
    	$('#changeAdmin').css('display', 'none')
    }else {
    	$('#isSuspended').text('일반회원')
		$('#changeAdmin').text('관리자권한 부여')
		$('#addBenUser').text('이용정지')
    } 
    $('#benUser').hide()
    
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

function adminPetList() {
	$.ajax({
		url: '../pet/get/${user.userId}' ,
		success: petList => {
			if(petList.length){
				pets = []
				petList.forEach(pet => {
					let petProfileImageFilename = pet.petProfileImageFilename
					let petIntro = pet.petIntro
					if(!petIntro){
						petIntro = '반려견 소개가 없습니다.'
					} else 
					if(petProfileImageFilename) {
						pets.unshift(
								'<table class="table text-center mb-4">' +
									'<tbody>' +
										'<tr style="height: 1rem;">' + 
					                    	'<td class="petBox image-box" rowspan="2" style="height: 8rem; width: 8rem; border: .1rem solid;">' +
					                    		'<div class=image-box>' +
													'<img class="image-thumbnail" src="/attach/' + pet.petProfileImageFilename + '"/>' +
					                    		'</div>' +
											'</td>' +
					                    '<th style ="width: 10rem;">이름</th><td class="text-start">' + pet.petName + '</td>' +
						                '</tr>' +
						                '<tr>' +
					                    	'<th>소개</th><td class="text-start"><pre>' + petIntro + '</pre></td>' +
					    	            '</tr>' +
					                '</tbody>' +
					             '<table>'
								)
					} else {
						pets.unshift(
								'<table class="table text-center mb-4">' +
									'<tbody>' +
										'<tr style="height: 1rem;">' + 
					                    	'<td class="petBox image-box" rowspan="2" style="height: 147px; width: 147px; border: .1rem solid;">' +
					                    			'<p class="text-center mt-5">펫 프로필이미지</p>' +
											'</td>' +
					                    '<th style ="width: 10rem;">이름</th><td class="text-start">' + pet.petName + '</td>' +
						                '</tr>' +
						                '<tr>' +
					                    	'<th>소개</th><td class="text-start"><pre>' + petIntro + '</pre></td>' +
					    	            '</tr>' +
					                '</tbody>' +
					             '<table>'
								)
							}
							$('#pets').append(pets.join(''))
					})
			}else $('#pets').append(
					`<p class="text-center">펫이 없습니다.</p>`
			)
		}
	})
}

function adminMeetingList() {
	$.ajax({
		url: '../meeting/get/${user.userId}',
		success: meetings => {
			if(meetings.length){
				const meetingArr = []
				$.each(meetings, (i, meeting) => {
					$('#sido').val(meeting.sidoId).trigger('change')
					$('#sigugun').val(meeting.sigunguId).trigger('change')
					$('#dong').val(meeting.dongId).trigger('change')
					console.log(meeting.sidoId)
					console.log($('#sido option:selected').text())
					meetingArr.push(
				`<table class="table text-center mb-4">
					<tbody>
						<tr>
		                    <th style="width: 8rem;">제목</th><td class="text-start">` + meeting.meetingTitle + `</td> 
		                    <th>모임시간</th><td class="text-start"><input type="datetime-local" style="border:none; background: none; font-size: 12px;" class="form-control p-0" value="` + meeting.meetingTime + `"disabled/></td>
		                </tr>
		                <tr>
		                    <th>장소</th><td class="text-start">` + $("#sido option:selected").text() + " " + $("#sigugun option:selected").text() + " " + $("#dong option:selected").text() + 
		                    `</td><th style="width: 8rem;">참석인원/모집인원</th><td class="text-start">` + meeting.applicantNumber + `/` + meeting.recruitmentNumber + `</td>
		                </tr>
		                <tr>
		                    <th>내용</th>
		                    <td class="text-start" colspan="3"><pre>` + 
		                        meeting.meetingContent +
		                    `</pre></td>
		                </tr>
		             </tbody>
	             </table>`
					)
				})
				
				$('#meetings').append(meetingArr.join(''))
			}else $('#meetings').append(
					`<p class="text-center">만든 모임이 없습니다.</p>`
			)
			$('#sigugun').css("display", "none")
		}
	})
}

function goPage() {
	location.replace("./${user.userId}") 
}

function init() {
	$(adminPetList)
	$(adminMeetingList)
		let hasAdminRights = ${user.hasAdminRights}
	$('#changeAdmin').click(() => {
		if(hasAdminRights == 0){
		$('#modalMsg').text('관리자 권한을 부여하시겠습니까?')
    	$('#modalBtn').hide()
    	$('#logoBtn').hide()
    	$('#benUser').hide()
    	$('#modalBtnDouble').show()
    	$('#modal').modal('show')
		} else {
			$('#modalMsg').text('관리자 권한을 해제하시겠습니까?')
	    	$('#modalBtn').hide()
	    	$('#logoBtn').hide()
	    	$('#benUser').hide()
	    	$('#modalBtnDouble').show()
	    	$('#modal').modal('show')
		}
		})
		
	$('#okBtn').click(() => {
		let hasAdminRights = ${user.hasAdminRights}
		if(hasAdminRights == 0) {
			hasAdminRights = 1
			user = {
				userId : "${userId}",
				hasAdminRights : hasAdminRights 
			}			
			$.ajax({
				url: '../changeAdmin',
				method: 'put',
				contentType:'application/json',
				data: JSON.stringify(user),
				success: goPage
			})
		} else {
			hasAdminRights = 0
			user = {
					userId : "${userId}",
					hasAdminRights : hasAdminRights
				}
			
			$.ajax({
				url: '../changeAdmin',
				method: 'put',
				contentType:'application/json',
				data: JSON.stringify(user),
				success: goPage
			})
		}
	})
	
	$('#userNameFix').click(() => {
		if(isVal($('#userName'))){
			user = {
					userId : "${userId}",
					userName : $('#userName').val()
				}
				
				$.ajax({
					url: '../userNameFix',
					method: 'put',
					contentType: 'application/json',
					data: JSON.stringify(user),
					success: goPage
				})	
		}
	})
	
	$('#addBenUser').click(() => {
		let isSuspended = ${user.isSuspended}
		if(isSuspended == 1) {
			$('#modalMsg').text('회원을 이용정지해제하시겠습니까?')
	    	$('#modalBtn').hide()
	    	$('#logoBtn').hide()
	    	$('#benUser').show()
	    	$('#modalBtnDouble').hide()
	    	$('#modal').modal('show')	
		} else {
			$('#modalMsg').text('회원을 이용정지시키시겠습니까?')
	    	$('#modalBtn').hide()
	    	$('#logoBtn').hide()
	    	$('#benUser').show()
	    	$('#modalBtnDouble').hide()
	    	$('#modal').modal('show')
		}
	})
	
	$('#benOkBtn').click(() => {
		let isSuspended = ${user.isSuspended}
		if(isSuspended == 0) {
			isSuspended = 1
		user = {
			userId: "${userId}",
			isSuspended : isSuspended
		}
			
		$.ajax({
			url: '../benUser',
			method: 'put',
			contentType: 'application/json',
			data: JSON.stringify(user),
			success: goPage
		})
		
		} else {
			isSuspended = 0
			user = {
					userId: "${userId}",
					isSuspended : isSuspended
				}
			
				$.ajax({
					url: '../benUser',
					method: 'put',
					contentType: 'application/json',
					data: JSON.stringify(user),
					success: goPage
				})
		}
	})
	}
	$(init)
</script>
</head>
<body>
<div class='container wrap'>
<div class='row mb-4'>
    <div class='col'>
        <div class='row'>
            <nav class="navbar navbar-expand navbar-light nav-header">
                <div class="container-fluid">
                    <a class="navbar-brand" href="../../admin"><b>산책하개</b></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                        <a class="nav-link" href="../../admin">회원</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="../meeting/list">모임</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="../notice">공지</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="../report">신고</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" type='button' id='fixLogo'>로고변경</a>
                        </li>
                    </ul>
                    </div>
                    <div>
                        <a class="nav-link a-gray" href="../../logout"><small>로그아웃</small></a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<div class='row'>
    <div class='col'>
        <form>
            <div class='row mb-3'>
                <div class='col pt-3'>
                    <span class='label'><b>회원정보</b></span>
                </div>
                <div class='col'>
                    <div class='gap-2 d-flex justify-content-end'>
                        <button type='button' class='btn botton-orange' id='changeAdmin'></button>
                        <button type='button' class='btn botton-orange' id='addBenUser'></button>
                        <button type='button' class='btn botton-orange' id='userNameFix'>수정</button>
                    </div> 
                </div>
            </div>
        </form>
        <hr>
    </div>
</div> 
<div class='row md'>
    <div class='col'>
        <table class='table text-center'>
            <tbody>
                <tr>
                    <td class='pt-4' rowspan='5' style='border-right: .1rem solid; width: 9rem;'>
                    <div class="image-box d-flex justify-content-center" id='profile'>
                        
                    </div>
                    </td> 
                    <th style="width: 10rem;">이름</th><td><input type='text' style='border: none;' id='userName' placeholder='이름' value='${user.userName}'></td><th style='width: 15rem;'>생년월일</th><td>${user.birthdate}</td>
                </tr>
                <tr>
                    <th>닉네임</th><td>${user.nickname}</td><th>이메일</th><td>${user.email}</td>
                </tr>
                <tr>
                    <th>아이디</th><td>${user.userId }</td><th>전화번호</th><td id='phone'></td>
                </tr>
                <tr>
                    <th>주소</th><td>${user.address}&nbsp;${user.detailedAddress}</td><th>관리자권한 및 이용정지</th><td id='isSuspended'></td>
                </tr>
                <tr>
                    <th>소개</th><td colspan='3'><pre id='userIntro'></pre></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div class='row mt-5'>
    <div class='col'>
        <span class='label'><b>펫정보</b></span>
    </div>
</div>
<hr>
<div class='row md'>
    <div class='col' id='pets'>
        
    </div>
</div>
<div class='row mt-5'>
    <div class='col'>
        <span class='label'><b>모임</b></span>
    </div>
</div>
<hr>
<div class='row md'>
    <div class='col' id='meetings'>
            
    </div>
</div>
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
                <button type='button' class='btn btn-orange' id='okBtn'>네</button>
            </div>
            <div class='modal-footer' id='benUser'>
                <button type='button' class='btn btn-lightgray' id='noBtn' data-bs-dismiss="modal">
                    아니오
                </button>
                <button type='button' class='btn btn-orange' id='benOkBtn'>네</button>
            </div>
            <div class='modal-footer' id='logoBtn'>
                <button type='button' class='btn btn-lightgray' id='closeBtn' data-bs-dismiss="modal">
                    취소
                </button>
                <button type='button' class='btn btn-orange' id='fixBtn' data-bs-dismiss="modal">변경</button>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>