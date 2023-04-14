<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
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
    $('#delBtn').click(() => {
    	if(!$('#petId:checked').val()) {
    		confirmModal('삭제할 반려견을 선택하세요.')
    	} else {
    		if($('tr').length != 1) {
    		 	yesNoModal('반려견을 삭제하시겠습니까?')
    		}
    	}
   })

 //펫삭제
    $('#okBtn').click(() => {
   		$.ajax({
               url: '/pet/del/' + $('#petId:checked').val(),
               method: 'delete',
               success: function() {
            	   $('#image_container').empty()
            	   $('#imageTxt').show();
                   $('#petName').val('');
                   $('#petIntro').val('');
                   $('#UploadProfile').val('');
                   getPets();
               },
               error: console.log($('#petId:checked').val())
         })
    })

//펫추가
    $('#addBtn').click(() => {
        var url = $("#petForm").attr("action");
        var form = $('#petForm')[0];
        var formData = new FormData(form);

            $.ajax({
                url: url,
                type: 'post',
                data: formData,
                success: getPets,
                error: function (data) {
                alert(data);
                },
                cache: false,
                contentType: false,
                processData: false
        })
    })
    
    $('#pets').on({
    	change() {
    		var petProfile = $(this).parent().next().next().text()
    		if(petProfile != "") {
			$('#image_container').empty()
			$('#imageTxt').hide();
	    	var div = document.createElement("div");
	    	div.setAttribute("class", "petProfileImage");
	      	var img = document.createElement("img");
	        img.setAttribute("src", "/attach/" + petProfile);
	        img.setAttribute("id", 'UploadProfileBtn');
	        img.setAttribute("class", 'img-fluid image-thumbnail');
	        img.setAttribute("style", 'width:130px; height:130px;');
	        document.querySelector("div#image_container").appendChild(div).appendChild(img);
    		}
    		$('#petName').val($(this).parent().next().text())
    		$('#petIntro').val($(this).parent().next().next().next().text())
    	}
    }, '#petId')

    //펫수정
$('#fixBtn').click(() => {
        var petId = $('#petId:checked').val();
        var petName = $('#petName').val();
        var petIntro = $('#petIntro').val();
        if($('#uploadProfile').val()) {
        	var petProfile = $('#uploadProfile')[0].files[0]
        } else {
        	var petProfile = $('#petId:checked').parent().next().next().text()
        }
        var formData = new FormData();
        formData.append('petProfile', petProfile);
        formData.append('petName', petName);
        formData.append('petIntro', petIntro);
        formData.append('petId', petId);

        $.ajax({
            url: '/pet/fix',
            type: 'put',
            data: formData,
            success: function () {
                $('#petName').val('');
                $('#petIntro').val('');
                $('#UploadProfile').val('');
                getPets();
            },
            error: function (data) {
                alert(data);
            },
            cache: false,
            contentType: false,
            processData: false
        })
    })
})

//펫리스트
function getPets() {
    $('#pets').empty()

    $.ajax({
        url: '/pet/get',
        success: petsList => {
            console.log(petsList)
                if(petsList.length) {
                pets = []
                petsList.forEach(pet => {
                    if(pet.petProfileImageFilename != null) {
                        pets.unshift(
                            "<tr><td style='text-align: start;'><input name='petId' id='petId' type='radio' value='" + pet.petId +"'/></td><td>" +
                                pet.petName  + "</td><td hidden>" +pet.petProfileImageFilename + "</td><td hidden>"+pet.petIntro+"</td></tr>"
                        )
                    }
                })
             $('#pets').append(pets.join(''))
            } else $('#pets').append(
            		`<tr><td colspan='3' class='text-center'>반려견을 등록하세요.</td></tr>`)
        }
    })
}

function setThumbnail(event) {
	 $('#image_container').empty();
		$('.petProfileImage').hide();
    var reader = new FileReader();

    reader.onload = function(event) {
    	$('#imageTxt').hide();
    	var div = document.createElement("div");
    	div.setAttribute("class", "petProfileImage");
      	var img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        img.setAttribute("id", 'UploadProfileBtn');
        img.setAttribute("class", 'img-fluid image-thumbnail');
        img.setAttribute("style", 'width:130px; height:130px;');
        document.querySelector("div#image_container").appendChild(div).appendChild(img);
    };

    reader.readAsDataURL(event.target.files[0]);
  }

$(getPets)
$(upLoadImg)
</script>
<title>반려견 관리</title>
<style>
    
</style>
</head>
<body>
<div class='row d-flex justify-content-end'>
    <nav class="navbar fixed-top bg-orange p-3">
        <div class='row'>
            <div class='col-3 d-flex justify-content-start'>
                <i class='bi bi-chevron-left' onclick="history.back();"></i>
            </div>
        </div>
        <div class='col-6 text-end me-3'>
            <b>반려견 수정</b>
        </div>
        <div class='col-3'></div>
    </nav>
</div>
<div class='container text-center'>
    <form id='petForm' role='form' method='post' enctype='multipart/form-data' action='/pet/add'>
        <div class='row'>
            <div class='col mb-3'>
                  <div class="wrapper d-flex justify-content-center">
                <div id="uploadProfileBtn" type='button' class='box text-center'>
                	<input type='text' id='반려견사진' class='form-control mb-3' hidden>
                	<p id='imageTxt' class='mt-5'>반려견 사진</p>
                	<div id="image_container"></div>
                </div>
            </div>
              <input type="file" id="uploadProfile" class='image' name='PetProfile' accept="image/*" onchange="setThumbnail(event);" hidden/>
              </div>
          </div>
        <div class='row'>
            <div class='col'>
                <input type='text' name='petName' id='petName' class='form-control mb-3'  placeholder='반려견 이름'>
            </div>
        </div>
        <div class='row mb-1'>
            <div class='col'>
                <textarea class='form-control' name='petIntro' id='petIntro' rows='5' placeholder='반려견 소개'></textarea>
            </div>
        </div>
        <div class='col gap-2 d-flex justify-content-end'>
            <div class='row mt-3'>
                <div class='col d-grid gap-2 d-flex justify-content-end mb-3'>
                    <button type='button' class='btn btn-lightgray' id='addBtn'>
                        추가
                    </button>
                    <button type='button' class='btn btn-lightgray' id='fixBtn'>
                        수정
                    </button>
                    <button type='button' class='btn btn-lightgray' id='delBtn'>
                        삭제
                    </button>
                </div>
            </div>
        </div>
    </form>
    <div class='row mt-3'>
        <div class='col'>
            <table class='table'>
                <tbody class='text-muted' id='pets'>               
                </tbody>
            </table>
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
            <li class="nav-item" type="button" onclick="location.href='../user/main.html'">
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