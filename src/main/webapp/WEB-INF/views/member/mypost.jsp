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
   <link rel="stylesheet" href="../assets/css/mypage-detail.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
</head>
 
  <style>
	  	form {
	  		margin-top: 100px;
	  	}
	</style>
	<script>
		$(document).ready(function(){
			$("#my-post").click(function(){
				//location.href="";
			});
		});
	</script>
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
          <!-- //toggle switch for light and dark theme -->
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
          		<img src="<c:url value="/img/${petMypage.pet_fname}"/>" class="img-fluid" alt="client-img" style="width: 130px;">
          	</div>
          </div>
          <h4>내 프로필</h4>
        </div>
        <div class="col-lg-3 col-6 stats_info counter_grid1" button type="button"  onclick="location.href =  '/member/mypost.do';">
          <p class="counter">80</p>
          <h4>게시물</h4>
        </div>
        <div class="col-lg-3 col-6 stats_info counter_grid mt-lg-0 mt-5" button type="button" onclick="location.href =  '/member/follower.do';">
          <p class="counter">812</p>
          <h4>팔로워</h4>
        </div>
        <div class="col-lg-3 col-6 stats_info counter_grid mt-lg-0 mt-5" button type="button" onclick="location.href =  '/member/following.do';">
          <p class="counter">90</p>
          <h4>팔로잉</h4>
        </div>
      </div>
    </div>
  </section>
          <section class="w3l-blog-block py-5">
  <div class="container py-lg-4 py-md-3">
      <div class="heading text-center mx-auto">
          <span class="sub-title text-center mb-2">Blog posts</span>
          <h3 class="hny-title mb-5">
            Highest Quality Care For Pets You'll Love</h3>
      </div>
      <div class="row">
          <div class="col-lg-4 col-md-6 item">
              <div class="card">
                  <div class="card-header p-0 position-relative">
                      <a href="post_blog.do">
                          <img class="card-img-bottom d-block" src="../assets/images/g1.jpg" alt="Card image cap">
                      </a>
                  </div>
                  <div class="card-body blog-details">
                      <a href="post_blog.do" class="blog-desc">Delivering happiness for Pets</a>
                      <p>Lorem ipsum dolor sit amet consectetur ipsum elit. Qui eligendi
                          vitae sit.</p>
                      <div class="author align-items-center mt-3 mb-1">
                          <a href="post_blog.do">Johnson smith</a> - <span class="meta-value"> May 23, 2020 </span>
                      </div>
                      <ul class="blog-meta">
                          <li class="meta-item blog-students">
                              <span class="meta-value"> <span class="fa fa-comment"></span> 30 comments</span>
                          </li>
                          <li class="meta-item blog-students">
                              <span class="meta-value"> <span class="fa fa-eye"></span> 30 Views</span>
                          </li>
                      </ul>
                  </div>
              </div>
          </div>
          <div class="col-lg-4 col-md-6 item mt-md-0 mt-5">
              <div class="card">
                  <div class="card-header p-0 position-relative">
                      <a href="blog-single.html">
                          <img class="card-img-bottom d-block" src="../assets/images/g2.jpg" alt="Card image cap">
                      </a>
                  </div>
                  <div class="card-body blog-details">
                      <a href="blog-single.html" class="blog-desc">Delivering happiness for Pets
                      </a>
                      <p>Lorem ipsum dolor sit amet consectetur ipsum elit. Qui eligendi
                          vitae sit.</p>
                      <div class="author align-items-center mt-3 mb-1">
                          <a href="#author">Johnson smith</a> - <span class="meta-value"> May 23, 2020 </span>
                      </div>
                      <ul class="blog-meta">
                          <li class="meta-item blog-students">
                              <span class="meta-value"> <span class="fa fa-comment"></span> 30 comments</span>
                          </li>
                          <li class="meta-item blog-students">
                              <span class="meta-value"> <span class="fa fa-eye"></span> 30 Views</span>
                          </li>
                      </ul>
                  </div>
              </div>
          </div>
          <div class="col-lg-4 col-md-6 item mt-lg-0 mt-5">
              <div class="card">
                  <div class="card-header p-0 position-relative">
                      <a href="blog-single.html">
                          <img class="card-img-bottom d-block" src="../assets/images/g3.jpg" alt="Card image cap">
                      </a>
                  </div>
                  <div class="card-body blog-details">
                      <a href="blog-single.html" class="blog-desc">Delivering happiness for Pets
                      </a>
                      <p>Lorem ipsum dolor sit amet consectetur ipsum elit. Qui eligendi
                          vitae sit.</p>
                      <div class="author align-items-center mt-3 mb-1">
                          <a href="#author">Johnson smith</a> - <span class="meta-value"> May 23, 2020 </span>
                      </div>
                      <ul class="blog-meta">
                          <li class="meta-item blog-students">
                              <span class="meta-value"> <span class="fa fa-comment"></span> 30 comments</span>
                          </li>
                          <li class="meta-item blog-students">
                              <span class="meta-value"> <span class="fa fa-eye"></span> 30 Views</span>
                          </li>
                      </ul>
                  </div>
              </div>
          </div>
          <div class="col-lg-4 col-md-6 item mt-5 pt-lg-3">
              <div class="card">
                  <div class="card-header p-0 position-relative">
                      <a href="blog-single.html">
                          <img class="card-img-bottom d-block" src="../assets/images/g4.jpg" alt="Card image cap">
                      </a>
                  </div>
                  <div class="card-body blog-details">
                      <a href="blog-single.html" class="blog-desc">Delivering happiness for Pets
                      </a>
                      <p>Lorem ipsum dolor sit amet consectetur ipsum elit. Qui eligendi
                          vitae sit.</p>
                      <div class="author align-items-center mt-3 mb-1">
                          <a href="#author">Johnson smith</a> - <span class="meta-value"> May 23, 2020 </span>
                      </div>
                      <ul class="blog-meta">
                          <li class="meta-item blog-students">
                              <span class="meta-value"> <span class="fa fa-comment"></span> 30 comments</span>
                          </li>
                          <li class="meta-item blog-students">
                              <span class="meta-value"> <span class="fa fa-eye"></span> 30 Views</span>
                          </li>
                      </ul>
                  </div>
              </div>
          </div>
          <div class="col-lg-4 col-md-6 item mt-5 pt-lg-3">
              <div class="card">
                  <div class="card-header p-0 position-relative">
                      <a href="blog-single.html">
                          <img class="card-img-bottom d-block" src="../assets/images/g5.jpg" alt="Card image cap">
                      </a>
                  </div>
                  <div class="card-body blog-details">
                      <a href="blog-single.html" class="blog-desc">Delivering happiness for Pets
                      </a>
                      <p>Lorem ipsum dolor sit amet consectetur ipsum elit. Qui eligendi
                          vitae sit.</p>
                      <div class="author align-items-center mt-3 mb-1">
                          <a href="#author">Johnson smith</a> - <span class="meta-value"> May 23, 2020 </span>
                      </div>
                      <ul class="blog-meta">
                          <li class="meta-item blog-students">
                              <span class="meta-value"> <span class="fa fa-comment"></span> 30 comments</span>
                          </li>
                          <li class="meta-item blog-students">
                              <span class="meta-value"> <span class="fa fa-eye"></span> 30 Views</span>
                          </li>
                      </ul>
                  </div>
              </div>
          </div>
          <div class="col-lg-4 col-md-6 item mt-5 pt-lg-3">
              <div class="card">
                  <div class="card-header p-0 position-relative">
                      <a href="blog-single.html">
                          <img class="card-img-bottom d-block" src="../assets/images/g6.jpg" alt="Card image cap">
                      </a>
                  </div>
                  <div class="card-body blog-details">
                      <a href="blog-single.html" class="blog-desc">Delivering happiness for Pets
                      </a>
                      <p>Lorem ipsum dolor sit amet consectetur ipsum elit. Qui eligendi
                          vitae sit.</p>
                      <div class="author align-items-center mt-3 mb-1">
                          <a href="#author">Johnson smith</a> - <span class="meta-value"> May 23, 2020 </span>
                      </div>
                      <ul class="blog-meta">
                          <li class="meta-item blog-students">
                              <span class="meta-value"> <span class="fa fa-comment"></span> 30 comments</span>
                          </li>
                          <li class="meta-item blog-students">
                              <span class="meta-value"> <span class="fa fa-eye"></span> 30 Views</span>
                          </li>
                      </ul>
                  </div>
              </div>
          </div>
          <div class="col-lg-4 col-md-6 item mt-5 pt-lg-3">
              <div class="card">
                  <div class="card-header p-0 position-relative">
                      <a href="post-blog.jsp">
                          <img class="card-img-bottom d-block" src="../assets/images/g7.jpg" alt="Card image cap">
                      </a>
                  </div>
                  <div class="card-body blog-details">
                      <a href="post-blog.jsp" class="blog-desc">Delivering happiness for Pets
                      </a>
                      <p>Lorem ipsum dolor sit amet consectetur ipsum elit. Qui eligendi
                          vitae sit.</p>
                      <div class="author align-items-center mt-3 mb-1">
                          <a href="#author">Johnson smith</a> - <span class="meta-value"> May 23, 2020 </span>
                      </div>
                      <ul class="blog-meta">
                          <li class="meta-item blog-students">
                              <span class="meta-value"> <span class="fa fa-comment"></span> 30 comments</span>
                          </li>
                          <li class="meta-item blog-students">
                              <span class="meta-value"> <span class="fa fa-eye"></span> 30 Views</span>
                          </li>
                      </ul>
                  </div>
              </div>
          </div>
          <div class="col-lg-4 col-md-6 item mt-5 pt-lg-3">
              <div class="card">
                  <div class="card-header p-0 position-relative">
                      <a href="blog-single.html">
                          <img class="card-img-bottom d-block" src="../assets/images/g8.jpg" alt="Card image cap">
                      </a>
                  </div>
                  <div class="card-body blog-details">
                      <a href="blog-single.html" class="blog-desc">Delivering happiness for Pets
                      </a>
                      <p>Lorem ipsum dolor sit amet consectetur ipsum elit. Qui eligendi
                          vitae sit.</p>
                      <div class="author align-items-center mt-3 mb-1">
                          <a href="#author">Johnson smith</a> - <span class="meta-value"> May 23, 2020 </span>
                      </div>
                      <ul class="blog-meta">
                          <li class="meta-item blog-students">
                              <span class="meta-value"> <span class="fa fa-comment"></span> 30 comments</span>
                          </li>
                          <li class="meta-item blog-students">
                              <span class="meta-value"> <span class="fa fa-eye"></span> 30 Views</span>
                          </li>
                      </ul>
                  </div>
              </div>
          </div>
          <div class="col-lg-4 col-md-6 item mt-5 pt-lg-3">
              <div class="card">
                  <div class="card-header p-0 position-relative">
                      <a href="blog-single.html">
                          <img class="card-img-bottom d-block" src="../assets/images/g9.jpg" alt="Card image cap">
                      </a>
                  </div>
                  <div class="card-body blog-details">
                      <a href="blog-single.html" class="blog-desc">Delivering happiness for Pets
                      </a>
                      <p>Lorem ipsum dolor sit amet consectetur ipsum elit. Qui eligendi
                          vitae sit.</p>
                      <div class="author align-items-center mt-3 mb-1">
                          <a href="#author">Johnson smith</a> - <span class="meta-value"> May 23, 2020 </span>
                      </div>
                      <ul class="blog-meta">
                          <li class="meta-item blog-students">
                              <span class="meta-value"> <span class="fa fa-comment"></span> 30 comments</span>
                          </li>
                          <li class="meta-item blog-students">
                              <span class="meta-value"> <span class="fa fa-eye"></span> 30 Views</span>
                          </li>
                      </ul>
                  </div>
              </div>
          </div>
      </div>
      <!-- pagination -->
      <div class="pagination-wrapper mt-5">
          <ul class="page-pagination">
              <li><span aria-current="page" class="page-numbers current">1</span></li>
              <li><a class="page-numbers" href="#url">2</a></li>
              <li><a class="page-numbers" href="#url">3</a></li>
              <li><a class="page-numbers" href="#url">4</a></li>
              <li><a class="page-numbers" href="#url">....</a></li>
              <li><a class="page-numbers" href="#url">15</a></li>
              <li><a class="next" href="#url"><span class="fa fa-angle-right"></span></a></li>
          </ul>
      </div>
      <!-- //pagination -->
  </div>
</section>
	</body>
</html>
