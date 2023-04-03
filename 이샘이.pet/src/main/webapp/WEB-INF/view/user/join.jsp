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
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<title>회원가입</title>
<style>
    
</style>
<script>
 $(() => {

    $('#confirmPw').after('')
    $('#idCheck').click(() => {
            confirmModal('사용가능한 아이디 입니다.')
    })

    $('#nicknameCheck').click(() => {
        confirmModal('사용가능한 닉네임 입니다.')})
})

$(upLoadImg)

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
    <div class='row'>
      <div class='col mb-3'>
            <div class="wrapper d-flex justify-content-center">
                <div id="uploadProfileBtn" type='button' class='circle'>
                    <img src='../res/defaultUserProfile.png' class='img-fluid circle'/>
                </div>
            </div>
        <input type='file' id='uploadProfile' hidden>
        </div>
    </div>
    <form id='userForm'>
        <div class='row'>
            <div class='col'>
                <input type='text' class='form-control mb-3' id='userName' name='userName' placeholder='이름'>
            </div>
        </div>
        <div class='row'>
            <div class='col-8'>
                <input type='text' class='form-control mb-3' id='userId' name='userId' placeholder='아이디'>
            </div>
            <div class='col-4'>
                <button type='button' class='btn btn-lightgray form-control' id='idCheck'>중복확인</button>
            </div>
        </div>
        <div class='row'>
            <div class='col-8'>
                <input type='text' class='form-control mb-3' id='nickname' name='nickname' placeholder='닉네임'>
            </div>
            <div class='col-4'>
                <button type='button' class='btn btn-lightgray form-control' id='nicknameCheck'>중복확인</button>
            </div>
        </div>
        <div class='row'>
            <div class='col'>
                <input type='password' class='form-control mb-3 pw' id='pw' name='pw' placeholder='비밀번호' autocomplete="off">
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
            </div>
        </div>
        <div class='row'>
            <div class='col'>
                <input type='email' class='form-control mb-3' id='email' name='email' placeholder='이메일'>
            </div>
        </div>
        <div class='row'>
            <div class='col'>
                <input type='text' id='sample6_address' class='form-control mb-3' name='address' placeholder='주소'>
            </div>
        </div>
        <div class='row'>
            <div class='col-8 mb-3'>
                <input type='text' id='sample6_detailAddress' class='form-control' placeholder='상세주소' name='detailedAddress'>
                <input type='text' id='sample6_postcode' placeholder='우편번호' hidden>
                <input type='text' id='sample6_extraAddress' placeholder='참고항목' hidden>
            </div>
            <div class='col-4'>
                <button type='button' class='btn btn-lightgray form-control' value='주소 검색'>주소 검색</button>
            </div>
        </div>
        <div class='row '>
            <div class='col-3 p-2'>
                <label for='birtday'>생년월일</label>
            </div>
            <div class='col-9'>
                <input type='date' class='form-control' id='birthday' name='birthdate' placeholder='생년월일' required/>
            </div>
        </div>
        <div class='row mb-1'>
            <div class='col'>
                <span id='errMsg'></span>
            </div>
        </div>
        <div class='row p-3'>
            <button type='button' id='nextBtn' class='btn btn-orange'><a href='petJoin'>다음</a></button>
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

