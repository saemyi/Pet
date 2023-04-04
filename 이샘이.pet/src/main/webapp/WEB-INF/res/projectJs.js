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

function isVal(field) {
    let isGood = false

    if(!field.val()) errMsg = field.attr('placeholder') + '입력하세요'
    else isGood = true

    if(!isGood) {
        confirmModal(errMsg)
    }
    
    return isGood
}
