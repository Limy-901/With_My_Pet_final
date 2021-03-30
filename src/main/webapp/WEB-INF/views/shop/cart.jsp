<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
   <head>
      <!-- Required meta tags -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>:: With My Pet :: 함께 산책해요 | 장바구니 </title>
      <!-- google fonts -->  
      <link href="//fonts.googleapis.com/css2?family=Jost:wght@300;400;600&display=swap" rel="stylesheet">
      <!-- google fonts --> 
       <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
   
    <script src="../assets/js/jquery-3.3.1.min.js"></script>
      <!-- sweetAlert -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
      
      <!-- sweetAlert -->
      <!-- Template CSS -->
      <link rel="stylesheet" href="../assets/css/cart.css">
      <!-- Template CSS -->
   </head>
   <body>
      <!--header-->
      <header id="site-header" class="fixed-top">
         <div class="container">
            <nav class="navbar navbar-expand-lg stroke" >
               <a href="../"><img src="assets/images/logos/logo-yellow.png" class="img-curve img-fluid" alt="" /></a>
                <button class="navbar-toggler  collapsed bg-gradient" type="button" data-toggle="collapse"
                  data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false"
                  aria-label="Toggle navigation">
               <span class="navbar-toggler-icon fa icon-expand fa-bars"></span>
               <span class="navbar-toggler-icon fa icon-close fa-times"></span>
               </button>
               <div class="collapse navbar-collapse" id="navbarTogglerDemo02" style="margin-right: 7%;">
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
                        </div>
                     </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        커뮤니티 <span class="fa fa-angle-down"></span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                             <a class="dropdown-item" href="board/list.do?board_idx=1">공지사항</a>
                          <a class="dropdown-item" href="board/list.do?board_idx=2">일상이야기</a>
                          <a class="dropdown-item" href="board/list.do?board_idx=3">산책후기</a>
                          <a class="dropdown-item" href="board/list.do?board_idx=4">일상이야기</a>
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
		                      <a class="nav-link" href="/member/logout.do" style="font-family: 'Spoqa Han Sans Neo';">로그아웃 </a>
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
               <!-- //toggle switch for light and dark theme -->
            </nav>
         </div>
      </header>
      <!-- //header -->
     
      <!-- about carousel -->
      <section>
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
      <!-- //about carousel -->
      <section>
     
         <form name="order" id="order" method="post" action="order?member_number=4">
            <div class="container py-lg-5" >
            <div class="content-info-in row">
            <div class="content-gd col-lg-5 pl-lg-4">
            <div class="title-content text-left mb-2">
               <div class="title-content text-left mb-2">
                  <h3 class="hny-title">장바구니</h3 >
                  </br>
                  <ul class="tag" align="left">
                     <li class="design">장바구니</li>
                     > 
                     <li class="design1">주문</li>
                     > 
                     <li class="design1">결제 </li>
                  </ul>
               </div>
               </br>
               
               <table class="table--1aTBT9emfH" >
                  <colgroup>
                     <col class="col_1--5TSKjnuT7E">
                     <col class="col_2--YKLfiddUoQ">
                     <col class="col_3--3kO7FM0QDn">
                     <col class="col_4--2HuEbgLS2c">
                     <col class="col_5--1Q8JnXqems">
                  </colgroup>
                  <thead>
                     <tr>
                        <th class="th--1G-vGQPU9O" scope="col" >번호</th>
                        <th class="th--1G-vGQPU9O" scope="col" >상품정보</th>
                        <th class="th--1G-vGQPU9O" scope="col" width="10%">상품사진</th>
                        <th class="th--1G-vGQPU9O" scope="col" width="12%">수량선택</th>
                        <th class="th--1G-vGQPU9O" scope="col" width="15%">size선택</th>
                        <th class="th--1G-vGQPU9O" scope="col" width="15%">주문금액</th>
                      	<th class="th--1G-vGQPU9O" scope="col" width="15%"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:set var="sum" value="0" />
                     <c:set var="sum" value="0" />
                     <tr><c:if test="${empty cartLists}">
                     <td colspan="6" align="center">장바구니에 상품이 없습니다.<td>
               </c:if></tr>
                     <c:forEach items="${cartLists}" var="cartList" varStatus="status">
                     
                    <tr class="table_row--2U-tpJvyb0">
                    
                       <td name="product_code" id="product_code" type="hidden" value="${cartList.product_code}" class="table_cell--275JhdiLLN" >${status.index}</td>
                       <td name="product_content" id="product_content" type="text" value="${cartList.product_content}" class="table_cell--275JhdiLLN" >${cartList.product_content}</td>
                       <td class="table_cell--275JhdiLLN" ><img src="${cartList.product_image}" width=70 height=70 align="center"/></td>
                       <td>
                       <input id="product_amount<c:out value="${status.index}"/>" value="${cartList.product_amount}" type="number" class="ui selection dropdown" name="product_amount" min="1" max="10"></br>
                       <a class="button" onclick="a(<c:out value="${status.index}"/>);" style="padding:5px;margin-top:20px;">변경</a>
                       </td>
                       <td name="product_size" id="product_size" type="text" value="${cartList.product_size}" class="table_cell--275JhdiLLN" >${cartList.product_size}</td>
                       <td name="product_price" id="product_price" type="text" value="${cartList.product_price}" class="table_cell--275JhdiLLN" >${cartList.product_price}</td>
                       <td class="table_cell--275JhdiLLN" type="text" align='center' value="${status.index}"><a href="del?idx=${status.index}"><b>X</b></a></td>
                    </tr>
                    <c:set var="sum" value="${sum + (cartList.product_price * cartList.product_amount)}" />
                 </c:forEach>
                  </tbody>
                  <div class="listResult">
                     <div class="sum">
                        <tr>
                           <th class="table_cell--275JhdiLLN" colspan="7" value="${sum}"></br>주문 총 금액: ${sum}원  </br></th>
                        </tr>
                        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
                        <script type="text/javascript">
                        const swalWithBootstrapButtons = Swal.mixin({
                      	  customClass: {
                      	    confirmButton: 'btn btn-primary',
                      	    cancelButton: 'btn btn-default',
                      	  },
                      	  buttonsStyling: false
                     	})
                        function a(x){
                        	var product_amount=document.getElementById("product_amount"+x).value;
                        	swalWithBootstrapButtons.fire({
                        		showCancelButton: true,
                        		text :'수량을 변경하시겠습니까?',
                        		icon :'question',
                        		focusConfirm: false,
                        		confirmButtonText :'네',
                        		cancelButtonText :'아니오',
                        	}).then((result) => {
                        		if(result.isConfirmed){
                        			location.href = "changeQty?index="+x+"&product_amount="+product_amount;
                        		}else{
                        			return false;
                        		}
                        	})
                        }
                        
                        
                        </script>
                     </div>
                  </div>
               </table>
            </div>
            </br>
            <h3> 주문 금액 정보</h3>
            </br> 
            <div class="order_calculator--2zlH_jz09P">
               <div class="product_price_detail--uc8kecGUYk">
                  <dl class="product_price--2hbbWXbdsD">
                     <dt> 총 상품 금액</dt>
                     <dd>
                        <span class="price--mkyVLxZMtX">${sum}</span>원 
                        </br>+
                     </dd>
                  </dl>
                  <dl class="product_price--2hbbWXbdsD">
                     <dt> 배송비</dt>
                     <dd>
                        <span class="price--mkyVLxZMtX">2500</span>원 
                     </dd>
                  </dl>
               </div>
               <div class="product_price_total--3Qb27-JOGF">
                  <span class="text_mart--2kMJYDiHte">
                     	총 주문금액
                     <fmt:formatNumber pattern="###,###,###" class="price--mkyVLxZMtX"  value="${sum+2500}" />
                     ${sum+2500}
                  </span>
                 	 원
              </div>
            </div>
           </br>
            &nbsp;&nbsp;&nbsp;
            &nbsp;<a href="order?member_number=4"><button type="button" class="popup btn btn-style btn-primary"  style="float: right;" >
            결제하기&nbsp;</button>&nbsp;</a>
            &nbsp;<button type="button" class="popup btn btn-style btn-primary" style="float: left;" onClick="location.href='product?catgo_code=9'">
            쇼핑계속하기</button>&nbsp;
            <script src="assets/js/bootstrap.min.js"></script>
            
         </form>
      </section>
      <!--//MENU-JS-->
<script src="../assets/js/bootstrap.min.js"></script>
 

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
</body>
</html>