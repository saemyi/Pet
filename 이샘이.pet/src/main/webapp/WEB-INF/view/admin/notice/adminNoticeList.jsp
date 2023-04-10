<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC' crossorigin='anonymous'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js' integrity='sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM' crossorigin='anonymous'></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'>
<script src='../../../res/projectJs.js'></script>
<link rel='stylesheet' href='../../res/admin.css'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<title>공지리스트</title>
<style>
    
</style>
<script>
    $(() => {
    $('#fixLogo').click(() => {
    logoModal('<input type="file"/><br>로고 파일을 등록하세요.')})
})

	function NoticesList() {
    	$.ajax({
    		url: 'notice/get',
    		success: noticeList => {
    			if(noticeList.length){
    			notices = []
    			noticeList.forEach(notice => {
    				notices.unshift(
						'<tr>' +
							'<td>' + notice.noticeId + '</td>' + 
							'<td><a href="notice/adminNoticeView/' + notice.noticeId + '" class="a-black">' + notice.noticeTitle + '</a></td>' +
							'<td>' + notice.noticeTime + '</td>' +
							'<td>' + notice.userId + '</td>' +
						'</tr>'
    				)
    			})
    			
    				$('#notices').append(notices.join(''))
    			}else $('#notices').append(
    				`<tr><td colspan='4' class='text-center'>공지가 없습니다.</td></tr>`		
    			)
    		}
    	})
    }
    
    function init() {
    	$(NoticesList)
	    
    	$('#search').click(() => {
    		$('#notices').empty()
    		let notice ={
		    	noticeTitle : $('#searchValue').val()
    		} 
    		$.ajax({
    			url: 'notice/search',
    			data: notice,
    			success: noticeList => {
        			if(noticeList.length){
        			notices = []
        			noticeList.forEach(notice => {
        				notices.unshift(
    						'<tr>' +
    							'<td>' + notice.noticeId + '</td>' + 
    							'<td><a href="notice/adminNoticeView/' + notice.noticeId + '" class="a-black">' + notice.noticeTitle + '</a></td>' +
    							'<td>' + notice.noticeTime + '</td>' +
    							'<td>' + notice.userId + '</td>' +
    						'</tr>'
        				)
        			})
        			
        				$('#notices').append(notices.join(''))
        			}else $('#notices').append(
        				`<tr><td colspan='4' class='text-center'>공지가 없습니다.</td></tr>`		
        			)
        		}		
    		})
    	})
    }
    $(init)
    
</script>
</head>
<body>
<div class='container wrap'>
<div class='row mb-4'>
    <div class='col'>
        <div class='row'>
            <nav class="navbar navbar-expand navbar-light nav-header">
                <div class="container-fluid">
                    <a class="navbar-brand" href="../main.html"><b>산책하개</b></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                        <a class="nav-link" href="../main.html">회원</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="../meeting/01.html">모임</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="./notice">공지</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="../report/01.html">신고</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" type='button' id='fixLogo'>로고변경</a>
                        </li>
                    </ul>
                    </div>
                    <div>
                        <a class="nav-link a-gray" href="../user/01.html"><small>로그아웃</small></a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<div class='row mt-3'>
    <div class='col'>
        <div class="input-group mt-2 gap-2 wrap d-flex justify-content-center">
            <select class="select-orange" aria-label="Default select example">
                <option>공지제목</option>
                <option>작성자</option>
              </select>
            <mx-auto>
                <input type="search" class="form-control" placeholder="검색어 입력" aria-label="search" aria-describedby="search" id="searchValue">
            </mx-auto>
            <button class="btn botton-orange" type="submit" id="search">검색</button>
        </div>
    </div>
</div>
<div class='row mt-4'>
    <div class='col'>
        <table class='table text-center sm'>
            <thead class='table'>
                <tr><th style='width: 6rem;'>공지번호</th><th>공지제목</th><th>공지시간</th><th>작성자</th>
            </thead>
            <tbody id='notices'>
                
            </tbody>
        </table>
        <div class='row'>
            <div class='col-4'>
                <button type='button' class='btn botton-orange' id='noticeAdd' onclick='location.href="./notice/adminNoticeAdd"'>추가</button>
            </div>
            <div class='col gap-2 d-flex justify-content-start'>
                <nav aria-label="Page navigation example">
                    <ul class="pagination" >
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item" ><a class="page-link" href="page1">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
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
</body>
</html>