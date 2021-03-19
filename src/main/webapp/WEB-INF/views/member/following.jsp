<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
   <link rel="stylesheet" href="../assets/css/follow.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.2/sweetalert2.all.js"></script>
</head>

	<style>
	
	  	form {
	  		margin-top: 10px;
	  	}
	  	
	div.wrapper {
		display: flex;
        width: 740px;
        height: auto;
        justify-content: center;
        align-item: center;
    }
    div.left {
   		display: flex;
        width: 35%;
        box-sizing: border-box;
        text-align:center;
        justify-content: center;
        align-items: center;
    }
    div.center {
    	display: flex;
        width: 40%;
        box-sizing: border-box;
        justify-content: flex-start;
        align-items: center;
	}
	   
    div.right {
   	 	display: flex;
        width: 25%;
        box-sizing: border-box;
        justify-content: center;
        align-items: center;
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
                      <a class="nav-link" href="/member/mypage.do" style="font-family: 'Spoqa Han Sans Neo';">마이페이지 </a>
                  </li>                     
                  <li class="nav-item">
                      <a class="nav-link" href="/" style="font-family: 'Spoqa Han Sans Neo';">로그아웃 </a>
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
&nbsp;
<!-- //header -->
  <section class="w3l-stats py-5" id="follow-stats">
    <div class="gallery-inner container py-lg-0 py-3">
      <div class="row stats-con pb-lg-3">
        <div class="col-lg-3 col-6 stats_info counter_grid">
          <div class="testi-des">
          	<div class="test-img">
          		<img src="<c:url value="/img/${petMypage.pet_fname}"/>" class="img-fluid" alt="client-img" style="width: 130px; height: 130px;">
          	</div>
          </div>
          <h4>내 프로필</h4>
        </div>
        <div class="col-lg-3 col-6 stats_info counter_grid1" button type="button"  onclick="location.href =  '/member/mypost.do';">
          <p class="counter">80</p>
          <h4>게시물</h4>
        </div>
        <div class="col-lg-3 col-6 stats_info counter_grid mt-lg-0 mt-5" button type="button" onclick="location.href =  '/member/follower.do';">
          <p class="counter">${fn:length(followerMembervo1) }</p>
          <h4>팔로워</h4>
        </div>
        <div class="col-lg-3 col-6 stats_info counter_grid mt-lg-0 mt-5" button type="button" onclick="location.href =  '/member/following.do';">
          <p class="counter">${fn:length(followingMembervo1) }</p>
          <h4>팔로잉</h4>
        </div>
      </div>
    </div>
  </section>
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<br><br><br><br>
<div class="testi-des" style="margin-bottom:40px; text-align:center;">
<center>
<h2>팔로잉</h2>
<br><br><br>
<c:forEach var="followingMembervo1" items="${followingMembervo1}" varStatus="status">	
<input class="following_delete" type="hidden">
	<div class="wrapper">	
     <div class="left">
        <img src="<c:url value="/img/${followingMembervo2[status.index].pet_fname}"/>"  width="80" hight="80" align="middle">
        </div>
        <!-- 가운데 -->
        <div class="center">${followingMembervo1.member_name}
        </div>
        <!-- 오른쪽 -->
        <div class="right">
        <button onclick="following_delete(${followingMembervo1.member_number});" class="btn btn-primary mt-4">삭제</button>
        </div>
	</div>
<br><br><br>
		</c:forEach>
	</center>
</div>
<br><br>
</body>
<script>
function following_delete(member_number) {
	$('following_delete').val(member_number);
		
	$.ajax({
	    type : "POST",
	    url : "deleteFollowing.do",
	    data :{  member_number : member_number
	    	},
	    success : function(data) {
	    }
	});
}
</script>
</html>