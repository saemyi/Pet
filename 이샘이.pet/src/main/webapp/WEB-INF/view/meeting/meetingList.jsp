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
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script>
$(() => {
    let completionStatusMsg = '마감' // 마감, 완료
    $('.completionStatus').eq(0).text(completionStatusMsg)
    completionStatusMsg = '모집중'
    $('.completionStatus').eq(1).text(completionStatusMsg)
    
    let title = '4시에 서울숲 한바퀴'
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
<title>MEETING.04</title>
<style>
    
</style>
</head>
<body>
<header>
    <div class='row d-flex justify-content-end'>
        <nav class="navbar fixed-top bg-orange p-3">
            <div class='row'>
                <div class='col d-flex justify-content-start'>
                    <i class='bi bi-chevron-left' onclick="history.back();"></i>
                </div>
            </div>
            <div class='col text-center ms-5'>
                <b class='ms-3'>내 모임</b>
            </div>
        <li class="nav-item dropdown" style='list-style: none;'>
        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" style='text-decoration: none; color: black;' role="button" aria-expanded="false">모임확인</a>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#scrollspyHeading1">참여 모임</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#scrollspyHeading2">내가 만든 모임</a></li>
        </ul>
        </li>
        </nav>
    </div>
</header>
<div class='container'>
<div class='row'>
    <div class='col'>
        <div class='pb-2' id='scrollspyHeading1'>
            <p><b>참여 모임</b></p>
        </div>
        <div class='row' >
            <div class='col card-start' hidden>
                <div class='row mt-auto'>
                    <div class='col'>
                        <div class='mb-2'>
                            <div class="card" type="button" onclick="location.href='../meeting/01.html'">
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
                                                <div class="col-4 d-flex justify-content-center"><div class='mt-1 align-baseline d-flex justify-content-start participantStatus'></div>
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
        </div>
        <div class='row'>
            <div class='col card-start'>
                <div class='row mt-auto'>
                    <div class='col'>
                        <div class='mb-2'>
                            <div class="card" type="button" onclick="location.href='../meeting/01.html'">
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
                                                <div class="col-4 d-flex justify-content-center"><div class='mt-1 align-baseline d-flex justify-content-start participantStatus'></div>
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
        </div>
        <div class='pb-2 mt-3' id='scrollspyHeading2'>
            <p><b>내가 만든 모임</b></p>
        </div>
        <div class='row'>
            <div class='col card-start'>
                <p class='text-center text-secondary mt-5'>내가 만든 모임이 없습니다.</p>
            </div>
        </div>
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