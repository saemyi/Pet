<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
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
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>회원가입</title>
<style>
    
</style> 
<script>
 $(() => {
	 err("#userId", userId_pw_check, ".result-userId", '<small class="errMsg" id="userIdError">4자이상 20자이하 영어소문자, 숫자 조합으로 입력하세요.</small>')
	 err("#nickname", nickname_check, ".result-nickname", '<small class="errMsg" id="nicknameError">2자이상 10자이하 영어, 한글, 숫자 입력가능합니다.</small>')
	 err("#password", userId_pw_check, ".result-password", '<small class="errMsg">4자이상 20자이하 영어소문자, 숫자 조합으로 입력하세요.</small>')
	 err("#userName", userName_check, ".result-userName", '<small class="errMsg">2자이상 10자이하 한글로 입력하세요.</small>')
	 err("#email", email_check, ".result-email", '<small class="errMsg">이메일 형식이 올바르지 않습니다.</small>')
	 err("#phone", phone_check, ".result-phone", '<small class="errMsg">' + "'-'" + '을 제외한 전화번호를 입력하세요.</small>')
	 
    $('#confirmPw').after('')
    $('#idCheck').click(() => {
    	if($('#userIdError').length != 0) {
    		
    	} else {
		   	var userId = $('#userId').val();
		   	$.ajax({
		   		url:'./idCheck',
		   		type:'post',
		   		data:{userId:userId},
		   		success: function(cnt) {
		   			if(isVal($('#userId'))) {
		   				if(cnt == 0) {
		       				confirmModal('사용가능한 아이디 입니다.')
		       				$("input[name=checked_id]").val('y');
		       			} else {
		       				confirmModal('이미 존재하는 아이디 입니다.')
		       				$("input[name=checked_id]").val('');
		       				$('#userId').val(''); 
		       			}
		   			} else confirmModal("아이디 입력하세요.")
		   		},
		   		error:function() {
		   			confirmModal('다시 시도해주세요.');
		   		}
		   	})
    	}
    })

    $('#nicknameCheck').click(() => {
    	if($('#nicknameError').length != 0) {
    	
    	} else {
	    	var nickname = $('#nickname').val();
	    	$.ajax({
	    		url:'./nicknameCheck',
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
	

	$('#nextBtn').click(() => {
		if(isVal($('#userId')) && isVal($('#nickname')) && isVal($('#userName')) && isVal($('#password')) 
				&& isVal($('#pwCheck')) && isVal($('#birthdate')) && isVal($('#phone')) && isVal($('#sample6_address')) 
				&& isVal($('#email')) && $('.errMsg').length == 0) {
			if($("input[name=checked_id]").val() != 'y') {
				confirmModal('아이디 중복확인 하세요.')
			} else if ($("input[name=checked_nickname]").val() != 'y') {
				confirmModal('닉네임 중복확인 하세요.')
			} else {
				$('#userJoinForm').submit();
			}
		} 
	})
	
 })
 
      function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.createElement("img");
          img.setAttribute("src", event.target.result);
          img.setAttribute("class", 'img-fluid circle');
          document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
      }
 
$(upLoadImg)
$(pwCheck)

</script>
</head>
<body>
    <div class='row d-flex justify-content-end'>
        <nav class="navbar fixed-top bg-white p-3">
            <div class='row'>
                <div class='col d-flex justify-content-start'>
                    <i class='bi bi-chevron-left' onclick="history.back();"></i>
                </div>
            </div>
            <div class='col text-center me-3'>
                <b>회원가입</b>
            </div>
        </nav>
    </div>
<div class='container text-center'>
<form method='post' encType='multipart/form-data' id='userJoinForm'>
    <div class='row'>
      <div class='col mb-3'>
            <div class="wrapper d-flex justify-content-center">
                <div id="uploadProfileBtn" type='button' class='circle'>
                	<div id="image_container"></div>
                </div>
            </div>
            <input type="file" id="uploadProfile" class='image' name='userProfile'  accept="image/*" onchange="setThumbnail(event);" hidden/>
        </div>
    </div>
        <div class='row'>
            <div class='col'>
                <input type='text' class='form-control mb-3' id='userName' name='userName' placeholder='이름'>
                <div id="errorMsg" class="result-userName result-check"></div>
            </div>
        </div>
        <div class='row'>
            <div class='col-8'>
                <input type='text' class='form-control mb-3' id='userId' name='userId' placeholder='아이디'>
            </div>
            <div class='col-4'>
                <button type='button' class='btn btn-lightgray form-control' id='idCheck'>중복확인</button>
                <input type="hidden" name="checked_id" value="">
            </div>
        </div>
        <div id="errorMsg" class="result-userId result-check"></div>
        <div class='row'>
            <div class='col-8'>
                <input type='text' class='form-control mb-3' id='nickname' name='nickname' placeholder='닉네임'>
            </div>
            <div class='col-4'>
                <button type='button' class='btn btn-lightgray form-control' id='nicknameCheck'>중복확인</button>
                <input type="hidden" name="checked_nickname" value="">
            </div>
        </div>
        <div id="errorMsg" class="result-nickname result-check"></div>
        <div class='row'>
            <div class='col'>
                <input type='password' class='form-control mb-3 pw' id='password' name='pw' placeholder='비밀번호' autocomplete="off">
                <div id="errorMsg" class="result-password result-check"></div>
            </div>
        </div>
        <div class='row' id='confirmPw'>
            <div class='col'>
                <input type='password' class='form-control mb-3 pw' id='pwCheck' name='pwcheck' placeholder='비밀번호 재확인' autocomplete="off">
            </div>
        </div>
        <div class='row'>
            <div class='col'>
                <input type='text' class='form-control mb-3' id='phone' name='phone' placeholder='전화번호'>
                <div id="errorMsg" class="result-phone result-check"></div>
            </div>
        </div>
        <div class='row'>
            <div class='col'>
                <input type='email' class='form-control mb-3' id='email' name='email' placeholder='이메일'>
                <div id="errorMsg" class="result-email result-check"></div>
            </div>
        </div>
        <div class='row'>
            <div class='col'>
                <input type='text' id='sample6_address' class='form-control mb-3' name='address' placeholder='주소' readonly/>
            </div>
        </div>
        <div class='row'>
            <div class='col-8 mb-3'>
                <input type='text' id='sample6_detailAddress' class='form-control' placeholder='상세주소' name='detailedAddress'>
                <input type='text' id='sample6_postcode' placeholder='우편번호' hidden>
                <input type='text' id='sample6_extraAddress' placeholder='참고항목' hidden>
            </div>
            <div class='col-4'>
                <button type='button' class='btn btn-lightgray form-control' value='주소 검색' onclick="sample6_execDaumPostcode()">주소 검색</button>
            </div>
        </div>
        <div class='row '>
            <div class='col-3 p-2'>
                <label for='birtday'>생년월일</label>
            </div>
            <div class='col-9'>
                <input type='date' class='form-control' id='birthdate' name='birthdate' placeholder='생년월일'/>
            </div>
        </div>
        <div class='row mb-1'>
            <div class='col'>
                <span id='errMsg'></span>
            </div>
        </div>
        <div class='row p-3'>
            <button type='button' id='nextBtn' class='btn btn-orange'>다음</button>
        </div>
    </form>
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
</body>
</html>

