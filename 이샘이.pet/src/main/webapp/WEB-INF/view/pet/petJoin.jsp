<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200' />
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css'>
<link rel='stylesheet' href='../res/project.css'>
<script src='../res/projectJs.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<title>반려견 등록</title>
<script>
    let pets = []
    let petNum = function* genPetNum() {
        let petNum = 1
        while(true) yield petNum++
    }()

function petName(input) {    
    var regex=/^[a-zA-Z가-힣]{1,10}$/;
    return (input != '' && input != 'undefined' && regex.test(input)); 
}

  $(() => {
	  
	    $("#petName").blur(function(){
	    var input = $(this).val();
	    if( input == '' || input == 'undefined') return;
	    if(!petName(input) ) {
	        $(".result-petName").html('<small class="errMsg">1자이상 10자이하 영어소문자와 한글만 입력가능합니다.</small>').css('color', 'red');
	        $(this).focus();
	        return false;
	    }else {
	        $(".result-petName").text('');
	    }
	    });
	
	    $('#okBtn').click(() => {
	        let petNum = $('#choice:checked').val()
	        pets = pets.filter(pet => pet.petNum != petNum)
	
	        $('#modal').modal('hide')
	        listPets()
	    })
	    
	   $('#joinBtn').click(() => {
		   if(isVal($("#petName")) && $(".errMsg").length == 0) {
			   let user = {
		      			userId: "${user.userId}",
		          		userName: "${user.userName}",
		          		profileImageFilename : "${user.userProfileImageFilename}",
		          		phone :"${user.phone}",
		          		email :"${user.email}",
		          		address : "${user.address}",
		          		detailedAddress : "${user.detailedAddress}",
		          		birthdate : "${user.birthdate}",
		          		pw : "${user.pw}",
		          		nickname : "${user.nickname}",
		        	}	
		            $.ajax({
		            	url: '../add',
		            	method: 'post',
		            	data: user,
		            	success: petJoin
		       })
		   	}
	    })
	})


function listPets() {
        $('input').not(':radio').val('')
        $('#pets').empty()

        if(pets.length) {
            const petArr = []

            $.each(pets, (i, pet) => {
                petArr.unshift(
                    	'<tr><td>' + 
                        '<input type="radio" value="' + pet.petNum + '"id="choice"/>' + '</td><td>'+ 
                        pet.petProfile + '</td><td>' +
                        pet.petName  + '</td><td>' + 
                        pet.petIntro + '</td></tr>')
            		})

            $('#pets').append(petArr.join(''))
        } else $('#pets').append (
            `<tr><td colspan='3' class='text-center'>반려견을 등록해주세요.</td></tr>`)
    }
  
function petJoin() {
	$('#petForm').submit()
}

    function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.createElement("img");
          img.setAttribute("src", event.target.result);
          img.setAttribute("class", 'img-fluid circle');
          document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
      }

$(upLoadImg)

</script>
</head>
<body>
    <div class='row d-flex justify-content-end'>
        <nav class="navbar fixed-top bg-white p-3">
            <div class='row'>
                <div class='col d-flex justify-content-start'>
                    <i class='bi bi-chevron-left' onclick="history.back();"></i>
                </div>
            </div>
            <div class='col text-center me-3'>
                <b>반려견 등록</b>
            </div>
        </nav>
    </div>
<div class='container text-center'>
    <form id='petForm' encType='multipart/form-data' action='/pet/petJoin' method='post'>
        <div class='row'>
            <div class='col mb-3'>
                  <div class="wrapper d-flex justify-content-center">
                      <div id="uploadProfileBtn" type='button' class='box'>
                          <div id="image_container"></div>
                      </div>
                  </div>
              <input type='file' id='uploadProfile' name='PetProfile' hidden>
              </div>
          </div>
        <div class='row'>
            <div class='col'>
                <input type='text' class='form-control mb-3' id='petName' name='petName' placeholder='반려견 이름'>
                <div id="error_id" class="result-petName result-check"></div>
            </div>
        </div>
        <div class='row mb-1'>
            <div class='col'>
                <textarea class='form-control' rows='5' id='petIntro' name='petIntro' placeholder='반려견 소개' maxlength='200'></textarea>
                <input type='text' class='form-control mb-3' id='userId' name='userId' value='${user.userId}' placeholder='주인이름' hidden>
            </div>
        </div>
            <table class='table'> 
                <tbody class='text-muted' id='pets'>
                    <tr><td colspan='2' class='text-center'>대표 반려견을 등록해주세요.</td></tr>              
                </tbody>
            </table> 
        </div>
    <div class='row p-3'>
        <button type='button' id='joinBtn' class='btn btn-orange'>가입완료</button>
    </div>    
</div>
</form>
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
</body>
</html>
