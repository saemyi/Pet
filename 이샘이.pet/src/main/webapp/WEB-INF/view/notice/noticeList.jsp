<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel='stylesheet' href='../res/project.css'>
<script src='../res/projectJs.js'></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script>
	function listNotices() {
		$.ajax({
			url: 'notice/get',
			success: noticeList => {
				if(noticeList.length){
					notices = []
					noticeList.forEach(notice => {
						notices.unshift(
							'<li class="list-group-item" type="button" value="' + notice.noticeId + '" id=' + notice.noticeId + '>' +
								'<div class="row pt-2">' +
									'<div class="col-6 pt-1">' + 
									'<p>' + notice.title + '</p>' +
									'</div>' +
									'<div class="col-4 pt-1">' +
									'<p>' + notice.datetime + '</p>' +
									'</div>' +
									'<div class="col">' +
										'<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">' +
											'<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>' +
										'</svg>' +
									'</div>' +
								'</div>' +
							'</li>')
					})
					
						$('#notices').append(notices.join(''))
				} else $('#notices').append(
					`<ul class='list-group list-group-flush'>
		                <li class='list-group-item' type='button' onclick='location.herf="02.html"'>
		                    <div class='row pt-2'>
		                        <div class='col'>
		                            <p class='text-center'>공지사항이 없습니다.</p>
		                        </div>
		                    </div>
		                </li>
		            </ul>`)
				}
		})
	}
	$(listNotices)
</script>
<title>공지사항</title>
<style>
    p {
    font-size: 12px;
}
</style>
</head>
<body>
    <div class='row d-flex justify-content-end'>
        <nav class="navbar fixed-top bg-orange p-3">
            <div class='row'>
                <div class='col d-flex justify-content-start'>
                    <i class='bi bi-chevron-left' onclick="history.back();"></i>
                </div>
            </div>
            <div class='col text-center me-4'>
                <b>공지</b>
            </div>
        </nav>
    </div>
<div class='container'>
    <div class='row pt-3'>
        <div class='col'>
            <div class='card'>
                <div class='card-header pt-3'>
                <h4>공지사항</h4>
            </div>
        </div>
        <div class='card-body'>
            <ul class='list-group list-group-flush' id='notices'>
                                
            </ul>
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