<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.text.SimpleDateFormat, java.util.Date, pet.walk.vo.Walk, java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
                                        <li><a href="../" style="font-family: 'Spoqa Han Sans Neo';">메인화면</a></li>
                                        <li><a href="../walk/list.do" style="font-family: 'Spoqa Han Sans Neo';">산책</a></li>
                                        <li><a href="../product" style="font-family: 'Spoqa Han Sans Neo';">쇼핑</a></li>
                                        <li><a href="../board/list.do" style="font-family: 'Spoqa Han Sans Neo';">커뮤니티</a></li>
                                        
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
        <!-- 본문, card 8개 -->
        <div class="row" style="min-height:660px; margin-left:16%;width:80%;">
           <div class="col-12 m-b-30"><br/>
               <div class="row" style="font-family: 'Spoqa Han Sans Neo' !important;">
               	   <!-- 반복 -->

               	   <c:if test="${empty map.lists}">
               	   	예정 된 산책이 없습니다.
               	   </c:if>
               	   
               	   <c:forEach items="${map.lists}" var="list" varStatus="status">
	                   <div class="col-md-6 col-lg-3">
	                       <div class="card" style="min-height:500px;">
	                           <div class="card-header bg-white">
	                               <h5 class="card-title" style="font-family: 'Spoqa Han Sans Neo' !important;">${list.walk_subject}</h5>
	                               <h6 class="card-subtitle mb-2 text-muted" style="font-family: 'Spoqa Han Sans Neo' !important;">${list.day} <br/> ${list.time} / ${list.walk_type}</h6>
	                           </div>
	                           <img class="img-fluid" src="<c:url value="/img/${map.urls[status.index]}"/>" alt="">
	                           <div class="card-body">
	                               <p class="card-text" style="font-family: 'Spoqa Han Sans Neo' !important;">${list.walk_content}</p>
	                           </div>
	                           <div class="card-footer">

	                               <p class="card-text d-inline"><small class="text-muted" style="font-family: 'Spoqa Han Sans Neo' !important;">${map.times[status.index]}</small>
	                               </p><a style="font-family: 'Spoqa Han Sans Neo';" href="../walk/blog.do?idx=${list.walk_idx}" class="card-link float-right"><small>Card link</small></a>
	                           </div>
	                       </div>
	                   </div>
                   </c:forEach>
                   <!-- End Col -->
                   
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
                <h6 class="footer-title-28" style="color:white;font-family: 'Spoqa Han Sans Neo' !important;">Walk Service</h6>
                <ul style="font-family: 'Spoqa Han Sans Neo';">
                  <li><a href="about.html">Cha Ji Hyun</a></li>
                  <li><a href="blog.html">Lim Yeon Ji</a></li>
                </ul>
              </div>
              <div class="col-sm-4 col-6 footer-list-28 mt-5">
                <h6 class="footer-title-28" style="color:white;font-family: 'Spoqa Han Sans Neo' !important;">Shopping Service</h6>
                <ul style="font-family: 'Spoqa Han Sans Neo';">
                  <li><a href="contact.html">Lee Ok Seok</a></li>
                  <li><a href="#signup">Sung Jin Hee</a></li>
                </ul>
              </div>
              <div class="col-sm-4 footer-list-28 mt-5">
                <h6 class="footer-title-28" style="color:white;font-family: 'Spoqa Han Sans Neo' !important;">Member Service</h6>
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