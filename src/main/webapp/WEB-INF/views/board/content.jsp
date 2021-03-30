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
   
   <!-- google fonts --> 
  <!-- Template CSS -->
   <link href="//fonts.googleapis.com/css2?family=Jost:wght@300;400;600&display=swap" rel="stylesheet">
   <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
   <link rel="stylesheet" href="../assets/css/style-liberty.css">
   <link rel="stylesheet" href="../assets/css/board.css">
  
  <!-- 제이쿼리 -->
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
  

    
</head>

<body>
<!--header-->
<header id="site-header" class="fixed-top">
  <div class="container">
      <nav class="navbar navbar-expand-lg stroke">
          <a href="../../"><img src="../assets/images/logos/logo-yellow.png" class="img-curve img-fluid" alt="" /></a>
         
      
      
          <button class="navbar-toggler  collapsed bg-gradient" type="button" data-toggle="collapse"
              data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false"
              aria-label="Toggle navigation">
              <span class="navbar-toggler-icon fa icon-expand fa-bars"></span>
              <span class="navbar-toggler-icon fa icon-close fa-times"></span>
              </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
             <ul class="navbar-nav ml-auto">
                  <li class="nav-item active">
                      <a class="nav-link" href="index.html" style="font-family: 'Spoqa Han Sans Neo';">Home <span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-family: 'Spoqa Han Sans Neo';">
                         	산 책 <span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1" style="font-family: 'Spoqa Han Sans Neo';">
                      	<a class="dropdown-item" href="../../walk/list.do?cp=1" style="font-family: 'Spoqa Han Sans Neo';">산책모집 </a>
                          <a class="dropdown-item" href="../../walk/board.do" style="font-family: 'Spoqa Han Sans Neo';">산책후기 </a>
                      </div>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-family: 'Spoqa Han Sans Neo';">
                         	쇼 핑 <span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1" style="font-family: 'Spoqa Han Sans Neo';">
                      	<a class="dropdown-item" href="../../product?catgo_code=9" style="font-family: 'Spoqa Han Sans Neo';">쇼핑하기</a>
                          <a class="dropdown-item" href="../../cart" style="font-family: 'Spoqa Han Sans Neo';">장바구니</a>
                          <a class="dropdown-item" href="../../shop/order" style="font-family: 'Spoqa Han Sans Neo';">결제</a>
                      </div>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-family: 'Spoqa Han Sans Neo';">
                         	 커뮤니티 <span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1" style="font-family: 'Spoqa Han Sans Neo';">
                          <a class="dropdown-item" href="../../board/list.do?board_idx=1" style="font-family: 'Spoqa Han Sans Neo';">공지사항</a>
                          <a class="dropdown-item" href="../../board/list.do?board_idx=2" style="font-family: 'Spoqa Han Sans Neo';">일상이야기</a>
                          <a class="dropdown-item" href="../../board/list.do?board_idx=3" style="font-family: 'Spoqa Han Sans Neo';">산책후기</a>
                          <a class="dropdown-item" href="../../board/list.do?board_idx=4" style="font-family: 'Spoqa Han Sans Neo';">쇼핑후기</a>
                          <a class="dropdown-item" href="../../board/list.do?board_idx=5" style="font-family: 'Spoqa Han Sans Neo';">문의사항</a>
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
                  <!-- 일때만 페이지 입장 -->
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
          <!-- //toggle switch for light and dark theme -->
      </nav>
  </div>
</header>
<!-- //header -->
	
<div class="title">
<h3>게시판 </h3>
산책에 관련된 내용을 업로드하는 게시판입니다.
</div>

<!-- 메뉴바 시작-->
<div class="menubar">
<br><br>
<div class="boardtitle">

<c:choose>
<c:when test="${board.board_idx eq '1'}"><h3>공지사항 </h3></c:when>
<c:when test="${board.board_idx eq '2'}"><h3>일상이야기 </h3></c:when>
<c:when test="${board.board_idx eq '3'}"><h3>산책후기 </h3></c:when>
<c:when test="${board.board_idx eq '4'}"><h3>쇼핑후기 </h3></c:when>
</c:choose>

 </div> 
			<div class="sidemenu">
	 <a style="color:#424242;font-weight: 500;" href="list.do?board_idx=1">공지사항</a>&nbsp;&nbsp;
	 <a style="color:#424242;font-weight: 500;" href="list.do?board_idx=2">일상이야기</a>&nbsp;&nbsp;
  	 <a style="color:#424242;fo	nt-weight: 500;" href="list.do?board_idx=3">산책후기</a>&nbsp;&nbsp;
	 <a style="color:#424242;font-weight: 500;" href="list.do?board_idx=4">쇼핑후기</a>&nbsp;&nbsp;
	 <a style="color:#424242;font-weight: 500;" href="list.do?board_idx=4">문의사항</a>
	 
	</div>
	</div>
<!-- 메뉴바 끝-->



<!-- 컨텐츠시작 -->
<div class="header">#${board.post_idx}&nbsp;&nbsp;<c:forEach items="${board.tag}" var="tag"><div class="tagDiv">${tag.post_tag}</div></c:forEach><br>
<div class="sub">${board.post_subject}</div>
<div class="user"><div class="memberDetail">${board.post_writer} <div class="dropdown-content">
  

<a href="list.do?member_number=${board.member_number}">게시글보기</a>
<a href="../msg/chat.do?member_number=${board.member_number}">1:1 채팅</a>

  </div>
</div></div>


 <div class="date">${board.post_date}</div> <div class="hit">조회 ${board.post_count}</div>
 



</div>

<div class="cont">
<div class="drop">
	<div class="hambergurMenu">
		<div class="hamburger"></div>
		<div class="hamburger"></div>
		<div class="hamburger"></div>
	</div>

  <div class="dropdown-content">
  <a href="javascript:sendLink()">공유하기  <img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_small.png" style="width: 20px;padding-bottom:5px;">
  </a>
  <c:if test="${not empty login}"><a href='rewrite.do?post_idx=${board.post_idx}&post_order=${board.post_order}' style="color: black;">답글작성</a></c:if>
  <c:if test="${login.member_number eq board.member_number or login.member_name eq 'admin'}">
<a href='modify.do?post_idx=${board.post_idx}'>수정</a>
<a href='delete.do?post_idx=${board.post_idx}'>삭제</a></c:if>
  </div>
</div>
<div class="content">${board.content}</div>  


    
<script>
function clickLike(member_name){
	var post_idx = ${board.post_idx};
	var name = member_name;
	var member_number = ${login.member_number};
	
	if(!name){
		alert("로그인시 가능합니다.");		
	}else{
	$.ajax({
		url: "insertLike.do",
		type: 'get',
		data:{	
			post_idx:post_idx,
			member_number:member_number	
		},
		dataType: 'json',
		success: function(result){
			var htmls= result;
				$('.like').html(htmls); 
				 $('.like-button').on('click', function() {
					  $('.like-button').toggleClass('liked')
					}) 
		},
		error: function(request, status, error){
			  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+ error);
		}
	});
	}
}


</script>
<button class="clickLike" onclick="clickLike('${login.member_name}')"><i class="fa fa-thumbs-up fa-2x like-icon"></i>
<div class="like">${board.like}</div>
</button>
</div>


<script>
Kakao.init('63be5e5f8d770d2796e1e45e8fcfebbd');
function sendLink() {
  Kakao.Link.sendDefault({
    objectType: 'feed',
    content: {
	        title: '함께 산책해요 :: With My Pet',
	        description: 'With My Pet::커뮤니티',
	        imageUrl: 'https://postfiles.pstatic.net/MjAyMTAzMDJfMTY1/MDAxNjE0NjgxMzk0MjY2.iMWrCceWl_Bat-8WehW_MPBWhiGWa_Zt3wpLYBrYrPgg.XAMxlGBwAYIdppCdX2H5CxObPeC-aYmLTvcYNXDLGAog.JPEG.misty901/Corg.jpg?type=w773',
	        link: {
	    	  mobileWebUrl: 'http://localhost:8080/board/content.do?post_idx='+${board.post_idx},
	          webUrl: 'http://localhost:8080/board/content.do?post_idx='+${board.post_idx}
	        }
    },
  })
}


function replyDelete(comment_idx, index){
var sIndex = index;
confirm("삭제하시겠습니까?");
	
 	$.ajax({
		url: "deleteCmt.do",
		type: 'get',
		data:{comment_idx:comment_idx},	
		success: function(result){
			
			
		   if(result=="success")
			  {
			   alert("삭제완료");
			 	$('#replyZone'+sIndex).remove();
			  } 
	  },
	  error: function(request, status, error){
		  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+ error);
	  }
	  
  });
}
 	


function replyButton(comment_idx, cmt_writer, index, cmt_date){
	var cmtIdx = comment_idx;
	var cmtWriter = cmt_writer;
	var cmtDate = cmt_date;
	var htmls = "";
	var sIndex = index;



	
	htmls += '<form id="editReply">';
 	htmls += '<div class="replyfirstsec" id="editId">';
	htmls += '<div class="replywriter" id="writerId">'+cmtWriter+'님의 답변(수정중)</div><input type="hidden" value='+cmtIdx+' name="comment_idx"/><br></div>';
	htmls += '<div class="replysecondsec" id="editId"><div class="rereple"><textarea id="contentInput" name="cmt_content" rows="10" style="height: 70px; width:100%;"></textarea>';	
	htmls += ' <input class="submitbtn" type="button" value="등록" onclick="replyUpdate('+cmtIdx+',\''+cmtWriter+'\','+sIndex+', '+cmtDate+')"></div></form>';
	
	
	$('#replyZone'+sIndex).html(htmls);
	
	$('#writeReple').empty();

}

function replyUpdate(comment_idx, cmt_writer, index, cmt_date){
	confirm("수정하시겠습니까?");
	var writer = cmt_writer;
	var htmls = "";	
	var sIndex = index;
	var cmtDate = cmt_date;
	var inputId = $('#contentInput').val();


	
	


	
	$.ajax({
		url: "updateReply.do",
		type: 'post',
		data: $("#editReply").serialize(),
		success: function(result){
			htmls += '<div class="replyfirstsec" id="comment_idx'+comment_idx+'">';
			htmls += '<div class="replywriter" id="writerId">'+writer+' 님의 답변 </div><br>';
			htmls += '<div style="font-size:12px;" id="dateId">'+cmtDate+'</div></div>';
			htmls += '<div class="replysecondsec" id="contentId">'+inputId+'</div>';
			htmls += '<div class="contbtns"><div class="writecomment">댓글쓰기</div>';
			htmls += '<div class="modify"><a onclick="replyButton('+comment_idx+','+writer+','+sIndex+','+cmtDate+')">수정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></div>';
			htmls += '<div class="delete"><a onclick="replyDelete('+comment_idx+','+sIndex+')">삭제</a></div>';

			 
			alert("수정완료");	
			$('#replyZone'+sIndex).html(htmls);

		},
	  error: function(request, status, error){
		  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+ error);
	  }
	});
}

function writeReplyButton(comment_idx, cmt_writer,index, member_name, member_number, post_idx, board_idx){
	var cmtIdx = comment_idx;
	var writer = cmt_writer;
	var sIndex = index;
	var m_name = member_name;
	var m_number = member_number;
	var postIdx = post_idx;
	var boardIdx = board_idx;
	var htmls = "";	




htmls += '<form name="tryReply" method="post" id="tryReply" action="rewriteCmt.do">';
htmls += '<div class="rereple"><div class="replywriterr">'+m_name+'</div><br>';
htmls += '<input type="hidden" value='+m_name+' name="cmt_writer"/><input type="hidden" value='+m_number+' name="member_number"/>';
htmls += '<input type="hidden" value='+postIdx+' name="post_idx"/><input type="hidden" value='+boardIdx+' name="board_idx"/>';
htmls += '<textarea name="cmt_content" rows="10" style="height: 70px; width:100%;" >@'+writer+' 	</textarea> ';
htmls += '<input class="submitbtn" type="button" value="등록" onclick="rewritecmt()"></div></form>';
	

$('.replycomment'+sIndex).html(htmls); 
}

function rewritecmt(){
if(tryReply.cmt_content.value == "")
{
    alert("내용을 입력해 주세요.");
    return;
}	
tryReply.submit();
}
</script>


<c:forEach items="${board.comment}" var="cmt" varStatus="status">
<div class="reply" id="replyZone${status.index}">
	<div class="replyfirstsec">	
	<div class="replywriter" id="writerId">${cmt.cmt_writer}님의 답변</div><br>
	${cmt.cmt_date}
	</div>
	<div class="replysecondsec" id="contentId">${cmt.cmt_content}</div>
	<c:if test="${not empty login}"><div class="writecomment" onclick="writeReplyButton(${cmt.comment_idx}, '${cmt.cmt_writer}', 
	${status.index}, '${login.member_name}',${login.member_number},${board.post_idx}, ${board.board_idx})">댓글쓰기</div></c:if>
	<c:if test="${login.member_number eq cmt.member_number or login.member_name eq 'admin'}">
	<div class="modify"><a onclick="replyButton(${cmt.comment_idx},'${cmt.cmt_writer}',${status.index},'${cmt.cmt_date}')">수정</a></div>
	<div class="delete"><a onclick="replyDelete(${cmt.comment_idx}, ${status.index})">삭제</a></div>
	</c:if>
	
	
	
	
	<div class="replycomment${status.index}">
	
	</div>
	
</div>


</c:forEach>


<!-- 댓글 -->
<!-- 댓글작성 -->




<script language="javascript">

  function check(){
              	if(f1.cmt_content.value == "")
	                  {
	                      alert("내용을 입력해 주세요.");
	                      return;
	                  }	
                  	  f1.submit();
                  }


</script>


<!-- 댓글작성 -->
<c:choose>
 <c:when test="${empty login}">
<div class="cantWriteReple">
<a href="../member/login.do">로그인</a> 후에 댓글 작성이 가능합니다.
</div>
</c:when>

<c:otherwise>
<c:set value="${board}" var="board"/>	
<form name="f1" method="post" action="replyUpload.do" id="writeReple">
<div class="writeReple">
	<div class="replyfirstsec">
	<div class="replywriter">${login.member_name}</div>
	<input type="hidden" value="${login.member_name}" name="cmt_writer"/>
	<input type="hidden" value="${login.member_number}" name="member_number"/>
	<input type="hidden" value="${board.post_idx}" name="post_idx"/>
	<input type="hidden" value="${board.board_idx}" name="board_idx"/>
	<div class="replysecondsec" id="editId"><div class="rereple">
	<textarea id="contentInput" name="cmt_content" rows="10" style="height: 70px; width:100%;"></textarea>
	<input class="submitbtn" type="button" value="등록" onclick="check()"></div></div>

	</div>
</div>
</form>
</c:otherwise>
</c:choose>



<script>
 function viewMember(){
	 window.location.href = "#viewMember";
 }
</script>
 
 
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
