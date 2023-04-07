<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1 user-scalable=no, 
maximum-scale=1.0, minimum-scale=1.0'>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel='stylesheet' href='../res/project.css'>
<script src='../res/projectJs.js'></script>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<title>댓글</title>
<style>
.send {
   margin-left: -5.5px;
   border-top-right-radius: 2rem;
   border-bottom-right-radius: 2rem;
}

.comment {
   border-top-left-radius: 2rem;
   border-bottom-left-radius: 2rem;
   border-radius: 2rem;
}

</style>

<body>
    <div class='row d-flex justify-content-end'>
        <nav class="navbar fixed-top bg-orange p-3">
            <div class='row'>
                <div class='col d-flex justify-content-start'>
                    <i class='bi bi-chevron-left' onclick="history.back();"></i>
                </div>
            </div>
            <div class='col text-center me-4'>
                <b>댓글</b>
            </div>
        </nav>
    </div>
    <div class='container' id='comments'>
		
    </div>
    <nav class="navbar fixed-bottom bg-orange">
        <div class='input-group mt-2' style='padding-inline: .5rem;'>
            <input type='text' class='form-control border-0 comment fa-2x' placeholder='댓글을 입력하세요.'/>
            <button type='button' class='btn border-0 bg-white'  onclick='CommentSend()'>
                <i class='bi bi-arrow-up-circle fa-2x'></i>
            </button>
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
                    <button type='button' class='btn bg-orange' id='okBtn' data-bs-dismiss="modal">네</button>
                </div>
            </div>
        </div>
    </div>
</body>


<script>

    function listComments() {   
        console.log("listComments 실행")
        $('#comments').empty()
        $.ajax({
        url:'comment/get', 
        dataType: 'json',
        success: comment => {
        	$('#commentContent').val(comment.commentContent)
        	$('#commentTime').val(comment.commentTime)
    }
    listComments()
         
    function CommentSend(){
            let comment = {
                    commentContent: $('.comment').val(),
                    commentTime: $('#commentTime').val(),
                    userId: '${userId}',
                    meetingId: '1',
                    nickname: 'user',
                    replycnt: '3'
            }
            console.log(comment.commentId)
            console.log(comment.commentContent)
            console.log(comment.commentTime)
            console.log(comment.userId)
            console.log(comment.nickname)
            console.log(comment.replycnt)
            
            

        
    }

       
</script>
</html>
