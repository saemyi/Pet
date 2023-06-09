<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC' crossorigin='anonymous'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js' integrity='sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM' crossorigin='anonymous'></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script src='../../res/projectJs.js'></script>
<link rel='stylesheet' href='../../res/admin.css'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script type="application/javascript" src="../../res/hangjungdong.js"></script>
<title>모임리스트</title>
<style>
 td { 
 	font-size: 12px !important;
 }
</style>
<script>
let dataPerPage = 10;
let pageCount = 10;
let imageFilename;
$(() => {
	//sido option 추가
	jQuery.each(hangjungdong.sido, function (idx, code) {
		//append를 이용하여 option 하위에 붙여넣음
		jQuery('#sido').append(fn_option(code.sido, code.codeNm));
	});
	
	//sido 변경시 시군구 option 추가
	jQuery('#sido').change(function () {
		jQuery('#sigugun').show();
		jQuery('#sigugun').empty();
		jQuery('#sigugun').append(fn_option('', '시/군/구')); //
		jQuery.each(hangjungdong.sigugun, function (idx, code) {
			if (jQuery('#sido > option:selected').val() == code.sido)
				jQuery('#sigugun').append(fn_option(code.sigugun, code.codeNm));
		});
		
		//세종특별자치시 예외처리
		//옵션값을 읽어 비교
		if (jQuery('#sido option:selected').val() == '36') {
			jQuery('#sigugun').hide();
			//index를 이용해서 selected 속성(attr)추가
			//기본 선택 옵션이 최상위로 index 0을 가짐
			jQuery('#sigugun option').eq(1).attr('selected', 'selected');
			//trigger를 이용해 change 실행
			jQuery('#sigugun').trigger('change');
		}
		
		jQuery('#dong').empty();
		jQuery('#dong').prepend(fn_option('', '읍/면/동'));
		jQuery('#dong option').eq(0).attr('selected', 'selected');
	});
	
	//시군구 변경시 행정동 옵션추가
	jQuery('#sigugun').change(function () {
		//option 제거
		jQuery('#dong').empty();
		jQuery.each(hangjungdong.dong, function (idx, code) {
			if (jQuery('#sido > option:selected').val() == code.sido && jQuery('#sigugun > option:selected').val() == code.sigugun)
				jQuery('#dong').append(fn_option(code.dong, code.codeNm));
		});
		//option의 맨앞에 추가
		jQuery('#dong').prepend(fn_option('', '읍/면/동'));
		//option중 선택을 기본으로 선택
		jQuery('#dong option').eq(0).attr('selected', 'selected');
	});
	
	jQuery('#dong').change(function () {
		var sido = jQuery('#sido option:selected');
		var sigugun = jQuery('#sigugun option:selected');
		var dong = jQuery('#dong option:selected');
		
		var addressText = sido.text() + ' ' + sigugun.text() + ' ' + dong.text(); // 시도/시군구/읍면동 이름
		jQuery('#addressText').text(addressText);
		$('#sidoNm').text(sido.text())
		$('#sigugunNm').text(sigugun.text())
		$('#dongNm').text(dong.text())
		
		var addressCode = sido.val() + ' ' + sigugun.val() + ' ' + dong.val(); // 읍면동코드
		jQuery('#addressCode').text(addressCode);
	});
})

function fn_option(code, name) {
    return '<option value="' + code + '">' + name + '</option>';
}

function meetingList(currentPage, dataPerPage) {
	$('#meetings').empty()
	
	$.ajax({
		url: '/meeting/getMeetings',
		dataType: 'json',
		method: 'post',
		success: meetings => {
			if(meetings.length) {
				let meetingArr = fillMeetingsArray(meetings)
				currentPage = Number(currentPage)
				for(let i = (currentPage - 1) * dataPerPage;
					i < (currentPage - 1) * dataPerPage + dataPerPage;
					i++
					) {
					$('#meetings').append(meetingArr[i])
				}
				totalData = meetingArr.length
				viewPagination(totalData, dataPerPage, pageCount, currentPage)
			} else {
				$('#meetings').append('<tr><td colspan=6 class=text-center>모임이 없습니다.</td></tr>')
			}
			
			$('#sigugun').css("display", "none")
		}
	})
}

function fillMeetingsArray(meetings) {
	const meetingArr = []
	
	$.each(meetings, (i, meeting) => {
		$('#sido').val(meeting.sidoId).trigger('change')
		$('#sigugun').val(meeting.sigunguId).trigger('change')
		$('#dong').val(meeting.dongId).trigger('change')
		
		meetingArr.push(
			`<tr>
				<td><a href='/admin/meeting/` + meeting.meetingId + `' class='a-black'>` + meeting.meetingTitle + `</a></td> 
				<td>` + $('#sido option:selected').text() + ' ' + $('#sigugun option:selected').text() + ' ' + $('#dong option:selected').text() + `</td>
				<td><input type='datetime-local' class='form-control text-center' style='border:none; background: none; font-size: 12px; padding: 1px;' value='` + meeting.meetingTime + `' disabled/></td>
				<td>` + meeting.userId + `</td>
				<td>` + (meeting.applicantNumber == meeting.recruitmentNumber ? "o" : "x") + `</td>
				<td>` + (new Date() > new Date(meeting.meetingTime) ? "o" : "x") + `</td>
			</tr>`
		)
	})
	return meetingArr
}

function search(currentPage, dataPerPage) {
	$('#meetings').empty()
	
	let category = $('#searchCategory option:selected').val()
	let info = undefined
	
	switch(category) {
	case 'title':
		info = {
			meetingTitle : $('#searchValue').val()
		}
		break;
	case 'author':
		info = {
			userId: $('#searchValue').val()
		}
		break;
	}
	
	$.ajax({
		url: '/meeting/searchMeetings',
		method: 'post',
		data: info,
		dataType: 'json',
		success: meetings => {
			if(meetings.length) {
				let meetingArr = fillMeetingsArray(meetings)
				currentPage = Number(currentPage)
				for(let i = (currentPage - 1) * dataPerPage;
					i < (currentPage - 1) * dataPerPage + dataPerPage;
					i++
					) {
					$('#meetings').append(meetingArr[i])
				}
				totalData = meetingArr.length
				searchPagination(totalData, dataPerPage, pageCount, currentPage)
			} else {
				$('#meetings').append('<tr><td colspan=6 class=text-center>모임이 없습니다.</td></tr>')
			}
			
			$('#sigugun').css("display", "none")
		}
	})
}

function viewPagination(totalData, dataPerPage, pageCount, currentPage) {
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
	// 이전 화살표
	if(currentPage != 1){
		pageHtml += "<li class='page-item'><a href='#' class = 'page-link' aria-label='Previous' id='prev'> <span aria-hidden='true'>&laquo;</span></a></li>"
	}
	
	//페이지 번호 표시 
	for (var i = first; i <= last; i++) {
		if (currentPage == i) {
			pageHtml +=
			"<li class='page-item'><a href ='#' class = 'page-link currentPage' id='" + i + "'>" + i + "</a></li>";
		} else {
			pageHtml += "<li class='page-item'><a href ='#' class = 'page-link' id='" + i + "'>" + i + "</a></li>";
		}
	}
	//다음 화살표
	if (currentPage != totalPage) {
		pageHtml += "<li class='page-item'><a href='#' class = 'page-link' aria-label='Next' id='next'> <span aria-hidden='true'>&raquo;</span> </a></li>";
	}
	
	$("#pages").html(pageHtml);
	
	//페이지 번호 클릭 이벤트 
	$("#pages li a").click(function () {
		let $id = $(this).attr("id");
		selectedPage = $(this).text();
		
		if ($id == "next") selectedPage = currentPage + 1;
		if ($id == "prev") selectedPage = currentPage - 1;
		
		//페이지 표시 재호출
		viewPagination(totalData, dataPerPage, pageCount, selectedPage);
		//글 목록 표시 재호출
		meetingList(selectedPage, dataPerPage);
	});
}

function searchPagination(totalData, dataPerPage, pageCount, currentPage) {
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
	// 이전 화살표
	if(currentPage != 1){
		pageHtml += "<li class='page-item'><a href='#' class = 'page-link' aria-label='Previous' id='prev'> <span aria-hidden='true'>&laquo;</span></a></li>"
	}
	
	//페이지 번호 표시 
	for (var i = first; i <= last; i++) {
		if (currentPage == i) {
			pageHtml +=
			"<li class='page-item'><a href ='#' class = 'page-link currentPage' id='" + i + "'>" + i + "</a></li>";
		} else {
			pageHtml += "<li class='page-item'><a href ='#' class = 'page-link' id='" + i + "'>" + i + "</a></li>";
		}
	}
	//다음 화살표
	if (currentPage != totalPage) {
		pageHtml += "<li class='page-item'><a href='#' class = 'page-link' aria-label='Next' id='next'> <span aria-hidden='true'>&raquo;</span> </a></li>";
	}
	
	$("#pages").html(pageHtml);
	
	//페이지 번호 클릭 이벤트 
	$("#pages li a").click(function () {
		let $id = $(this).attr("id");
		selectedPage = $(this).text();
		
		if ($id == "next") selectedPage = currentPage + 1;
		if ($id == "prev") selectedPage = currentPage - 1;
		
		//페이지 표시 재호출
		searchPagination(totalData, dataPerPage, pageCount, selectedPage);
		//글 목록 표시 재호출
		search(selectedPage, dataPerPage);
	});
}

function init() {
	meetingList(1, dataPerPage)
	
	$('#searchBtn').click(() => {
		search(1, dataPerPage)
	})
	
	$('#fixLogo').click(() => {
           logoModal( '<form id="logoForm" encType="multipart/form-data" action="../../logo/add"  method="post">' + 
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
       	location.replace("/admin/meeting/list")
	})
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
					<a class="navbar-brand" href="../../admin"><b>산책하개</b></a>
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
					</button>
					<div class="navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item">
						<a class="nav-link" href="../../admin">회원</a>
						</li>
						<li class="nav-item">
						<a class="nav-link" href="../../admin/meeting/list">모임</a>
						</li>
						<li class="nav-item">
						<a class="nav-link" href="../notice">공지</a>
						</li>
						<li class="nav-item">
						<a class="nav-link" href="../report">신고</a>
						</li>
						<li class="nav-item">
						<a class="nav-link" type='button' id='fixLogo'>로고변경</a>
						</li>
					</ul>
					</div>
					<div>
						<a class="nav-link a-gray" href="../../logout"><small>로그아웃</small></a>
					</div>
				</div>
			</nav>
		</div>
	</div>
</div>
<div class='row mt-3'>
	<div class='col'>
		<div class="input-group mt-2 gap-2 wrap d-flex justify-content-center">
			<select class="select-orange" id='searchCategory' aria-label="Default select example">
				<option value='title'>제목</option>
				<option value='author'>작성자</option>
			</select>
			<mx-auto>
				<input type="search" class="form-control" placeholder="검색어 입력" aria-label="search" aria-describedby="search" id='searchValue'>
			</mx-auto>
			<button class="btn botton-orange" type="submit" id="searchBtn">검색</button>
		</div>
	</div>
</div>
<div class='row mt-4 sm'>
    <div class='col'>
        <table class='table text-center sm'>
            <thead class='table'>
                <tr><th>제목</th><th>장소</th><th>시각</th><th>작성자</th><th>마감</th><th>완료</th></tr>
            </thead>
            <tbody id='meetings'>
            </tbody>
        </table>
        <div class='row'>
        <div class='col gap-2 d-flex justify-content-center'>
            <nav aria-label="Page navigation example">
                <ul class="pagination" id='pages'>
                </ul>
            </nav>
        </div>
        </div>
    </div>
</div>
<div class='row'>
	<div class='col'>
		<select class='form-select' name='sido' id='sido' style='display:none;'>
			<option value=''>시/도</option>
		</select>
	</div>
	<div class='col'>
		<select class='form-select' name='sigugun' id='sigugun' style='display:none;'>
			<option value=''>시/군/구</option>
		</select>
	</div>
	<div class='col'>
		<select class='form-select' name='dong' id='dong' style='display:none;'>
			<option value=''>읍/면/동</option>
		</select>
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
</body>
</html>