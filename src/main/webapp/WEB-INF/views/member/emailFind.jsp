<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    
<!doctype html>
<html lang="en">

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

	<style>
	  	form {
	  		margin-top: 10px;
	  	}
	</style>

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
	                  <li class="nav-item">
	                      <a class="nav-link" href="/member/agree.do" style="font-family: 'Spoqa Han Sans Neo';">회원가입</a>
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
          <!-- //toggle switch for light and dark theme -->
      </nav>
  </div>
</header>


<!-- //header -->
<meta charset="UTF-8">
<title>Login</title>
<style type="text/css">
table {
	margin: 0 auto;
	border-collapse: separate !important;
    border-spacing: 0 10px;
}
button {
	margin-bottom: 30px
}

.sns-login-btn img {
vertical-align: middle;
	width: 200px;
    height: 48px;
    margin-top: 15px;
}
.sns-login-btn span {
	    font-weight: 600;
    vertical-align: middle;
}

</style>
</head>

		
		
	<!-- //header -->
	<div style="text-align:center">
	<section class="w3l-contact-1 pt-5"id="contact">
  		<div class="contacts-9 pt-lg-4">
      		<h5 class="sub-title text-center mb-2">With Us!</h5>
      		<h3 class="hny-title text-center mb-5">이메일 찾기</h3>
      		<div class="container pb-lg-4 modify-container">
          <div class="d-grid">
           
              <div class="map-content-9 mt-lg-0 mt-md-4 mt-2">
                  <!--<form action="https://sendmail.w3layouts.com/submitForm" method="post">-->
                      <div class="input-wrap">
 						   <input type="text" class="form-control" name="member_name" id="member_name" placeholder="NAME"
                              required="">
                          <input type="text" class="form-control" name="member_address" id="member_address" placeholder="ADDRESS"
                              required="">
              
              		<button onclick="emailFind()"  id="emailFind" class="btn btn-primary mt-4">이메일 찾기</button>
				</div>           

				</div>
			</div>
		</div>
	</div>
	</section>
	</div>
	
<script>
function emailFind(){
	var address = document.getElementById("member_address").value;
	var name = document.getElementById("member_name").value;
	$.ajax({
   	 url: "emailSearch.do",
   	 type:'GET',
	     async: false,
	     data:{  
	    	 address: address,
	    	 name: name 
	     },
	 	success:function(data){
	 		if(data.member_email == ''){
	 			alert("이름과 주소에 관련된 아이디가 없습니다.");
			} else {
				alert("아이디 : "+data.member_email);
	 		}
   		}
	});

}
	

</script>
</body>
</html>