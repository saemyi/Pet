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
<title>설정</title>
<style>

</style>
<script>
   $(() => {
    $('#logout').click(() => {
        yesNoModal('로그아웃 하시겠습니까?','../logout')})

    $('#delUser').click(() => {
    yesNoModal('회원탈퇴 후, 복구가 불가능합니다.<br>정말 탈퇴하시겠습니까?','../delUser')})    
})
</script>
<body>
<div class='row d-flex justify-content-end'>
    <nav class="navbar fixed-top bg-orange p-3">
        <div class='row'>
            <div class='col d-flex justify-content-start'>
                <i class='bi bi-chevron-left' onclick="history.back();"></i>
            </div>
        </div>
        <div class='col text-center me-4'>
            <b>설정</b>
        </div>
    </nav>
</div>
<div class='container'>
    <div class='row m-1'>
        <div class='col'>
            <div class='row mb-3'>
                <button type='button' class='btn btn-lightgray' onclick="location.href='../user/userFix'">회원정보수정</button>
            </div>
            <div class='row mb-3'>
                <button type='button' class='btn btn-lightgray'onclick="location.href='../pet/02.html'">반려견 관리</button>
            </div>
            <div class='row mb-3'>
                <button type='button' class='btn btn-lightgray' onclick="location.href='07.html'">비밀번호 변경</button>
            </div>
            <div class='row mb-3'>
                <button type='button' class='btn btn-lightgray' onclick="location.href='../alarm/02.html'">알람설정</button>
            </div>
            <div class='row mb-3'>
                <button type='button' class='btn btn-lightgray' onclick="location.href='/report'">신고</button>
            </div>
            <div class='row mb-3'>
                <button type='button' class='btn btn-lightgray' id='logout'>로그아웃</button>
            </div>
            <div class='row'>
                <button type='button' class='btn btn-lightgray' id='delUser'>회원탈퇴</button>
            </div>
        </div>
    </div>
</div>
<nav class="navbar fixed-bottom bg-orange">
    <div class="container-fluid pt-3">
        <div>
            <li class="nav-item" type="button" onclick="location.href='../meeting/add'">
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