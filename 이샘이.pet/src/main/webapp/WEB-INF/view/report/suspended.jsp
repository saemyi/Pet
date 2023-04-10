<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel='stylesheet' href='../res/project.css'>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<title>이용정지</title>
<style>
   
</style>
<script>
$(() => {
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
<header>    
    
</header>

<div class='container'>
<div class='row'>
    <div class='col'>
        <div class='row'>
            <div class='col mt-3'>
                <h5 class='text-center'><b>이용 정지 안내</b></h5>
            </div>
        </div>
        <div class='row mt-2'>
            <div class='col'>
                <p class='text-center'>요청하신 서비스는 이용이 제한되었습니다.</p>
            </div>
        </div>
    </div>
</div>
<div class='row mt-2 pt-4 '>
    <div class='col '>
        <div class='row pt-3 border'>
            <div class='col-3 text-end'>
                <p>제한사유</p>
            </div> 
            <div class='col-6 text-center '>
                <p id='reason'></p>
            </div>
        </div>
        <div class='row pt-5 border'>
            <div class='col mt-3 mb-5 '>
                <p class='text-center'>자세한 사항은<br>sancheck01@schg.com로<br>문의바랍니다.</p>
            </div>
        </div>
    </div>
</div>
<div class='row mt-3'>
    <div class='col'>
        <div class='d-grid gap-2 col-8 mx-auto'>
            <button type='button' class='btn btn-warning' onclick='location.href="./login?"'>확인</button>
        </div>
    </div>
</div>
</div>
</body>
<footer>
   
</footer>
</html>