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
<title>아이디찾기</title>
<style>
    
</style>
<script>
 $(() => {
    $('#findUserId').click(() => {
        if(isVal($('#userName')) && isVal($('#phone'))) {
        	let user = {
        			userName: $('#userName').val(),
        			phone: $('#phone').val()
        	}
        	
        	$.ajax({
        		url: '/findId',
        		method: 'post',
        		data : user,
        		dataType : 'text',
        		success: function(text) {
        			if(text != null) {
        				confirmModal('회원님의 아이디는 ' + text + ' 입니다.', 'login')
        			} else {
        				confirmModal('존재하는 회원이 없습니다.')
        			}
        		},
        		error: confirmModal('존재하는 회원이 없습니다.')
        	})
        }
    })
})
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
        <div class='col text-center me-4'>
            <b>아이디 찾기</b>
        </div>
    </nav>
</div>
<div class='container text-center'>
    <div class='row p-3'>
        <div class='col p-5'>
            <div class='row p-2'>
                <div class='col'>
                    <input type='text' id='userName' name='userName' class='form-control' placeholder='이름'>
                </div>
            </div>      
            <div class='row p-2'>
                <div class='col'>
                    <input type='text' id='phone' name='phone' class='form-control' placeholder="전화번호 ('-'제외)">
                </div>
            </div>
            <div class='row p-3'>
                    <button type='button' id='findUserId' class='btn btn-orange'>아이디 찾기</button>
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
</body>
</html>