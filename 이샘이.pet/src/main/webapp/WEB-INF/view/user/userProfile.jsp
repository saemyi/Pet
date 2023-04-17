<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
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
<title>프로필조회</title>
<style>
    p {
    font-size: 12px;
}
</style>
<script>
$(() => {
	
	var userProfileImage = "${user.userProfileImageFilename}" 
	if(userProfileImage == "") {
	} else {
		$('#userProfileImage').html("<img id='userImage' class='image-thumbnail'/>")
		$('#userImage').attr('src', "/attach/${user.userProfileImageFilename}")
	}
})

function getPets() {
		$('#pets').empty()
		
		var userId = $('#userId').val()
		$.ajax({
			url: '/pet/getPets/' + userId,
			method: "post",
			data: userId,
			success: petsList => {
				console.log(petsList)
				if(petsList.length) {
					pets = []
					petsList.forEach(pet => {
						petIntro = pet.petIntro
						if(!petIntro){
							petIntro = '반려견 소개가 없습니다.'
						}
						if(pet.petProfileImageFilename != null) {
							pets.unshift(
								"<div class='card shadow mb-3'>" +
							    "<div class='card-body'>" +
						        "<div class='row'>" +
					            "<div class='petBox image-box d-flex justify-content-center' id='petProfileImage'>" +
					            '<img class="image-thumbnail" src="/attach/'+ pet.petProfileImageFilename + '"/>' +
					            "</div>" +
					            "<div class='col-8'>" +
					                "<h6><b>" + pet.petName + "</b></h6>" +
					                "<hr>" +
					                "<p>" + petIntro + 
					                "</p>" +
					            "</div></div></div></div>")  
						} else {
							pets.unshift(
								"<div class='card shadow mb-3'>" +
							    "<div class='card-body'>" +
						        "<div class='row'>" +
					            "<div class='petBox text-center p-3'>" +
					               "<p class='mt-4'>반려견</p>" +
					            "</div>" +
					            "<div class='col-8'>" +
					                "<h6><b>" + pet.petName + "</b></h6>" +
					                "<hr>" +
					                "<p>" + petIntro + 
					                "</p>" +
					            "</div></div></div></div>"
							)
						}
					})
				 $('#pets').append(pets.join(''))
				}
			}
		})
	}

$(getPets)
</script>
<body>
<header>    
    <div class='row d-flex justify-content-end'>
        <nav class="navbar fixed-top bg-orange p-3">
            <div class='row'>
                <div class='col-3 d-flex justify-content-start'>
                    <i class='bi bi-chevron-left' onclick="history.back();"></i>
                </div>
            </div>
            <div class='col-6 me-4'>
                <b>프로필</b>
            </div>
        </nav>
    </div>
<div class='container mb-5'>
    <div class='row p-3 d-flex justify-content-center mb-3'>
        <div class='col-5 box text-center m-0 p-0' id='userProfileImage'>
            <p class='mt-5'>프로필이미지</p>
        </div>
        <div class='col-7 mb-3'>
            <h5><b>${user.nickname}</b></h5><hr>
            <p>${user.userIntro}
            </p>
        </div>
    </div>
    <div class='row p-3 text-center mb-3' style='background-color: rgb(245, 244, 252);'>
    <h6 style='color: rgb(38, 38, 56);'><b>${user.nickname}님의 반려견</b></h6>
    </div>
</div>
<div id='pets'>
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