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
	 $('#replies').empty()
	 
	 $.ajax({
		 url:'reply/get', 
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
							                    <small>2023.03.16 11:48:14</small>
							                </div>
							            </div>
							            <div class='row mt-2'>
							                <div class='col m-2'>
							                    <p>반가워요! 강아지들 소개 보고 왔는데 두마리 다 참 귀엽네요 ㅎㅎ 저희 강아지는 치와와에요</p>
							                </div>
							            </div>
							        </div>
							 </div><hr>
							 `)
				        	
				 })
				 $('#replies').append(commentArr.join(''))
			 } else $('#replies').append(
	            '<tr><td colspan=4 class=text-center> 댓글이 없습니다.</td></tr>')
		 }
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
<div class='container'>
    <div class='row'>
        <div class='col'>
            <div class='row'>
                <div class='col-2'>
                    <button type='button' class='border-0' onclick="location.href='../user/08.html'"><b>User1</b></button>
                </div>
                <div class='col'>
                    <small>2023.03.16 10:53:35</small>
                </div>
                <div class='col-2'>
                    <div class='dropdown'>
                        <button type='button' class='reply-menu dropdown-toggle'style='border:none;' data-bs-toggle='dropdown'>
                            <i class='bi bi-three-dots fa-2x'></i>
                        </button>
                        <div class='dropdown-menu'>
                            <nav>
                                <button class='dropdown-item'>수정</button>
                                <button type='button' class='dropdown-item' id='delComment'>삭제</button>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class='row mt-2'>
                <div class='col m-2'>
                    <p>안녕하세요! 참가 신청했습니다!</p>
                </div>
            </div>
            <div class='row'>
                <div class='col'>
                    <input type='button' class='reply' onclick="location.href='02.html'" value='답글3'/>
                </div>
            </div>
        </div>
    </div><hr>
</div>
<div class='container' id='replies'>
    <!--답글-->
    <div class='row'>
        <div class='col-2 d-flex justify-content-end'>
            <i class="bi bi-arrow-return-right"></i>
        </div>
        <div class='col'>
            <div class='row'>
                <div class='col-2'>
                    <button type='button' class='border-0' onclick="location.href='../user/08.html'"><b>User3</b></button>
                </div>
                <div class='col'>
                    <small>2023.03.16 11:48:14</small>
                </div>
            </div>
            <div class='row mt-2'>
                <div class='col m-2'>
                    <p>반가워요! 강아지들 소개 보고 왔는데 두마리 다 참 귀엽네요 ㅎㅎ 저희 강아지는 치와와에요</p>
                </div>
            </div>
        </div>
    </div><hr>
    <div class='row'>
        <div class='col-2 d-flex justify-content-end'>
            <i class="bi bi-arrow-return-right"></i>
        </div>
        <div class='col'>
            <div class='row'>
                <div class='col-2'>
                    <button type='button' class='border-0' onclick="location.href='../user/08.html'"><b>User1</b></button>
                </div>
                <div class='col'>
                    <small>2023.03.16 11:50:14</small>
                </div>
                <div class='col-2'>
                    <div class='dropdown'>
                        <button type='button' class='reply-menu dropdown-toggle' style='border:none;' data-bs-toggle='dropdown'>
                            <i class='bi bi-three-dots fa-2x'></i>
                        </button>
                        <div class='dropdown-menu'>
                            <nav>
                                <button class='dropdown-item'>수정</button>
                                <button type='button'class='dropdown-item' id='delReply'>삭제</button>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class='row mt-2'>
                <div class='col m-2'>
                    <p>치와와도 참 매력적인것 같아요!</p>
                </div>
            </div>
        </div>
    </div><hr>
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
