<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC' crossorigin='anonymous'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js' integrity='sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM' crossorigin='anonymous'></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'>
<link rel='stylesheet' href='../res/admin.css'>
<script src='../res/projectJs.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<title>메인</title>
<style>
</style>
<script>
var totalData;
var dataList; 
let dataPerPage = 10;
let pageCount = 10;
let globalCurrentPage = 1;
let imageFilename;
$(() => {
	$('#fixLogo').click(() => {
        logoModal( '<form id="logoForm" encType="multipart/form-data" action="logo/add"  method="post">' + 
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
     })
})

function userCount() {
	$.ajax({
		url: 'admin/user/count',
		success: userCount => {
			if(userCount) {
				$('#userCount').text(userCount)
			}else $('#userCount').append(
				`<p>회원이 없습니다.</p>`		
			)
		}
	})
}

function displayData(currentPage, dataPerPage){
	$('#users').empty()
	$.ajax({
		url: 'admin/user/get',
		success: userList => {
			if(userList.length){
				users = []
				userList.forEach(user => {
					let isSuspended = user.isSuspended
					let str = user.phone
					let phone = str.substring(0,3) + '-' + str.substring(3,7) + '-' + str.substring(7,11)
					let Sus = null
					if(isSuspended == 0) {
						Sus = 'x'
					}else Sus = '○'
					users.unshift(
						'<tr>' + 
		                    '<td><a href="admin/adminUserView/' + user.userId +'" class="a-black">'  + user.userId + '</a></td>' + 
		                    '<td>' + user.nickname +'</td>' + 
		                    '<td>' + user.userName +'</td>' +
		                    '<td>'+ phone + '</td>' +
		                    '<td>' + user.email + '</td>' +
		                    '<td>' + Sus + '</td>' +
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
	 					$('#users').append(users[i])
	 				 }
	 			
	 			totalData = userList.length;
	 	        dataList = users;
	 	        //페이징 표시 호출
	 			paging(totalData, dataPerPage, pageCount, currentPage);
				
			}else $('#users').append(
					`<tr><td colspan='6' class='text-center'>회원이 없습니다.</td></tr>`			
			)
		}
	})
}

function paging(totalData, dataPerPage, pageCount, currentPage) {
	 // console.log("totalData " + totalData)
	 // console.log("pageCount " + pageCount)
	 // console.log("dataPerPage " + dataPerPage)
	
	  //console.log("currentPage " + currentPage)
	  totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
	 // console.log("paging totalPage : " + totalPage);
	  if(totalPage < pageCount){
	    pageCount = totalPage;
	  }
	  
	  let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
	//  console.log("pageGroup "+pageGroup)
	  let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
	 // console.log("last "+last)
	  if (last > totalPage) {
	    last = totalPage;
	  }

	  let first = (pageGroup - 1) * 10 + 1; //화면에 보여질 첫번째 페이지 번호
	  //console.log("first "+first)
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
	  
	  //상단 페이지 데이터 확인용
	  /* let displayCount = "";
	  displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
	  $("#displayCount").text(displayCount); */


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
	  
	  //console.log("totalData end :"+totalData)
}
	/*
	function userList() {
	$.ajax({
		url: 'admin/user/get',
		success: userList => {
			if(userList.length){
				users = []
				userList.forEach(user => {
					let isSuspended = user.isSuspended
					let str = user.phone
					let phone = str.substring(0,3) + '-' + str.substring(3,7) + '-' + str.substring(7,11)
					console.log(phone)
					let Sus = null
					if(isSuspended == 0) {
						Sus = 'x'
					}else Sus = '○'
					users.unshift(
						'<tr class="hover-cursor">' + 
		                    '<td><a href="admin/adminUserView/' + user.userId +'" class="a-black">'  + user.userId + '</a></td>' + 
		                    '<td>' + user.nickname +'</td>' + 
		                    '<td>' + user.userName +'</td>' +
		                    '<td>'+ phone + '</td>' +
		                    '<td>' + user.email + '</td>' +
		                    '<td>' + Sus + '</td>' +
		                '</tr>'		
					)
				})
				$('#users').append(users.join(''))
			}else $('#users').append(
					`<tr><td colspan='6' class='text-center'>회원이 없습니다.</td></tr>`			
			)
		}
	})
}
	*/

function searchData(currentPage, dataPerPage){
	$('#users').empty()
	let user = {
		userId : $('#searchValue').val()
	}
	$.ajax({
		url: 'admin/user/search',
		data: user,
		success: userList => {
			if(userList.length){
				users = []
				userList.forEach(user => {
					let isSuspended = user.isSuspended
					let str = user.phone
					let phone = str.substring(0,3) + '-' + str.substring(3,7) + '-' + str.substring(7,11)
					let Sus = null
					if(isSuspended == 0) {
						Sus = 'x'
					}else Sus = '○'
					users.unshift(
						'<tr>' + 
		                    '<td><a href="admin/adminUserView/' + user.userId +'" class="a-black">'  + user.userId + '</a></td>' + 
		                    '<td>' + user.nickname +'</td>' + 
		                    '<td>' + user.userName +'</td>' +
		                    '<td>'+ phone + '</td>' +
		                    '<td>' + user.email + '</td>' +
		                    '<td>' + Sus + '</td>' +
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
	 					$('#users').append(users[i])
	 				 }
	 			
	 			totalData = userList.length;
	 	        dataList = users;
	 	        //페이징 표시 호출
	 			paging(totalData, dataPerPage, pageCount, currentPage);
				
			}else $('#users').append(
					`<tr><td colspan='6' class='text-center'>회원이 없습니다.</td></tr>`			
			)
		}
	})
}
	function init() {
		$(userCount)
		
		displayData(1, dataPerPage);
		
		$('#search').click(() => {
			searchData(1, dataPerPage);
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
                        <a class="nav-link" href="./admin/meeting/list">모임</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="./admin/notice">공지</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="./admin/report">신고</a>
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
            <mx-auto>
                <input type="search" class="form-control" placeholder="아이디 입력" aria-label="search" aria-describedby="search" id="searchValue">
            </mx-auto>
            <button class="btn botton-orange" type="submit" id="search">검색</button>
        </div>
    </div>
</div>
<div class='row wrap'>
    <div class='col'>
        <table class='table text-center'>
            <div class='gap-2 d-flex justify-content-end'>
                <span class='label a-gray'>총 회원수 : </span>
                <span class='label a-gray' id='userCount'></span>
            </div> 
            <thead class='table'>
                <tr><th>아이디</th><th>닉네임</th><th>이름</th><th>전화번호</th><th>이메일</th><th>이용정지</th></tr>
            </thead>
            <tbody id='users'>
                
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
                <button type='button' class='btn btn-orange' id='fixBtn' data-bs-dismiss="modal">변경</button>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>