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

textarea {
	resize: none; 
	background-color: #fff;
}
</style>
<script>	
    function listComments() {   
        console.log("listComments 실행")
        $('#comments').empty()
        $('#comments').empty()
        $.ajax({
	        url:'get/' + ${meetingId}, 
	        dataType: 'json',
	        success: comments => {
	            if(comments.length) {
	                const commentArr = []               
	                $.each(comments, (i, comment) => {
	                    commentArr.unshift(
	                        `<div class='row'>
	                            <div class='col'>
	                                <div class='row'>
	                                    <div class='col-auto pe-0'>
	                                        <button type='button' class='border-0'onclick="location.href='../login'"><b style='font-size: 0.8rem;'>\${comment.nickname}</b></button>
	                                    </div>
	                                    <div class='col'>
	                                        <p style='font-size: 0.5rem;'>\${comment.commentTime}</p>
	                                    </div>
	                                    <div class='col-2' style='margin-top: -.5rem;'>
	                                        <div class='dropdown dropmenu\${comment.userId}'  style='display: none;'>
	                                            <button type='button' class='reply-menu dropdown-toggle' style='border:none;' data-bs-toggle='dropdown'>
	                                                <i class='bi bi-three-dots fa-2x'></i>
	                                            </button>
	                                            <div class='dropdown-menu'>
	                                                <nav>
	                                                    <button type='button' class='dropdown-item' onclick="CommentFix(\${comment.commentId})">수정</button>
	                                                    <button type='button' class='dropdown-item' onclick="CommentDel(\${comment.commentId})">삭제</button>
	                                                </nav>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class='row mt-2'>
	                                    <div class='col m-2 mb-0'>
	                                    	<p><textarea cols='40' rows='3'id='commentContent\${comment.commentId}' class='border-0'readonly disabled>\${comment.commentContent}</textarea></p>              
	                                    </div>
	                                </div>
	                                <div class='row'>
	                                    <div class='col'>
	                                        <input type='button' class='reply' onclick="location.href='/reply/\${comment.commentId}'" value='답글\${comment.replyCnt}'/>
	                                    </div>
	                                </div>
	                            </div>
	                        </div><hr>`    
	                    )
	                })  
	                $('#comments').append(commentArr.join(''))  
	                $('.dropmenu${userId}').removeAttr("style")               
	            } else $('#comments').append(
	                '<tr><td colspan=4 class=text-center> 댓글이 없습니다.</td></tr>')            
	        }
        })
    }
    
	function CommentSend(){
    	$('#commentErr').empty()
    	if($('.comment').val()){
            let comment = {
                    commentContent: $('.comment').val(),     
                    userId: "${userId}",
                    meetingId: ${meetingId}          
            }
            
           	if(comment.userId == ""){
           		window.location.href = '/login'
           	} else {
           		$.ajax({
                    url: 'add',
                    method: 'post',
                    data: comment,
                    success: listComments
                })
           	} 
            
            $('.comment').val('') 
    	}else $('#commentErr').text('댓글을 입력해주세요').show().fadeOut(3000)
	}
	
	let comId = 0;   
    function CommentFix(comId){
    	confirmModal("<p><textarea cols='40' rows='3'id='commentContentFix"+ comId +"'"+ "class='border-0' style='resize: none;' placeholder='댓글을 입력해주세요'>"+ $('#commentContent'+ comId).val() + "</textarea></p>")
    	$('#confirmBtn').click(() => {
    		if($('#commentContentFix'+ comId).val()){
    			let comment = {
        	    		commentId: comId,
        	    		commentContent: $('#commentContentFix'+ comId).val()	
        	    	}
        	    	
        	    	$.ajax({
        	            url: 'fix',
        	            method: 'put',
        	            contentType: 'application/json',
        	        	data: JSON.stringify(comment),
        	            success: function(){
                        	window.location.href = '/comment/'+ ${meetingId} 
                        }
        	        })
    		} else {
    				$('#modalErrMsg').text('댓글을 입력해주세요').show().fadeOut(3000)
    				$('#confirmModal').removeAttr('data-bs-dismiss')	
    		}    		
    	})
    }   
    
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
listComments()
</script>
</html>
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
    <div class='container pb-5' id='comments'>		
    </div>
    <nav class="navbar fixed-bottom p-0">
    	<div id='commentErr' class='col text-center bg-white' style='color: red;'></div>
        <div class='input-group mt-2 bg-orange p-2' style='padding-inline: .5rem;'>
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
                	<p id='modalErrMsg' class='text-danger'></p>
                    <button type='button' class='btn btn-orange' id='confirmBtn'>수정</button>
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