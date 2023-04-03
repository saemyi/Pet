<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%
	String userId = (String)session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel='stylesheet' href='res/project.css'>
<script src='res/projectJs.js'></script>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script type="application/javascript" src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
<title>main</title>
<style>

</style>
<script>
    
 $(() => {
    let completionStatusMsg = '마감'
    $('.completionStatus').eq(0).text(completionStatusMsg)
    completionStatusMsg = '모집중'
    $('.completionStatus').eq(1).text(completionStatusMsg)
    
    let title = '4시에 신원시장 앞 산책해요!'
    $('.meetingTitle').eq(0).text(title)
    title = '퍼피퍼니 애견카페 2시 모임!'
    $('.meetingTitle').eq(1).text(title)

    let meetingDateTime = '2025-03-15 오후 4:00'
    $('.meetingDateTime').eq(0).text(meetingDateTime)
    meetingDateTime = '2025-03-16 오후 2:00'
    $('.meetingDateTime').eq(1).text(meetingDateTime)

    let recruited = 5
    let totalRecruitment = 5
    let percentage = 100 * recruited / totalRecruitment
    $('.progress-bar').eq(0).text(Math.floor(percentage) + '%')
    $('.progress-bar').eq(0).css('width', percentage + '%')
    $('.participantStatus').eq(0).text('인원 ' + recruited + '/' + totalRecruitment)
    recruited = 2
    totalRecruitment = 4
    percentage = 100 * recruited / totalRecruitment
    $('.progress-bar').eq(1).text(Math.floor(percentage) + '%')
    $('.progress-bar').eq(1).css('width', percentage + '%')
    $('.participantStatus').eq(1).text('인원 ' + recruited + '/' + totalRecruitment)
})
</script>
</head>
<body>
<div class='row d-flex justify-content-end'>
    <nav class="navbar fixed-top bg-orange p-2">
<%
if(userId == null) {
%>
	 <form action='login'>
	       <button type='submit' class="loginBtn navbar-brand link-black">로그인</button>   
	 </form>
<%} else {%>
 	<a href='logout' class='logoutBtn'>로그아웃</a>
<%} %>
        <div class='col text-center me-4'>
            <b>산책하개</b>
        </div>
        <div class='mt-2 mb-1'>
            <span type='button' class="material-symbols-outlined" onclick='location.href="./notice/01.html"'>
                campaign
            </span>
            <span type='button' class="material-symbols-outlined" onclick="location.href='./alarm/01.html'">
                notifications
            </span>   
        </div>
    </nav>
</div>
<div class='container'>
<div class='row'>
    <div class='col'>
        <form method='post'>
            <div class='row'>
                <div class='col mt-2'>
                    <div class='row mt-4 '>
                        <div class='col'>
                            <h5><b>지역선택</b></h3>
                        </div>
                    </div>
                    <div class='row'>
                        <div class='col'>
                            <div class='row'>
                                <div class='col'>
                                    <select class='form-select' name='sido' id='sido'>
                                        <option value=''>시/도</option>
                                        <option value=''>서울</option>
                                    </select>
                                </div>
                                <div class='col'>
                                    <select class='form-select' name='sigugun' id='sigugun'>
                                        <option value=''>시/군/구</option>
                                        <option value=''>관악구</option>
                                        <option value=''>구로구</option>
                                    </select>
                                </div>
                                <div class='col'>
                                    <select class='form-select' name='dong' id='dong'>
                                        <option value=''>읍/면/동</option>
                                        <option value=''>신림동</option>
                                        <option value=''>봉천동</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class='row mt-5 mb-1'>
                <div class='col'>
                    <h5><b>모임</b></h1>
                </div>
            </div>
            <div class='row mt-auto'>
                <div class='col'>
                    <div class='col'>
                        <div class='mb-2'>
                            <div class="card" type="button" onclick="location.href='./meeting/01.html'">
                                <div class="card-body">
                                    <div class='row'>
                                        <div class='col'>
                                            <div class='row'>
                                                <div class='col-3'>
                                                    <b><mark class='bg-orange'><span class='completionStatus'></span></mark></b>
                                                </div>
                                                <div class='col'>
                                                    <h6 class="card-title"><b><span class='meetingTitle'></span></b></h6>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class='col-3'></div>
                                                <div class='col'>
                                                    <p class='card-text meetingDateTime'></p>
                                                </div>
                                            </div>
                                            <div class='row'>
                                                <div class="col-8 pt-1">
                                                    <div class='progress'>
                                                        <div class='progress-bar w-40 progress-bar-striped progress-bar-animated bg-primary' role='progressbar'>40%</div>
                                                    </div>
                                                </div>
                                                <div class="col-4 d-flex justify-content-center">
                                                    <div class='mt-1 align-baseline d-flex justify-content-start participantStatus'></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                            <div class='mb-2'>
                                <div class="card" type="button" onclick="location.href='./meeting/01.html'">
                                    <div class="card-body">
                                        <div class='row'>
                                            <div class='col'>
                                                <div class='row'>
                                                    <div class='col-3'>
                                                        <b><mark class='bg-orange'><span class='completionStatus'></span></mark></b>
                                                    </div>
                                                    <div class='col'>
                                                        <h6 class="card-title"><b><span class='meetingTitle'></span></b></h6>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class='col-3'></div>
                                                    <div class='col'>
                                                        <p class='card-text meetingDateTime'></p>
                                                    </div>
                                                </div>
                                                <div class='row'>
                                                    <div class="col-8 pt-1">
                                                        <div class='progress'>
                                                            <div class='progress-bar w-40 progress-bar-striped progress-bar-animated bg-primary' role='progressbar'>40%</div>
                                                        </div>
                                                    </div>
                                                    <div class="col-4 d-flex justify-content-center">
                                                        <div class='mt-1 align-baseline d-flex justify-content-start participantStatus'></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
             </form>   
         </div>
    </div>
</div>
<nav class="navbar fixed-bottom bg-orange">
    <div class="container-fluid pt-3">
        <div>
            <li class="nav-item" type="button" onclick="location.href='meeting/add'">
                <span class="material-symbols-outlined">
                    add
                </span>
            </li>
        </div>
        <div>
            <li class="nav-item" type="button" onclick="location.href='./main.html'">
                <span class="material-symbols-outlined">
                    format_list_bulleted
                </span>
            </li>
        </div>
        <div>
            <li class="nav-item" type="button" onclick="location.href='./user/mypage.html'">
                <span class="material-symbols-outlined">
                    person
                </span>
            </li>    
        </div>
    </div>
</nav>
</body>
</html>