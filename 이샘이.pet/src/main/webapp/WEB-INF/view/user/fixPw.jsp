<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel='stylesheet' href='../res/project.css'>
<script src='../res/projectJs.js'></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script>

$(() => {
    $('#fixBtn').click(() => {
    	if($('#errPw').length == 0 && isVal($('#currentPw')) && isVal($('#password'))) {
		var pw = $('#currentPw').val()
    	
		   	$.ajax({
				url: '/findUser',
				method: 'post',
				data: {pw:pw},
				success: function(cnt) { 
					if(cnt == 1) {
						changePw()
					} else {
						confirmModal("헌재 비밀번호가 일치하지 않습니다.")
					}
				} 
			})
    	}
    })
    
    $('.btn-close').click(() => {
    	if($('#modalMsg').text() == "비밀번호 변경 완료! 다시 로그인해주세요.") {
    		location.href='/logout'
    	}
    }) 
    
    $('#confirmBtn').click(() => {
    	if($('#modalMsg').text() == "비밀번호 변경 완료! 다시 로그인해주세요.") {
    		location.href='/logout'
    	} 
    })
})  

function changePw() {
	 let user = {
         	pw: $('#password').val()
         }
	$.ajax({
		url: '/fixPw',
		method: 'put',
		contentType: 'application/json',
		data: JSON.stringify(user),
		success: confirmModal("비밀번호 변경 완료! 다시 로그인해주세요.")
	})
}

$(pwCheck)
</script>
<title>비밀번호 변경</title>
<style>
    
</style>
<body>
    <div class='row d-flex justify-content-end'>
        <nav class="navbar fixed-top bg-orange p-3">
            <div class='row'>
                <div class='col-3 d-flex justify-content-start'>
                    <i class='bi bi-chevron-left' onclick="history.back();"></i>
                </div>
            </div>
            <div class='col-6 text-end me-3'>
                <b>비밀번호 변경</b>
            </div>
            <div class='col-3 d-flex justify-content-end'>
                <button type='button' class='btn btn-muted' id='fixBtn'>변경</button>
            </div>
        </nav>
    </div>
<div class='container'>
    <div class='row pt-3 mt-5'>
        <div class='col mt-5'>
            <input type='password' class='form-control' id='currentPw' placeholder='현재 비밀번호' autocomplete="off"/>
        </div>
    </div>
    <div class='row mt-5'>
        <div class='col'>
            <input type='password' class='form-control mb-3 pw' name='pw' id='password' placeholder='비밀번호' autocomplete="off">
        </div>
    </div>
    <div class='row' id='confirmPw'>
        <div class='col text-center'>
            <input type='password' class='form-control mb-3 pw' id='pwCheck' placeholder='비밀번호 재확인' autocomplete="off"s>
        </div>
    </div>
</div>
<nav class="navbar fixed-bottom bg-orange">
    <div class="container-fluid pt-3">
        <div>
            <li class="nav-item" type="button" onclick="location.href='../meeting/02.html'">
                <span class="material-symbols-outlined">
                    add
                </span>
            </li>
        </div>
        <div>
            <li class="nav-item" type="button" onclick="location.href='../main.html'">
                <span class="material-symbols-outlined">
                    format_list_bulleted
                </span>
            </li>
        </div>
        <div>
            <li class="nav-item" type="button" onclick="location.href='../user/mypage.html'">
                <span class="material-symbols-outlined">
                    person
                </span>
            </li>    
        </div>
    </div>
</nav>
</body>
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
</html>