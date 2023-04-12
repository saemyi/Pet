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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<title>회원정보수정</title>
<style>

</style>
<script>
$(() => {
    $('#nickNameCheck').click(() => {
    confirmModal('사용가능한 닉네임 입니다.')})

    $('#changeUser').click(() => {
    confirmModal('회원정보가 수정되었습니다.<br> MYPAGE로 이동합니다.', 'mypage.html')})
})
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
    <div class='row'>
      <div class='col mb-3'>
            <div class="wrapper d-flex justify-content-center">
                <div id="UploadProfileBtn" type='button' class='box text-align-center'>
                    <p class='mt-5'>프로필이미지</p>
                </div>
            </div>
        <input type='file' id='UploadProfile' hidden>
    </div>
    </div>
    <form id='userForm'>
        <div class='row'>
            <div class='col-8'>
                <input type='text' class='form-control mb-3' id='nickName' placeholder='닉네임' value='user1' maxlength='20'>
            </div>
            <div class='col-4'>
                <button type='button' class='btn btn-lightgray form-control' id='nickNameCheck'>중복확인</button>
            </div>
        </div>
        <div class='row'>
            <div class='col'>
                <input type='text' class='form-control mb-3' id='phoneNum' value='01012341234' placeholder="전화번호('-'제외)">
            </div>
        </div>
        <div class='row'>
            <div class='col'>
                <input type='email' class='form-control mb-5' id='email' value='dog1232@naver.com' placeholder='이메일'>
            </div>
        </div>
        <div class='row'>
            <div class='col'>
                <input type='text' id='sample6_address' class='form-control mb-3' value='서울 관악구 신림동' placeholder='주소'>
            </div>
        </div>
        <div class='row'>
            <div class='col-8 mb-3'>
                <input type='text' id='sample6_detailAddress' class='form-control' value='202호' placeholder='상세주소'>
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
                <input type='date' class='form-control' id='birthday' placeholder='생년월일'/>
            </div>
        </div>
        <div class='row mb-3'>
            <div class='col'>
                <textarea class='form-control' placeholder='자기소개' maxlength='200'></textarea>
            </div>
        </div>
    </form>
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
            <li class="nav-item" type="button" onclick="location.href='mypage.html'">
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