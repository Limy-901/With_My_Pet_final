<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>

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
                      <div class="dropdown-menu " aria-labelledby="navbarDropdown1" style="font-family: 'Spoqa Han Sans Neo';" >
                      	<a class="dropdown-item" href="../walk/list.do?cp=1" >산책모집 </a>
                      </div>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-family: 'Spoqa Han Sans Neo';">
                         	쇼 핑 <span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1" style="font-family: 'Spoqa Han Sans Neo';">
                      	<a class="dropdown-item" href="../product?catgo_code=9">쇼핑하기</a>
                      </div>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-family: 'Spoqa Han Sans Neo';">
                         	 커뮤니티 <span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1" style="font-family: 'Spoqa Han Sans Neo';">
                          <a class="dropdown-item" href="../board/list.do?board_idx=1" style="font-family: 'Spoqa Han Sans Neo';">공지사항</a>
                          <a class="dropdown-item" href="../board/list.do?board_idx=2" style="font-family: 'Spoqa Han Sans Neo';">일상이야기</a>
                          <a class="dropdown-item" href="../board/list.do?board_idx=3" style="font-family: 'Spoqa Han Sans Neo';">산책후기</a>
                          <a class="dropdown-item" href="../board/list.do?board_idx=4" style="font-family: 'Spoqa Han Sans Neo';">일상이야기</a>
                      </div>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="/member/mypage.do" style="font-family: 'Spoqa Han Sans Neo';">마이페이지 </a>
                  </li>                     
                  <li class="nav-item">
                      <a class="nav-link" href="/member/logout.do" style="font-family: 'Spoqa Han Sans Neo';">로그아웃 </a>
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
                  <li class="nav-item">
                      <a href="/" style="font-family: 'Spoqa Han Sans Neo';">${login.member_name}님<br><center>환영합니다</center> </a>
                  </li> 
                  </nav>                  
          </div>
         
</header>

<!-- //header -->
&nbsp;
  <section class="w3l-stats py-5" id="follow-stats">
    <div class="gallery-inner container py-lg-0 py-3">
      <div class="row stats-con pb-lg-3">
        <div class="col-lg-3 col-6 stats_info counter_grid">
          <div class="testi-des">
          	<div class="test-img">
          		<img src="<c:url value="/img/${mpvo.pet_fname}"/>" class="img-fluid" alt="client-img" style="width: 130px; height: 130px;">
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
<br><br>
<section class="w3l-team-main">
 <center>
	<div style="float:left; margin-left:360px;">
		<div class="column position-relative">
			 <img src="<c:url value="/img/${mpvo.pet_fname}"/>" class="img-fluid img-thumbnail"/></a>
            </div>
            <div class="column">
              <br>
              <h3 class="name-pos"><a href="#url">${login.member_name}</a></h3>
              <p>
				<button onclick="location.href='mypageupdate.do'"class="btn btn-primary mt-4">내 정보수정</button >
				<button onclick="location.href='messge.do'"class="btn btn-primary mt-4">메세지</button >
				
			 </p>
			
			 <br>
              <div class="social">
                <div class="social-left">
                  <a href="#facebook" class="facebook"><span class="fa fa-facebook" aria-hidden="true"></span></a>
                  <a href="#twitter" class="twitter"><span class="fa fa-twitter" aria-hidden="true"></span></a>
                  <a href="#linkedin"><span class="fa fa-linkedin" aria-hidden="true"></span></a>
                </div>
              </div>
               </center>
            </div>
          </div>
</section>
         <br><br><br>
 <div style="width:400px; hight:400px; margin-right:440px; float:right;">
 	<center>
         <h1>강아지정보 입력</h1>
			<br>
                 <form action="mypagepetupdate.do" method="post" enctype="multipart/form-data">
			      <div class="text">
			      <br>
			          <input type="text" class="form-control" name="pet_name" id="w3lName" placeholder="name" required="">
			          <br><br>
			          <input type="text" class="form-control" name="pet_sex" id="w3lName" placeholder="sex" required="">
			          <br><br>
			          <input type="text" class="form-control" name="pet_age" id="w3lName" placeholder="age  ex)YYYY-MM-DD" required="">
			          <br><br>
			          <input type="text" class="form-control" name="pet_walkarea" id="w3lName" placeholder="walk area" required="">
			          <br><br>
			     
			      <h1>파일 업로드</h1><br>
						<input type="file" name="uploadfile" placeholder="파일 선택" /><br/>
						</form>
						<br>			     
			       <p>
			  	<button type="submit"  class="btn btn-primary mt-4">정보수정하기</button >
			  	<br><br>
			  	
			  	</p>
			  </form>
			
			  	 </center>
		  </div>
</body>
</html>