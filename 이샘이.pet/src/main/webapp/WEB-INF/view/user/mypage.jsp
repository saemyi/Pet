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
<title>마이페이지</title>
<style>
    p {
    font-size: 12px;
}
</style>
<script>
$(() => {
	
})

	function mypage() {
		$.ajax({
			url: '/getUser',
			dataType: 'json',
			success: user => {
				$('#userNickname').text(user.nickname)
				$('#userIntro').text(user.userIntro)
			}
		})
	}
	
$(mypage)

</script>
<header>
    <div class='row d-flex justify-content-end'>
        <nav class="navbar fixed-top bg-orange">
            <div class='row'>
                <div class='col d-flex justify-content-start'>
                    <i class='bi bi-chevron-left' onclick="history.back();"></i>
                </div>
            </div>
            <div class='col text-center ms-4'>
                <b>마이페이지</b>
            </div>
            <div class='mt-2 mb-1'>
                <i class="bi bi-gear-fill" type='button' onclick="location.href='./setting'"></i>
            </div>
            <img src='<c:url value="/attach/"/>'/><br>
        </nav>
    </div>
</header>
<body>
<body>
<div class='container mb-5'>
    <div class='row p-3 d-flex justify-content-center'>
        <div class='box text-center p-2'>
            <p class='mt-5'>프로필이미지</p>
        </div>
        <div class='col-7 mb-3'>
            <h5><b id='userNickname'></b></h5><hr>
            <p id='userIntro'>
            </p>
        </div>
    </div>
    <div class='row p-3'>
            <button type='button' class='btn btn-orange mb-3' onclick="location.href='../meeting/04.html'">내모임 보기</button>
    </div>
    <div class='row'>
        <div class='col'>
            <div class='row p-2'>
                <h6><b>내 반려견</b></h6>
            </div>
        </div>
    </div>
    <div class="card shadow mb-3">
        <div class="card-body">
            <div class="row">
                <div class='petBox text-center p-3'>
                    <p class='mt-4'>펫이미지</p>
                </div>
                <div class="col-8">
                    <h6><b>뽀실이</b></h6>
                    <hr>
                    <p>말티즈 10살 남자아이에요! 개껌 먹는걸 제일 좋아한답니다!
                    </p>
                </div>
            </div>
        </div>
    </div>
<div class="card shadow mb-3">
    <div class="card-body">
        <div class="row">
            <div class='petBox text-center p-3'>
                <p class='mt-4'>펫이미지</p>
            </div>
            <div class="col-8">
                <h6><b>빵실이</b></h6>
                <hr>
                <p>뽀실이에게 여동생이 생겼어요!
                    6개월 포메, 얌전하고 착해요.<br> 
                </p>
            </div>
        </div>
    </div>
</div>
</div>
</body>
<footer>
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
</footer>
</html>