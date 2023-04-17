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
<title>신고리스트</title>
<style>
 td {
 	font-size: 12px !important;
 }
</style>
<script>
var totalData;
var dataList; 
let dataPerPage = 10;
let pageCount = 10;
let globalCurrentPage = 1;

function init() {
	//글 목록 표시 호출 (테이블 생성)
	displayData(1, dataPerPage);
	
	$('#search').click(() => {
		searchData(1, dataPerPage);
	})
}

function displayData(currentPage, dataPerPage) {
	$('#reports').empty()
	$.ajax({
   		url: 'report/get',
   		success: reportList => {
   			if(reportList.length){
   			reports = []
   			reportList.forEach(report => {
   				var processed
   				if(report.isProcessed == 0){
   					processed = 'x'
   				}else processed = 'o'
   				
   				var reason
   				if(report.reason == '1'){
   					reason = '광고/음란성 댓글'
   				}else if(report.reason == '2'){
   					reason = '욕설/반말/부적절한 언어'
   				}else if(report.reason == '3'){
   					reason = '회원 분란유도'
   				}else if(report.reason == '4'){
   					reason = '회원 비방'
   				}else if(report.reason == '5'){
   					reason = '지나친 정치/종교 논쟁'
   				}else if(report.reason == '6'){
   					reason = '도배성 댓글'
   				}else if(report.reason == '7'){
   					reason = '기타'
   				}else reason = '사유 없음'
   
   				reports.unshift(
					'<tr>' +
						'<td>' + report.reportId + '</td>' + 
						'<td><a href=../admin/adminUserView/'+ report.targetId +' class = a-black>' + report.targetId + '</td>' + 
						'<td><a href=../admin/report/adminReportView/'+ report.reportId +' class = a-black id= reason>' + reason + '</a></td>' + 
						'<td>' + report.userId + '</td>' +
						'<td>' + processed + '</td>' + 
					'</tr>'
   				)
   				
   			})
   				currentPage = Number(currentPage);
	 			dataPerPage = 10;
	 			 for (
	 				    var i = (currentPage - 1) * dataPerPage;
	 				    i < (currentPage - 1) * dataPerPage + dataPerPage;
	 				    i++
	 				) {
	 					$('#reports').append(reports[i])
	 				 }
	 			
	 			totalData = reportList.length;
	 	        dataList = reports;
	 	        //페이징 표시 호출
	 			paging(totalData, dataPerPage, pageCount, currentPage);
   			}else $('#reports').append(
   				`<tr><td colspan='5' class='text-center'>신고글이 없습니다.</td></tr>`		
   			)
   		}
   	})
}

function paging(totalData, dataPerPage, pageCount, currentPage) {
	  totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
	  if(totalPage < pageCount){
	    pageCount = totalPage;
	  }
	  
	  let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
	  let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호

	  if (last > totalPage) {
	    last = totalPage;
	  }

	  let first = (pageGroup - 1) * 10 + 1; //화면에 보여질 첫번째 페이지 번호
	  let next = last + 1;
	  let prev = first - 1;
	  
	  $("#pages").empty();
	  let pageHtml = "";
	//페이징 이전 화살표
	  if(currentPage != 1){
		  pageHtml += "<li class='page-item'><a href='#' class = 'page-link' aria-label='Previous' id='prev'> <span aria-hidden='true'>&laquo;</span></a></li>"
	  }
	
	 //페이징 번호 표시 
	  for (var i = first; i <= last; i++) {
	    if (currentPage == i) {
	      pageHtml +=
	        "<li class='page-item'><a href ='#' class = 'page-link currentPage' id='" + i + "'>" + i + "</a></li>";
	    } else {
	      pageHtml += "<li class='page-item'><a href ='#' class = 'page-link' id='" + i + "'>" + i + "</a></li>";
	    } 
	  }
	//페이징 다음 화살표
	  if (currentPage != totalPage) {
	    pageHtml += "<li class='page-item'><a href='#' class = 'page-link' aria-label='Next' id='next'> <span aria-hidden='true'>&raquo;</span> </a></li>";
	  }

	  $("#pages").html(pageHtml);

	  //페이징 번호 클릭 이벤트 
	  $("#pages li a").click(function () {
	    let $id = $(this).attr("id");
	    selectedPage = $(this).text();

	    if ($id == "next") selectedPage = currentPage + 1;//selectedPage = next;
	    if ($id == "prev") selectedPage = currentPage - 1;//selectedPage = prev;
	    
	    //전역변수에 선택한 페이지 번호를 담는다...
	    globalCurrentPage = selectedPage;
	    //페이징 표시 재호출
	    paging(totalData, dataPerPage, pageCount, selectedPage);
	    //글 목록 표시 재호출
	    displayData(selectedPage, dataPerPage);
	  });

}

function searchData(currentPage, dataPerPage){
	$('#reports').empty()
	
	let report = '';
	
	if( $('#select option:selected').val() == 1){
		report = {
			targetId: $('#searchValue').val(),
			userId: '',
			isProcessed: undefined 
		}
	}
	
	if( $('#select option:selected').val() == 2){
		report = {
			targetId: '',
			userId: $('#searchValue').val(),
			isProcessed: undefined 
		}
	}
	
	if( $('#select option:selected').val() == 3){
		if($('#searchValue').val() == ''){
			report = {
					targetId: '',
					userId: '',
					isProcessed: undefined
				}
		}
		
		if($('#searchValue').val() == 'o'){
			report = {
				targetId: '',
				userId: '',
				isProcessed: 1
			}
		}
		
		if($('#searchValue').val() == 'x'){
			report = {
				targetId: '',
				userId: '',
				isProcessed: 0
			}
		}
	}
	
	$.ajax({
   		url: 'report/search',
   		data: report,
   		success: reportList => {
   			if(reportList.length){
   			reports = []
   
   			reportList.forEach(report => {
   				var processed
   				if(report.isProcessed == 0){
   					processed = 'x'
   				}else processed = 'o'
   				
   				var reason
   				if(report.reason == '1'){
   					reason = '광고/음란성 댓글'
   				}else if(report.reason == '2'){
   					reason = '욕설/반말/부적절한 언어'
   				}else if(report.reason == '3'){
   					reason = '회원 분란유도'
   				}else if(report.reason == '4'){
   					reason = '회원 비방'
   				}else if(report.reason == '5'){
   					reason = '지나친 정치/종교 논쟁'
   				}else if(report.reason == '6'){
   					reason = '도배성 댓글'
   				}else if(report.reason == '7'){
   					reason = '기타'
   				}else reason = '사유 없음'
   				
   				reports.unshift(
					'<tr>' +
						'<td>' + report.reportId + '</td>' + 
						'<td><a href=../admin/adminUserView/'+ report.targetId +' class = a-black>' + report.targetId + '</td>' + 
						'<td><a href=../admin/report/adminReportView/'+ report.reportId +' class = a-black id= reason>' + reason + '</a></td>' + 
						'<td>' + report.userId + '</td>' +
						'<td>' + processed + '</td>' + 
					'</tr>'
   				)
   				
   			})
   				currentPage = Number(currentPage);
	 			dataPerPage = 10;
	 			 
	 			for (
	 				    var i = (currentPage - 1) * dataPerPage;
	 				    i < (currentPage - 1) * dataPerPage + dataPerPage;
	 				    i++
	 				) {
	 					$('#reports').append(reports[i])
	 				 }
	 			
	 			totalData = reportList.length;
	 	        dataList = reports;
	 	
	 	        //페이징 표시 호출
	 			searchPaging(totalData, dataPerPage, pageCount, currentPage);
   			}else $('#reports').append(
   				`<tr><td colspan='5' class='text-center'>신고글이 없습니다.</td></tr>`		
   			)
   		}
   	})
}

function searchPaging(totalData, dataPerPage, pageCount, currentPage) {
	  totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
	  
	  if(totalPage < pageCount){
	    pageCount = totalPage;
	  }
	  
	  let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
	  let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
	 
	  if (last > totalPage) {
	    last = totalPage;
	  }

	  let first = (pageGroup - 1) * 10 + 1; //화면에 보여질 첫번째 페이지 번호
	  let next = last + 1;
	  let prev = first - 1;
	  
	  $("#pages").empty();
	  let pageHtml = "";
	//페이징 이전 화살표
	  if(currentPage != 1){
		  pageHtml += "<li class='page-item'><a href='#' class = 'page-link' aria-label='Previous' id='prev'> <span aria-hidden='true'>&laquo;</span></a></li>"
	  }
	
	 //페이징 번호 표시 
	  for (var i = first; i <= last; i++) {
	    if (currentPage == i) {
	      pageHtml +=
	        "<li class='page-item'><a href ='#' class = 'page-link currentPage' id='" + i + "'>" + i + "</a></li>";
	    } else {
	      pageHtml += "<li class='page-item'><a href ='#' class = 'page-link' id='" + i + "'>" + i + "</a></li>";
	    } 
	  }
	  //페이징 다음 화살표
	  if (currentPage != totalPage) {
	    pageHtml += "<li class='page-item'><a href='#' class = 'page-link' aria-label='Next' id='next'> <span aria-hidden='true'>&raquo;</span> </a></li>";
	  }

	  //console.log("pageHtml:" + pageHtml)
	  $("#pages").html(pageHtml);

	  //페이징 번호 클릭 이벤트 
	  $("#pages li a").click(function () {
	    let $id = $(this).attr("id");
	    selectedPage = $(this).text();

	    if ($id == "next") selectedPage = currentPage + 1;//selectedPage = next;
	    if ($id == "prev") selectedPage = currentPage - 1;//selectedPage = prev;
	    
	    //전역변수에 선택한 페이지 번호를 담는다...
	    globalCurrentPage = selectedPage;
	    //페이징 표시 재호출
	    searchPaging(totalData, dataPerPage, pageCount, selectedPage);
	    //글 목록 표시 재호출
	    searchData(selectedPage, dataPerPage);
	  });
}

$(logoChange)
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
                    <a class="navbar-brand" href="../admin"><b>산책하개</b></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                        <a class="nav-link" href="../admin">회원</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="../admin/meeting/list">모임</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="../admin/notice">공지</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="../admin/report">신고</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" type='button' id='fixLogo'>로고변경</a>
                        </li>
                    </ul>
                    </div>
                    <div>
                        <a class="nav-link a-gray" href="../logout"><small>로그아웃</small></a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<div class='row mt-3'>
    <div class='col'>
        <div class="input-group mt-2 gap-2 wrap d-flex justify-content-center">
            <select class="select-orange" id='select' aria-label="Default select example">
                <option value='1'>신고대상</option>
                <option value='2'>신고인</option>
                <option value='3'>처리여부</option>
              </select>
            <mx-auto>
                <input type="search" class="form-control" id='searchValue' placeholder="검색어 입력" aria-label="search" aria-describedby="search">
            </mx-auto>
            <button class="btn botton-orange" type="submit" id="search">검색</button>
        </div>
    </div>
</div>
<div class='row mt-4'>
    <div class='col sm'>
        <table class='table text-center'>
            <thead class='table'>
                <tr><th style='width: 6em;'>신고번호</th><th>신고대상</th><th>신고사유</th><th>신고인</th><th>처리여부</th>
            </thead>
            <span id='displayCount'></span>
            <tbody id='reports'>
            
            </tbody>
        </table>
        <div class='col gap-2 d-flex justify-content-center'>
            <nav aria-label="Page navigation example">
                <ul class="pagination" id='pages'>
                <!--
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item" ><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">6</a></li>
                    <li class="page-item"><a class="page-link" href="#">7</a></li>
                    <li class="page-item"><a class="page-link" href="#">8</a></li>
                    <li class="page-item"><a class="page-link" href="#">9</a></li>
                    <li class="page-item"><a class="page-link" href="#">10</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                     -->
                </ul>
            </nav>
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
                <button type='button' class='btn btn-orange' id='fixBtn' data-bs-dismiss="modal">등록</button>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>