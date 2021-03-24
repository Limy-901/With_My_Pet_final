<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="//fonts.googleapis.com/css2?family=Jost:wght@300;400;600&display=swap" rel="stylesheet">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="../assets/css/write.css"> 

    
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="../assets/js/summernote-ko-KR.js"></script>

<title>글쓰기</title>
<Style>
.go{ width: 90%;margin-left: 5%;margin-top: 5%;}

</Style>


<script>
$(document).ready(function() {
	var toolbar = [
	    // 글꼴 설정
	    ['fontname', ['fontname']],
	    // 글자 크기 설정
	    ['fontsize', ['fontsize']],
	    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
	    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	    // 글자색
	    ['color', ['forecolor','color']],
	    // 표만들기
	    ['table', ['table']],
	    // 글머리 기호, 번호매기기, 문단정렬
	    ['para', ['ul', 'ol', 'paragraph']],
	    // 줄간격
	    ['height', ['height']],
	    // 그림첨부, 링크만들기, 동영상첨부
	    ['insert',['picture','link','video']],
	    // 코드보기, 확대해서보기, 도움말
	    ['view', ['codeview','fullscreen', 'help']]
	  ];
	
	var setting = {
            height : 300,
            minHeight : null,
            maxHeight : null,
            maxWidth : 100,
            focus : true,
            lang : 'ko-KR',
            toolbar : toolbar,
            //콜백 함수

         };
        $('#summernote').summernote(setting);
        });
        
       
function goWrite(f) {
        	var title = f.post_subject.value;
        	var writer = f.post_writer.value;
        	var content = f.content.value;
        	var boardname = f.board_idx.value;
        	
        	if (title.trim() == ''){
        		alert("제목을 입력해주세요");
        		return false;
        	}
        	if (writer.trim() == ''){
        		alert("작성자를 입력해주세요");
        		return false;
        	}
        	if (content.trim() == ''){
        		alert("내용을 입력해주세요");
        		return false;
        	}	
        	if (boardname == ''){
        		alert("게시판을 선택해주세요");
        		return false;
        	}	
        	f.action='modify.do';
        	f.submit();
        	return true;
        }
        
function goWrite2(f) {
	var title = f.post_subject.value;
	var writer = f.post_writer.value;
	var content = f.content.value;
	var boardname = f.board_idx.value;
	
	
	if (title.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}
	if (writer.trim() == ''){
		alert("작성자를 입력해주세요");
		return false;
	}
	if (content.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}	
	if (boardname == ''){
		alert("게시판을 선택해주세요");
		return false;
	}	
	
	f.action='write.do';
	f.submit();
	return true;
}
</script>	

</head>
<body>

<!--header-->
<header id="site-header" class="fixed-top">
  <div class="container">
      <nav class="navbar navbar-expand-lg stroke">
          <a href="../../"><img src="../assets/images/logos/logo-yellow.png" class="img-curve img-fluid" alt=""></a>
         
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
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1" style="font-family: 'Spoqa Han Sans Neo';border-radius:10px;	margin-top:20px;">
                      	<a class="dropdown-item" href="../../walk/list.do?cp=1">산책모집 </a>
                          <a class="dropdown-item" href="../../walk/board.do">산책후기 </a>
                      </div>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-family: 'Spoqa Han Sans Neo';">
                         	쇼 핑 <span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1" style="font-family: 'Spoqa Han Sans Neo';border-radius:10px;margin-top:20px;">
                      	<a class="dropdown-item" href="../../product?catgo_code=9">쇼핑하기</a>
                          <a class="dropdown-item" href="../../cart">장바구니</a>
                          <a class="dropdown-item" href="../../order">결제</a>
                      </div>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-family: 'Spoqa Han Sans Neo';">
                         	 커뮤니티 <span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1" style="font-family: 'Spoqa Han Sans Neo';border-radius:10px;margin-top:20px;">
                          <a class="dropdown-item" href="../../board/list.do?board_idx=1">공지사항</a>
                          <a class="dropdown-item" href="../../board/list.do?board_idx=2">일상이야기</a>
                          <a class="dropdown-item" href="../../board/list.do?board_idx=3">산책후기</a>
                          <a class="dropdown-item" href="../../board/list.do?board_idx=4">쇼핑후기</a>
                          <a class="dropdown-item" href="../../board/list.do?board_idx=5">문의사항</a>
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

              </nav>
          </div>
          <!-- //toggle switch for light and dark theme -->
      </nav>
  </div>
</header>
<!-- //header -->
<br><br><br>



  		
  		
  		
<div style="width: 60%; margin: auto;">
	<form name="f" method="post" action="modify.do" class="go" enctype="multipart/form-data" onsubmit='return '>	
	
	
	<!-- 1. 최초글작성 / 2. 수정글 작성  -->
	<c:choose>
	<c:when test="${empty board.post_subject}">
	<select id="category" name="board_idx" class="form-control" required="" style="font-size:13px;">
	       	         
	         <option value="">게시판을 선택해 주세요.</option>
	         
	            <c:if test="${login.member_name eq '관리자'}"><option value="1" >
					공지사항</option></c:if>
	            <option value="2" >
					일상이야기 </option>
				<option value="3" >
					산책후기 </option>
			 	<option value="4" >
					쇼핑후기 </option>
				<option value="5" >
					문의사항 </option>
		
    </select>
	</c:when>
		
	<c:otherwise>
	<select id="category" name="board_idx" class="form-control" required="">
	         <c:choose>
	      
	         <c:when test="${board.board_idx eq '1'}">
	         <option value="1" >
					공지사항</option></c:when>
			<c:when test="${board.board_idx eq '2'}">
	         <option value="2" >
					일상이야기</option></c:when>
			<c:when test="${board.board_idx eq '3'}">
	         <option value="3" >
					산책후기</option></c:when>
			<c:when test="${board.board_idx eq '4'}">
	         <option value="4" >
					쇼핑후기</option></c:when>
			<c:otherwise>
	         <option value="5" >
					문의사항</option></c:otherwise>	
			</c:choose>
	</select>
	</c:otherwise>
	</c:choose>
			
			
		<br>
                
      
		
		<input type="text" name="post_subject"  class="form-control" value="${board.post_subject}"/><br>
		
		
		<!-- <input type="text" name="tagString" placeholder="입력후 스페이스바를 눌러보세요"><br> -->
	
  		<input id="tag" type="text" name="post_tag" class="form-control" onkeyup="if(window.event.keyCode==13){(enterValue())}"/>
  		<br>
  		

  		
		
    
		<br> 
		<textarea id="summernote" name="content" >${board.content}</textarea>
		${board.board_name}
		
		
		<c:choose>
		<c:when test="${!empty board.post_subject}">
		<input class="bttn" id="subBtn" type="button" value="수정"  onclick="goWrite(this.form)"/>
		</c:when>
		<c:otherwise>
		<input class="bttn" id="subBtn" type="button" value="등록"  onclick="goWrite2(this.form)">
		</c:otherwise>
		</c:choose>
		
		<input type="hidden" name="post_writer" class="form-control" value="${login.member_name}" readonly/><br>
		<input type="hidden" name="member_number" class="form-control" value="${login.member_number}"/><br>
		<input type="hidden" name="post_idx" class="form-control" value="${board.post_idx}"/><br>
		<input type="hidden" name="post_no" class="form-control" value="${board.post_idx}"/><br>

	
	</form>
</div>
<!-- 배열에 담아서 데이터 넘기기 -->

<script>
  		function enterValue(){
  			var content =  $('#tag').val();
  			var htmls = "";
  			alert(content);
  			

  		}
</script>		
</body>
</html>