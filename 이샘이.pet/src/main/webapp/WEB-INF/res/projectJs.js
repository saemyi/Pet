function confirmModal(con, url=null) {
    $('#modalMsg').html(con)
    if(url != null) {
        $('#confirmBtn').attr('onclick','location="' +  url +'"')
    }
    $('#modalBtnDouble').hide()
    $('#logoBtn').hide()
    $('#modal').modal('show')
}

function yesNoModal(con, url=null) {
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
        let pw1 = $('#pw').val();
        let pw2 = $('#pwCheck').val();
    
        $('#checkMsg').empty()
    
        if($('#pw').val() != '' && $('#pwCheck').val() != '') {
            if(pw1 == pw2) {
                $('#pwCheck').after('<div id="checkMsg" style="color:green"><p>비밀번호가 일치합니다.</p></div>')
            } else {
                $('#pwCheck').after('<div id="checkMsg" style="color:red"><p>비밀번호가 일치하지 않습니다.</p></div>')
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

function userId_pw_check(input) {    
    var regex=/^[0-9a-z]{4,20}$/;
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

