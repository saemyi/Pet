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
<script src='https://kit.fontawesome.com/77ad8525ff.js' crossorigin='anonymous'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script>
$(() => {
	
})
 
function getParticipantData() {
	$.ajax({
		url: 'getMeetingCreator',
		dataType: 'json',
		success: participant => {
			if(participant.userProfileImageFilename != null) {
				$('#ownerProfile').html(
					`<div class='box image-box m-0 p-0 d-flex justify-content-center' id='userProfileImage'></div>
					<div class='col-7 mb-3'>
						<h5><b id='userNickname'></b></h5><hr>
						<p id='userIntro'></p>
					</div>`)
				$('#userProfileImage').html("<img src='/attach/" + participant.userProfileImageFilename + "' class='image-thumbnail'/>")
				$('#ownerProfile').attr('onclick', 'location="/profile/' + participant.userId +'"')
			} else {
				$('#ownerProfile').html(
					`<div class='box text-center image-box' id='userProfileImage'></div>
					<div class='col-7 mb-3'>
						<h5><b id='userNickname'></b></h5><hr>
						<p id='userIntro'></p>
					</div>`)
				$('#userProfileImage').html("<p class='mt-5'>프로필이미지</p>")
				$('#ownerProfile').attr('onclick', 'location="/profile/' + participant.userId +'"')
			}
			$('#userNickname').html('&nbsp;<i class="fa-solid fa-crown"></i>&nbsp;' + participant.nickname)
			if(!participant.userIntro) participant.userIntro = '유저 소개가 없습니다.'
			$('#userIntro').text(participant.userIntro)
		}
	})
	
	$.ajax({
		url: 'getParticipants',
		dataType: 'json',
		success: participants => {
			if(participants.length) {
				const participantArr = []
				
				$.each(participants, (i, participant) => {
					participantArr.push(
						`<div class="card shadow mb-3" id='participantProfile' type='button' onclick="location='/profile/\${participant.userId}'">
							<div class="card-body">
								<div class="row">` +
									(participant.userProfileImageFilename != null ? `<div class='box image-box m-0 p-0 d-flex justify-content-center'><img src='/attach/` + participant.userProfileImageFilename + `' class='image-thumbnail'/></div>` : `<div class='box text-center image-box'><p class='mt-5'>프로필이미지</p></div>`) +
									`<div class="col-7">
										<h6><b>` + participant.nickname + `</b></h6>
										<hr>
										<p>` + ((!participant.userIntro) ? '유저 소개가 없습니다.' : participant.userIntro) + `</p>
									</div>
								</div>
							</div>
						</div>`
					)
				})
				$('#participants').append(participantArr.join(''))
			}
		}
	})
}

function init() {
	getParticipantData()
}

$(init)
</script>
<title>참여자 목록</title>
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
                <b>참여자 목록</b>
            </div>
        </nav>
    </div>
<div class='container'>
<div class='row'>
	<div class='col'>
		<input type='text' class='form-control text-center mb-3' style='border: none; background-color: none;' value='참여자' disabled/>
		<div class='row p-3 d-flex justify-content-center' id='ownerProfile' type='button'>
		</div>
		<hr>
		<div id='participants'>
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