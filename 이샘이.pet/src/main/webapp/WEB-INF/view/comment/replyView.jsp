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
<title>답글</title>
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
<script>
function listReplies() { 
	console.log("listReplies 실행")
	 $('#replies').empty()
	 $.ajax({
		 url:'getComment/' +${commentId},
		 dataType: 'json',
		 success: comment => {
			 $('#comment').append(
					 `<div class='row'>
                     <div class='col'>
                         <div class='row'>
                             <div class='col pe-0'>
                                 <button type='button' class='border-0'onclick="location.href='../login'"><b>\${comment.nickname}</b></button>
                             </div>
                             <div class='col-6'>
                                 <small id='commentTime' value='\${comment.commentTime}'>\${comment.commentTime}</small>
                             </div>
                             <div class='col-2'>
                                 <div class='dropdown dropmenu\${comment.userId}'  style='display: none;'>
                                     <button type='button' class='reply-menu dropdown-toggle' style='border:none;' data-bs-toggle='dropdown'>
                                         <i class='bi bi-three-dots fa-2x'></i>
                                     </button>
                                     <div class='dropdown-menu'>
                                         <nav>
                                             <button type='button' class='dropdown-item' onclick="CommentFix(\${comment.commentId})" id='commentFix' value='\${comment.commentId}'>수정</button>
                                             <button type='button' class='dropdown-item' onclick="CommentDel(\${comment.commentId})">삭제</button>
                                         </nav>
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <div class='row mt-2'>
                             <div class='col m-2 mb-0'>
                             	<p><textarea cols='40' rows='3'id='commentContent\${comment.commentId}' class='border-0' style='resize: none;'readonly>\${comment.commentContent}</textarea></p>              
                             </div>
                         </div>
                         <div class='row'>
                             <div class='col'>
                                 <input type='button' class='reply' name='\${comment.replyCnt}' onclick="location.href='/reply/\${comment.commentId}'" value='답글\${comment.replyCnt}'/>
                             </div>
                         </div>
                     </div>
                 </div><hr>`    
             ))
			 
		 }		 
	 })
	 
	 
	 $.ajax({
		 url:'get/' + ${commentId}, 
		 dataType: 'json',
		 success: replies => {
			 if(replies.length) {
				 const replyArr = []				 
				 $.each(replies, (i, reply) => {
					 replyArr.unshift(
							 `<div class='row'>
							        <div class='col-2 d-flex justify-content-end'>
							            <i class="bi bi-arrow-return-right"></i>
							        </div>
							        <div class='col'>
							            <div class='row'>
							                <div class='col-2'>
							                    <button type='button' class='border-0' onclick="location.href='../user/08.html'"><b>\${reply.nickname}</b></button>
							                </div>
							                <div class='col'>
							                    <small id='replyTime' value='\${reply.replyTime}'>\${reply.replyTime}</small>
							                </div>
							                <div class='col-2'>
							                    <div class='dropdown'>
							                        <button type='button' class='reply-menu dropdown-toggle' style='border:none;' data-bs-toggle='dropdown'>
							                            <i class='bi bi-three-dots fa-2x'></i>
							                        </button>
							                        <div class='dropdown-menu'>
							                            <nav>
							                                <button class='dropdown-item' onclick="ReplyFix(\${reply.replyId})" id='replyFix' value='\${reply.replyId}'>수정</button>
							                                <button type='button'class='dropdown-item' onclick="ReplyDel(\${reply.replyId})">삭제</button>
							                            </nav>
							                        </div>
							                    </div>
							                </div>
							            </div>
							            <div class='row mt-2'>
							                <div class='col m-2 mb-0'>
							                	<p><textarea cols='40' rows='3'id='replyContent\${reply.replyId}' class='border-0' style='resize: none;'readonly>\${reply.replyContent}</textarea></p>
	                                        	<button id='fix\${reply.reply}' style='display: none;' class='border-0'onclick='FixFinish(\${reply.replyId})'>수정 완료</button>
							                </div>
							            </div>
							        </div>
							  </div><hr>`)
				 })
				 $('#replies').append(replyArr.join(''))
			 } else $('#replies').append(
	            '<tr><td colspan=4 class=text-center> 댓글이 없습니다.</td></tr>')
		 }
	 })
}
listReplies()   
function ReplySend(){ 
        let reply = {
                replyContent: $('.reply').val(),
                replyTime: $('#commentTime').val(),
                userId: '${userId}',
                commentId: '1',
        }
        
        $.ajax({
            url: 'add',
            method: 'post',
            data: reply,
            success: listComments
        })
}

function CommentFix(){
	$('#commentContent').removeAttr('readonly')
	$('#fix').removeAttr('style')
	console.log($('[name="comment"]').attr('id'))
	
}

function FixFinish(){
	let comment = {
		commentId: $('[name="comment"]').attr('id'),
		commentContent: $('#commentContent').val(),
		commentTime: $('#commentTime').val(),
		userId: 'user',
        meetingId: '1',
        nickname: 'user123',
        replycnt: '3'
	}
	console.log(comment)
	$.ajax({
        url: 'comment/fix',
        method: 'put',
        contentType: 'application/json',
    	data: JSON.stringify(comment),
        success: listComments
    })   
    $('#commentContent').attr('readonly', true)
	$('#fix').attr('style', 'display: none;')
}

let comId = 0; 
function CommentDel(comId){   
    yesNoModal('댓글을 삭제하시겠습니까?')
    $('#okBtn').click(() => { 
    	console.log(comId)
        $.ajax({
            url: 'comment/del/' + comId,
            method: 'delete',
            success: function(){
            	window.location.href = '/reply'
            }
        })

    })  
}
</script>
<body>
<div class='row d-flex justify-content-end'>
    <nav class="navbar fixed-top bg-orange p-3">
        <div class='row'>
            <div class='col d-flex justify-content-start'>
                <i class='bi bi-chevron-left' onclick="history.back();"></i>
            </div>
        </div>
        <div class='col text-center me-4'>
            <b>답글</b>
        </div>
    </nav>
</div>
<div class='container' id='comment'>
    
</div>
<div class='container' id='replies'>
    <!--답글-->
    
</div>
<nav class="navbar fixed-bottom bg-orange">
    <div class='input-group mt-2' style='padding-inline: .5rem;'>
        <input type='text' class='form-control border-0 comment fa-2x' placeholder='답글을 입력하세요.' aria-describedby='button-comment'/>
        <button type='button' class='btn border-0 send bg-white' id='button-reply'>
            <i class='bi bi-arrow-up-circle fa-2x'></i>
        </button>
    </div>
</nav>
</body>
<div class='modal fade' id='modal'>
    <div class='modal-dialog modal-dialog-centered'>
        <div class='modal-content'>
            <div class='modal-header'>
                <button type='button' class='btn-close' data-bs-dismiss="modal"></button>
            </div>
            <div class='modal-body'>
                <p id='modalMsg'></p>
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
</html>
