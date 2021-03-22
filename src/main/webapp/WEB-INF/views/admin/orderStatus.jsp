<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 관리자 :: With My Pet</title>
<link href="../assets/css/admin/style.css" rel="stylesheet">
</head>
<body>
    <!-- 기본 틀 -->
    <div id="main-wrapper" style="height:100%; display:relative; opacity:100;">

        <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header" style="background-color:#FFD687;">
            <div class="brand-logo" style="display:flex; margin:auto;">
                <a href="#" style="display:flex; margin:auto;">
                    <span class="brand-title" style="display:flex; margin:auto; margin-bottom:10%;">
                        <img style="display:flex; margin:auto; width:80%;"src="../assets/images/logos/logo-grey.png" alt=""><br/><br/>
                    </span>
                </a>
            </div>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
        <div class="header" style="background-color:#FFD687; margin-bottom: -1%;">    
            <div class="header-content clearfix">
                
                <div class="header-right">
                    <ul class="clearfix">
                    	<!-- 새 문의글  -->
                        <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                <i class="mdi mdi-email-outline"></i>
                                <span class="badge badge-pill gradient-1">3</span>
                            </a>
                            <div class="drop-down animated fadeIn dropdown-menu">
                                <div class="dropdown-content-heading d-flex justify-content-between">
                                    <span class="" style="font-family: 'Spoqa Han Sans Neo';">새 문의글</span>  
                                    <a href="javascript:void()" class="d-inline-block">
                                        <span style="font-family: 'Spoqa Han Sans Neo';"class="badge badge-pill gradient-1">3</span>
                                    </a>
                                </div>
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li class="notification-unread">
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="../assets/images/admin/avatar/1.jpg" alt="">
                                                <div class="notification-content">
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-heading">Saiful Islam</div>
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-timestamp">08 Hours ago</div>
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="notification-unread">
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="../assets/images/admin/avatar/2.jpg" alt="">
                                                <div class="notification-content">
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-heading">Adam Smith</div>
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-timestamp">08 Hours ago</div>
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-text">Can you do me a favour?</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="../assets/images/admin/avatar/3.jpg" alt="">
                                                <div class="notification-content">
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-heading">Barak Obama</div>
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-timestamp">08 Hours ago</div>
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="../assets/images/admin/avatar/4.jpg" alt="">
                                                <div class="notification-content">
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-heading">Hilari Clinton</div>
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-timestamp">08 Hours ago</div>
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-text">Hello</div>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <!-- 페이지 이동 네비 바 -->
                        <li class="icons dropdown d-none d-md-flex">
                            <a href="javascript:void(0)" class="log-user"  data-toggle="dropdown">
                                <span style="font-family: 'Spoqa Han Sans Neo';">관리페이지</span>  <i class="fa fa-angle-down f-s-14" aria-hidden="true"></i>
                            </a>
                            <div class="drop-down dropdown-language animated fadeIn  dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li><a style="font-family: 'Spoqa Han Sans Neo';" href="../">메인화면</a></li>
                                        <li><a style="font-family: 'Spoqa Han Sans Neo';" href="../walk/list.do">산책</a></li>
                                        <li><a style="font-family: 'Spoqa Han Sans Neo';" href="../product">쇼핑</a></li>
                                        <li><a style="font-family: 'Spoqa Han Sans Neo';" href="../board/list.do">커뮤니티</a></li>
                                        
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
                <div class="nk-sidebar" style="background-color:#FFD687;">           
            <div class="nk-nav-scroll" style="background-color:#FFD687;">
                <ul class="metismenu" id="menu" style="background-color:#FFD687;">
                    <li class="nav-label"></li>
                    <li>
                        <a href="#" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text"></span>
                        </a>
                    </li>
                    
                    <li class="mega-menu mega-menu-sm">
                    	<a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt user-icon"></i><span class="nav-text"style="font-family: 'Spoqa Han Sans Neo';">회 원</span>
                        </a>
                        <ul aria-expanded="false">
                        	<li><a href="memberList.do"style="font-family: 'Spoqa Han Sans Neo';">회원 목록</a></li>
                        </ul>
                    </li>
                    
                    <li class="mega-menu mega-menu-sm">
                    	<a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt user-icon"></i><span class="nav-text"style="font-family: 'Spoqa Han Sans Neo';">산 책</span>
                        </a>
                        <ul aria-expanded="false">
                        	<li><a href="nextWalk.do"style="font-family: 'Spoqa Han Sans Neo';">산책 예정 현황</a></li>
                        	<li><a href="previousWalk.do"style="font-family: 'Spoqa Han Sans Neo';">지난 산책 현황</a></li>
                        </ul>
                    </li>
                    
                    <li class="mega-menu mega-menu-sm" style="z-index:999;">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-graph menu-icon"></i><span class="nav-text"style="font-family: 'Spoqa Han Sans Neo';">상 품</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="registerProduct.do"style="font-family: 'Spoqa Han Sans Neo';">상품 등록</a></li>
                            <li><a href="productQ.do"style="font-family: 'Spoqa Han Sans Neo';">문의 답변</a></li>
                            <li><a href="productA.do"style="font-family: 'Spoqa Han Sans Neo';">지난 문의 내용</a></li>
                            <li><a href="orderStatus.do"style="font-family: 'Spoqa Han Sans Neo';">주문 현황</a></li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="walkStatistic.do" aria-expanded="false">
                            <i class="icon-badge menu-icon"></i><span class="nav-text"style="font-family: 'Spoqa Han Sans Neo';">산책 통계</span>
                        </a>
                    </li>
                    
                </ul>
            </div>
        <br/>
        </div>
<div class="container-fluid">
<br/><br/>
     <div class="row" style=" width:175%; margin-left:12.5%;">     
        <div class="col-lg-6">
            <div class="card" style="min-height:620px;">
                <div class="card-body">
                    <div class="card-title">
                        <h4 style="font-family: 'Spoqa Han Sans Neo';">주문 현황</h4>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered" style="text-align:center;">
                            <thead>
                                <tr>
                                    <th style="width:2%;font-family: 'Spoqa Han Sans Neo';">이름</th>
                                    <th style="width:5%;font-family: 'Spoqa Han Sans Neo';">상품명</th>
                                    <th style="width:1%;font-family: 'Spoqa Han Sans Neo';">금액</th>
                                    <th style="width:3%;font-family: 'Spoqa Han Sans Neo';">구매일</th>
                                    <th style="width:10%;font-family: 'Spoqa Han Sans Neo';">배송지</th>
                                    <th style="width:3%;font-family: 'Spoqa Han Sans Neo';">결제방법</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:if test="${empty list}">
                            		<tr><td colspan="8" style="width:3%;font-family: 'Spoqa Han Sans Neo';">판매한 상품이 없습니다.</td></tr>
                            	</c:if>
                            	<c:forEach items="${list}" var="list">
	                                <tr>
	                                    <td style="width:3%;font-family: 'Spoqa Han Sans Neo';">${list.member_name}</td>
	                                    <td style="width:3%;font-family: 'Spoqa Han Sans Neo';">${list.product_name}</td>
	                                    <td style="width:3%;font-family: 'Spoqa Han Sans Neo';">${list.pay_totalpay} 원</td>
	                                    <td style="width:3%;font-family: 'Spoqa Han Sans Neo';" class="color-primary">${list.pay_day}</td>
	                                    <td style="width:3%;font-family: 'Spoqa Han Sans Neo';">${list.pay_address}</td>
	                                    <c:choose>
	                                    	<c:when test="${list.pay_method eq '카드결제'}">
	                                    		<td><span style="font-size:1rem;font-family: 'Spoqa Han Sans Neo';" class="badge badge-primary px-2">${list.pay_method}</span></td>
	                                    	</c:when>
	                                    	<c:otherwise>
	                                    		<td><span style="font-size:1rem;font-family: 'Spoqa Han Sans Neo';" class="badge badge-danger px-2">${list.pay_method}</span></td>
	                                    	</c:otherwise>
	                                    </c:choose>
	                                    
	                                </tr>
                                </c:forEach>
<script>
function editDeli(type){
	$.ajax({
		url: "editDeli.do",
	    type: 'GET',
	    async: false,
	    data: {
	    	editType: type
		},
	    success : function(map) {
		  
	    }
	});
}
</script>              
                                
                                
                                
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- 
				<nav style="margin:auto; display:flex;">
				    <ul class="pagination"  align="center" style="margin:auto; display:flex;">
				        <li class="page-item disabled"><a class="page-link" href="#">Previous</a>
				        </li>
				        <li class="page-item"><a class="page-link" href="#">1</a>
				        </li>
				        <li class="page-item active"><a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
				        </li>
				        <li class="page-item"><a class="page-link" href="#">3</a>
				        </li>
				        <li class="page-item"><a class="page-link" href="#">Next</a>
				        </li>
				    </ul>
				</nav><br/>페이지네이션 -->
            </div>
        </div>
	</div>
</div>
 <!-- footer-28 block -->
<section class="w3l-footer" style="background-color:black; display:absolute;z-index:100;">
  <footer class="footer-28">
    <div class="footer-bg-layer">
      <div class="container py-lg-3">
        <div class="row footer-top-28">
          <div class="col-lg-6 col-md-5 footer-list-28 mt-5">
            <h6 class="footer-title-28" style="color:white;font-family: 'Spoqa Han Sans Neo';">Contact information</h6>
            <ul>
              <li>
                <p style="font-family: 'Spoqa Han Sans Neo';"><strong>Address</strong> : Seoul Mapo Baekbumro, South Korea</p>
                <p style="font-family: 'Spoqa Han Sans Neo';"><strong>Contact</strong> : <a href="tel:+(12)234-11-24">Click Here</a></p>
              </li>
            </ul>
          </div>
          <div class="col-lg-6 col-md-7">
            <div class="row">
              <div class="col-sm-4 col-6 footer-list-28 mt-5">
                <h6 class="footer-title-28" style="color:white;font-family: 'Spoqa Han Sans Neo';">Walk Service</h6>
                <ul style="font-family: 'Spoqa Han Sans Neo';">
                  <li><a href="about.html">Cha Ji Hyun</a></li>
                  <li><a href="blog.html">Lim Yeon Ji</a></li>
                </ul>
              </div>
              <div class="col-sm-4 col-6 footer-list-28 mt-5">
                <h6 class="footer-title-28" style="color:white;font-family: 'Spoqa Han Sans Neo';">Shopping Service</h6>
                <ul style="font-family: 'Spoqa Han Sans Neo';">
                  <li><a href="contact.html">Lee Ok Seok</a></li>
                  <li><a href="#signup">Sung Jin Hee</a></li>
                </ul>
              </div>
              <div class="col-sm-4 footer-list-28 mt-5">
                <h6 class="footer-title-28" style="color:white;font-family: 'Spoqa Han Sans Neo';">Member Service</h6>
                <ul style="font-family: 'Spoqa Han Sans Neo';">
                  <li><a href="#URL">Choi Woo Jae</a></li>
                  <li><a href="#URL">Lee Su Jin</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      
    </div>
  </footer>
  </section>
  
    <!--**********************************
        Scripts
    ***********************************-->
    <script src="../assets/plugins/common/common.min.js"></script>
    <script src="../assets/js/admin/custom.min.js"></script>
    <script src="../assets/js/admin/settings.js"></script>
    <script src="../assets/js/admin/gleek.js"></script>
    <script src="../assets/js/admin/styleSwitcher.js"></script>
</body>
</html>