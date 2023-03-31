<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%
		
%>
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
function userId_pw_check(input) {    
    var regex=/^[0-9a-z]{4,20}$/;
    return (input != '' && input != 'undefined' && regex.test(input)); 
}

$(() => {        
    $("#userId").blur(function(){
    var userId = $(this).val();
    if( userId == '' || userId == 'undefined') return;
    if(! userId_pw_check(userId) ) {
        $(".result-userId").html('<small>4자이상 20자이하 영어소문자, 숫자 조합으로 입력하세요.</small>').css('color', 'red');
        $(this).focus();
        return false;
    }else {
        $(".result-userId").text('');
    }
    });

    $("#password").blur(function(){
    var password = $(this).val();
    if( password == '' || password == 'undefined') return;
    if(! userId_pw_check(password) ) {
        $(".result-password").html('<small>4자이상 20자이하 영어소문자 숫자 조합으로 입력하세요.</small>').css('color', 'red');
        $(this).focus();
        return false;
    }else {
        $(".result-password").text('');
    }
    });
});
</script>
</head>
<body>
<div class='container'>
    <div class='row mt-5'>
        <div class='col'>
        <form method='post'>
            <div class='row'>
                <div class='col d-flex justify-content-center'>
                    <div class='logoBox p-5'>
                        <p class='d-flex text-center ms-3 mt-5 p-5'>로고이미지</p>
                    </div>
                </div>
            </div>
            <div class='row mt-5 mb-2'>
            <div class='col'>
                <div class='d-flex justify-content-center'>
                    <input type='text' class='form-control' value='${user.userId}' name='userId' id='userId' placeholder='ID'/>
                </div>
                <div id="error_id" class="result-userId result-check"></div>
            </div>
        </div>
        <div class='row'>
            <div class='col'>
                <div class='d-flex justify-content-center'>
                    <input type='password' class='form-control' name='pw' id='password' placeholder='PW' autocomplete="off"/>
                </div>
                <div id="error_pw" class="result-password result-check"></div>
            </div>
        </div>
        <div class='row mb-3'>
            <div class='col'>
                <input type='checkbox' class='mt-3 d-inline' name='rememberMe'/> 아이디 저장
            </div>
        </div>
        <div class='text-center'>
        	<small style='color:red;'>${requestScope.errMsg}</small>
        </div>
        <div class='row mb-3'>
            <div class='col'>
                <button type='submit' class='btn btn-warning col-12'>로그인</button>
            </div>
        </div>
        <div class='row'>
            <div class='col'>
                <div class='gap-2 d-flex justify-content-center'>
                    <button type='button' class='form-control' onclick="location.href='03.html'">ID 찾기</button>
                    <button type='button' class='form-control' onclick="location.href='04.html'">PW 찾기</button>
                    <button type='button' class='form-control' onclick="location.href='02.html'">회원가입</button>
                </div>
            </div>
        </div>
    </form>
    </div>
</div>
</div>
</body>
</html>