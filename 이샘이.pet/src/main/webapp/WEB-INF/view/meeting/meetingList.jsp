<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js'></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel='stylesheet' href='../res/project.css'>
<script src='../res/projectJs.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script>
$(() => {
})

function fillMeetingsArray(meetings) {
	const meetingArr = []
	
	$.each(meetings, (i, meeting) => {
		meetingArr.push(
			`<div class='row mt-auto'>
				<div class='col'>
					<div class='mb-2'>
						<div class="card" type="button" onclick="location.href='../meeting/` + meeting.meetingId + `'">
							<div class="card-body">
								<div class='row'>
									<div class='col'>
										<div class='row'>
											<div class='col-3'>
												<b><mark class='bg-orange'><span class='completionStatus'>` +
												(new Date() > new Date(meeting.meetingTime) ? "완료" : meeting.applicantNumber == meeting.recruitmentNumber ? "마감" : "모집중") +
												`</span></mark></b>
											</div>
											<div class='col'>
												<h6 class="card-title"><b><span class='meetingTitle'>` + meeting.meetingTitle + `</span></b></h6>
											</div>
										</div>
										<div class="row">
											<div class='col-3'></div>
											<div class='col'>
												<input type='datetime-local' class='form-control' name='meetingDateTime' id='meetingDateTime' style='border:none; background: none;' value='` + meeting.meetingTime + `' disabled/>
											</div>
										</div>
										<div class='row'>
											<div class="col-8 pt-1">
												<div class='progress'>
													<div class='progress-bar progress-bar-striped progress-bar-animated bg-primary' role='progressbar' ` + 
													"style='width:" + 100 * meeting.applicantNumber / meeting.recruitmentNumber + '%' + ";'>" +
													Math.floor(100 * meeting.applicantNumber / meeting.recruitmentNumber) + '%' + `</div>
												</div>
                                            </div>
                                            <div class="col-4 d-flex justify-content-center">
												<div class='mt-1 align-baseline d-flex justify-content-start participantStatus'>` +
												'인원 ' + meeting.applicantNumber + '/' + meeting.recruitmentNumber + `</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>`
		)
	})
	return meetingArr
}

function getMeetingsByParticipant() {
	$('#participating-meeting').empty()
	
	let info = {
		userId: "${userId}"
	}
	
	$.ajax({
		url: '/meeting/getMeetingsByParticipant',
		method: 'post',
		data: info,
		dataType: 'json',
		success: meetings => {
			if(meetings.length) {
				let meetingArr = fillMeetingsArray(meetings)
				$('#participating-meeting').append(meetingArr.join(''))
			} else {
				$('#participating-meeting').append(`<p class='text-center text-secondary mt-3'>참여 모임이 없습니다.</p>`)
			}
		}
	})
}

function getMeetingsByOwner() {
	$('#created-meeting').empty()
	
	let info = {
		userId: "${userId}"
	}
	
	$.ajax({
		url: '/meeting/getMeetings',
		method: 'post',
		data: info,
		dataType: 'json',
		success: meetings => {
			if(meetings.length) {
				let meetingArr = fillMeetingsArray(meetings)
				$('#created-meeting').append(meetingArr.join(''))
			} else {
				$('#created-meeting').append(`<p class='text-center text-secondary mt-3'>내가 만든 모임이 없습니다.</p>`)
			}
		}
	})
}

function init() {
	getMeetingsByParticipant()
	getMeetingsByOwner()
}

$(init)
</script>
<title>내 모임</title>
<style>
    
</style>
</head>
<body>
<header>
    <div class='row d-flex justify-content-end'>
        <nav class="navbar fixed-top bg-orange">
            <div class='row'>
                <div class='col d-flex justify-content-start'>
                    <i class='bi bi-chevron-left' onclick="location.href='../user/mypage'"></i>
                </div>
            </div>
            <div class='col text-center ms-5'>
                <b class='ms-4'>내 모임</b>
            </div>
        <li class="nav-item dropdown" style='list-style: none;'>
        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" style='text-decoration: none; color: black;' role="button" aria-expanded="false">모임확인</a>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#scrollspyHeading1">참여 모임</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#scrollspyHeading2">내가 만든 모임</a></li>
        </ul>
        </li>
        </nav>
    </div>
</header>
<div class='container'>
<div class='row'>
    <div class='col'>
        <div class='pb-2' id='scrollspyHeading1'>
            <p><b>참여 모임</b></p>
        </div>
        <div class='row' >
            <div class='col' id='participating-meeting'>
            </div>
        </div>
		<div class='pb-2 mt-3' id='scrollspyHeading2'>
			<p><b>내가 만든 모임</b></p>
		</div>
		<div class='row'>
			<div class='col' id='created-meeting'>
			</div>
		</div>
	</div>
</div>
</div>
<nav class="navbar fixed-bottom bg-orange">
    <div class="container-fluid pt-3">
        <div>
            <li class="nav-item" type="button" onclick="location.href='/meeting/add'">
                <span class="material-symbols-outlined">
                    add
                </span>
            </li>
        </div>
        <div>
            <li class="nav-item" type="button" onclick="location.href='/'">
                <span class="material-symbols-outlined">
                    format_list_bulleted
                </span>
            </li>
        </div>
        <div>
            <li class="nav-item" type="button" onclick="location.href='../user/mypage'">
                <span class="material-symbols-outlined">
                    person
                </span>
            </li>    
        </div>
    </div>
</nav>
</body>
</html>