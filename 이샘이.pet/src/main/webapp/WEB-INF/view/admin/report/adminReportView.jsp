<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC' crossorigin='anonymous'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js' integrity='sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM' crossorigin='anonymous'></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'>
<script src='../../../res/projectJs.js'></script>
<link rel='stylesheet' href='../../../res/admin.css'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<title>신고상세</title>
<style>
   
</style>
<script>
let imageFilename;
$(() => {
	if(${report.isProcessed} == 0){
		$('#changedProcessed').hide()	
	}else{
		$('#changeProcessed').hide()
	}
	
	$('#fixLogo').click(() => {
        logoModal( '<form id="logoForm" encType="multipart/form-data" action="../../../logo/add"  method="post">' + 
        				'<input type="file" name="file" id="imageFilename"/>'+
        		   '</form>' 
        )
    })
    
    $('#fixBtn').click(() => {
    	 let logo ={
    		imageFilename: $('#imageFilename').val() 
    	} 
     	$.ajax({
         	url: 'logo/add',
         	method: 'post',
         	data: logo,
         	success: $('#logoForm').submit() 	   
    	 })
    	 location.replace("/admin/report")
     })
 
    $('#changeProcessed').click(() => {
	   	let isProcessed = ''
	  
	   	if( ${report.isProcessed} == 0 ){
	   		isProcessed = 1
	   		report = {
	   			  
  				reportId : ${reportId},
  				isProcessed : isProcessed 
	   		}
	   		$.ajax({
				url: '../changeProcessed',
				method: 'put',
				contentType:'application/json',
				data: JSON.stringify(report),
				success: './'
			})
			$('#changedProcessed').show()
			$('#changeProcessed').hide()	
	   	}
    })
    
    var reason 
    
   	if(${report.reason} == 1){
   		reason = '광고/음란성 댓글'
   	}else if(${report.reason} == 2){
   		reason = '욕설/반말/부적절한 언어'
   	}else if(${report.reason} == 3){
   		 reason = '회원 분란유도'
   	}else if(${report.reason} == 4){
   		reason = '회원 비방'
   	}else if(${report.reason} == 5){
   		reason = '지나친 정치/종교 논쟁'
   	}else if(${report.reason} == 6){
   		reason = '도배성 댓글'
   	}else if(${report.reason} == 7){
   		reason = '기타'
   	}else reason = '사유 없음'	
   		
   	$("#reason").text(reason)
})
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
                        <a class="nav-link" href="../../../admin/meeting/list">모임</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="../../../admin/notice">공지</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="../../../admin/report">신고</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" type='button' id='fixLogo'>로고변경</a>
                        </li>
                    </ul>
                    </div>
                    <div>
                        <a class="nav-link a-gray" id='isProcessed' href="../logout"><small>로그아웃</small></a>
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
                <div class='col-9'>
                    <span class='label'><b>신고</b></span>
                </div>
                <div class='col-3 d-flex justify-content-end'>
                    <button type='button' id='changeProcessed' class='btn botton-orange'>신고확인</button>
                    <button type='button' id='changedProcessed' class='btn btn-secondary' disabled = false;><small>신고확인완료</small></button>
                </div> 
            </div>
        </form>
        <hr>
    </div>
</div>
<div class='row'>
    <div class='col'>
        <table class='table text-center'>
            <tbody id='reports'> 
                <tr>
                    <th style='width: 10rem;'>신고대상</th><td class='text-start' style='width: 35rem;'><a href='../../../admin/adminUserView/${report.targetId}' class='a-black'>${report.targetId}</a></td>
                    <th style='width: 15rem;'>신고인</th><td>${report.userId}</td>
                </tr>
                <tr>
                    <th>신고사유</th><td class='text-start' id='reason'></td><td></td><td></td>
                </tr>
                 <tr>
                    <th style='padding-top: 1rem;'>내용</th>
                    <td class='text-start'>
                    	<pre>${report.reportContent}</pre>
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
</body>
</html>