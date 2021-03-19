<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>:: With My Pet :: 함께 산책해요 </title>
<style type="text/css">
table {
	margin: 0 auto;
}

.sns-login-btn {
    padding: 15px 24px;
}
.sns-login-btn img {
vertical-align: middle;
    width: 30px;
    height: 30px;
    margin-right: 8px;
}
.sns-login-btn span {
	    font-weight: 600;
    vertical-align: middle;
}
</style>

<head>
		<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>:: With My Pet :: 함께 산책해요 </title>
		 <!-- google fonts -->  
	<link rel="icon" type="image/png" sizes="16x16" href="../assets/images/icon/footprint16.png">
	<link href="//fonts.googleapis.com/css2?family=Jost:wght@300;400;600&display=swap" rel="stylesheet">
	<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="assets/plugins/toastr/css/toastr.min.css">
	<link rel="stylesheet" href="../assets/css/login.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
</head>
<body>
	
<!--header-->
<header id="site-header" class="fixed-top">
  <div class="container">
      <nav class="navbar navbar-expand-lg stroke">
        <a href="/"><img src="../assets/images/logos/logo-yellow.png" class="img-curve img-fluid" alt="" /></a>

          <button class="navbar-toggler  collapsed bg-gradient" type="button" data-toggle="collapse"
              data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false"
              aria-label="Toggle navigation">
              <span class="navbar-toggler-icon fa icon-expand fa-bars"></span>
              <span class="navbar-toggler-icon fa icon-close fa-times"></span>
          </button>

 			<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
              <ul class="navbar-nav ml-auto">
                  <li class="nav-item active">
                      <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
                  </li>
                  
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-family: 'Spoqa Han Sans Neo';">
                         	산 책 <span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1" style="font-family: 'Spoqa Han Sans Neo';" >
                      	<a class="dropdown-item" href="walk/list.do?cp=1" >산책모집 </a>
                          <a class="dropdown-item" href="walk/board.do">산책후기 </a>
                      </div>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-family: 'Spoqa Han Sans Neo';">
                         	쇼 핑 <span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1" style="font-family: 'Spoqa Han Sans Neo';">
                      	<a class="dropdown-item" href="product?catgo_code=9">쇼핑하기</a>
                          <a class="dropdown-item" href="cart">장바구니</a>
                          <a class="dropdown-item" href="order">결제</a>
                      </div>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-family: 'Spoqa Han Sans Neo';">
                         	 커뮤니티 <span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1" style="font-family: 'Spoqa Han Sans Neo';">
                          <a class="dropdown-item" href="board/list.do">공지사항</a>
                          <a class="dropdown-item" href="board/list.do">일상이야기</a>
                      </div>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="/member/login.do" style="font-family: 'Spoqa Han Sans Neo';">로그인</a>
                  </li>              
              </ul>
          </div>
          <!-- toggle switch for light and dark theme -->
          <div class="mobile-position">
              <nav class="navigation">
                  <div class="theme-switch-wrapper">
                      <label class="theme-switch" for="checkbox">
                          <input type="checkbox" id="checkbox">
                          <div class="mode-container">
                              <i class="gg-sun"></i>
                              <i class="gg-moon"></i>
                          </div>
                     </label>
                </div>
            </nav>
        </div>
      </nav>
  </div>
</header>

<!-- //header -->
		<div style="text-align:center">
		
		
		<section class="w3l-contact-1 pt-5"id="contact">
  <div class="contacts-9 pt-lg-4">
      <h5 class="sub-title text-center mb-2">With Us!</h5>
      <h3 class="hny-title text-center mb-5">회원가입</h3>
      <div class="container pb-lg-4 modify-container">
          <div class="d-grid">
           
              <div class="map-content-9 mt-lg-0 mt-md-4 mt-2">
                  <!--<form action="https://sendmail.w3layouts.com/submitForm" method="post">-->
                  <form action="signup.do" method="post">
                      <div class="input-wrap">
                          <input type="email" class="form-control" name="member_email" id="member_email" placeholder="E-MAIL"
                              required=""> 
                          <input type="password" class="form-control" name="member_password" id="member_password1" placeholder="PASSWORD"
                              required="">
                          <input type="password" class="form-control" name="member_password2" id="member_password2" placeholder="PASSWORDChk"
                              required="">
                          <input type="text" class="form-control" name="member_name" id="member_name" placeholder="NAME"
                              required="">
                          <input type="text" class="form-control" name="member_address" id="member_address" placeholder="ADRESS"
                              required="">
                      </div>
                     
                      <button type="submit" class="btn btn-primary mt-4">가입하기</button>
                  </form>
            </div>
          </div>
      </div>
  </div>
</section>


		</div>
	</body>
	
		<script>

		$("#member_email").blur(function() {
			var email = document.getElementById("member_email").value;
			if(email == ""){
				alert("이메일에는 공백이 들어갈수 없습니다ㅠㅠ");	
			} else{
				$.ajax({
					url : "mailChk.do",
					type: 'post',
					async: false,
					data:{
						email:email
					},
					success : function(data) {		
						if(data == 1){
							alert("이메일이 존재합니다. 다른 이메일을 입력해주세요.");
							
						}else{
							alert("사용가능한 이메일 입니다!");
							$("#member_password1").focus();
						}
					}
				})
			}
		});	
		
		$(function(){
			//비밀번호 확인
			$('#member_password2').blur(function(){
			   if($('#member_password1').val() != $('#member_password2').val()){
			    	if($('#member_password2').val()!=''){
				    alert("비밀번호가 일치하지 않습니다.");
			    	    $('#member_password2').val('');
			          $('#member_passwordw2').focus();
			       }
			    }
			})  	   
		});
	</script>
</html>

