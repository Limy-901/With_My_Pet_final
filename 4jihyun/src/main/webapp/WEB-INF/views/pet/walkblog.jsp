<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>:: With My Pet :: 산책모집 </title>
   <!-- google fonts -->  
   <link href="//fonts.googleapis.com/css2?family=Jost:wght@300;400;600&display=swap" rel="stylesheet">
   <!-- google fonts --> 
  <!-- Template CSS -->
  <link rel="stylesheet" href="assets/css/style-liberty.css">
    <link rel="stylesheet" href="assets/css/popup.css">
    <link rel="stylesheet" href="assets/css/blog.css">
  <!-- Template CSS -->
  
  
  
  <!--심볼시작  -->
  <svg display="none" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<defs>
<symbol id="icon-bubble" viewBox="0 0 1024 1024">
	<title>bubble</title>
	<path class="path1" d="M512 224c8.832 0 16 7.168 16 16s-7.2 16-16 16c-170.464 0-320 89.728-320 192 0 8.832-7.168 16-16 16s-16-7.168-16-16c0-121.408 161.184-224 352-224zM512 64c-282.784 0-512 171.936-512 384 0 132.064 88.928 248.512 224.256 317.632 0 0.864-0.256 1.44-0.256 2.368 0 57.376-42.848 119.136-61.696 151.552 0.032 0 0.064 0 0.064 0-1.504 3.52-2.368 7.392-2.368 11.456 0 16 12.96 28.992 28.992 28.992 3.008 0 8.288-0.8 8.16-0.448 100-16.384 194.208-108.256 216.096-134.88 31.968 4.704 64.928 7.328 98.752 7.328 282.72 0 512-171.936 512-384s-229.248-384-512-384zM512 768c-29.344 0-59.456-2.24-89.472-6.624-3.104-0.512-6.208-0.672-9.28-0.672-19.008 0-37.216 8.448-49.472 23.36-13.696 16.672-52.672 53.888-98.72 81.248 12.48-28.64 22.24-60.736 22.912-93.824 0.192-2.048 0.288-4.128 0.288-5.888 0-24.064-13.472-46.048-34.88-56.992-118.592-60.544-189.376-157.984-189.376-260.608 0-176.448 200.96-320 448-320 246.976 0 448 143.552 448 320s-200.992 320-448 320z"></path>
</symbol>
<symbol id="icon-star" viewBox="0 0 1024 1024">
	<title>star</title>
	<path class="path1" d="M1020.192 401.824c-8.864-25.568-31.616-44.288-59.008-48.352l-266.432-39.616-115.808-240.448c-12.192-25.248-38.272-41.408-66.944-41.408s-54.752 16.16-66.944 41.408l-115.808 240.448-266.464 39.616c-27.36 4.064-50.112 22.784-58.944 48.352-8.8 25.632-2.144 53.856 17.184 73.12l195.264 194.944-45.28 270.432c-4.608 27.232 7.2 54.56 30.336 70.496 12.704 8.736 27.648 13.184 42.592 13.184 12.288 0 24.608-3.008 35.776-8.992l232.288-125.056 232.32 125.056c11.168 5.984 23.488 8.992 35.744 8.992 14.944 0 29.888-4.448 42.624-13.184 23.136-15.936 34.88-43.264 30.304-70.496l-45.312-270.432 195.328-194.944c19.296-19.296 25.92-47.52 17.184-73.12zM754.816 619.616c-16.384 16.32-23.808 39.328-20.064 61.888l45.312 270.432-232.32-124.992c-11.136-6.016-23.424-8.992-35.776-8.992-12.288 0-24.608 3.008-35.744 8.992l-232.32 124.992 45.312-270.432c3.776-22.56-3.648-45.568-20.032-61.888l-195.264-194.944 266.432-39.68c24.352-3.616 45.312-18.848 55.776-40.576l115.872-240.384 115.84 240.416c10.496 21.728 31.424 36.928 55.744 40.576l266.496 39.68-195.264 194.912z"></path>
</symbol>
</defs>
</svg>
    <!--심볼끝  -->
  
  
  
</head>

<body>
<!--header-->
<header id="site-header" class="fixed-top">
  <div class="container">
      <nav class="navbar navbar-expand-lg stroke">
          <h1><a class="navbar-brand" href="index.html">
               Pooch Care
          </a></h1>
          <!-- if logo is image enable this   
      <a class="navbar-brand" href="#index.html">
          <img src="image-path" alt="Your logo" title="Your logo" style="height:35px;" />
      </a> -->
          <button class="navbar-toggler  collapsed bg-gradient" type="button" data-toggle="collapse"
              data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false"
              aria-label="Toggle navigation">
              <span class="navbar-toggler-icon fa icon-expand fa-bars"></span>
              <span class="navbar-toggler-icon fa icon-close fa-times"></span>
              </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
              <ul class="navbar-nav ml-auto">
                  <li class="nav-item active">
                      <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
                  </li>
                  
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         	산 책 <span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                      	<a class="dropdown-item" href="walklist.do">산책모집 </a>
                          <a class="dropdown-item" href="walkboard.do">산책후기 </a>
                      </div>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         	쇼 핑 <span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                      	<a class="dropdown-item" href="blog.html">쇼핑하기</a>
                          <a class="dropdown-item" href="blog.html">구매후기</a>
                      </div>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         	 커뮤니티 <span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                          <a class="dropdown-item" href="blog.html">공지사항</a>
                          <a class="dropdown-item" href="blog-single.html">일상이야기</a>
                      </div>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="gallery.html">로그인 </a>
                  </li>
                 
                  <li class="nav-item">
                      <a class="nav-link" href="contact.html">Contact </a>
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


<!-- /services-->
<!-- /services-grids-->
<section class="w3l-content-with-photo-4">
 <!-- 컨텐트 시작 -->
-
<div class="blog-container">
  

  <div class="blog-body">
  <p>2021년 2월 4일 목요일</p>
    <div class="blog-title">
      <h1><a href="#">공덕동 1:1 산책 파티 구해요!</a></h1>
    </div>
    
    <div class="blog-author--no-cover">
        <a class="avatar" style="background-image: url("https://secure.meetupstatic.com/photos/member/2/b/b/7/thumb_250991191.jpeg");"></a>
	   <div class="img-circle img-circle-sm">
                  <img src="assets/images/f2.jpg" class="mr-3" alt="...">
       </div> 	
       			<p class="name">지혀닝님이 산책할 친구를 기다리고 있어요!</p>
    </div>
    
    
 <div class="col-lg-3 col-sm-6 grids-feature">
        <div class="area-box">          
         <div class="col-md-4">
            <img src="assets/images/g1.jpg" class="img-fluid radius-image mt-1" alt="blog-post-image">
         </div>        
       <div class="col-md-8 align-self">  
        <p>2021년 2월 4일</p>
        <p>뽀미, 4살, 경계심이 많아요</p>       
          <p>대충 모집하는이의 내용입니다.</p>
        </div>
        </div>
      </div>
    
    
    
    
    
    <div class="blog-summary">
      <p>
		공덕동 근처 거주하시고 여성 분이었으면 좋겠네요! 강아지친구해요~~
		</p>
    </div>
    <div class="blog-tags">
      <ul>
        <li><a href="#">공덕동</a></li>
        <li><a href="#">포메라니안</a></li>
        <li><a href="#">1:1</a></li>
      </ul>
    </div>
  </div>
  
  <div class="blog-footer">
    <ul>
      <li class="published-date">12분 전</li>
      <li class="comments"><a href="#"><svg class="icon-bubble"><use xlink:href="#icon-bubble"></use></svg><span class="numero">8</span></a></li>
      <li class="shares"><a href="#"><svg class="icon-star"><use xlink:href="#icon-star"></use></svg><span class="numero">3</span></a></li>
    </ul>
  </div>

</div>
<div class="modifies">
 <a class="modify" href="#popup1">수정</a>
  <a class="modify" href="#popup1">삭제</a>
</div>
 
 

 
 
 
 <!-- 참가자리스트 -->
          <div class="attendlabel">
           <span>참가자(5)</span>
         </div>
         <div class="row">

          <div class="col-lg-4 col-md-6 item">
              <div class="card">
                  <div class="card-header p-0 position-relative">
                      <a href="blog-single.html">
                          <img class="card-img-bottom d-block" src="assets/images/g1.jpg" alt="Card image cap">
                      </a>
                      
                  </div>
                  <div class="card-body blog-details">
                      <p>차지현</p>
                      <p>저도 공덕살아요^^ 같이산책해요!</p>
                  </div>
              </div>
          </div>
          <div class="col-lg-4 col-md-6 item">
              <div class="card">
                  <div class="card-header p-0 position-relative">
                      <a href="blog-single.html">
                          <img class="card-img-bottom d-block" src="assets/images/g2.jpg" alt="Card image cap">
                      </a>
                      
                  </div>
                  <div class="card-body blog-details">
                      <p>차지현</p>
                      <p>회원</p>
                  </div>
              </div>
          </div>
          <div class="col-lg-4 col-md-6 item">
              <div class="card">
                  <div class="card-header p-0 position-relative">
                      <a href="blog-single.html">
                          <img class="card-img-bottom d-block" src="assets/images/g3.jpg" alt="Card image cap">
                      </a>
                      
                  </div>
                  <div class="card-body blog-details">
                      <p>차지현</p>
                      <p>회원</p>
                  </div>
              </div>
          </div>
          <div class="col-lg-4 col-md-6 item mt-md-0 mt-5">
              <div class="card">
                  <div class="card-header p-0 position-relative">
                      <a href="blog-single.html">
                          <img class="card-img-bottom d-block" src="assets/images/g4.jpg" alt="Card image cap">
                      </a>
                      
      			  </div>
                  <div class="card-body blog-details">
                      <p>차지현</p>
                      <p>회원</p>
                  </div>
              </div>
          </div>
           <div class="col-lg-4 col-md-6 item">
              <div class="card">
                  <div class="card-header p-0 position-relative">
                      <a href="blog-single.html">
                          <img class="card-img-bottom d-block" src="assets/images/g3.jpg" alt="Card image cap">
                      </a>
                      
                  </div>
                  <div class="card-body blog-details">
                      <p>차지현</p>
                      <p>회원</p>
                  </div>
              </div>
          </div>
          <div class="col-lg-4 col-md-6 item mt-md-0 mt-5">
              <div class="card">
                  <div class="card-header p-0 position-relative">
                      <a href="blog-single.html">
                          <img class="card-img-bottom d-block" src="assets/images/g4.jpg" alt="Card image cap">
                      </a>
                      
      			  </div>
                  <div class="card-body blog-details">
                      <p>차지현</p>
                      <p>회원</p>
                  </div>
              </div>
          </div>
      </div>
 
 <!-- 신청자리스트 -->
 
 
		<div class="apply">	 
           <div class="applylabel">
           <span>신청자(6)</span>
           </div>
           <div class="applyrow">
 		 <div class="col-lg-4 col-md-6 item">
              <div class="card">
                  <div class="card-header p-0 position-relative">
                      <a href="blog-single.html">
                          <img class="card-img-bottom d-block" src="assets/images/g1.jpg" alt="Card image cap">
                      </a>
                      
                  </div>
                  <div class="card-body blog-details">
                      <p>차지현</p>
                      <p>저도 공덕살아요^^ 같이산책해요!</p>
                  </div>
              </div>
          </div>
          <div class="col-lg-4 col-md-6 item">
              <div class="card">
                  <div class="card-header p-0 position-relative">
                      <a href="blog-single.html">
                          <img class="card-img-bottom d-block" src="assets/images/g2.jpg" alt="Card image cap">
                      </a>
                      
                  </div>
                  <div class="card-body blog-details">
                      <p>차지현</p>
                      <p>회원</p>
                  </div>
              </div>
          </div>
          <div class="col-lg-4 col-md-6 item">
              <div class="card">
                  <div class="card-header p-0 position-relative">
                      <a href="blog-single.html">
                          <img class="card-img-bottom d-block" src="assets/images/g3.jpg" alt="Card image cap">
                      </a>
                      
                  </div>
                  <div class="card-body blog-details">
                      <p>차지현</p>
                      <p>회원</p>
                  </div>
              </div>
          </div>
          <div class="col-lg-4 col-md-6 item mt-md-0 mt-5">
              <div class="card">
                  <div class="card-header p-0 position-relative">
                      <a href="blog-single.html">
                          <img class="card-img-bottom d-block" src="assets/images/g4.jpg" alt="Card image cap">
                      </a>
                      
      			  </div>
                  <div class="card-body blog-details">
                      <p>차지현</p>
                      <p>회원</p>
                  </div>
              </div>
          </div>

 		 <div class="col-lg-4 col-md-6 item mt-md-0 mt-5">
              <div class="card">
                  <div class="card-header p-0 position-relative">
                      <a href="blog-single.html">
                          <img class="card-img-bottom d-block" src="assets/images/g5.jpg" alt="Card image cap">
                      </a>
                      
      			  </div>
                  <div class="card-body blog-details">
                      <p>차지현</p>
                      <p>텍스트에 따라 카드크기 달라지는 아ㅣ슈</p>
                  </div>
              </div>
          </div>
                    <div class="col-lg-4 col-md-6 item mt-md-0 mt-5">
              <div class="card">
                  <div class="card-header p-0 position-relative">
                      <a href="blog-single.html">
                          <img class="card-img-bottom d-block" src="assets/images/g4.jpg" alt="Card image cap">
                      </a>
                      
      			  </div>
                  <div class="card-body blog-details">
                      <p>차지현</p>
                      <p>회원</p>
                  </div>
              </div>
          </div>
 		</div>
 		</div>

 
 
 <!-- 참가팝업시작 -->
<div id="popup1" class="overlay">
	<div class="popup">
		<h4>같이 산책할래요!</h4>
		<br>
		<a class="close" href="#">&times;</a>
		 <div class="col-lg-3 col-sm-6 grids-feature">
        <div class="area-box">          
         <div class="col-md-4">
            <img src="assets/images/g1.jpg" class="img-fluid radius-image mt-1" alt="blog-post-image">
         </div>        
       <div class="col-md-8 align-self">  
        <p>2021년 2월 4일</p>
        <p>뽀미, 4살, 경계심이 많아요</p>       
          <p>대충 파티지원자의 내용입니다.</p>
        </div>
        </div>
      </div>
		
		
		
      <form name="f" action="write.do" method="post">
          
          <label for="address">만나실 견주분께 인사를 보내보세요!</label><br>
          <input type="text" id="address" name="ct_address" size=45><br>
          <label for="address">같이 갈 강아지의 특징을 적어주세요<br>(ex// 애교가 많아 사람을 잘따라요!)</label><br>
          <input type="text" id="address" name="ct_address" size=45>
          
          <button type="submit" class="modify">보내기</button>
	   </form>

		</div>
	</div>
</div>
 
 
  <!-- 참가팝업끝 -->

</section>



	 <!-- 언더바 -->
			<div class="underbar">
			  <span class="undertext">2월 4일 (목) · 오후 7:00 GMT+9<br>
			    공덕동 1:1 산책 (2월 4일)</span>
			  <nav>
			   <a class="button" href="#popup1">참가할래요🐕</a>
			  </nav>
			</div>
	 <!-- 언더바 -->



<!-- disable body scroll which navbar is in active -->
<script>
  $(function () {
    $('.navbar-toggler').click(function () {
      $('body').toggleClass('noscroll');
    })
  });
</script>
<!-- disable body scroll which navbar is in active -->

  <!-- Template JavaScript -->
  <script src="assets/js/jquery-3.3.1.min.js"></script>
  <script src="assets/js/theme-change.js"></script>
  <!-- js for portfolio lightbox -->
  <!--/MENU-JS-->
  <script>
    $(window).on("scroll", function () {
      var scroll = $(window).scrollTop();

      if (scroll >= 80) {
        $("#site-header").addClass("nav-fixed");
      } else {
        $("#site-header").removeClass("nav-fixed");
      }
    });

    //Main navigation Active Class Add Remove
    $(".navbar-toggler").on("click", function () {
      $("header").toggleClass("active");
    });
    $(document).on("ready", function () {
      if ($(window).width() > 991) {
        $("header").removeClass("active");
      }
      $(window).on("resize", function () {
        if ($(window).width() > 991) {
          $("header").removeClass("active");
        }
      });
    });
  </script>
  <!--//MENU-JS-->

  <script src="assets/js/bootstrap.min.js"></script>
<!-- footer-28 block -->
<section class="w3l-footer">
  <footer class="footer-28">
    <div class="footer-bg-layer">
      <div class="container py-lg-3">
        <div class="row footer-top-28">
          <div class="col-lg-6 col-md-5 footer-list-28 mt-5">
            <h6 class="footer-title-28">Contact information</h6>
            <ul>
              <li>
                <p><strong>Address</strong> : #135 block, Barnard St. Brooklyn, London 10036, UK</p>
              </li>
              <li>
                <p><strong>Phone</strong> : <a href="tel:+(12)234-11-24">+(12)234-11-24</a></p>
              </li>
              <li>
                <p><strong>Email</strong> : <a href="mailto:example@mail.com">example@mail.com</a></p>
              </li>
            </ul>

            <div class="main-social-footer-28 mt-3">
              <ul class="social-icons">
                <li class="facebook">
                  <a href="#link" title="Facebook">
                    <span class="fa fa-facebook" aria-hidden="true"></span>
                  </a>
                </li>
                <li class="twitter">
                  <a href="#link" title="Twitter">
                    <span class="fa fa-twitter" aria-hidden="true"></span>
                  </a>
                </li>
                <li class="dribbble">
                  <a href="#link" title="Dribbble">
                    <span class="fa fa-dribbble" aria-hidden="true"></span>
                  </a>
                </li>
                <li class="google">
                  <a href="#link" title="Google">
                    <span class="fa fa-google" aria-hidden="true"></span>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-lg-6 col-md-7">
            <div class="row">
              <div class="col-sm-4 col-6 footer-list-28 mt-5">
                <h6 class="footer-title-28">Company</h6>
                <ul>
                  <li><a href="about.html">About Us</a></li>
                  <li><a href="blog.html">Blog Posts</a></li>
                  <li><a href="services.html">Services</a></li>
                  <li><a href="#pricing">Pricing</a></li>
                </ul>
              </div>
              <div class="col-sm-4 col-6 footer-list-28 mt-5">
                <h6 class="footer-title-28">Quick Links</h6>
                <ul>
                  <li><a href="contact.html">Contact Us</a></li>
                  <li><a href="#signup">Create account</a></li>
                  <li><a href="#learn">Care Center</a></li>
                  <li><a href="#feedback">Site Feedack</a></li>
                </ul>
              </div>
              <div class="col-sm-4 footer-list-28 mt-5">
                <h6 class="footer-title-28">Support</h6>
                <ul>
                  <li><a href="#URL">All Dogs</a></li>
                  <li><a href="#URL">Care Advices</a></li>
                  <li><a href="#URL">Care Support</a></li>
                  <li><a href="#URL">Veterinary Help</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>


      <div class="midd-footer-28 align-center py-lg-4 py-3 mt-5">
        <div class="container">
          <p class="copy-footer-28 text-center"> &copy; 2021 With My pet from Us. All Rights Reserved.
           </p>
        </div>
      </div>
    </div>
  </footer>
</section>
</body>
</html>