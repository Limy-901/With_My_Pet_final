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
            <button onclick="location.href='mypagepetupdate.do'"class="btn btn-primary mt-4">강아지정보수정</button >
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
     <div style="width:400px; float:right; margin-right:440px; margin-top:-40px">
      <center>
         <h1>회원정보 수정</h1>
         <br>
    <form action="mypageupdate.do" method="post">
      <div class="text">
          <h1>${login.member_email}</h1>
          <br><br>
          <input type="text" class="form-control" name="member_password" id="w3lName" placeholder="password 변경" required="">
          <br><br>
          <input type="text" class="form-control" name="member_name" id="w3lName" placeholder="name 변경" required="">
          <br><br>
          <input type="text" class="form-control" name="member_address" id="w3lName" placeholder="adress 변경" required="">
          <br>
      </div>
       <p>
  	<button type="submit" class="btn btn-primary mt-4">정보수정하기</button >
  	</p>
  </form>
      </center>
 </div>
 

  <script>
    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function () {
      scrollFunction()
    };

    function scrollFunction() {
      if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("movetop").style.display = "block";
      } else {
        document.getElementById("movetop").style.display = "none";
      }
    }

    // When the user clicks on the button, scroll to the top of the document
    function topFunction() {
      document.body.scrollTop = 0;
      document.documentElement.scrollTop = 0;
    }
    
    $(document).ready(function () {
    	 $('.popup-with-zoom-anim').magnificPopup({
             type: 'inline',

             fixedContentPos: false,
             fixedBgPos: true,

             overflowY: 'auto',

             closeBtnInside: true,
             preloader: false,

             midClick: true,
             removalDelay: 300,
             mainClass: 'my-mfp-zoom-in'
           });

           $('.popup-with-move-anim').magnificPopup({
             type: 'inline',

             fixedContentPos: false,
             fixedBgPos: true,

             overflowY: 'auto',

             closeBtnInside: true,
             preloader: false,

             midClick: true,
             removalDelay: 300,
             mainClass: 'my-mfp-slide-bottom'
           });
    	$("#owl-demo1").owlCarousel({
    	      loop: true,
    	      margin: 20,
    	      nav: false,
    	      responsiveClass: true,
    	      responsive: {
    	        0: {
    	          items: 1,
    	          nav: false
    	        },
    	        736: {
    	          items: 1,
    	          nav: false
    	        },
    	        1000: {
    	          items: 2,
    	          nav: false,
    	          loop: false
    	        }
    	      }
    	    })
        $('.owl-one').owlCarousel({
          loop: true,
          margin: 0,
          nav: false,
          responsiveClass: true,
          autoplay: true,
          autoplayTimeout: 5000,
          autoplaySpeed: 1000,
          autoplayHoverPause: false,
          responsive: {
            0: {
              items: 1,
              nav: false
            },
            480: {
              items: 1,
              nav: false
            },
            667: {
              items: 1,
              nav: true
            },
            1000: {
              items: 1,
              nav: true
            }
          }
        })
      })

    var login = '${login.member_name}';
    var sender = $('#senNo').val();
    var socket = null;
    if(login != '') connectWS();
    function connectWS(){
    	var url = "ws://localhost:8080/replyEcho";
    	var ws = new WebSocket(url);
    	socket = ws;
    	// 커넥션 연결
    	ws.onopen = function(event){
    		console.log('info : connection opened'+event);
    	 // 메세지 왔을때 (알림 + 목록갱신)
    	 ws.onmessage = function (event){
    		toastr.options = {
                  closeButton: true,
                  progressBar: true,
                  showMethod: 'slideDown',
                  timeOut: 8000
           };
           toastr.success('메시지 알림', event.data+' 님이 메시지를 보냈습니다!');
    	 };
    	};
    	ws.onclose = function(event) { 
    		console.log('info : connection closed.');
    		setTimeout(function(){ 
    			connectWS();
    		}, 1000);
    	};
    	ws.onerror = function(event) { console.log('error : '+event); };
    };
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
      })
      
      
  </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="../assets/js/theme-change.js"></script>
  <script src="../assets/js/owl.carousel.js"></script>
  <script src="../assets/js/jquery.waypoints.min.js"></script>
  <script src="../assets/js/jquery.countup.js"></script>
  <script src="../assets/js/jquery.magnific-popup.min.js"></script>
  <script src="../assets/js/bootstrap.min.js"></script>
  <script src="../assets/plugins/sweetalert2/dist/sweetalert2.min.js"></script>
  <script src="//cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js"></script>
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</body>
</html>