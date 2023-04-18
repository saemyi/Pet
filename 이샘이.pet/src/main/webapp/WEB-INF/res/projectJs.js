function confirmModal(con, url=null) {
    $('#modalMsg').html(con)
    if(url != null) {
        $('#confirmBtn').attr('onclick','location="' +  url +'"')
    }
    $('#modalBtnDouble').hide()
    $('#modalBtn').show()
    $('#logoBtn').hide()
    $('#modal').modal('show')
} 
function logoChange(){
	 $('#fixLogo').click(() => {
        logoModal( '<form id="logoForm" encType="multipart/form-data" action="/logo/add" method="post">' + 
                    '<input type="file" name="file" id="imageFile" accept="image/*"/>'+
                 '</form>' 
        )
    })
    
    $('#fixBtn').click(() => {
    	var form = $('#logoForm')[0];
        var formData = new FormData(form);
         
	    $.ajax({
	        url: '/logo/add',
	        method: 'post',
	        data: formData,
	        cache: false,
	        contentType: false,
	        processData: false
	    })
	 })
}


function yesNoModal(con, url=null) {
	$('#modalBtnDouble').show()
    $('#modalMsg').html(con)
    $('#modalBtn').hide()
    $('#logoBtn').hide()
    if(url != null) {
        $('#okBtn').attr('onclick', 'location="' +  url +'"')  
    }
    $('#modal').modal('show')
}

function logoModal(con) {
    $('#modalMsg').html(con)
    $('#modalBtn').hide()
    $('#modalBtnDouble').hide()
    $('#modal').modal('show')
}

function upLoadImg() {
    $('#uploadProfileBtn').click(() => $('#uploadProfile').click())
}

function pwCheck() {
    $('.pw').focusout(function(){
        let pw1 = $('#password').val();
        let pw2 = $('#pwCheck').val();
    
        $('#checkMsg').empty()
    
        if($('#password').val() != '' && $('#pwCheck').val() != '') {
            if(pw1 == pw2) {
                $('#pwCheck').after('<div id="checkMsg" style="color:green"><p>비밀번호가 일치합니다.</p></div>')
            } else {
                $('#pwCheck').after('<div id="checkMsg" style="color:red"><p id="errPw">비밀번호가 일치하지 않습니다.</p></div>')
            }
        }
    })
}

 //카카오 주소 api
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
            var extraAddr = '';
            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }
            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById('sample6_extraAddress').value = extraAddr;
            
            } else {
                document.getElementById('sample6_extraAddress').value = '';
            }

            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById('sample6_address').value = addr;
            document.getElementById('sample6_detailAddress').focus();
        }
    }).open();
}

//아이디 비밀번호 유효성검사
function userId_pw_check(input) {    
    var regex=/^[0-9a-z]{4,20}$/;
    return (input != '' && input != 'undefined' && regex.test(input)); 
}
//유저이름 유효성검사
function userName_check(input) {    
    var regex=/^[가-힣]{2,10}$/;
    return (input != '' && input != 'undefined' && regex.test(input)); 
}
//닉네임 유효성검사
function nickname_check(input) {    
    var regex=/^[가-힣A-Za-z0-9]{2,8}$/;
    return (input != '' && input != 'undefined' && regex.test(input)); 
}
//전화번호 유효성검사
function phone_check(input) {    
    var regex=/^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/; 
    return (input != '' && input != 'undefined' && regex.test(input)); 
}
//이메일 유효성검사
function email_check(input) {    
     var regex=/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; 
    return (input != '' && input != 'undefined' && regex.test(input)); 
}

//펫이름 유효성검사
function petName_check(input) {    
    var regex=/^[가-힣A-Za-z]{1,10}$/; 
    return (input != '' && input != 'undefined' && regex.test(input));  
}

function isVal(field) {
    let isGood = false

    if(!field.val()) errMsg = field.attr('placeholder') + ' 입력하세요'
    else isGood = true

    if(!isGood) {
        confirmModal(errMsg)
    }
    
    return isGood
}

function err(id, func, className, errMsg) {
	 $(id).blur(function(){
	    var input = $(this).val();
	    if(input == '' || input == 'undefined') return;
	    if(!func(input)) {
	        $(className).html(errMsg).css('color', 'red');
	        $(this).focus();
	        
	    }else {
	        $(className).text('');
	        isGood=true
	    }
	})
}




