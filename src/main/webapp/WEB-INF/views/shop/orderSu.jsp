<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<head>
      <!-- Required meta tags -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>:: With My Pet :: 함께 산책해요 | 결제완료 </title>
      <!-- google fonts -->  
      <link href="//fonts.googleapis.com/css2?family=Jost:wght@300;400;600&display=swap" rel="stylesheet">
      <!-- google fonts --> 
      <!-- Template CSS -->
      <link rel="stylesheet" href="assets/css/cart.css">
      <!-- Template CSS -->
   </head>

<body>
  <!--header-->
 <header id="site-header" class="fixed-top">
         <div class="container">
            <nav class="navbar navbar-expand-lg stroke">
               <a href="../"><img src="assets/images/logos/logo-yellow.png" class="img-curve img-fluid" alt="" /></a>
               </a>
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
                     <li class="nav-item">
                        <a class="nav-link" href="../">Home <span class="sr-only">(current)</span></a>
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
                           <a class="dropdown-item" href="product">쇼핑하기</a>
                           <a class="dropdown-item" href="cart">장바구니</a>
                           <a class="dropdown-item" href="order">결제</a>
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
<section >
         <div class="breadcrumb-bg breadcrumb-bg-about py-sm-5 py-4">
            <div >
               <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                  <ol class="carousel-indicators">
                     <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                     <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                     <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                  </ol>
                  <div class="carousel-inner">
                     <div class="carousel-item active">
                        <img class="d-block w-100" src="assets/images/2ban1.jpg" height="400px" alt="First slide">
                     </div>
                     <div class="carousel-item">
                        <img class="d-block w-100" src="assets/images/2ban2.jpg" height="400px" alt="Second slide">
                     </div>
                     <div class="carousel-item">
                        <img class="d-block w-100" src="assets/images/2ban1.jpg" height="400px" alt="Third slide">
                     </div>
                  </div>
                  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                  </a>
                  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                  </a>
               </div>
            </div>
         </div>
      </section>
<!-- about breadcrumb -->
<section>
         <form name="order" id="order" method="post" action="order">
            <div class="container py-lg-5" >
            <div class="content-info-in row">
            <div class="content-gd col-lg-5 pl-lg-4">
            <div class="title-content text-left mb-2">
               <div class="title-content text-left mb-2">
                  <h3 class="hny-title">장바구니</h3 >
                  </br>
                  <ul class="tag" align="left">
                     <li class="design1">장바구니</li>
                     > 
                     <li class="design1">주문</li>
                     > 
                     <li class="design">결제 </li>
                  </ul>
               </div>
               </br>
               <table class="table--1aTBT9emfH" >
               </br><h3 align="center">주문이 완료되었습니다.</br> 🙇감사합니다.🙇‍♀</h3></br>
                  <colgroup>
                     <col class="col_1--5TSKjnuT7E">
                     <col class="col_3--3kO7FM0QDn">
                     <col class="col_4--2HuEbgLS2c">
                     <col class="col_5--1Q8JnXqems">
                  </colgroup>
                  <thead>
                     <tr>
                        <th class="th--1G-vGQPU9O" scope="col" width="25%">상품정보</th>
                        <th class="th--1G-vGQPU9O" scope="col" width="10%" >수량선택</th>
                        <th class="th--1G-vGQPU9O" scope="col" width="10%">size선택</th>
                        <th class="th--1G-vGQPU9O" scope="col" width="10%">주문금액</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:set var="sum" value="0" />
                     <c:forEach items="${cartLists}" var="cartList" varStatus="status">
                        <tr class="table_row--2U-tpJvyb0">
                           <th name="product_content" id="product_content" type="hidden" value="${cartList.product_content}" class="table_cell--275JhdiLLN" >${cartList.product_content}</td>
                           <th name="product_amount" id="product_amount" type="hidden" value="${cartList.product_amount}" class="table_cell--275JhdiLLN" >${cartList.product_amount}</td>
                           <th name="product_size" id="product_size" type="hidden" value="${cartList.product_size}" class="table_cell--275JhdiLLN" >${cartList.product_size}</td>
                           <th name="product_price" id="product_price" type="hidden" value="${cartList.product_price}" class="table_cell--275JhdiLLN" >${cartList.product_price}</td>
                        </tr>
                        <c:set var="sum" value="${sum + (cartList.product_price * cartList.product_amount)}" />
                     </c:forEach>
                  </tbody>
               </table>
            </div>
            
            <div class="order_calculator--2zlH_jz09P">
               <div class="product_price_total--3Qb27-JOGF">
                  <span class="text_mart--2kMJYDiHte">
                  <h5 align="center"> 회원 결제 정보</h5>
                     	<h6>총 주문금액
                     <fmt:formatNumber pattern="###,###,###" class="price--mkyVLxZMtX"  value="${sum+2500}" />
                     ${sum+2500}
            			
                  </span>
                 	 원
                  <h6 name="ordersu_name" id="ordersu_name" type="text" value="${ordersu.ordersu_name}">결제성함 : ${ordersu.ordersu_name}</h6>
                  <h6 name="product_code" id="product_code" type="text" value="${ordersu.product_code}">결제번호 : ${ordersu.product_code}</h6>
                  <h6 name="ordersu_addr" id="ordersu_addr" type="text" value="${ordersu.ordersu_addr}">배송지 : ${ordersu.ordersu_addr}</h6>
               </div>
            </div>
            <!-- //about breadcrumb -->
            <script src="assets/js/bootstrap.min.js"></script>
         </form>
      </section>
      <!-- move top -->
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
      </script>
      <!-- /move top -->
      </section>
      <!-- //footer-28 block -->
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
      <!-- libhtbox -->
      <script src="assets/js/lightbox-plus-jquery.min.js"></script>
      <!-- libhtbox -->
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
         
         function add_cart(product_code){
         	$.ajax({
         		type: "post",
         		async: false,
         		url: "addProductsInCart",
         		data: {product_code:product_code},
         		success: function(data, textStatus){
         			if(data.trim()=='add_success'){
         				alert("성공하셨습니다");
         			}else if(data.trim()=='already_existed'){
         				alert("이미 카트에 등록된 제품입니다");
         			}
         		},
         		error: function(data, textStatus){
         			alert("에러가 발생했습니다."+data);
         		},
         		complete: function(data, textStatus){
         			alert("작업을 완료했습니다");;
         		}
         		
         	});
         }
      </script>
      <!--//MENU-JS-->
      <script src="../assets/js/bootstrap.min.js"></script>
<section class="w3l-footer">
 
   </body>
</html>