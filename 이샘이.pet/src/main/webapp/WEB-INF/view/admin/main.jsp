<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC' crossorigin='anonymous'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js' integrity='sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM' crossorigin='anonymous'></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'>
<link rel='stylesheet' href='../res/admin.css'>
<script src='../res/projectJs.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<title>메인</title>
<style>
</style>
<script>
$(() => {
    $('#fixLogo').click(() => {
        logoModal('<input type="file"/><br>로고 파일을 등록하세요.')})
})

   function userList() {
   $.ajax({
      url: 'admin/user/get',
      success: userList => {
         if(userList.length){
            users = []
            userList.forEach(user => {
               let isSuspended = user.isSuspended
               let Sus = null
               if(isSuspended == 0) {
                  Sus = '0'
               }else Sus = 'x'
               users.unshift(
                  '<tr class="hover-cursor">' + 
                          '<td><a href="admin/adminUserDetail/' + user.userId +'" class="a-black">'  + user.userId + '</a></td>' + 
                          '<td>' + user.nickname +'</td>' + 
                          '<td>' + user.userName +'</td>' +
                          '<td>'+ user.phone + '</td>' +
                          '<td>' + user.email + '</td>' +
                          '<td>' + Sus + '</td>' +
                      '</tr>'      
               )
            })
            $('#users').append(users.join(''))
         }else $('#users').append(
               `<tr><td colspan='6' class='text-center'>회원이 없습니다.</td></tr>`         
         )
      }
   })
}
$(userList)
</script>
</head>
<body>
<div class='container wrap'>
<div class='row mb-4'>
    <div class='col'>
        <div class='row'>
            <nav class="navbar navbar-expand navbar-light nav-header">
                <div class="container-fluid">
                    <a class="navbar-brand" href="./main.html"><b>산책하개</b></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                        <a class="nav-link" href="main">회원</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="./admin/meeting">모임</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="./admin/notice">공지</a>
                        </li>
                        <li class="nav-item"> 
                        <a class="nav-link" href="./admin/report">신고</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" type='button' id='fixLogo'>로고변경</a>
                        </li>
                    </ul>
                    </div>
                    <div>
                        <a class="nav-link a-gray" href="logout"><small>로그아웃</small></a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<div class='row mt-3'>
    <div class='col'>
        <div class="input-group mt-2 gap-2 wrap d-flex justify-content-center">
            <mx-auto>
                <input type="search" class="form-control" placeholder="검색어 입력" aria-label="search" aria-describedby="search">
            </mx-auto>
            <button class="btn botton-orange" type="submit" id="button-addon2">검색</button>
        </div>
    </div>
</div>
<div class='row wrap'>
    <div class='col'>
        <table class='table text-center'>
            <div class='gap-2 d-flex justify-content-end'>
                <span class='label a-gray'>총 회원수 : </span>
                <span class='label a-gray'>1953</span>
            </div> 
            <thead class='table'>
                <tr><th>아이디</th><th>닉네임</th><th>이름</th><th>전화번호</th><th>이메일</th><th>이용정지</th></tr>
            </thead>
            <tbody id='users'>
                
            </tbody>
        </table>
        <div class='col gap-2 d-flex justify-content-center'>
            <nav aria-label="Page navigation example">
                <ul class="pagination" >
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item" ><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">6</a></li>
                    <li class="page-item"><a class="page-link" href="#">7</a></li>
                    <li class="page-item"><a class="page-link" href="#">8</a></li>
                    <li class="page-item"><a class="page-link" href="#">9</a></li>
                    <li class="page-item"><a class="page-link" href="#">10</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
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
            <div class='modal-footer' id='logoBtn'>
                <button type='button' class='btn btn-lightgray' id='closeBtn' data-bs-dismiss="modal">
                    취소
                </button>
                <button type='button' class='btn btn-orange' id='fixBtn' data-bs-dismiss="modal">변경</button>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>