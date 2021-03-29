<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="java.util.Hashtable"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
​
​
<!doctype html>
<html lang="ko">
​
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>:: With My Pet :: 함께 산책해요</title>
   <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/icon/footprint16.png">
  <link href="//fonts.googleapis.com/css2?family=Jost:wght@300;400;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="../assets/css/list.css">
  <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="../assets/css/walkform.css">
  <link rel="stylesheet" href="../assets/css/walkform.min.css">
  <link rel="stylesheet" href="../assets/css/button/input.css">
  <link rel="stylesheet" href="../assets/css/button/input.min.css">
  <link rel="stylesheet" href="../assets/css/button/button.css">
  <link rel="stylesheet" href="../assets/css/button/button.min.css">
  <link rel="stylesheet" href="../assets/css/button/dropdown.css">
  <link rel="stylesheet" href="../assets/css/button/dropdown.min.css">
  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="../assets/js/button/package.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<script src="../assets/js/button/dropdown.min.js"></script>
	<script src="../assets/js/button/dropdown.js"></script>
	<script src="../assets/js/button/index.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
</head>

<body>



  
  
<!--header-->
<header id="site-header" class="fixed-top" >
  <div class="container">
      <nav class="navbar navbar-expand-lg stroke">
          <a href="../"><img src="../assets/images/logos/logo-yellow.png" class="img-curve img-fluid" alt="" /></a>
          <button class="navbar-toggler  collapsed bg-gradient" type="button" data-toggle="collapse"
              data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false"
              aria-label="Toggle navigation">
              <span class="navbar-toggler-icon fa icon-expand fa-bars"></span>
              <span class="navbar-toggler-icon fa icon-close fa-times"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
              <ul class="navbar-nav ml-auto">
                  <li class="nav-item active">
                      <a class="nav-link" href="../" style="font-family: 'Spoqa Han Sans Neo';">Home <span class="sr-only">(current)</span></a>
                  </li>
                  
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-family: 'Spoqa Han Sans Neo';">
                         	산 책 <span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1" style="font-family: 'Spoqa Han Sans Neo';" >
                      	<a class="dropdown-item" href="list.do?cp=1" >산책모집 </a>
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
                          <a class="dropdown-item" href="/shop/order">결제</a>
                      </div>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-family: 'Spoqa Han Sans Neo';">
                         	 커뮤니티 <span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1" style="font-family: 'Spoqa Han Sans Neo';">
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
          </c:if>
      </nav>
  </div>
</header>
<!-- //header -->

<!-- about breadcrumb -->
<section class="w3l-about-breadcrumb text-center">
  <div class="breadcrumb-bg breadcrumb-bg-about py-sm-5 py-4">
      <div class="container py-2">
          <h2 class="title" style="font-family: 'Spoqa Han Sans Neo';">산책 모임</h2>
          <ul class="breadcrumbs-custom-path mt-2">
              <li><a href="#url" style="font-family: 'Spoqa Han Sans Neo';">Home</a></li>
              <li class="active"><span class="fa fa-arrow-right mx-2" aria-hidden="true" style="font-family: 'Spoqa Han Sans Neo';"></span> About  </li>
          </ul>
      </div>
  </div>
</section><br><br>

<div>
	<img style="display:flex; margin:auto; margin-bottom:2%; max-width:250px; max-height:300px;" src="../assets/images/withme.png">
</div>

<!-- 산책개설버튼, 로그인 시에만 개설 가능 -->
		<c:choose>
		
			<c:when test="${empty login}">
				<div style="margin:auto; display:flex; ">
				 <a href="#"style="font-size:23px;margin:auto; padding:1.5%;display:flex; position:relative;"><b>&nbsp;&nbsp;&nbsp;&nbsp;아직 로그인 하지 않았어요!&nbsp;&nbsp;&nbsp;&nbsp;</b></a>
				</div><br><br><br>
			</c:when>
			<c:when test="${petMypage.pet_name ne '정보없음'}">
				<div style="margin:auto; display:flex; ">
				 <a class="button" href="../walk/post.do"style="font-size:30px;margin:auto; padding:1.5%;display:flex; position:relative;"><b>&nbsp;&nbsp;&nbsp;&nbsp;직접 산책모임 만들기 🐕&nbsp;&nbsp;&nbsp;&nbsp;</b></a>
				</div><br><br><br>
				<!-- 검색창 -->
				<center>
				    <div class="ui action input" style="width:40%; margin-bottom:5%; ">
					  <input style="font-family: 'Spoqa Han Sans Neo';" type="text" id="searchKeyword" placeholder="검색어를 입력하세요.">
					  <select id="searchType" class="ui compact selection dropdown">
					    <option selected="" value="all">전체</option>
					    <option value="location">지역</option>
					    <option value="subject">제목</option>
					    <option value="content">내용</option>
					  </select>
					  <div class="ui teal button" onclick="search()">검색</div>
					</div>
				</center>
			</c:when>
			
			<c:otherwise>
				<div style="margin:auto; display:flex; ">
				 <a href="#"style="font-size:23px;margin:auto; padding:1.5%;display:flex; position:relative;"><b>&nbsp;&nbsp;&nbsp;&nbsp;아직 반려동물 정보가 없어요!&nbsp;&nbsp;&nbsp;&nbsp;</b></a>
				</div><br><br><br>
			</c:otherwise>
		</c:choose>


<script>
// 산책글 검색 Ajax
function search(){
	var keyword = $("#searchKeyword").val();
	var selected = $("#searchType").val();
	// 검색결과 한글버전
	var koSelected = '';
	switch(selected){
		case 'all': koSelected = '전체'; break;
		case 'location': koSelected = '지역'; break;
		case 'subject': koSelected = '제목'; break;
		case 'content': koSelected = '내용'; break;
	}
	$.ajax({
		   url: "search.do", 
		   type: "GET",
		   data: {
			   keyword:keyword,
			   searchType:selected
		   },
		   success: function(list){
			   var html = '';
			   html += '<div style="text-align:center; margin-top:2%; margin-bottom:2%;"><b>'+koSelected+'</b> 타입으로 <b>'+keyword+'</b> 키워드를 검색한 결과 : '+list.list.length+' 건</div>';
			   for(var i=0; i<list.list.length;i++){
				   html += '<div class="acard-media"><div class="acard-media-object-container">';
				   html += '<div class="acard-media-object" style="width:50%%; height:100%; overflow:hidden">';
				   html += '<img src="<c:url value="/img/'+list.picLists[i]+'"/>" style="width:100%; height:auto;" class="img-fluid img-thumbnail"/></div></div>';
				   if(list.cmtList == null){
					   html += '<span class="acard-media-object-tag subtle">첫 번째 참가자를 기다리고 있어요!</span>';
				   }
				   html += '<div class="acard-media-body" id="acard'+list.list[i].walk_idx+'${item.walk_idx}"><div class="acard-media-body-top">';
				   html += '<span class="asubtle">'+list.list[i].day+','+list.list[i].time+' &nbsp;&nbsp;/&nbsp;&nbsp; '+list.list[i].walk_writer+'</span>';
				   html += '<div class="acard-media-body-top-icons au-float-right">';
				   html += '<a href="javascript:sendLink()"><img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_small.png"/></a>&nbsp;&nbsp;';
				   html += '&nbsp;<button onclick="location.href="blog.do?idx='+list.list[i].walk_idx+'"" class="massive yellow ui button"style';
				   html += '="position:relative;margin-top:38%;font-size:0.95rem;font-family: "Spoqa Han Sans Neo";">더 알아보기</button></div></div>';
				   html += '<span class="acard-media-body-heading" style="font-size:1.3rem; color:#FFB446;"><b>'+list.list[i].walk_subject+'</b></span>';
				   html += '<p style="margin-top:3%;">'+list.list[i].walk_content+'</p><div class="acard-media-body-supporting-bottom">';
				   html += '<span class="acard-media-body-supporting-bottom-text asubtle au-float-right"></span><div>';
				   html += '<span class="acard-media-body-supporting-bottom-text asubtle" style="margin-bottom:16px;">';
				   html += '<a style="font-weight:400;" class="ui teal label"># '+list.list[i].walk_location+'</a><a style="font-weight:400;" class="ui yellow label"># '+list.list[i].walk_writer+'</a></span></div></div>';
				   html += '</div></div>';
			   }
			   $('#searchReset').empty();
			   $('#searchReset').html(html);
			   $('#page').empty();
		   }
	});
}
</script>
<c:if test="${empty list}">
	<center><br><br><br><p>데이터가 없습니다.</p><br><br><br></center>
</c:if>
	
<div id="searchReset" style="align:center;">

	<c:forEach items="${list.list}" var="item" varStatus="status">
	<div class="acard-media">
	<!-- 마우스 오버시 등장하는 댓글회원 -->
	    <div class="acard-media-object-container">
	      <div class="acard-media-object" style="width:50%%; height:100%; overflow:hidden">
	      	<img src="<c:url value="/img/${list.picLists[status.index]}"/>" style="width:100%; height:auto;" class="img-fluid img-thumbnail"/>
	      </div>
	      <c:if test="${empty list.cmtList[status.index]}"> 
	      	<span class="acard-media-object-tag subtle">첫 번째 참가자를 기다리고 있어요!</span>
	      </c:if>
	    </div>
	    <!-- 산책 정보 -->
	    <div class="acard-media-body" id="acard${item.walk_idx}">
	      <div class="acard-media-body-top">
	        <span class="asubtle">${item.day}, ${item.time}</span>
	        
		        <div class="acard-media-body-top-icons au-float-right">
		          <a href="javascript:sendLink()"><img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_small.png"/></a>
		          &nbsp;&nbsp;&nbsp;
		          <button onclick="location.href='blog.do?idx=${item.walk_idx}'" class="massive yellow ui button" 
			      style="position:relative;margin-top:38%;font-size:0.95rem;font-family: 'Spoqa Han Sans Neo';">더 알아보기</button>
		        </div>
	        
	      </div>
	      <span class="acard-media-body-heading" style="font-size:1.3rem; color:#FFB446;" >${item.walk_subject}</span>
	      <p style="margin-top:3%;">${item.walk_content}</p>
	      <div class="acard-media-body-supporting-bottom">
	        <span class="acard-media-body-supporting-bottom-text asubtle au-float-right"></span>
	        <div>
		        <span class="acard-media-body-supporting-bottom-text asubtle" style="margin-bottom:16px;">
			        <a style="font-weight:400;" class="ui teal label"># ${item.walk_location}</a>
			        <a style="font-weight:400;" class="ui yellow label"># ${item.walk_writer}</a>
		        </span>
	      	</div>
	      </div>
	      <div class="acard-media-body-supporting-bottom acard-media-body-supporting-bottom-reveal">
	      </div>
	    </div>
  </div>
<script type="text/javascript">
// 카카오 공유하기
Kakao.init('63be5e5f8d770d2796e1e45e8fcfebbd');
function sendLink() {
  Kakao.Link.sendDefault({
    objectType: 'feed',
    content: {
      title: '함께 산책해요 :: With My Pet',
      description: '우리 강아지의 산책 친구',
      imageUrl: 'https://postfiles.pstatic.net/MjAyMTAzMDJfMTY1/MDAxNjE0NjgxMzk0MjY2.iMWrCceWl_Bat-8WehW_MPBWhiGWa_Zt3wpLYBrYrPgg.XAMxlGBwAYIdppCdX2H5CxObPeC-aYmLTvcYNXDLGAog.JPEG.misty901/Corg.jpg?type=w773',
      link: {
  	  mobileWebUrl: 'http://localhost:8080/walk/blog.do?idx='+${item.walk_idx},
        webUrl: 'http://localhost:8080/walk/blog.do?idx='+${item.walk_idx}
      }
    }
  })
}
</script>
	</c:forEach>
</div>
  
 <!-- 페이지네이션 -->
 <div id="page" style="text-align:center;"><br/><br/><br/>
   <c:forEach begin="1" end="${list.totalPageCount}" var="i">
	<a href="list.do?cp=${i}">
		<c:choose>
		   <c:when test="${i==list.cp}">
		   		<strong>${i}</strong>
		   </c:when>
			<c:otherwise>
				${i}
			</c:otherwise>
		</c:choose>
	</a>&nbsp;
	</c:forEach><br/><br/>
   <label>( TOTAL : ${list.totalCount} )</label><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 </div><br/><br/>
    

<!-- 최하단 footer -->
<section class="w3l-footer" style="margin-bottom:8%;">
  <footer class="footer-28">
    <div class="footer-bg-layer">
      <div class="container py-lg-3">
        <div class="row footer-top-28">
          <div class="col-lg-6 col-md-5 footer-list-28 mt-5">
            <h6 class="footer-title-28" style="font-family: 'Spoqa Han Sans Neo';">Contact information</h6>
            <ul>
              <li>
                <p style="font-family: 'Spoqa Han Sans Neo';"><strong>Address</strong> : Seoul Mapo Baekbumro, South Korea</p>
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
 
 

  <!-- move top -->
  <button onclick="topFunction()" id="movetop" title="Go to top">
    &#10548;
  </button>
  <!-- 로그인 시에만 웹소켓 연결  -->
  <input type="hidden" id="loginCheck" value="${login.member_name}">
  <script>
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
<script>
 	// 메시지 통신
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
    		 var myNo = '${login.member_number}';
    		 $.ajax({
   	  		  url: "/msg/receiveMsg.do",
   	  		    type: 'GET',
   	  		    async: false,
   	  		    data: {
   	  			    member_number: myNo
   	  			},
   	  			success : function(count) {
   	  				// 안읽은 메시지 개수 변경 
   	  				$('#msgZone').empty();
   	  				html = '';
   	  				if(count == 0){
   	  				    html += '<i class="mdi mdi-bell-outline"></i>';
   	  					html += '<span id="unreadCount" class="badge badge-pill gradient-2" style="position:absolute; margin-top:-1.3%;';
   	  					html += 'adding-left:1.6%;margin-right:2%; color:#ffb446;"></span>';
   		          		html += '<a href="/msg/chat.do"><img src="../assets/images/icon/message.png"></a>';
   	  				}else{
   	  					html += '<i class="mdi mdi-bell-outline"></i>';
   	  					html += '<span id="unreadCount" class="badge badge-pill gradient-2" style="position:absolute; margin-top:-1.3%;';
	  					html += 'adding-left:1.6%;margin-right:2%; color:#ffb446;">'+count+'</span>';
		          		html += '<a href="/msg/chat.do"><img src="../assets/images/icon/colorMessage.png"></a>';
   	  				}
   	  				$('#msgZone').html(html);
   	  				// 알림 메시지
	   	  			toastr.options = {
	   	                  closeButton: true,
	   	                  progressBar: true,
	   	                  showMethod: 'slideDown',
	   	                  timeOut: 8000
	   	           	};
	   	  			toastr.success('메시지 알림', event.data+' 님이 메시지를 보냈습니다!');
   	  			}
   	  		});
    		
           
    	 };
    	};
    	ws.onclose = function(event) { 
    		console.log('info : connection closed.');
    		setTimeout(function(){ 
    			connectWS();
    		}, 1000);
    	};
    	ws.onerror = function(event) { 
    		console.log('error : '+event); 
    	};
    };
</script>
  <!-- /move top -->
</section>
</body>
</html>