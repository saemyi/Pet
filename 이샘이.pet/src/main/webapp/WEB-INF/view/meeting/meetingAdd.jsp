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
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<!-- https://zelkun.tistory.com/entry/004-jQuery-%EC%8B%9C%EB%8F%84%EC%8B%9C%EA%B5%B0%EA%B5%AC%EC%9D%8D%EB%A9%B4%EB%8F%99%EC%9D%84-%EC%9D%B4%EC%9A%A9%ED%95%9C-selectbox-%EC%A0%9C%EC%96%B4-with-%EA%B8%B0%EC%83%81%EC%B2%AD-%EB%8F%99%EB%84%A4%EC%98%88%EB%B3%B4 -->
<script type="application/javascript" src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
<link rel='stylesheet' href='../res/project.css'>
<script src='../res/projectJs.js'></script>
<script>
let isAddressComplete = false

$(() => {
    //sido option 추가
    jQuery.each(hangjungdong.sido, function (idx, code) {
        //append를 이용하여 option 하위에 붙여넣음
        jQuery('#sido').append(fn_option(code.sido, code.codeNm));
    });

    //sido 변경시 시군구 option 추가
    jQuery('#sido').change(function () {
    	isAddressComplete = false
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
    });

    //시군구 변경시 행정동 옵션추가
    jQuery('#sigugun').change(function () {
        //option 제거
    	isAddressComplete = false
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
    	isAddressComplete = true
        var sido = jQuery('#sido option:selected');
        var sigugun = jQuery('#sigugun option:selected');
        var dong = jQuery('#dong option:selected');

        var addressText = sido.text() + ' ' + sigugun.text() + ' ' + dong.text(); // 시도/시군구/읍면동 이름
        jQuery('#addressText').text(addressText);

        var addressCode = sido.val() + ' ' + sigugun.val() + ' ' + dong.val(); // 읍면동코드
        jQuery('#addressCode').text(addressCode);
    });
})

function fn_option(code, name) {
    return '<option value="' + code + '">' + name + '</option>';
}

function moveToMeetingView() {
	window.location.href = "meeting/view/" + "${lastMeetingId}"
}

function init() {
    $('#submitBtn').click(() => {
    	console.log($('#meetingTitle').val())
    	console.log($('#meetingContent').val())
    	console.log($('#meetingDateTime').val())
    	console.log($('#recruitmentNumber').val())
    	console.log("${userId}")
    	console.log($('#sido').val())
    	console.log($('#sigugun').val())
    	console.log($('#dong').val())
    	console.log(isAddressComplete)
        if($('#meetingTitle').val() && $('#meetingContent').val()
        		&& $('#meetingDateTime').val() && isAddressComplete) {
            let meeting = {
                title: $('#meetingTitle').val(),
                meetingContent: $('#meetingContent').val(),
				datetime: $('#meetingDateTime').val(),
				recruitmentNumber: $('#recruitmentNumber').val(),
				applicantNumber: 1,
				userId: "${userId}",
				sidoId: $('#sido').val(),
				sigunguId: $('#sigugun').val(),
				dongId: $('#dong').val()
			}

            $.ajax({
            	url: 'add',
            	method: 'post',
            	data: meeting,
            	success: moveToMeetingView
            })
        } else {
        	confirmModal("모든 정보를 입력해 주세요.")
        }
    })
}

$(init)
</script>
<title>모임추가</title>
<style>
    
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
                <b>모임등록</b>
            </div>
        </nav>
    </div>
<div class='container'>
<form>
<div class='row'>
    <div class='col'>
        <div class='mb-3'>
            <input type='text' class='form-control' name='meetingTitle' id='meetingTitle' placeholder='제목'/>
        </div>
    </div>
</div>
<div class='row'>
    <div class='col'>
        <div class='row'>
            <div class='col'>
                <select class='form-select' name='sido' id='sido'>
                    <option value=''>시/도</option>
                </select>
            </div>
            <div class='col'>
                <select class='form-select' name='sigugun' id='sigugun'>
                    <option value=''>시/군/구</option>
                </select>
            </div>
            <div class='col'>
                <select class='form-select' name='dong' id='dong'>
                    <option value=''>읍/면/동</option>
                </select>
            </div>
        </div>
    </div>
</div>
<div class='row mt-3'>
    <div class='col'>
        <div class='row'>
            <div class='col-3 text-center p-2'>
                <p>일&nbsp;&nbsp;시</p>
            </div>
            <div class='col-9'>
                <input type='datetime-local' class='form-control' name='meetingDateTime' id='meetingDateTime'/>
            </div>
        </div>
    </div>
</div>
<div class='row'>
    <div class='col'>
        <div class='row mb-3'>
            <div class='col-3 text-center p-2'><p>모집인원</p></div>
            <div class='col-9'>
                <select class='form-select' name='recruitmentNumber' id='recruitmentNumber'>
                    <option value='2'>2</option>
                    <option value='3'>3</option>
                    <option value='4'>4</option>
                    <option value='5'>5</option>
                    <option value='6'>6</option>
                    <option value='7'>7</option>
                    <option value='8'>8</option>
                    <option value='9'>9</option>
                    <option value='10'>10</option>
                </select>
            </div>
        </div>
    </div>
</div>
<div class='row'>
    <div class='col'>
        <div class='mb-3'>
            <textarea class='form-control' rows='10' name='meetingContent' id='meetingContent' placeholder='모임에 대한 구체적인 정보를 입력하세요 :&#41;'></textarea>
        </div>
    </div>
</div>
<div class='row'>
    <div class='col'>
        <div class='d-grid gap-2 mb-3'>
            <button type='button' class='btn btn-orange' id='submitBtn'>
                모임등록
            </button>
        </div>
    </div>
</div>
</form>
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
                <button type='button' class='btn btn-orange' id='fixBtn' data-bs-dismiss="modal">변경</button>
            </div>
        </div>
    </div>
</div>
<nav class="navbar fixed-bottom bg-orange">
    <div class="container-fluid pt-3">
        <div>
            <li class="nav-item" type="button" onclick="location.href='meeting/add'">
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