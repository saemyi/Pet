<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC' crossorigin='anonymous'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js' integrity='sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM' crossorigin='anonymous'></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'>
<script src='../../../res/projectJs.js'></script>
<link rel='stylesheet' href='../../../res/admin.css'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<title>공지상세</title>
<script>
$(() => {
    $('#noticeDel').click(() => {
        yesNoModal('정말로 삭제 하시겠습니까?')})

    $('#fixLogo').click(() => {
        logoModal('<input type="file"/><br>로고 파일을 등록하세요.')})
})

function goPage() {
	//location.replace("../../notice")
	history.pushState(null, null, location.href="../../notice");
	window.onpopstate = function(event) {
	}
}

function init() {
	$('#noticeDel').click(() => {
		$('#modalMsg').text('공지를 삭제하시겠습니까?')
    	$('#modalBtn').hide()
    	$('#modalBtnDouble').show()
    	$('#modal').modal('show')
	})
	
	$('#okBtn').click(() => {
		$.ajax({
			url: '../del/' + $('#noticeDel').val(),
			method: 'delete',
    		success: goPage
		})
		$('#modal').modal('hide')
	})
}
$(init)
</script>
<style>
</style>
</head>
<body>
<div class='container wrap'>
<div class='row mb-4'>
    <div class='col'>
        <div class='row'>
            <nav class="navbar navbar-expand navbar-light nav-header">
                <div class="container-fluid">
                    <a class="navbar-brand" href="../../../admin"><b>산책하개</b></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                        <a class="nav-link" href="../../../admin">회원</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="../../meeting/list">모임</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="../../notice">공지</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="../../report">신고</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" type='button' id='fixLogo'>로고변경</a>
                        </li>
                    </ul>
                    </div>
                    <div>
                        <a class="nav-link a-gray" href="../../../logout"><small>로그아웃</small></a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<div class='row'>
    <div class='col'>
        <form>
            <div class='row mb-3'>
                <div class='col pt-3'>
                    <span class='label'><b>공지</b></span>
                </div>
                <div class='col'>
                    <div class='gap-2 d-flex justify-content-end'>
                        <button type='button' class='btn botton-orange' id='noticeFix' value='${notice.noticeId}' onclick='location.href="../adminNoticeFix/${notice.noticeId}"' >수정</button>
                        <button type='button' class='btn botton-orange' id='noticeDel' value='${notice.noticeId}'>삭제</button>
                    </div> 
                </div>
            </div>
        </form>
        <hr>
    </div>
</div>
<div class='row sm'>
    <div class='col'>
        <table class='table text-center'>
            <tbody>
                <tr>
                    <th style='width: 143px;'>제목</th>
                    <td class='text-start'>
                        ${notice.noticeTitle}
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td class='text-start' id='noticeContent'>
						<pre>${notice.noticeContent }</pre>
                    </td>
                </tr>
            </tbody>
        </table>
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
                <button type='button' class='btn btn-orange' id='okBtn'>네</button>
            </div>
            <div class='modal-footer' id='logoBtn'>
                <button type='button' class='btn btn-lightgray' id='closeBtn' data-bs-dismiss="modal">
                    취소
                </button>
                <button type='button' class='btn btn-orange' id='fixBtn' data-bs-dismiss="modal">변경</button>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>