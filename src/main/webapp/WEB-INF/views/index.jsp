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
   <link rel="stylesheet" href="assets/css/main.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.2/sweetalert2.all.js"></script>
</head>

<body>

<!--header-->
<header id="site-header" class="fixed-top">
  <div class="container">
      <nav class="navbar navbar-expand-lg stroke">
          <a href="#"><img src="assets/images/logos/logo-yellow.png" class="img-curve img-fluid" alt="" /></a>
          <button class="navbar-toggler  collapsed bg-gradient" type="button" data-toggle="collapse"
              data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false"
              aria-label="Toggle navigation">
              <span class="navbar-toggler-icon fa icon-expand fa-bars"></span>
              <span class="navbar-toggler-icon fa icon-close fa-times"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
              <ul class="navbar-nav ml-auto">
                  <li class="nav-item active">
                      <a class="nav-link" href="index.html" style="font-family: 'Spoqa Han Sans Neo';">Home <span class="sr-only">(current)</span></a>
                  </li>
                  
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-family: 'Spoqa Han Sans Neo';">
                         	산 책 <span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1" style="font-family: 'Spoqa Han Sans Neo';" >
                      	<a class="dropdown-item" href="walk/list.do?cp=1" style="font-family: 'Spoqa Han Sans Neo';">산책모집 </a>
                          <a class="dropdown-item" href="walk/board.do" style="font-family: 'Spoqa Han Sans Neo';">산책후기 </a>
                      </div>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-family: 'Spoqa Han Sans Neo';">
                         	쇼 핑 <span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1" style="font-family: 'Spoqa Han Sans Neo';">
                      	<a class="dropdown-item" href="product?catgo_code=9" style="font-family: 'Spoqa Han Sans Neo';">쇼핑하기</a>
                          <a class="dropdown-item" href="cart" style="font-family: 'Spoqa Han Sans Neo';">장바구니</a>
                          <a class="dropdown-item" href="/shop/order" style="font-family: 'Spoqa Han Sans Neo';">결제</a>
                      </div>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-family: 'Spoqa Han Sans Neo';">
                         	 커뮤니티 <span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1" style="font-family: 'Spoqa Han Sans Neo';">
                          <a class="dropdown-item" href="board/list.do?board_idx=1" style="font-family: 'Spoqa Han Sans Neo';">공지사항</a>
                          <a class="dropdown-item" href="board/list.do?board_idx=2" style="font-family: 'Spoqa Han Sans Neo';">일상이야기</a>
                          <a class="dropdown-item" href="board/list.do?board_idx=3" style="font-family: 'Spoqa Han Sans Neo';">산책후기</a>
                          <a class="dropdown-item" href="board/list.do?board_idx=4" style="font-family: 'Spoqa Han Sans Neo';">일상이야기</a>
                      </div>
                  </li>
                  <c:choose>
                  	  <c:when test="${empty login.member_name}">
		                  <li class="nav-item">
		                      <a class="nav-link" href="/member/login.do" style="font-family: 'Spoqa Han Sans Neo';">로그인 </a>
		                  </li>
	                  </c:when>
	                  <c:otherwise>
	                  	  <li class="nav-item">
		                      <a class="nav-link" href="/member/login.do" style="font-family: 'Spoqa Han Sans Neo';">로그아웃 </a>
		                  </li>
		                  <li class="nav-item">
		                      <a class="nav-link" href="/member/login.do" style="font-family: 'Spoqa Han Sans Neo';">마이페이지 </a>
		                  </li>
	                  </c:otherwise>
                  </c:choose>
                  <!-- 관리자일때만 관리자페이지 입장 -->
                  <c:if test="${login.member_name eq 'admin'}"> 
	                  <li class="nav-item">
	                      <a class="nav-link" href="/admin/index.do" style="font-family: 'Spoqa Han Sans Neo';">관 리 </a>
	                  </li>
                  </c:if>
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
          
          <!-- 회원 접속 시, 메시지 띄움 -->
          <c:if test="${!empty login}">
	          <div>
	          <c:choose>
	          	<c:when test="${unread == 0}">
	          		<a href="/msg/chat.do"><img src="../assets/images/icon/message.png"></a>
	          	</c:when>
	          	<c:otherwise>
	          		<i class="mdi mdi-bell-outline"></i>
                    <span class="badge badge-pill gradient-2" style="position:absolute; margin-top:-1.3%; padding-left:1.6%;
                     margin-right:2%; color:#ffb446;">${unread}</span>
	          		<a href="/msg/chat.do"><img src="../assets/images/icon/colorMessage.png"></a>
	          	</c:otherwise>
	          </c:choose>
	          </div>
          </c:if>
          
      </nav>
  </div>
</header>
  <section class="w3l-main-slider" id="home">
    <div class="companies20-content">
      <div class="owl-one owl-carousel owl-theme">
        <div class="item">
          <li>
            <div class="slider-info banner-view bg bg2">
              <div class="banner-info">
                <div class="container" >
                  <div class="banner-info-bg text-left">
                    <h5>산 책</h5 style="font-family: 'Spoqa Han Sans Neo'; color:white;"><br/>
                    <p>함께하는 산책문화를 만들어요.</p>
                    <a class="btn btn-style btn-white mt-sm-5 mt-4 mr-2" href="walklist.do">산책모집</a>
                    <a class="btn btn-style border-btn mt-sm-5 mt-4" href="walkboard.do" style="color:#ffb446;">산책후기</a>
                  </div>
                </div>
              </div>
            </div>
          </li>
        </div>
        <div class="item">
          <li>
            <div class="slider-info  banner-view banner-top1 bg bg2">
              <div class="banner-info">
                <div class="container">
                  <div class="banner-info-bg ml-lg-auto">
                    <h5>쇼 핑</h5><br/>
                    <p>날개를 달아주세요!</p>
                    <a class="btn btn-style btn-white mt-sm-5 mt-4 mr-2" href="about.html">상품구경</a>
                    <a class="btn btn-style border-btn mt-sm-5 mt-4" href="contact.html" style="color:#ffb446;">후기구경</a>
                  </div>
                </div>
              </div>
            </div>
          </li>
        </div>
        <div class="item">
          <li>
            <div class="slider-info banner-view banner-top2 bg bg2">
              <div class="banner-info">
                <div class="container">
                  <div class="banner-info-bg text-left">
                   
                    <h5>커뮤니티</h5><br/>
                    <p>함께 일상을 나눠요.</p>
                    <a class="btn btn-style border-btn mt-sm-5 mt-4" href="contact.html" style="border-color:#ffb446; color:#ffb446;">일상이야기</a>
                  </div>
                </div>
              </div>
            </div>
          </li>
        </div>
        <div class="item">
          <li>
            <div class="slider-info banner-view banner-top3 bg bg2">
              <div class="banner-info">
                <div class="container">
                  <div class="banner-info-bg ml-lg-auto">
                  </div>
                </div>
              </div>
            </div>
          </li>
        </div>
      </div>
    </div>
  </section>
  <section class="w3l-grids-3 py-5" id="about">
    <div class="container py-md-5 py-3">
      <div class="bottom-ab-grids align-items-center">
        <div class="bottom-ab-left">
          <h6 class="sub-title">산책 친구 서비스</h6>
          <h2 class="hny-title">With My Pet</h2><br/>
          <p class="my-3">'위드마이펫' 은,<br/>모든 강아지들에게 친구가 생기기를 바라는 서비스입니다. <br/>근처의 산책 친구를 찾아보고, 커뮤니티를 통해 함께 일상을 나눌 수 있습니다.<br/>위드마이펫을 통해, 즐겁고 신나는 반려동물 생활을 즐기세요!</p>
            <a href="#read" class="read">Contact us</a>
        </div>
      </div>
    </div>
  </section>
  
<!-- 산책글 리스트 -->
<section class="w3l-features py-5" id="features">
  <div class="container py-lg-5 py-md-4">
    <div class="grids-area-hny main-cont-wthree-fea row">
    
      <c:if test="${empty map}">
      	최근 산책글이 없습니다.
      </c:if>
      
      <c:forEach items="${map.walk}" var="item" varStatus="status">
	      <div class="col-lg-4 col-sm-6 grids-feature">
	        <div class="area-box" style="text-align:center;">
	          <div class="icon">
	            <span class="fa fa-snowflake-o"></span>
	          </div><br/>
	          <label>${item.day}</label><br/>
	          <img style="width:100%; height:auto;"src="<c:url value="/img/${map.walkPics[status.index]}"/>">
	          <h4><a href="#feature" class="title-head">${item.walk_subject}</a></h4>
	          <p>${item.walk_content}</p>
	          <a onclick="loginCheck(${item.walk_idx})" class="read">함께하기</a>
<script>
function loginCheck(idx){
	var login = "${login.member_name}";
	if(login == ''){
		Swal.fire({
			  icon: 'error',
			  title: '로그인이 필요합니다!',
			  text: '산책은 회원 서비스 입니다. 로그인을 먼저 해주세요.',
			  footer: '<a href="/member/login.do">로그인</a> &nbsp;&nbsp;<b>/</b>&nbsp;&nbsp; <a href="/member/agree.do">회원가입</a>'
		})
	}else{
		location.href="walk/blog.do?idx="+idx;
	}
}
</script>
	        </div>
	      </div>
	</c:forEach>
      
      
    </div>
    <center><a href="walk/list.do?cp=1" class="read">전체 모집글 보기</a></center>
  </div>
</section>

<!-- stats -->
  <section class="w3l-stats py-5" id="stats">
    <div class="gallery-inner container py-lg-0 py-3">
      <div class="row stats-con pb-lg-3">
        <div class="col-lg-3 col-6 stats_info counter_grid">
          <p class="counter">${map.walkData.totalwalks}</p>
          <h4>총 산책 모집</h4>
        </div>
        <div class="col-lg-3 col-6 stats_info counter_grid1">
          <p class="counter">${map.walkData.totaljoins}</p>
          <h4>성사된 파티</h4>
        </div>
        <div class="col-lg-3 col-6 stats_info counter_grid mt-lg-0 mt-5">
          <p class="counter">${map.walkData.notjoin}</p>
          <h4>참여를 기다리는 파티</h4>
        </div>
        <div class="col-lg-3 col-6 stats_info counter_grid2 mt-lg-0 mt-5">
          <p class="counter">${map.walkData.todayPuppy}</p>
          <h4>오늘 행복해진 강아지</h4>
        </div>
      </div>
    </div>
  </section>
 
 <!-- pricing plans -->
<section class="w3l-pricing-7-main py-5" id="pricing">
  <div class="pricing-7-sec pt-lg-4 pt-md-3 pb-lg-5 pb-md-4">
      <div class="container pricing-grid">
          <div class="heading text-center mx-auto">
            <h6 class="sub-title">신상품</h6>
              <h3 class="hny-title mb-5">상품구경</h3>
          </div>
          <div class="pricing-sec-7">
              <!-- pricing grid 1 -->
              <div class="pricing-gd-left pric-7-1">
                  <div class="w3l-pricing-7">
                      <div class="w3l-pricing-7-top">
                      	<img src="assets/images/g11.jpg"
                      	onmouseover="this.src='assets/images/g11.jpg'"
                      	onmouseout="this.src='assets/images/g11-1.jpg'"
                      	><br/><br/>
                          <h6 class="one-light">네오프렌 한복</h6>
                         
                          <h4>13,000<span>  원</span></h4>
                      </div>
                      <!-- 신상품순서 상품정렬 -->
                      <div class="w3l-pricing-7-bottom">
                          <div class="w3l-pricing-7-bottom-bottom">
                              <ul class="links">
                                  <li>
                                      <p class="lists">부드러운 소재 ! 아이들이 좋아해요</p>
                                  </li>
                                  <li>
                                      <p class="lists line-through">쫀쫀하고 신축성으로 편안하게 한복을 착용 할 수 있답니다!</p>
                                  </li>
                                  <li>
                                      <p class="lists line-through">이번 새해에는 위마펫 네오프렌 한복과 함께하세요</p>
                                  </li>
                              </ul>
                          </div>
                          <div class="buy-button">
                              <a class="popup btn btn-style btn-primary" href="#buy">쇼핑하러 Go!</a>
                          </div>
                      </div>
                  </div>
              </div>
              
              <div class="pricing-gd-left pric-7 active">
                  <div class="w3l-pricing-7">
                      <div class="w3l-pricing-7-top">
                      <img src="assets/images/g11.jpg"
                      	onmouseover="this.src='assets/images/g16.jpg'"
                      	onmouseout="this.src='assets/images/g16-1.jpg'"
                      	><br/><br/>
                          <h5>조회수 1위</h5>
                          <h6>멜빵치마</h6>
                        
                          <h4>13,000<span>  원</span></h4>
                      </div>
                      <div class="w3l-pricing-7-bottom">
                          <div class="w3l-pricing-7-bottom-bottom">
                            <ul class="links">
                              <li>
                                      <p class="lists">적당한 신축성 ++ </p>
                                  </li>
                                  <li>
                                      <p class="lists line-through">편하고 멋스럽게 입히기 좋아요</p>
                                  </li>
                                  <li>
                                      <p class="lists line-through">다양한 이너티와 매치가능! 사계절 내내 꺼내 입힐 수 있답니다.</p>
                                  </li>
                          </ul>
                          </div>
                          <div class="buy-button">
                              <a class="popup btn btn-style btn-primary" href="#buy">쇼핑하러 Go!</a>
                          </div>
                      </div>
                  </div>
              </div>
              <!-- pricing grid 1 -->
              <div class="pricing-gd-left pric-7-1">
                  <div class="w3l-pricing-7">
                      <div class="w3l-pricing-7-top">
                      	<img src="assets/images/g11.jpg"
                      	onmouseover="this.src='assets/images/g14-1.jpg'"
                      	onmouseout="this.src='assets/images/g14.jpg'"
                      	><br/><br/>
                          <h6 class="one-light">와플 실내티</h6>
                         
                          <h4>13,000<span>  원</span></h4>
                      </div>
                      <!-- 신상품순서 상품정렬 -->
                      <div class="w3l-pricing-7-bottom">
                          <div class="w3l-pricing-7-bottom-bottom">
                              <ul class="links">
                                  <li>
                                      <p class="lists">와플 패턴에 밴딩 포인트</p>
                                  </li>
                                  <li>
                                      <p class="lists line-through">도톰한 후라이스 원단의 소매와 허리 부분 밴딩 마감</p>
                                  </li>
                                  <li>
                                      <p class="lists line-through">적당한 신축성으로 실내복으로도 제격인 제품이에요!</p>
                                  </li>
                              </ul>
                          </div>
                          <div class="buy-button">
                              <a class="popup btn btn-style btn-primary" href="#buy">쇼핑하러 Go!</a>
                          </div>
                      </div>
                  </div>
              </div>
          </div><br/><br/>
          <center><a href="#read" class="read">전체 상품</a></center>
      </div>
  </div>
</section>

<section class="w3l-clients" id="clients">

  <div class="cusrtomer-layout py-5">
      <div class="container py-lg-4 py-md-3 pb-lg-0">
          <div class="heading text-center mx-auto">
              <h6 class="sub-title text-center">산책 후기</h6>
              <h3 class="hny-title mb-md-5 mb-4">산책 후기를 들려주세요!</h3>
          </div>
          <!-- /grids -->
          <div class="testimonial-width">
              <div id="owl-demo1" class="owl-two owl-carousel owl-theme">
              
                    <c:forEach items="${board}" var="board">          
                  <div class="item">
                      <div class="testimonial-content">
                          <div class="testimonial">
                              <blockquote>
                                  <q>${board.content}</q>
                              </blockquote>
                              <div class="testi-des">
                                  
                                  </div>
                                  <div class="peopl align-self">
                                      <h3>${board.post_writer}</h3>
                                  </div>
                              </div>
                          </div>
                      </div>       
     	   		</c:forEach>
     	  	 </div>

                  
                  
                  
              </div>
          </div>
      </div>
      <!-- /grids -->
 

</section>


<section class="w3l-footer">
  <footer class="footer-28">
    <div class="footer-bg-layer">
      <div class="container py-lg-3">
        <div class="row footer-top-28">
          <div class="col-lg-6 col-md-5 footer-list-28 mt-5">
            <h6 class="footer-title-28">Contact information</h6>
            <ul>
              <li>
                <p><strong>Address</strong> : Seoul Mapo Baekbumro, South Korea</p>
              </li>
              <li>
                <p><strong>Contact</strong> : <a href="tel:+(12)234-11-24">Click Here</a></p>
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
                <h6 class="footer-title-28">Walk Service</h6>
                <ul>
                  <li><a href="about.html">Cha Ji Hyun</a></li>
                  <li><a href="blog.html">Lim Yeon Ji</a></li>
                </ul>
              </div>
              <div class="col-sm-4 col-6 footer-list-28 mt-5">
                <h6 class="footer-title-28">Shopping Service</h6>
                <ul>
                  <li><a href="contact.html">Lee Ok Seok</a></li>
                  <li><a href="#signup">Sung Jin Hee</a></li>
                </ul>
              </div>
              <div class="col-sm-4 footer-list-28 mt-5">
                <h6 class="footer-title-28">Member Service</h6>
                <ul>
                  <li><a href="#URL">Choi Woo Jae</a></li>
                  <li><a href="#URL">Lee Su Jin</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>


      <div class="midd-footer-28 align-center py-lg-4 py-3 mt-5">
        <div class="container">
          <p class="copy-footer-28 text-center"> &copy; 2021 With My Pet. All Rights Reserved.
           </p>
        </div>
      </div>
    </div>
  </footer>
  </section>
 
  <button onclick="topFunction()" id="movetop" title="Go to top">
    &#10548;
  </button>
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
  <script src="assets/js/theme-change.js"></script>
  <script src="assets/js/owl.carousel.js"></script>
  <script src="assets/js/jquery.waypoints.min.js"></script>
  <script src="assets/js/jquery.countup.js"></script>
  <script src="assets/js/jquery.magnific-popup.min.js"></script>
  <script src="assets/js/bootstrap.min.js"></script>
  <script src="../assets/plugins/sweetalert2/dist/sweetalert2.min.js"></script>
  <script src="//cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js"></script>
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</body>
</html>
    