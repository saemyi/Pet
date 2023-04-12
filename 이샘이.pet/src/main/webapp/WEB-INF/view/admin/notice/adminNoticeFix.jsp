<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC' crossorigin='anonymous'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js' integrity='sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM' crossorigin='anonymous'></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='../../../res/projectJs.js'></script>
<link rel='stylesheet' href='../../../res/admin.css'w>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<title>공지수정</title>
<style>
</style>
<script>
$(() => {
   let noticeTitle = '${notice.noticeTitle}'
   let noticeContent = `${notice.noticeContent}`
    $('.noticeTitle').val(noticeTitle)
    $('.noticeContent').val(noticeContent)

    $('#noticeFix').click(() => {
       if(isVal($('#noticeTitle')) && isVal($('#noticeContent'))) {
          let notice = {
                 noticeId: ${notice.noticeId},
                 noticeTitle: $('#noticeTitle').val(),
                 noticeContent: $('#noticeContent').val()
              }
           
           $.ajax({
              url: '../fix',
              method: 'put',
              contentType: 'application/json',
              data: JSON.stringify(notice),
              success: goPage
              })
            }
          })   
      })
    
function goPage() {
   location.replace("../adminNoticeView/" + ${notice.noticeId})
}
</script>
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
<form>
<div class='row'>
    <div class='col'>
          <div class='row mb-3'>
               <div class='col pt-3'>
                   <span class='label'><b>공지수정</b></span>
               </div>
               <div class='col'>
                   <div class='gap-2 d-flex justify-content-end'>
                       <button type='button' class='btn botton-orange' id='noticeFix'>수정</button>
                   </div> 
               </div>
            </div>
        <hr>
    </div>
</div>
<div class='row sm'>
    <div class='col'>
        <table class='table text-center'>
            <tbody>
                <tr>
                    <th style='width: 143px;'>제목</th><td class='text-start'><input type='text' class='noticeTitle' style='border: none; width: 35rem;' placeholder='제목' id='noticeTitle'></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td class='text-start'>
                        <textarea class='text-start noticeContent pocus' style='resize: none; border: none; width: 35rem; height: 35rem;' placeholder='내용' id='noticeContent'></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
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