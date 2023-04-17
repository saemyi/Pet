<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js'></script>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet'>
<link rel='stylesheet' href='../res/project.css'>
<script src='../res/projectJs.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<title>산책하개</title>
<style>
   
</style>
<script>
$(() => {        
	err("#userId", userId_pw_check, ".result-userId", '<small class="errMsg">4자이상 20자이하 영어소문자, 숫자 조합으로 입력하세요.</small>')
  	err("#password", userId_pw_check, ".result-password", '<small class="errMsg">4자이상 20자이하 영어소문자, 숫자 조합으로 입력하세요.</small>')
  	
  	$("#loginBtn").click(() => {
  		if(isVal($('#userId')) && isVal($('#password')) && $('.errMsg').length == 0) {
  			$('#loginForm').submit();
  		}
  	})  
})

function getImage(){
	$.ajax({
	   	url: 'logo/get',
		success: logo => {
			if(logo){
				$('#getLogoImage').attr('src', '<c:url value="/attach/'+ logo.imageFilename +'"/>')
				$('#emptyLogo').hide()
			}else{
				$('#emptyLogo').show()
				$('#getLogoImage').hide() 
			}
		}
  	})
}

$(getImage)
</script> 
</head>
<body>
<div class='container'>
    <div class='row mt-5'>
        <div class='col'>
        <form method='post' id='loginForm'>
            <div class='row'>
                <div class='col d-flex justify-content-center'>
                    <div id='emptyLogo' class='logoBox p-5'>
                        <p class='d-flex text-center ms-3 mt-5 p-5'>로고이미지</p>
                    </div> 
                    <div>
                    	<img class='getLogoBox' id='getLogoImage'/>
                    </div>
                </div>
            </div>
            <div class='row mt-5 mb-2'>
            <div class='col'>
                <div class='d-flex justify-content-center'>
                    <input type='text' class='form-control' value='${user.userId}' name='userId' id='userId' placeholder='아이디'/>
                </div>
                <div id="errorMsg" class="result-userId result-check"></div>
            </div>
        </div>
        <div class='row'>
            <div class='col'>
                <div class='d-flex justify-content-center'>
                    <input type='password' class='form-control' name='pw' id='password' placeholder='비밀번호' autocomplete="off"/>
                </div>
                <div id="errorMsg" class="result-password result-check"></div>
            </div>
        </div>
        <div class='row mb-3'>
            <div class='col d-md-none'>
                <input type='checkbox' class='mt-3 d-inline' name='rememberMe'/> 아이디 저장
            </div>
        </div>
        <div class='text-center' id='errMsg'>
        	<small style='color:red;'>${requestScope.errMsg}</small>
        </div>
        <div class='row mb-3'>
            <div class='col'>
                <button type='button' id='loginBtn' class='btn btn-warning col-12'>로그인</button>
            </div>
        </div>
        <div class='row'>
            <div class='col'>
                <div class='gap-2 d-flex justify-content-center d-md-none'>
                    <button type='button' class='form-control' onclick="location.href='findId'">ID 찾기</button>
                    <button type='button' class='form-control' onclick="location.href='04.html'">PW 찾기</button>
                    <button type='button' class='form-control'><a href='userJoin' style='text-decoration: none; color: black;'>회원가입</a></button>
                </div>
            </div>
        </div>
    </form>
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
</body>
</html>