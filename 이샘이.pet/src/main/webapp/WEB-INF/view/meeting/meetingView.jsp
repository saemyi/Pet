<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet'>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js'></script>
<link rel='stylesheet' href='../res/project.css'>
<script src='../res/projectJs.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script>
    let isParticipationCancel = false
$(() => {
    let completionStatusMsg = '모집중' // 마감, 완료
    $('#completionStatus').text(completionStatusMsg)

    let title = '퍼피퍼니 애견카페 2시 모임!'
    $('#meetingTitle').html('<b>' + title + '</b>')

    let place = '서울 관악구 신림동'
    $('#meetingPlace').prop('disabled', (i, v) => !v)
    $('#meetingPlace').val(place)
    
    let dateTime = '2023-03-16T14:00:00'
    $('#meetingDateTime').prop('disabled', (i, v) => !v)
    $('#meetingDateTime').val(dateTime)

    let recruited = 2
    let totalRecruitment = 4
    let percentage = 100 * recruited / totalRecruitment
    $('.progress-bar').eq(0).text(Math.floor(percentage) + '%')
    $('.progress-bar').eq(0).css('width', percentage + '%')
    $('#participantStatus').html('<a href="05.html" style="text-decoration: none; color: black;"><b class="text-primary">' + recruited + '/' + totalRecruitment + '</b><small> 참여중</small>' + '</a>')

    let content = '안녕하세요~\n1살 포메 남아 사랑이 키우고 있는\n30대 초반 여자입니다!\n얼마전에 이 동네로 이사와서\n사랑이 새 친구 만들어주고\n저도 좋은 친구 만들고 싶네요!\n제 또래 여자분들 특히 환영합니당!'
    $('#meetingContent').prop('disabled', (i, v) => !v)
    $('#meetingContent').text(content)

    $('#editBtn').show() 
    $('#deleteBtn').show()
    $('#participateBtn').show()

})

function init() {
    $('#editBtn').click(() => {
        window.location.href = "meetingFix.jsp"
    })

    $('#deleteBtn').click(() => {
        yesNoModal('모임을 삭제하시겠습니까?', 'meetingList.jsp')
    })
}

$(init)
</script>
<title>모임</title>
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
                <b>모임상세조회</b>
            </div>
        </nav>
    </div>
<div class='container'>
<div class='row'>
    <div class='col'>
        <form>
            <div class='row pt-3' style='background-color: rgb(245, 244, 252);'>
                <div class='col'>
                    <div class='mb-3 text-center text-secondary'>
                        <h6><b><mark class="bg-orange">
                            <span id='completionStatus'></span></mark></b>
                            <span id='meetingTitle'></span>
                        </h6>
                    </div>
                </div>
            </div>
        <hr>
        <div class='row'>
            <div class='col'>
                <div class='row'>
                    <div class='col-2 p-2 text-center'>
                        <label for='meetingPlace'><b>장 소</b></label>
                    </div>
                    <div class='col'>
                        <input type='text' class='form-control' name='meetingPlace' id='meetingPlace' style='border:none; background: none;'/>
                    </div>
                </div>
            </div>
        </div>
        <div class='row'>
            <div class='col'>
                <div class='row'>
                    <div class='col-2 p-2 text-center'>
                        <label for='meetingDateTime'><b>일 시</b></label>
                    </div>
                    <div class='col'>
                        <input type='datetime-local' class='form-control' name='meetingDateTime' id='meetingDateTime' style='border:none; background: none;'/>
                    </div>
                </div>
            </div>
        </div>
        <div class='row d-flex justify-content-center'>
            <div class='col-9'>
                <div class='mb-3 p-1'>
                    <div class='progress'>
                        <div class='progress-bar progress-bar-striped progress-bar-animated' role='progressbar' style='width: 0%; font-size: 1rem;'></div>
                    </div>
                </div>
            </div>
            <div class='col-3'>
                <div class='mb-3 align-baseline d-flex justify-content-start' id='participantStatus'>
                </div>
            </div>
        </div>
        <div class='row'>
            <div class='col'>
                <div class='mb-3'>
                    <textarea class='form-control' rows='10' name='meetingContent' id='meetingContent' style='background: none;'></textarea>
                </div>
            </div>
        </div>
        <div class='row'>
            <div class='col'>
                <div class='d-grid d-flex justify-content-end mb-3'>
                    <div class='col-10'>
                        <div class='d-grid d-flex justify-content-end mb-4'>
                            <button type='button' class='btn btn-muted btn-sm' id='editBtn'>
                                수정
                            </button>
                            <button type='button' class='btn btn-muted btn-sm' id='deleteBtn'>
                                삭제
                            </button>
                        </div>
                    </div>
                    <div class='col p-1' onclick="location.href='../comment/01.html'">
                        <small>댓글</small>
                        <i class="bi bi-chat-square-text" type='button'></i>
                    </div>
                </div>
            </div>
        </div>
        <div class='row'>
            <div class='col'>
                <div class='d-grid gap-2 mb-3'>
                    <button type='button' class='btn btn-orange' id='participateBtn'>
                        참여신청
                    </button>
                </div>
            </div>
        </div>
    </div>
    </form>
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