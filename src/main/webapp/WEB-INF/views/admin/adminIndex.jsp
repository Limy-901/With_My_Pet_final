<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.Date, java.text.SimpleDateFormat" %>
<%
	Date nowDay = new Date();
	SimpleDateFormat dateForm = new SimpleDateFormat("yyyy년 MM월 dd일, a hh:mm분 기준");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>:: 관리자 :: With My Pet</title>
    <!-- 발자국 아이콘 -->
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/logos/logo-yellow.png">
    <!-- Pignose Calender -->
    <link href="../assets/plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="../assets/plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="../assets/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
    <!-- Custom Stylesheet -->
    <link href="../assets/css/admin/style.css" rel="stylesheet">
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>

</head>

<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

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
                
                <div class="nav-control">
                    <div class="hamburger">
                        <span class="toggle-icon"><i class="icon-menu"></i></span>
                    </div>
                </div>
                <!-- 검색 -->
                <div class="header-left">
                    <div class="input-group icons" style="width:200%;">
                        <input id="mainSearchKeyword" type="text" class="form-control" placeholder="검색어를 입력하세요." aria-label="Search Dashboard">
                        <div class="drop-down animated flipInX d-md-none">
                           <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1">
                        	<a onclick="mainSearchCheck()"><i class="mdi mdi-magnify"></i></a>
                        </span>
                    </div>                    
                </div>
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
                        <!-- 확인 필요 사항 -->
                        <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                <i class="mdi mdi-bell-outline"></i>
                                <span class="badge badge-pill gradient-2">5</span>
                            </a>
                            <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
                                <div class="dropdown-content-heading d-flex justify-content-between">
                                    <span class="">확인사항</span>  
                                    <a href="javascript:void()" class="d-inline-block">
                                        <span class="badge badge-pill gradient-2">5</span>
                                    </a>
                                </div>
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="javascript:void()">
                                                <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                                <div class="notification-content">
                                                    <h6 class="notification-heading">산책 포인트 지급</h6>
                                                    <span class="notification-text">Within next 5 days</span> 
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                                <div class="notification-content">
                                                    <h6 class="notification-heading">배송 현황 변경</h6>
                                                    <span class="notification-text">One hour ago</span> 
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
                                <span>관리페이지</span>  <i class="fa fa-angle-down f-s-14" aria-hidden="true"></i>
                            </a>
                            <div class="drop-down dropdown-language animated fadeIn  dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li><a href="../">메인화면</a></li>
                                        <li><a href="../walk/list.do">산책</a></li>
                                        <li><a href="../product">쇼핑</a></li>
                                        <li><a href="../board/list.do">커뮤니티</a></li>
                                        
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
                        	<li><a href="./layout-blank.html"style="font-family: 'Spoqa Han Sans Neo';">회원 목록</a></li>
                        	<li><a href="./layout-blank.html"style="font-family: 'Spoqa Han Sans Neo';">활동 현황</a></li>
                        	<li><a href="./layout-blank.html"style="font-family: 'Spoqa Han Sans Neo';">회원 탈퇴</a></li>
                        </ul>
                    </li>
                    
                    <li class="mega-menu mega-menu-sm">
                    	<a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt user-icon"></i><span class="nav-text"style="font-family: 'Spoqa Han Sans Neo';">산 책</span>
                        </a>
                        <ul aria-expanded="false">
                        	<li><a href="./layout-blank.html"style="font-family: 'Spoqa Han Sans Neo';">산책 후기 관리</a></li>
                        	<li><a href="./layout-blank.html"style="font-family: 'Spoqa Han Sans Neo';">산책 포인트</a></li>
                        </ul>
                    </li>
                    
                    <li class="mega-menu mega-menu-sm" style="z-index:999;">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-graph menu-icon"></i><span class="nav-text"style="font-family: 'Spoqa Han Sans Neo';">상 품</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./chart-flot.html"style="font-family: 'Spoqa Han Sans Neo';">상품 등록</a></li>
                            <li><a href="./chart-morris.html"style="font-family: 'Spoqa Han Sans Neo';">문의 답변</a></li>
                            <li><a href="./chart-morris.html"style="font-family: 'Spoqa Han Sans Neo';">주문 현황</a></li>
                        </ul>
                    </li>
                    
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-graph menu-icon"></i><span class="nav-text"style="font-family: 'Spoqa Han Sans Neo';">게시글</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./chart-flot.html"style="font-family: 'Spoqa Han Sans Neo';">최근 게시글</a></li>
                            <li><a href="./chart-morris.html"style="font-family: 'Spoqa Han Sans Neo';">신고글 목록</a></li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="widgets.html" aria-expanded="false">
                            <i class="icon-badge menu-icon"></i><span class="nav-text"style="font-family: 'Spoqa Han Sans Neo';">산책 통계</span>
                        </a>
                    </li>
                    <li>
                        <a href="widgets.html" aria-expanded="false">
                            <i class="icon-badge menu-icon"></i><span class="nav-text"style="font-family: 'Spoqa Han Sans Neo';">매출 통계</span>
                        </a>
                    </li>
                    <li>
                        <a href="widgets.html" aria-expanded="false">
                            <i class="icon-badge menu-icon"></i><span class="nav-text"style="font-family: 'Spoqa Han Sans Neo';">공지사항 작성</span>
                        </a>
                    </li>
                    
                    
                </ul>
            </div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        
        <div class="content-body" style="background-color:#FEE4B1;">
            <div class="container-fluid mt-3">
            
                <h4 style="text-align:center; margin:auto;font-family: 'Spoqa Han Sans Neo';">일일 현황</h4>
                <p style="text-align:center; margin:auto;font-family: 'Spoqa Han Sans Neo';"><%=dateForm.format(nowDay)%></p><br/>
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-1">
                            <div class="card-body">
                                <h3 class="card-title text-white"style="font-family: 'Spoqa Han Sans Neo';">신규 가입</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white"style="font-family: 'Spoqa Han Sans Neo';">4565</h2>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-user"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-2">
                            <div class="card-body">
                                <h3 class="card-title text-white"style="font-family: 'Spoqa Han Sans Neo';">일일 수익</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white"style="font-family: 'Spoqa Han Sans Neo';">$ 8541</h2>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-shopping-cart"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-3">
                            <div class="card-body">
                                <h3 class="card-title text-white"style="font-family: 'Spoqa Han Sans Neo';">신규 산책</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white"style="font-family: 'Spoqa Han Sans Neo';">4565</h2>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-users"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-4">
                            <div class="card-body">
                                <h3 class="card-title text-white"style="font-family: 'Spoqa Han Sans Neo';">매칭 성사</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white"style="font-family: 'Spoqa Han Sans Neo';">99%</h2>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-heart"></i></span>
                            </div>
                        </div>
                    </div>
                </div><br/><hr style="width:50%; margin:auto;"><br/><br/><br/>
                
                <div class="row">
                        <div class="col-lg-6 col-md-6">
                        	<!-- 산책&판매 통계 -->
                            <div class="col-lg-6">
		                        <div class="card">
		                            <div class="card-body">
		                                <h4 class="card-title"style="font-family: 'Spoqa Han Sans Neo';">산책 & 판매 통계</h4>
		                                <canvas id="lineChart" width="500" height="250"></canvas>
		                            </div>
		                        </div>
		                    </div>
                        </div>    
                        <!-- 판매율 순위 -->
                        <div class="col-lg-3 col-md-6">
		                    <div class="col-lg-6">
		                        <div class="card">
		                            <div class="card-body">
		                                <h4 class="card-title"style="font-family: 'Spoqa Han Sans Neo';">인기 판매 리스트</h4>
		                                <canvas id="pieChart" width="500" height="250"></canvas>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                
                   </div><br/><hr style="width:50%; margin:auto;"><br/><br/><br/>

				<!-- 최근 상품판매 내역  -->
				<h4 style="text-align:center;margin:auto;font-family: 'Spoqa Han Sans Neo';">최근 판매 내역</h4><br/>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="active-member">
                                    <div class="table-responsive">
                                        <table class="table table-xs mb-0">
                                            <thead>
                                                <tr style="font-family: 'Spoqa Han Sans Neo';">
                                                    <th>구매자</th>
                                                    <th>상 품</th>
                                                    <th>주소지</th>
                                                    <th>상 태</th>
                                                    <th>결제방법</th>
                                                    <th>최근활동</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr style="font-family: 'Spoqa Han Sans Neo';">
                                                    <td><img src="../assets/images/admin/avatar/1.jpg" class=" rounded-circle mr-3" alt="">Sarah Smith</td>
                                                    <td>iPhone X</td>
                                                    <td>
                                                        <span>United States</span>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <div class="progress" style="height: 6px">
                                                                <div class="progress-bar bg-success" style="width: 50%"></div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td><i class="fa fa-circle-o text-success  mr-2"></i> Paid</td>
                                                    <td>
                                                        <span>Last Login</span>
                                                        <span class="m-0 pl-3">10 sec ago</span>
                                                    </td>
                                                </tr>
                                                <tr style="font-family: 'Spoqa Han Sans Neo';">
                                                    <td><img src="../assets/images/admin/avatar/2.jpg" class=" rounded-circle mr-3" alt="">Walter R.</td>
                                                    <td>Pixel 2</td>
                                                    <td><span>Canada</span></td>
                                                    <td>
                                                        <div>
                                                            <div class="progress" style="height: 6px">
                                                                <div class="progress-bar bg-success" style="width: 50%"></div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td><i class="fa fa-circle-o text-success  mr-2"></i> Paid</td>
                                                    <td>
                                                        <span>Last Login</span>
                                                        <span class="m-0 pl-3">50 sec ago</span>
                                                    </td>
                                                </tr>
                                                <tr style="font-family: 'Spoqa Han Sans Neo';">
                                                    <td><img src="../assets/images/admin/avatar/3.jpg" class=" rounded-circle mr-3" alt="">Andrew D.</td>
                                                    <td>OnePlus</td>
                                                    <td><span>Germany</span></td>
                                                    <td>
                                                        <div>
                                                            <div class="progress" style="height: 6px">
                                                                <div class="progress-bar bg-warning" style="width: 50%"></div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td><i class="fa fa-circle-o text-warning  mr-2"></i> Pending</td>
                                                    <td>
                                                        <span>Last Login</span>
                                                        <span class="m-0 pl-3">10 sec ago</span>
                                                    </td>
                                                </tr>
                                                <tr style="font-family: 'Spoqa Han Sans Neo';">
                                                    <td><img src="../assets/images/admin/avatar/6.jpg" class=" rounded-circle mr-3" alt=""> Megan S.</td>
                                                    <td>Galaxy</td>
                                                    <td><span>Japan</span></td>
                                                    <td>
                                                        <div>
                                                            <div class="progress" style="height: 6px">
                                                                <div class="progress-bar bg-success" style="width: 50%"></div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td><i class="fa fa-circle-o text-success  mr-2"></i> Paid</td>
                                                    <td>
                                                        <span>Last Login</span>
                                                        <span class="m-0 pl-3">10 sec ago</span>
                                                    </td>
                                                </tr>
                                                <tr style="font-family: 'Spoqa Han Sans Neo';">
                                                    <td><img src="../assets/images/admin/avatar/4.jpg" class=" rounded-circle mr-3" alt=""> Doris R.</td>
                                                    <td>Moto Z2</td>
                                                    <td><span>England</span></td>
                                                    <td>
                                                        <div>
                                                            <div class="progress" style="height: 6px">
                                                                <div class="progress-bar bg-success" style="width: 50%"></div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td><i class="fa fa-circle-o text-success  mr-2"></i> Paid</td>
                                                    <td>
                                                        <span>Last Login</span>
                                                        <span class="m-0 pl-3">10 sec ago</span>
                                                    </td>
                                                </tr>
                                                <tr style="font-family: 'Spoqa Han Sans Neo';">
                                                    <td><img src="../assets/images/admin/avatar/5.jpg" class=" rounded-circle mr-3" alt="">Elizabeth W.</td>
                                                    <td>Notebook Asus</td>
                                                    <td><span>China</span></td>
                                                    <td>
                                                        <div>
                                                            <div class="progress" style="height: 6px">
                                                                <div class="progress-bar bg-warning" style="width: 50%"></div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td><i class="fa fa-circle-o text-warning  mr-2"></i> Pending</td>
                                                    <td>
                                                        <span>Last Login</span>
                                                        <span class="m-0 pl-3">10 sec ago</span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                    </div>
               </div><br/><hr style="width:50%; margin:auto;"><br/><br/><br/>
                
                

                <h4 style="text-align:center; margin:auto; font-family: 'Spoqa Han Sans Neo';">신규 회원</h4><br/>
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-center">
                                    <img src="../assets/images/admin/users/8.jpg" class="rounded-circle" alt="">
                                    
                                    <h5 class="mt-3 mb-1"style="font-family: 'Spoqa Han Sans Neo';">Ana Liem</h5>
                                    <p class="m-0"style="font-family: 'Spoqa Han Sans Neo';">Senior Manager</p>
                                    <!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-center">
                                    <img src="../assets/images/admin/users/5.jpg" class="rounded-circle" alt="">
                                    <h5 class="mt-3 mb-1"style="font-family: 'Spoqa Han Sans Neo';">John Abraham</h5>
                                    <p class="m-0"style="font-family: 'Spoqa Han Sans Neo';">Store Manager</p>
                                    <!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-center">
                                    <img src="../assets/images/admin/users/7.jpg" class="rounded-circle" alt="">
                                    <h5 class="mt-3 mb-1"style="font-family: 'Spoqa Han Sans Neo';">John Doe</h5>
                                    <p class="m-0"style="font-family: 'Spoqa Han Sans Neo';">Sales Man</p>
                                    <!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-center">
                                    <img src="../assets/images/admin/users/1.jpg" class="rounded-circle" alt="">
                                    <h5 class="mt-3 mb-1"style="font-family: 'Spoqa Han Sans Neo';">Mehedi Titas</h5>
                                    <p class="m-0"style="font-family: 'Spoqa Han Sans Neo';">Online Marketer</p>
                                    <!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div><br/><br/><br/>


				


                

                

                
            </div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        
        <!--**********************************
            Footer end
        ***********************************-->
    </div>
    
    
<!-- footer-28 block -->
<section class="w3l-footer" style="background-color:black; display:absolute;">
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
        Main wrapper end
    ***********************************-->
<script>
/* admin 검색 유효성 검사 */
function mainSearchCheck(){
	var check = document.getElementById('mainSearchKeyword');
	if (check.value == '') alert("검색어를 입력해주세요.");
	mainSearchKeyword.focus();
}
</script>
    <!--**********************************
        Scripts
    
    ***********************************-->
    <script src="../assets/plugins/common/common.min.js"></script>
    <script src="../assets/js/admin/custom.min.js"></script>
    <script src="../assets/js/admin/settings.js"></script>
    <script src="../assets/js/admin/gleek.js"></script>
    <script src="../assets/js/admin/styleSwitcher.js"></script>

    <!-- Chartjs -->
    <script src="../assets/plugins/chart.js/Chart.bundle.min.js"></script>
    <!-- Circle progress -->
    <script src="../assets/plugins/circle-progress/circle-progress.min.js"></script>
    <!-- Datamap -->
    <script src="../assets/plugins/d3v3/index.js"></script>
    <script src="../assets/plugins/topojson/topojson.min.js"></script>
    <script src="../assets/plugins/datamaps/datamaps.world.min.js"></script>
    <!-- Morrisjs -->
    <script src="../assets/plugins/raphael/raphael.min.js"></script>
    <script src="../assets/plugins/morris/morris.min.js"></script>
    <!-- Pignose Calender -->
    <script src="../assets/plugins/moment/moment.min.js"></script>
    <script src="../assets/plugins/pg-calendar/js/pignose.calendar.min.js"></script>
    <!-- ChartistJS -->
    <script src="../assets/plugins/chartist/js/chartist.min.js"></script>
    <script src="../assets/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>



    <script src="../assets/js/admin/dashboard/dashboard-1.js"></script>

</body>

</html>