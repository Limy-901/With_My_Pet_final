<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>:: 관리자 :: With My Pet</title>
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/logos/logo-yellow.png">
    <link href="../assets/css/admin/style.css" rel="stylesheet">
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.2/sweetalert2.all.js"></script>
</head>
<body>
	<!-- 프리로더 -->
	<div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!-- 기본 틀 -->
    <div id="main-wrapper" style="height:100%; display:relative;">
        <div class="nav-header" style="background-color:#FFD687;">
            <div class="brand-logo" style="display:flex; margin:auto;">
                <a href="#" style="display:flex; margin:auto;">
                    <span class="brand-title" style="display:flex; margin:auto; margin-bottom:10%;">
                        <img style="display:flex; margin:auto; width:80%;"src="../assets/images/logos/logo-grey.png" alt=""><br/><br/>
                    </span>
                </a>
            </div>
        </div>
        <div class="header" style="background-color:#FFD687; margin-bottom: -1%;">    
        </div>
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
        </div><br/>
    <!-- 멤버 리스트, 7개씩 -->
	<div style="max-width:150%; height:100%; margin:auto; display:relative;">
	
        <div class="card" style="min-height:670px; display:flex; margin:auto; max-width:92%; margin-left:13%;height:100%;">
            <div class="card-body" >
                <h3 style="font-family: 'Spoqa Han Sans Neo';text-align:center;">회원 목록</h3><br/>
                <div class="table-responsive" style="width:85%; margin:auto;"> 
                    <div id="memList" class="custom-media-object-2" style="width:95%; margin:auto;">
                        
                        <!-- 회원 목록 -->
                        <c:if test="${empty result.list}">
                        	<div class="media border-bottom-1 p-t-15" style="text-align:center;">
                            	<div class="media-body">
	                                <div class="row">
	                        			<p style="font-family: 'Spoqa Han Sans Neo';">검색 내용에 해당하는 회원이 존재하지 않습니다.</p>
                        			</div>
                        	    </div>
                            </div>
                        </c:if>
                        
                        <c:forEach items="${result.list}" var="list" varStatus="status">
	                        <div class="media border-bottom-1 p-t-15" style="text-align:center;">
	                        <c:choose>
	                        <c:when test="${!empty result.memberPic[status.index]}">
	                            <img class="mr-3 rounded-circle" style="width:50px" src="<c:url value="/img/${result.memberPic[status.index]}"/>" alt="">
	                        </c:when>
	                        <c:otherwise>
	                        	<img class="mr-3 rounded-circle" style="width:50px" src="" alt="">
	                        </c:otherwise>
	                        </c:choose>
	                            <div class="media-body">
	                                <div class="row">
	                                    <div class="col-lg-2">
	                                        <h5 style="font-family: 'Spoqa Han Sans Neo';margin-top:2%; margin-bottom:2%;margin:auto;">${list.member_name}</h5>
	                                        <p style="font-family: 'Spoqa Han Sans Neo';margin-bottom:2%;margin:auto;">${list.member_email}</p>
	                                    </div>
	                                    <div class="col-lg-3">
	                                        <p style="font-family: 'Spoqa Han Sans Neo';margin-top:2%; margin-bottom:2%;"class="text-muted f-s-14"><b>주소</b><br/>${list.member_address}</p>
	                                    </div>
	                                    <div class="col-lg-1">
	                                        <p style="font-family: 'Spoqa Han Sans Neo';margin-top:2%; margin-bottom:2%;"class="text-muted f-s-14"><b>산책</b><br/>${result.memberOption[status.index].walk} 회</p>
	                                    </div>
	                                    <div class="col-lg-1">
	                                        <p style="font-family: 'Spoqa Han Sans Neo';margin-top:2%; margin-bottom:2%;"class="text-muted f-s-14"><b>구매</b><br/>${result.memberOption[status.index].sale} 회</p>
	                                    </div>
	                                    <div class="col-lg-1">
	                                        <p style="font-family: 'Spoqa Han Sans Neo';margin-top:2%; margin-bottom:2%;"class="text-muted f-s-14"><b>산책포인트</b><br/>${result.memberOption[status.index].point} 점</p>
	                                    </div>
	                                    <div class="col-lg-2">
	                                        <p style="font-family: 'Spoqa Han Sans Neo';margin-top:2%; margin-bottom:2%;"class="text-muted f-s-14"><b>가입</b><br/>${list.member_date}</p>
	                                    </div>
	                                    <div class="col-lg-2 text-right" style="font-family: 'Spoqa Han Sans Neo';">
	                                    	강제 탈퇴
	                                        <span><a style="font-family: 'Spoqa Han Sans Neo';" onclick="memDelete(${list.member_number})" data-toggle="tooltip" data-placement="top" title="Close"><i class="fa fa-close color-danger"></i></a></span>
	                                        <p style="font-family: 'Spoqa Han Sans Neo';" class="f-s-13 text-muted">${list.login} 접속</p>
	                                    </div>
	                                    <button class="modify" onclick="point(${list.member_number})" style="font-family: 'Spoqa Han Sans Neo';background-color: rgb(255, 214, 135); padding-left:10px; padding-right:10px; line-height:55px; position:absolute; left:91%;border:none;font-family: 'Spoqa Han Sans Neo';">포인트 지급</button>
	                                </div>
	                            </div>
	                        </div>
	                    </c:forEach>
                    </div>
                </div>
            </div>
<script>
function point(member_number){
	Swal.fire({
		  title: '산책 포인트',
		  text: "지급할 포인트를 입력하세요.",
		  input: 'text',
		  inputAttributes: {
		    autocapitalize: 'off'
		  },
		  showCancelButton: true,
		  confirmButtonText: '지급',
		  cancelButtonText: '취소',
		  showLoaderOnConfirm: true,
		  preConfirm: (comment) => {
			  $.ajax({
				  url: "point.do",
				  type: 'GET',
				  data: { 
					  member_number: member_number,
					  point: comment
				  },
				  success : function(list){
					  alert(list.list.length);
					  $('#memList').empty();                             
					  var html = '';
					  for(var i=0; i<list.list.length; i++){
						  alert(list.list);
						  html += '<div class="media border-bottom-1 p-t-15" style="text-align:center;">';
						  html += '<img class="mr-3 rounded-circle" style="width:50px" src="<c:url value="/img/'+list.memberPic[i]+'"/>" alt="">';
						  html += '<div class="media-body"><div class="row"><div class="col-lg-2">';
						  html += '<h5 style="margin-top:2%; margin-bottom:2%;margin:auto;">'+list.list[i].member_name+'</h5>';
						  html += '<p style="margin-bottom:2%;margin:auto;">'+list.list[i].member_email+'</p></div><div class="col-lg-3">';
						  html += '<p style="margin-top:2%; margin-bottom:2%;"class="text-muted f-s-14"><b>주소</b><br/>'+list.list[i].member_address+'</p></div>';
						  html += '<div class="col-lg-1">';
						  html += '<p style="margin-top:2%; margin-bottom:2%;"class="text-muted f-s-14"><b>산책</b><br/>'+list.memberOption[i].walk+' 회</p>';
						  html += '</div><div class="col-lg-1">';
						  html += '<p style="margin-top:2%; margin-bottom:2%;"class="text-muted f-s-14"><b>구매</b><br/>'+list.memberOption[i].sale+' 회</p>';
						  html += '</div><div class="col-lg-1">';
						  html += '<p style="margin-top:2%; margin-bottom:2%;"class="text-muted f-s-14"><b>산책포인트</b><br/>'+list.memberOption[i].point+' 점</p>';
						  html += '</div><div class="col-lg-2">';
						  html += '<p style="margin-top:2%; margin-bottom:2%;"class="text-muted f-s-14"><b>가입</b><br/>'+list.list[i].member_date+'</p>';
						  html += '</div><div class="col-lg-2 text-right">강제 탈퇴';
						  html += '<span><a onclick="memDelete('+list.list[i].member_number+')" data-toggle="tooltip" data-placement="top" title="Close">';
						  html += '<i class="fa fa-close color-danger"></i></a></span><p class="f-s-13 text-muted">'+list.login+' 접속</p></div>';
						  html += '<button class="modify" onclick="point('+list.list[i].member_number+')" style="background-color: rgb(255, 214, 135); padding-left:10px; padding-right:10px; line-height:55px; position:absolute; left:91%;border:none;font-family: "Spoqa Han Sans Neo";">포인트 지급</button>';
						  html += '</div></div></div>';
					  }
					  $('#memList').html(html); 
					  Swal.fire({
						  position: 'top-end',
						  icon: 'success',
						  title: '포인트를 지급했습니다!',
						  showConfirmButton: false,
						  timer: 2000
					  })
				  }
			  });
		  }
	});
}
</script>
	                                
            <br/>
            
            <!-- 페이지네이션 -->
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
			</nav><br/><br/> -->
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
    <script src="../assets/plugins/common/common.min.js"></script>
    <script src="../assets/js/admin/custom.min.js"></script>
    <script src="../assets/js/admin/settings.js"></script>
    <script src="../assets/js/admin/gleek.js"></script>
    <script src="../assets/js/admin/styleSwitcher.js"></script>
    <script src="../assets/plugins/sweetalert2/dist/sweetalert2.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
    

	function memDelete(member_number){
		Swal.fire({
			  title: '탈퇴 처리 하시겠습니까?',
			  text: "되돌릴 수 없습니다! 신중하게 결정하세요!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '탈퇴',
			  cancelButtonText: '취소'
		}).then((result) => {
		  if (result.value) {
			  deleteMember(member_number);
		  }
		})
	}
	
    function deleteMember(member_number){
		alert(member_number);
		$.ajax({
			  url: "memberDelete.do",
			  type: 'GET',
			  data: { member_number: member_number },
			  success : function(list){
				  Swal.fire({
					  position: 'top-end',
					  icon: 'success',
					  title: '회원읉 탈퇴처리했습니다.',
					  showConfirmButton: false,
					  timer: 1500
				 })
				  $('#memList').empty();
				  var html = "";
				  for(var i=0; i<list.list.length; i++){
					  alert("안녕"+list.list[i].member_name);
					  html += "<div class='media border-bottom-1 p-t-15' style='text-align:center;'>";
					  html += "<img class='mr-3 rounded-circle' src='"+list.memberPic[i]+"' alt=''>";
					  html += "<div class='media-body'><div class='row'><div class='col-lg-2'>";
					  html += "<h5 style='margin-top:2%; margin-bottom:2%;margin:auto;'>"+list.list[i].member_name+"</h5>";
					  html += "<p style='margin-bottom:2%;margin:auto;'>"+list.list[i].member_email+"</p></div>";
					  html += "<div class='col-lg-3'>";
					  html += "<p style='margin-top:2%; margin-bottom:2%;'class='text-muted f-s-14'><b>주소</b><br/>"+list.list[i].member_address+"</p></div>";
					  html += "<div class='col-lg-1'>";
					  html += "<p style='margin-top:2%; margin-bottom:2%;'class='text-muted f-s-14'><b>산책</b><br/>"+list.memberOption[i].walk+" 회</p>";
					  html += "</div><div class='col-lg-1'>";
					  html += "<p style='margin-top:2%; margin-bottom:2%;'class='text-muted f-s-14'><b>구매</b><br/>"+list.memberOption[i].sale+" 회</p>";
					  html += "</div><div class='col-lg-1'>";
					  html += "<p style='margin-top:2%; margin-bottom:2%;'class='text-muted f-s-14'><b>산책포인트</b><br/>"+list.memberOption[i].point+" 점</p>";
					  html += "</div><div class='col-lg-2'>";
					  html += "<p style='margin-top:2%; margin-bottom:2%;'class='text-muted f-s-14'><b>가입</b><br/>"+list.list[i].member_date+"</p>";
					  html += "</div><div class='col-lg-2 text-right'>강제 탈퇴";
					  html += "<span><a onclick='memDelete(${list.member_number})' data-toggle='tooltip' data-placement='top' title='Close'><i class='fa fa-close color-danger'></i></a></span>";
					  html += "<p class='f-s-13 text-muted'>"+list.list[i].login+" 접속</p>  </div></div></div></div>";
				  }
				  $('#memList').html(html);
			  }
		});
	}
	
	</script>
</body>
</html>