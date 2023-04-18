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
            <button type='button' class='btn border-0 bg-white' id='send'>
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
        
        $('#comments').empty()
        
        $.ajax({
        url:'comment/get', 
        dataType: 'json',
        success: comments => {
            if(comments.length) {
                const commentArr = []
                
                $.each(comments, (i, comment) => {
                    commentArr.unshift(
                        `<div class='row'>
                            <div class='col'>
                                <div class='row'>
                                    <div class='col-2'>
                                        <button type='button' class='border-0' onclick="location.href='../login'"><b>\${comment.nickname}</b></button>
                                    </div>
                                    <div class='col'>
                                        <small>\${comment.commentTime}</small>
                                    </div>
                                    <div class='col-2' id='dropmenu'>
                                        <div class='dropdown'>
                                            <button type='button' class='reply-menu dropdown-toggle' style='border:none;' data-bs-toggle='dropdown'>
                                                <i class='bi bi-three-dots fa-2x'></i>
                                            </button>
                                            <div class='dropdown-menu'>
                                                <nav>
                                                    <button type='button' class='dropdown-item' onclick="CommentFix()">수정</button>
                                                    <button type='button' class='dropdown-item' onclick="CommentDel()">삭제</button>
                                                </nav>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class='row mt-2'>
                                    <div class='col m-2'>
                                        <input type='text' class='border-0' id='commentContent' value='\${comment.commentContent}' readonly></input>
                                    </div>
                                </div>
                                <div class='row'>
                                    <div class='col'>
                                        <input type='button' class='reply' onclick="location.href='reply'" value='답글\${comment.replycnt}'/>
                                    </div>
                                </div>
                            </div>
                        </div><hr>`)
                         
                }) 
                $('#comments').append(commentArr.join(''))
            } else $('#comments').append(
                '<tr><td colspan=4 class=text-center> 댓글이 없습니다.</td></tr>')
        }
        })

    };
    listComments()
         
    function CommentSend(){
        $('#send').click(() => {
            let comment = {
                    commentContent: $('.comment').val(),
                    commentTime: $('#commentTime').val(),
                    userId: 'user',
                    meetingId: '1',
                    nickname: 'User1',
                    replycnt: '3'
            }
            
            $.ajax({
                url: 'comment/add',
                method: 'post',
                data: comment,
                success: listComments
            })

        })
    }
    CommentSend();

        
    function CommentFix(){
         
        let comment = {
            commentContent: $('#commentContent').val(),
            commentTime: $('#commentTime').val()
        }
        $.ajax({
            url:'comment/fix',
            method:'put',
            contentType:'application/json',
            data: JSON.stringify(comment),
            success: listComments
        })
    };
        
    function CommentDel(){
        yesNoModal('댓글을 삭제하시겠습니까?','commentList.jsp')
        $('#okBtn').click(() => {
            $(yesNoModal)('댓글을 삭제하시겠습니까?','commentList'),
            
            $.ajax({
                url: 'comment/del/' + $('#commentId').val(),
                method: 'delete',
                success: listComments
            })

        })  
    };

</script>
</html>
