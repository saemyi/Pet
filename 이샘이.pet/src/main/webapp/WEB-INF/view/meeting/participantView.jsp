<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js'></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel='stylesheet' href='../res/project.css'>
<script src='../res/projectJs.js'></script>
<script src='https://kit.fontawesome.com/77ad8525ff.js' crossorigin='anonymous'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script>
$(() => {
    let userId = 'User2'
    $('.userId').eq(0).html('&nbsp;<i class="fa-solid fa-crown"></i>&nbsp;' + userId)
    userId = 'User3'
    $('.userId').eq(1).html(userId)

    let userIntro = '잘 부탁드려요~~'
    $('.userIntro').eq(0).text(userIntro)
    userIntro = '안녕하세요! 치와와 두마리아빠입니다.'
    $('.userIntro').eq(1).text(userIntro)
})
</script>
<title>참여자 목록</title>
<style>
        p {
    font-size: 12px;
}
</style>
</head>
<body>
    <div class='row d-flex justify-content-end'>
        <nav class="navbar fixed-top bg-orange p-3">
            <div class='row'>
                <div class='col d-flex justify-content-start'>
                    <i class='bi bi-chevron-left' onclick="history.back();"></i>
                </div>
            </div>
            <div class='col text-center me-4'>
                <b>참여자 목록</b>
            </div>
        </nav>
    </div>
<div class='container'>
<div class='row'>
    <div class='col'>
        <input type='text' class='form-control text-center mb-3' style='border: none; background-color: none;' value='참여자' disabled/>
        <div class='row p-3 d-flex justify-content-center'>
            <div class='box text-center p-2' onclick='location.href="../user/08.html"'>
                <p class='mt-5'>프로필이미지</p>
            </div>
            <div class='col-7 mb-3'>
                <h5><b><span class='userId'></span></b></h5><hr>
                <p class='card-text userIntro'></p>
            </div>
        </div>
        <hr>
        <div class="card shadow mb-3">
            <div class="card-body">
                <div class="row">
                    <div class='joinBox text-center p-3' onclick='location.href="../user/08.html"'>
                        <p class='mt-4'><small>프로필이미지</small></p>
                    </div>
                    <div class="col-8">
                        <h6><b class='userId'></b></h6>
                        <hr>
                        <p class='card-text userIntro'></p>
                    </div>
                </div>
            </div>
        </div>
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
</html>