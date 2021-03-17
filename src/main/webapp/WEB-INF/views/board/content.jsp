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
  <!-- 제이쿼리 -->
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
  

    
</head>

<body>
<header id="site-header" class="fixed-top">
  <div class="container">
      <nav class="navbar navbar-expand-lg stroke">
          <a href="#"><img src="../assets/images/logos/logo-yellow.png" class="img-curve img-fluid" alt=""></a>
         
          <!-- if logo is image enable this   
      <a class="navbar-brand" href="#index.html">
          <img src="image-path" alt="Your logo" title="Your logo" style="height:35px;" />
      </a> -->
          <button class="navbar-toggler  collapsed bg-gradient" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon fa icon-expand fa-bars"></span>
              <span class="navbar-toggler-icon fa icon-close fa-times"></span>
              
          </button>

          <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
              <ul class="navbar-nav ml-auto">
                  <li class="nav-item active">
                      <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
                  </li>
                  
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-family: 'Spoqa Han Sans Neo';">
                         	산 책 <span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1" style="font-family: 'Spoqa Han Sans Neo';">
                      	<a class="dropdown-item" href="walk/list.do?cp=1">산책모집 </a>
                          <a class="dropdown-item" href="walk/board.do">산책후기 </a>
                      </div>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-family: 'Spoqa Han Sans Neo';">
                         	쇼 핑 <span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1" style="font-family: 'Spoqa Han Sans Neo';">
                      	<a class="dropdown-item" href="product?catgo_code=9">쇼핑하기</a>
                          <a class="dropdown-item" href="cart">장바구니</a>
                          <a class="dropdown-item" href="order">결제</a>
                      </div>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-family: 'Spoqa Han Sans Neo';">
                         	 커뮤니티 <span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1" style="font-family: 'Spoqa Han Sans Neo';">
                          <a class="dropdown-item" href="board/list.do?board_idx=1&amp;cp=1">공지사항</a>
                          <a class="dropdown-item" href="board/list.do?board_idx=2&amp;cp=1">일상이야기</a>
                          <a class="dropdown-item" href="board/list.do?board_idx=3&amp;cp=1">산책후기</a>
                          <a class="dropdown-item" href="board/list.do?board_idx=4&amp;cp=1">쇼핑후기</a>
                      </div>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="../member/login.do" style="font-family: 'Spoqa Han Sans Neo';">로그인 </a>
                  </li>
                 
                  <li class="nav-item">
                      <a class="nav-link" href="sendmail.do">Contact </a>
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
	 <a style="color:#424242;font-weight: 500;" href="list.do?board_idx=4">쇼핑후기</a>
	</div>
	</div>
<!-- 메뉴바 끝-->



<!-- 컨텐츠시작 -->
<div class="header">#${board.post_idx}<br>
<div class="sub">${board.post_subject}</div>
<div class="user">${board.post_writer}</div> <div class="date">${board.post_date}</div> <div class="hit">조회 ${board.post_count}</div>
</div>

<div class="cont">${board.content}  
	<div class="hambergurMenu">
		<div class="hamburger"></div>
		<div class="hamburger"></div>
		<div class="hamburger"></div>
	</div>
    <div class="hamDropdown">
    <a href="#">1</a>
    <a href="#">1</a>
    <a href="#">1</a>
    <a href="#">1</a>
    </div>
    
    
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

<a href="javascript:sendLink()" style="margin-left: 25%;font-size: 12px;color: black;"><img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_small.png" style="width: 20px;"> 공유하기
</a>

<c:if test="${not empty login}"><div class="modi"><a href='rewrite.do?post_idx=${board.post_idx}&post_order=${board.post_order}' style="color: black;">답글작성</a></div></c:if>
<c:if test="${login.member_number eq board.member_number or login.member_name eq '관리자'}">
<div class="modi"><a href='modify.do?post_idx=${board.post_idx}' style="color: black;">수정</a></div>
<div class="del"><a href='delete.do?post_idx=${board.post_idx}' style="color: black;">삭제</a></div></c:if>
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
	var htmls = "";
	var sIndex = index;



	
	htmls += '<form id="editReply">';
 	htmls += '<div class="replyfirstsec" id="editId">';
	htmls += '<div class="replywriter" id="writerId">'+cmtWriter+' 님 댓글 수정중</div><input type="hidden" value='+cmtIdx+' name="comment_idx"/><br></div>';
	htmls += '<div class="replysecondsec" id="editId"><div class="rereple"><textarea id="contentInput" name="cmt_content" rows="10" style="height: 70px; width:100%;"></textarea>';	
	htmls += ' <input class="submitbtn" type="button" value="등록" onclick="replyUpdate('+cmtIdx+',\''+cmtWriter+'\','+sIndex+', '+cmt_date+')"></div></form>';
	
	
	$('#replyZone'+sIndex).html(htmls);
	
	$('#writeReple').empty();

}

function replyUpdate(comment_idx, cmt_writer, index, cmt_date){
	confirm("수정하시겠습니까?");
	var writer = cmt_writer;
	var htmls = "";	
	var sIndex = index;
	var inputId = $('#contentInput').val();
	alert(cmt_date);

	
	


	
	$.ajax({
		url: "updateReply.do",
		type: 'post',
		data: $("#editReply").serialize(),
		success: function(result){
			htmls += '<div class="replyfirstsec" id="comment_idx'+comment_idx+'">';
			htmls += '<div class="replywriter" id="writerId">'+writer+' 님의 답변 </div>';
			htmls += '<div style="font-size:12px;" id="dateId">'+cmt_date+'</div></div>';
			htmls += '<div class="replysecondsec" id="contentId">'+inputId+'</div>';
			htmls += '<div class="contbtns"><div class="writecomment">댓글쓰기</div>';
			htmls += '<div class="modify"><a onclick="replyButton('+comment_idx+','+writer+','+sIndex+','+cmt_date+')">수정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></div>';
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
	<c:if test="${login.member_number eq cmt.member_number or login.member_name eq '관리자'}">
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


<script>$('.like-button').on('click', function() {
  $(this).toggleClass('liked')
})
</script>

</body>

</html>
