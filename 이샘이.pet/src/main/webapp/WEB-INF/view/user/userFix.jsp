<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200' />
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css'>
<link rel='stylesheet' href='../res/project.css'>
<script src='../res/projectJs.js'></script>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js'></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<title>회원정보수정</title>
<style>

</style>
<script>
$(() => {
	
	 err("#nickname", nickname_check, ".result-nickname", '<small class="errMsg" id="nicknameError">2자이상 8자이하 영어, 한글, 숫자 입력가능합니다.</small>')
	 err("#email", email_check, ".result-email", '<small class="errMsg">이메일 형식이 올바르지 않습니다.</small>')
	 err("#phone", phone_check, ".result-phone", '<small class="errMsg">' + "'-'" + '을 제외한 전화번호를 입력하세요.</small>')
	 
	 $('#nickname').change(function() {
		 $("input[name=checked_nickname]").val('');
	 })
	 
	$('#nicknameCheck').click(() => {
    	if($('#nicknameError').length != 0) {
    	
    	} else { 
	    	var nickname = $('#nickname').val();
	    	$.ajax({
	    		url:'/nicknameCheck',
	    		type:'post',
	    		data:{nickname:nickname},
	    		success: function(cnt) {
	    			if(isVal($('#nickname'))) {
		    			if(cnt == 0) {
		    				confirmModal('사용가능한 닉네임 입니다.')
		    				$("input[name=checked_nickname]").val('y');    				
		    			} else {
		    				confirmModal('이미 존재하는 닉네임 입니다.')
		    				$('#nickname').val('');
		    				$("input[name=checked_nickname]").val('');
		    			}
	    			} else confirmModal("닉네임 입력하세요.")
	    		},
	    		error:function() { 
	    			confirmModal('다시 시도해주세요.');
	    		}
	    	})
    	}
	})
	
    $('#changeUser').click(() => {
    	if(isVal($('#nickname')) && isVal($('#birthdate')) && isVal($('#phone')) && isVal($('#sample6_address')) 
				&& isVal($('#email')) && $('.errMsg').length == 0) {
    		if($("input[name=checked_nickname]").val() != 'y') {
    			confirmModal('닉네임 중복확인하세요.')
    		} else {
    			$('#userForm').submit()
    		}
    	}
    })
    
    $(document).on('click', '#UploadProfileBtn', function() {
    	$('#uploadProfile').click()
    });
})

function getUser() {
	$.ajax({
		url: '/getUser',
		dataType: 'json',
		success: user => {
			console.log(user)
			if(user.userProfileImageFilename != null) {
				$('#userInfo').html('<div type="button" id="UploadProfileBtn" class="box text-align-center userProfileImage"></div>')
				$('.userProfileImage').html("<img class='image-thumbnail userImage'/>")
				$('.userImage').attr('src', '<c:url value="/attach/'+ user.userProfileImageFilename + '"/>')
				$('#userProfileImageFilename').val(user.userProfileImageFilename)
			} else {
				$('#userInfo').html('<div id="UploadProfileBtn" type="button" class="box text-align-center userProfileImage"><p class="mt-5">프로필이미지</p></div>')
			}
				$('#nickname').val(user.nickname)
				$('#phone').val(user.phone)
				$('#email').val(user.email)
				$('#sample6_address').val(user.address)
				$('#sample6_detailAddress').val(user.detailedAddress)
				$('#birthdate').val(user.birthdate)
				$('#userIntro').val(user.userIntro)
		}
	})
}

function setThumbnail(event) {
	$('#image_container').empty();
	$('.userProfileImage').hide();
    var reader = new FileReader();

    reader.onload = function(event) {
    	var div = document.createElement("div");
    	div.setAttribute("class", "userProfileImage");
      	var img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        img.setAttribute("id", 'UploadProfileBtn');
        img.setAttribute("class", 'img-fluid image-thumbnail');
        img.setAttribute("style", 'width:130px; height:130px;');
        document.querySelector("div#image_container").appendChild(div).appendChild(img);
    };
    
    reader.readAsDataURL(event.target.files[0]);
  }

$(getUser)

</script>
</head>
<body>
<div class='row d-flex justify-content-end'>
    <nav class="navbar fixed-top bg-orange p-3">
        <div class='row'>
            <div class='col-3 d-flex justify-content-start'>
                <i class='bi bi-chevron-left' onclick="history.back();"></i>
            </div>
        </div>
        <div class='col-6 text-end me-3'>
            <b>회원정보 수정</b>
        </div>
        <div class='col-3 d-flex justify-content-end'>
            <button type='button' class='btn btn-muted' id='changeUser'>변경</button>
        </div>
    </nav>
</div>
<div class='container text-center'>
<form id='userForm' encType='multipart/form-data' action='/fix' method='post'>
    <div class='row'>
      <div class='col mb-3'>
            <div class="wrapper d-flex justify-content-center" id='userInfo'>
            </div>
            <div id="image_container"></div>
        <input type="file" id="uploadProfile" class='image' name='userProfile' accept="image/*" onchange="setThumbnail(event);" hidden/>
    	<input type='text' name='userProfileImageFilename' id='userProfileImageFilename' hidden/>
    </div>
    </div>
        <div class='row'>
            <div class='col-8'>
                <input type='text' class='form-control mb-3' id='nickname' name='nickname' placeholder='닉네임' maxlength='20'>
            </div>
            <div class='col-4'>
                <button type='button' class='btn btn-lightgray form-control' id='nicknameCheck'>중복확인</button>
                <input type="hidden" name="checked_nickname" value="y">
            </div>
            <div id="errorMsg" class="result-nickname result-check"></div>
        </div>
        <div class='row'>
            <div class='col'>
                <input type='text' class='form-control mb-3' id='phone' name='phone' placeholder="전화번호('-'제외)">
                <div id="errorMsg" class="result-phone result-check"></div>
            </div>
        </div>
        <div class='row'>
            <div class='col'>
                <input type='email' class='form-control mb-5' id='email' name='email' placeholder='이메일'>
            	<div id="errorMsg" class="result-email result-check"></div>
            </div>
        </div>
        <div class='row'>
            <div class='col'>
                <input type='text' id='sample6_address' class='form-control mb-3' name='address' placeholder='주소' readonly>
            </div>
        </div>
        <div class='row'>
            <div class='col-8 mb-3'>
                <input type='text' id='sample6_detailAddress' class='form-control' name='detailedAddress' placeholder='상세주소'>
                <input type='text' id='sample6_postcode' placeholder='우편번호' hidden>
                <input type='text' id='sample6_extraAddress' placeholder='참고항목' hidden>
            </div>
            <div class='col-4'>
                <button type='button' class='btn btn-lightgray form-control' onclick='sample6_execDaumPostcode()' value='주소 검색'>주소 검색</button>
            </div>
        </div>
        <div class='row mb-3'>
            <div class='col-3 p-2'>
                <label for='birtday'>생년월일</label>
            </div>
            <div class='col-9'>
                <input type='date' class='form-control' name='birthdate' id='birthdate' placeholder='생년월일'/>
            </div>
        </div>
        <div class='row mb-3'>
            <div class='col'>
                <textarea class='form-control' id='userIntro' name='userIntro' placeholder='자기소개' maxlength='200'></textarea>
            </div>
        </div>
    </form>
  </div>
<nav class="navbar fixed-bottom bg-orange">
    <div class="container-fluid pt-3">
        <div>
            <li class="nav-item" type="button" onclick="location.href='../../meeting/add'">
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
            <li class="nav-item" type="button" onclick="location.href='./mypage'">
                <span class="material-symbols-outlined">
                    person
                </span>
            </li>    
        </div>
    </div>
</nav>
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
</body>
</html>