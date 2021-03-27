<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>:: With My Pet :: 게시판 </title>
   <!-- google fonts -->  
   <link href="//fonts.googleapis.com/css2?family=Jost:wght@300;400;600&display=swap" rel="stylesheet">
   <!-- google fonts --> 
  <!-- Template CSS -->
  <link rel="stylesheet" href="../assets/css/style-liberty.css">
    <link rel="stylesheet" href="../assets/css/board.css">

  <!-- Template CSS -->
  

 
</head>

<body>
<!--header-->
<header id="site-header" class="fixed-top">
  <div class="container">
      <nav class="navbar navbar-expand-lg stroke">
          <a href="../"><img src="../assets/images/logos/logo-yellow.png" class="img-curve img-fluid" alt=""></a>
           <button class="navbar-toggler  collapsed bg-gradient" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
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
                  <li class="nav-item">
                      <a href="/" style="font-family: 'Spoqa Han Sans Neo';">${login.member_name}님<br><center>환영합니다</center> </a>
                  </li> 
      </nav>
  </div>
</header>
<!-- //header -->

<!--게시판 시작-->

<table class="bbs-table" table style="margin-left: auto; margin-right: auto;margin-bottom: 2.5%;">
<tr id = "t1">
    <td style="width: 60px;">NO</td>
    <td style="width: 60px;">분류</td>
    <td style="width: 280px; padding-left:70px;">제목</td>
    <td style="width: 60px;">글쓴이</td>
    <td style="width: 60px;">조회수</td>

    <td style="width: 84px;">작성일</td>
    <c:if test="${empty listResult}">
	<tr align="center" noshade>
	   <td colspan="10">등록된 글이 존재하지 않습니다.</td>
	</tr>
</c:if>
<c:forEach items="${listResult.list}" var="board">
	<TR noshade>
		<TD>${board.post_idx}</TD>	
		
		<c:choose>
		<c:when test="${board.board_idx eq '1'}"><TD>공지사항</TD></c:when>
		<c:when test="${board.board_idx eq '2'}"><TD>일상이야기</TD></c:when>
		<c:when test="${board.board_idx eq '3'}"><TD>산책후기</TD></c:when>
		<c:otherwise><TD>쇼핑후기</TD></c:otherwise>
		</c:choose>
		
	 
		<TD style="padding-left:70px;">
		<c:choose>	
		<c:when test="${board.post_depth>1}">
			<c:forEach begin="1" end="${board.post_depth}"><span style='padding-left:10px'></span></c:forEach>
			<span style='font-size:12px;'>[답변]</span>
	      <a href="content.do?post_idx=${board.post_idx}&post_order=${board.post_order}">${board.post_subject}</a>
		 </c:when>
		 
		 <c:otherwise>
		 	 <a href="content.do?post_idx=${board.post_idx}&member_number=${login.member_number}">${board.post_subject}</a>
		 </c:otherwise>
		</c:choose>
		</TD>
		<TD>${board.post_writer}</TD>
		<TD>${board.post_count}</TD>

		<TD>${board.post_date}</TD>

</TR>
</c:forEach>

    
  
 
</tr>



<!-- 메뉴바 시작-->
<div class="menubar">

<br>
<br>
<div class="boardtitle">


<h3>내가 쓴 게시글</h3>
<br>

	
     안녕하세요, ${login.member_name}님

  
 
	<div class="sidemenu">
	 <a style="color:#424242;font-weight: 500;" href="list.do?board_idx=1">공지사항</a>&nbsp;&nbsp;
	 <a style="color:#424242;font-weight: 500;" href="list.do?board_idx=2">일상이야기</a>&nbsp;&nbsp;
  	 <a style="color:#424242;font-weight: 500;" href="list.do?board_idx=3">산책후기</a>&nbsp;&nbsp;
	 <a style="color:#424242;font-weight: 500;" href="list.do?board_idx=4">쇼핑후기</a>
	</div>
</div>

<!-- 메뉴바 끝-->

<!-- 반복 구간 시작 안되면 식으로 바꾸기-->


 



<!-- 반복구간 끝 -->
</table>




<!-- 검색 -->


      
    <form class="search" action="list.do" >
      <select name="catgo" style="padding-left: 4px;padding-top: 1px;padding-bottom: 1px;padding-right: 7px;border-color: #bababa; color: #262626">
        <option value="post_subject">제목</option>
        <option value="post_writer">글쓴이</option>
        <option value="post_content">내용</option>
      </select>
      <input type="text" name="keyword" size="17" required="required" style="border-color:white;"/> <button class="btn">검색</button>
    </form>  

<!-- 검색 -->
<!-- 페이징 -->

<br>
     <div id="paging">
   <c:choose>
    <c:when test="${listResult.cp eq 1}">
     
    </c:when>
  
    <c:otherwise>
     <a href="list.do?cp=${listResult.cp-(cp%countPage)}">이전</a>
    </c:otherwise>
    </c:choose>	
    
    
<c:choose>

<c:when test="${listResult.countPage<10}">
 <c:forEach begin="${listResult.startPage}" end="${listResult.countPage}" var="i">  
        <a href="list.do?cp=${i}">
   			<c:choose>
   			    <c:when test="${i==listResult.cp}">
                	<span class="bbs-strong">${i}</span>
                </c:when>
                
                <c:otherwise>
                    ${i}
                </c:otherwise>
			</c:choose>
    	</a>	
    </c:forEach>
</c:when>




<c:otherwise>
 <c:forEach begin="${listResult.startPage}" end="${listResult.endPage}" var="i">  
        <a href="list.do?cp=${i}">
   			<c:choose>
   			    <c:when test="${i==listResult.cp}">
                	<span class="bbs-strong">${i}</span>
                </c:when>
                
                <c:otherwise>
                    ${i}
                </c:otherwise>
			</c:choose>
    	</a>	
    </c:forEach>
</c:otherwise>
</c:choose>

   
   
    <c:if test="${listResult.countPage>10}"><a href="list.do?cp=${listResult.cp+((countPage+1)-(cp%countPage))}">다음</a></c:if>
 
</div>
 
 
 
<!-- 페이징 -->
<br>
<div id="list-menu">


<c:choose>
      <c:when test="${empty login}">
     <a type="button" class="btn" onclick="writeButton()" style="margin-left:-2.5%;">새 글쓰기</a></button>
     </c:when>
     <c:otherwise>
     <a href="write.do" type="button" class="btn" style="margin-left:-2.5%;">새 글쓰기</a></button>
     </c:otherwise>
</c:choose>
</div>


<!--게시판 끝-->

<script>
function writeButton(){
	location.href = '../member/login.do';
}


</script>

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
  <script src="../assets/js/jquery-3.3.1.min.js"></script>
  <script src="../assets/js/theme-change.js"></script>
  <!-- js for portfolio lightbox -->
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


    
  </script>
  <!--//MENU-JS-->

  <script src="../assets/js/bootstrap.min.js"></script>
<!-- footer-28 block -->
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
          <p class="copy-footer-28 text-center"> © 2021 With My Pet. All Rights Reserved.
           </p>
        </div>
      </div>
    </div>
  </footer>
  </section>
</body>
</html>