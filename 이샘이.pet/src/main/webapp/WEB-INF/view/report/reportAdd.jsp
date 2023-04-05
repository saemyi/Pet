<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<%
	String userId = (String)session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel='stylesheet' href='../res/project.css'>
<script src='../res/projectJs.js'></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<title>신고</title>
<style>
   
</style>
<script>
$(() => { 
	 $("#nickName").blur(function(){
	    var nickName = $(this).val();
	    if( nickName == '' || nickName == 'undefined') {
	        $(".nickNameCheck").html('<small>닉네임을 입력하세요.</small>').css('color', 'red');
	        $(this).focus();
	        return false;
	    }else {
	        $(".nickNameCheck").text('');
	    }	    
	});
	
	$("#reason").blur(function(){
		var reason = $("#reason option:selected").val();
		if( reason == '0'){
			$(".reasonCheck").html('<small>사유를 선택하세요.</small>').css('color', 'red');
			$(this).focus();
	        return false;
		}if(reason >= '1'){
	        $(".reasonCheck").text('');
	    }
	});
	
	$("#reportContent").blur(function(){
		var reportContent = $(this).val();
		if( reportContent == '' || reportContent == 'undefined'){
			$(".reportContentCheck").html('<small>상세내용을 입력하세요.</small>').css('color', 'red');
			$(this).focus();
		    return false;
		}else {
	        $(".reportContentCheck").text('');
	    }
	});
})

function moveMain(){
	location.href='/';
}


function init() {
	$("#addReportBtn").click(() => {
		if( $('#nickName').val() && $('#reason option:selected').val() && $('#reportContent').val() ){
    		yesNoModal('<p>신고내용은 삭제 혹은 취소가 불가합니다.<br> 해당 유저를 신고 하시겠습니까?</p>')
		}else {
        	confirmModal("모든 정보를 입력해 주세요.")
        }
    })
    
    $("#okBtn").click(() => {
   		let report = {
   			targetId: $('#nickName').val(),
   			reason: $('#reason option:selected').val(),
   			reportContent: $('#reportContent').val()
   		}
   		$.ajax({
           	url: 'report/add',
           	method: 'post',
           	data: report,
           	success: moveMain
        })
    })
}
$(init)
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
            <b>유저신고하기</b>
        </div>
    </nav>
</div>
<div class='container'>
<div class='row'>
    <div class='col'>
        <form>
            <div class='row'>
                <div class='col'>
                    <div class='row'>
                        <div class='col'>
                        	<div class='d-grid gap-2 col-10 mx-auto'>
                        		<input type='text' class='form-control' id='nickName' placeholder='닉네임'>
                        	</div>
                             <div class="nickNameCheck d-flex justify-content-center"></div>
                        </div>
                    </div> 
                    <div class='row mt-4'>
                        <div class='col'>
                        	<div class='d-grid gap-2 col-10 mx-auto'>
                        		<select class='form-select' id='reason'>
	                                <option value='0' style='display: none;' selected>신고사유</option>
	                                <option value='1'>광고/음란성 댓글</option>
	                                <option value='2'>욕설/반말/부적절한 언어</option>
	                                <option value='3'>회원 분란유도</option>
	                                <option value='4'>회원 비방</option>
	                                <option value='5'>지나친 정치/종교 논쟁</option>
	                                <option value='6'>도배성 댓글</option>
	                                <option value='7'>기타</option>
                            	</select>
                        	</div>
                          	<div class="reasonCheck d-flex justify-content-center"></div>
                        </div>
                    </div>
                    <div class='row mt-4'>
                        <div class='col'>
                        	<div class='d-grid gap-2 col-10 mx-auto'>
                        		<textarea id='reportContent' placeholder='상세 내용' style='height: 18rem;  resize: none;' class='form-control' ></textarea>
                        	</div>
                         	<div class='reportContentCheck d-flex justify-content-center'></div>
                        </div>
                    </div>
                    <div class='row mt-4'>
                     	<div class='text-center checkNickName'></div>
                        <div class='col d-grid gap-2 col-10 mx-auto'>
                            <button  type='button' class='btn btn-warning' id='addReportBtn'>
                                <span class='label'>제출</span>
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