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
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<!-- https://zelkun.tistory.com/entry/004-jQuery-%EC%8B%9C%EB%8F%84%EC%8B%9C%EA%B5%B0%EA%B5%AC%EC%9D%8D%EB%A9%B4%EB%8F%99%EC%9D%84-%EC%9D%B4%EC%9A%A9%ED%95%9C-selectbox-%EC%A0%9C%EC%96%B4-with-%EA%B8%B0%EC%83%81%EC%B2%AD-%EB%8F%99%EB%84%A4%EC%98%88%EB%B3%B4 -->
<script type="application/javascript" src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
<link rel='stylesheet' href='../res/project.css'>
<script src='../res/projectJs.js'></script>
<script>
$(() => {
    let title = '퍼피퍼니 애견카페 2시 모임!'
    $('#meetingTitle').val(title)

    let dateTime = '2023-03-16T14:00:00'
    $('#meetingDateTime').val(dateTime)

    let recruitmentNumber = 4
    $('#recruitmentNumber').val(recruitmentNumber)

    let content = '안녕하세요~\n1살 포메 남아 사랑이 키우고 있는\n30대 초반 여자입니다!\n얼마전에 이 동네로 이사와서\n사랑이 새 친구 만들어주고\n저도 좋은 친구 만들고 싶네요!\n제 또래 여자분들 특히 환영합니당!'
    $('#meetingContent').text(content)
})
</script>
<title>모임수정</title>
<style>

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
                <b>모임수정</b>
            </div>
        </nav>
    </div>
<div class='container'>
<form>
<div class='row'>
    <div class='col'>
        <div class='mb-3'>
            <input type='text' class='form-control' name='meetingTitle' id='meetingTitle' placeholder='제목'/>
        </div>
    </div>
</div>
<div class='row'>
    <div class='col'>
        <div class='row'>
            <div class='col'>
                <select class='form-select' name='sido' id='sido'>
                    <option>시/도</option>
                </select>
            </div>
            <div class='col'>
                <select class='form-select' name='sigugun' id='sigugun'>
                    <option>시/군/구</option>
                </select>
            </div>
            <div class='col'>
                <select class='form-select' name='dong' id='dong'>
                    <option>읍/면/동</option>
                </select>
            </div>
        </div>
    </div>
</div>
<div class='row mt-3'>
    <div class='col'>
        <div class='row'>
            <div class='col-3 text-center p-2'>
                <p>일&nbsp;&nbsp;시</p>
            </div>
            <div class='col-9'>
                <input type='datetime-local' class='form-control' name='meetingDateTime' id='meetingDateTime'/>
            </div>
        </div>
    </div>
</div>
<div class='row'>
    <div class='col'>
        <div class='row mb-3'>
            <div class='col-3 text-center p-2'><p>모집인원</p></div>
            <div class='col-9'>
                <select class='form-select' name='recruitmentNumber' id='recruitmentNumber'>
                    <option value='2'>2</option>
                    <option value='3'>3</option>
                    <option value='4'>4</option>
                    <option value='5'>5</option>
                    <option value='6'>6</option>
                    <option value='7'>7</option>
                    <option value='8'>8</option>
                    <option value='9'>9</option>
                    <option value='10'>10</option>
                </select>
            </div>
        </div>
    </div>
</div>
<div class='row'>
    <div class='col'>
        <div class='mb-3'>
            <textarea class='form-control' rows='10' name='meetingContent' id='meetingContent' placeholder='모임에 대한 구체적인 정보를 입력하세요 :&#41;'></textarea>
        </div>
    </div>
</div>
<div class='row'>
    <div class='col'>
        <div class='d-grid gap-2 mb-3'>
            <button type='button' class='btn btn-orange' id='submitBtn'>
                수정
            </button>
        </div>
    </div>
</div>
</form>
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