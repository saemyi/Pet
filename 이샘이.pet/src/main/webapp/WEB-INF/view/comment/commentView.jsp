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
    <div class='row d-flex justify-content-end' id="${meetingId}">
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
    <nav class="navbar fixed-bottom bg-orange pt-0">
    	<div id='commentErr' class='col text-center bg-white' style='color: red;'></div>
        <div class='input-group mt-2' style='padding-inline: .5rem;'>
            <input type='text' class='form-control border-0 comment fa-2x' placeholder='댓글을 입력하세요.'/>
            <button type='button' class='btn border-0 bg-white send'  onclick='CommentSend()'>
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
	        url:'get/' + ${meetingId}, 
	        dataType: 'json',
	        success: comments => {
            if(comments.length) {
                const commentArr = []               
                $.each(comments, (i, comment) => {
                    commentArr.unshift(
                        `<div class='row' name='comment' id='\${comment.meetingId}'>
                            <div class='col'>
                                <div class='row'>
                                    <div class='col-2'>
                                        <button type='button' class='border-0'onclick="location.href='../login'"><b id='\${comment.userId}' name='nickname'>\${comment.nickname}</b></button>
                                    </div>
                                    <div class='col' id='commentTime' value='\${comment.commentTime}'>
                                        <small>\${comment.commentTime}</small>
                                    </div>
                                    <div class='col-2' id='dropmenu'>
                                        <div class='dropdown'>
                                            <button type='button' class='reply-menu dropdown-toggle' style='border:none;' data-bs-toggle='dropdown'>
                                                <i class='bi bi-three-dots fa-2x'></i>
                                            </button>
                                            <div class='dropdown-menu'>
                                                <nav>
                                                    <button type='button' class='dropdown-item' onclick="CommentFix()" id='commentFix' value='\${comment.commentId}'>수정</button>
                                                    <button type='button' class='dropdown-item' onclick="CommentDel('\${comment.commentId}')">삭제</button>
                                                </nav>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class='row mt-2'>
                                    <div class='col m-2'>
                                        <input type='text' maxlength='200'class='border-0' id='commentContent' value='\${comment.commentContent}' readonly></input>
                                        <button id='fix' style='display: none;' class='border-0'onclick='FixFinish()'>수정 완료</button>
                                    </div>
                                </div>
                                <div class='row'>
                                    <div class='col'>
                                        <input type='button' class='reply' name='\${comment.replyCnt}' onclick="location.href='/reply'" value='답글\${comment.replyCnt}'/>
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
    }
console.log(comments)
    listComments()   
	function CommentSend(){
    	$('#commentErr').empty()
    	if($('.comment').val()){
            let comment = {
                    commentContent: $('.comment').val(),
                    commentTime: $('#commentTime').val(),
                    userId: "${userId}",
                    meetingId: ${meetingId}          
            }
            
            $.ajax({
                url: 'add',
                method: 'post',
                data: comment,
                success: listComments
            })
    }else $('#commentErr').append('댓글을 입력해주세요') 
}
    
    function CommentFix(){
    	$('#commentContent').removeAttr('readonly')
    	$('#fix').removeAttr('style')
    	console.log($('[name="comment"]').attr('id'))
    	
    }
    
    function FixFinish(){
    	let comment = {
    		commentId: $('#commentFix').val(),
    		commentContent: $('#commentContent').val(),
    		commentTime: $('#commentTime').val(),
    		userId: $('[name="nickname"]').attr('id'),
            meetingId: $('[name="comment"]').attr('id'),
            nickname: $('[name="nickname"]').text(),
            replyCnt: $('.reply').attr('name')
    	}
    	console.log(comment)
    	$.ajax({
            url: 'fix',
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
                url: 'del/' + comId,
                method: 'delete',
                success: function(){
                	window.location.href = '/comment/'+ ${meetingId} 
                }
            })

        })  
    }
</script>
</html>
