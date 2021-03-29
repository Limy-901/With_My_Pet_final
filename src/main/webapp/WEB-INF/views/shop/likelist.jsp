<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!doctype html>
<html lang="en">
   <head>
      <!-- Required meta tags -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title> With My Pet | 마이페이지 </title>
      <!-- google fonts -->  
      <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
      <link href="//fonts.googleapis.com/css2?family=Jost:wght@300;400;600&display=swap" rel="stylesheet">
      <!-- google fonts --> 
      <!-- Template CSS -->
      <link rel="stylesheet" href="assets/css/order.css">
      <!-- Template CSS -->
      
   </head>
   <body>
      <!--header-->

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
		                      <a class="nav-link" href="/member/mypage.do" style="font-family: 'Spoqa Han Sans Neo';">마이페이지 </a>
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
	          <!-- 읽지 않은 메시지 확인 -->
	          <div id="msgZone">
	          	 <c:choose>
		          	<c:when test="${unread eq 0}">
		          		<i class="mdi mdi-bell-outline"></i>
	                    <span id="unreadCount" class="badge badge-pill gradient-2" style="position:absolute; margin-top:-1.3%; padding-left:1.6%;
	                     margin-right:2%; color:#ffb446;"></span>
		          		<a href="/msg/chat.do"><img src="../assets/images/icon/message.png"></a>
		          	</c:when>
		          	<c:otherwise>
		          		<i class="mdi mdi-bell-outline"></i>
	                    <span id="unreadCount" class="badge badge-pill gradient-2" style="position:absolute; margin-top:-1.3%; padding-left:1.6%;
	                     margin-right:2%; color:#ffb446;">${unread}</span>
		          		<a href="/msg/chat.do"><img src="../assets/images/icon/colorMessage.png"></a>
		          	</c:otherwise>
		          </c:choose>
		      </div>
	          </div>
          </c:if>
          
      </nav>
  </div>
</header>
      <!-- //header -->
      <!-- about breadcrumb -->
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
      <!-- //about breadcrumb -->
      <div class="container py-lg-10" >
      <div class="content-info-in row">
      <div class="content-gd col-lg-9 pl-lg-9">
      <div class="title-content text-left mb-10">
      <div class="title-content text-left mb-10">
         <h3 style="font-family: 'Spoqa Han Sans Neo'; margin-top:5%; text-align:center;" class="hny-title">Like list</h3 >
         <br>
         <h4 style="font-family: 'Spoqa Han Sans Neo'; text-align:center;">💛 내가 찜 한 상품 ${fn:length(map.LikeList)}개</h4>
      </div>
       &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;					     
	      <div class=:container">
	      	<div class="row">
	      		<table class="table tavle=striped" style="margin-bottom:15%; text-align: center; border: 1px solid #dddddd">
	      			<thead>
	      				<tr>
      					<th style="font-family: 'Spoqa Han Sans Neo';margin-bottom:10%; background-color: #eeeeee; text-align: center;">상품번호</th>
      					<th style="font-family: 'Spoqa Han Sans Neo';margin-bottom:10%; background-color: #eeeeee; text-align: center;">상품이미지</th>
      					<th style="font-family: 'Spoqa Han Sans Neo';margin-bottom:10%; background-color: #eeeeee; text-align: center;">판매가격</th>
      					<th style="font-family: 'Spoqa Han Sans Neo';margin-bottom:10%; background-color: #eeeeee; text-align: center;">수량</th>   					
      					<th style="font-family: 'Spoqa Han Sans Neo';margin-bottom:10%; background-color: #eeeeee; text-align: center;"></th>
      				</tr>
      			</thead>
      			<tbody>
      				<!-- 찜 목록 비었으면 -->
     				 <c:if test="${empty map.LikeList}">
			         	<td style="font-family: 'Spoqa Han Sans Neo';"colspan="5">아직 찜한 상품이 없습니다!</td>
			         </c:if>
			         
			         <c:forEach items="${map.LikeList}" var="list" varStatus="status">
			         	<tr>
				            <td style="font-family: 'Spoqa Han Sans Neo';">${status.index}</td>
				            <td style="font-family: 'Spoqa Han Sans Neo';"><img style="min-height:70px; max-height:70px; " src="assets/images/${list.product_image}"></td>
				            <td style="font-family: 'Spoqa Han Sans Neo';">${list.product_name}</td>
				            <td style="font-family: 'Spoqa Han Sans Neo';">${list.product_price}</td>
				            <td>
				            	<button style="font-family: 'Spoqa Han Sans Neo';" class="btn btn-primary pull-right" onclick="buy(${list.product_code})" style="background-color:#FFB446; border:none;">&nbsp; 구매  &nbsp;</button>
				            </td>
				         </tr>
			         </c:forEach>		
			         
      			</tbody>
      		</table>
      	</div>
      	
      	<!-- 추천 상품 리스트 -->
      	<div class="container ">
      		<div class="text-center" style="font-family: 'Spoqa Han Sans Neo'; margin-bottom:5%;">
      			<h3 style="font-family: 'Spoqa Han Sans Neo';" class="hny-title">Commend list</h3>
      			<br>
      			<h4 style="font-family: 'Spoqa Han Sans Neo';">추천 상품</h4>
      		</div>
      	</div>
      	
      	
		<div class="card-deck" style="margin-bottom:30%;">
			<c:forEach items="${map.CommendList}" var="list">
			<a href="productDes?catgo_code=1&review_number=9&product_code=9">
			  <div class="card">
			    <img class="d-block w-80" src="assets/images/${list.product_image}" height="100px" alt="First slide">
			    <div class="card-body">
			      <h5  style="font-family: 'Spoqa Han Sans Neo';" class="card-title">${list.product_name}</h5>
			      <p  style="font-family: 'Spoqa Han Sans Neo';" class="card-text">${list.product_price}</p>
			    </div>
			  </div>
			</a>
			</c:forEach>
		</div>

  
      <!-- //about breadcrumb -->
      <script>
      function buy(code){
     	 location.href="productDes?catgo_code=1&review_number=9&product_code=9";
      }
      </script>	
      <script src="assets/js/bootstrap.min.js"></script>
   </body>
</html>