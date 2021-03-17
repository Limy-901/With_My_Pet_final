<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
   <head>
      <!-- Required meta tags -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title> With My Pet | 주문페이지 </title>
      <!-- google fonts -->  
      <link href="//fonts.googleapis.com/css2?family=Jost:wght@300;400;600&display=swap" rel="stylesheet">
      <!-- google fonts --> 
      <!-- Template CSS -->
      <link rel="stylesheet" href="assets/css/cart.css">
      <link rel="stylesheet" href="../assets/css/semantic.min.css">
      <link rel="stylesheet" href="../assets/css/semantic2.css">
      <!-- Template CSS -->
      <!-- iamport  -->
      <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
      <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
      <!-- iamport  -->
   </head>
   <body>
      <!--header-->
      <header id="site-header" class="fixed-top">
         <div class="container">
            <nav class="navbar navbar-expand-lg stroke">
               <a href="../"><img src="assets/images/logos/logo-yellow.png" class="img-curve img-fluid" alt="" /></a>
               </a>
               <button class="navbar-toggler  collapsed bg-gradient" type="button" data-toggle="collapse"
                  data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false"
                  aria-label="Toggle navigation">
               <span class="navbar-toggler-icon fa icon-expand fa-bars"></span>
               <span class="navbar-toggler-icon fa icon-close fa-times"></span>
               </span>
               </button>
               <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                  <ul class="navbar-nav ml-auto">
                     <li class="nav-item">
                        <a class="nav-link" href="../">Home <span class="sr-only">(current)</span></a>
                     </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        산 책 <span class="fa fa-angle-down"></span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                           <a class="dropdown-item" href="walklist.do">산책모집 </a>
                           <a class="dropdown-item" href="walkboard.do">산책후기 </a>
                        </div>
                     </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="product" id="navbarDropdown1" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        쇼 핑 <span class="fa fa-angle-down"></span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                           <a class="dropdown-item" href="product">쇼핑하기</a>
                           <a class="dropdown-item" href="cart">장바구니</a>
                           <a class="dropdown-item" href="order">결제</a>
                        </div>
                     </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        커뮤니티 <span class="fa fa-angle-down"></span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                           <a class="dropdown-item" href="blog.html">공지사항</a>
                           <a class="dropdown-item" href="blog-single.html">일상이야기</a>
                        </div>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="gallery.html">로그인 </a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="contact.html">Contact </a>
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
      <section>
         <!-- <form name="orderSu" id="orderSu" method="post" action="orderSu?member_number=4"> -->
            <div class="container py-lg-5" >
            <div class="content-info-in row">
            <div class="content-gd col-lg-5 pl-lg-4">
            <div class="title-content text-left mb-2">
            <div class="title-content text-left mb-2">
               <h3 class="hny-title">주문 상세내용</h3 >
               </br>
               <ul class="tag" align="left">
                  <li class="design1">장바구니</li>
                  > 
                  <li class="design">주문</li>
                  > 
                  <li class="design1">결제 </li>
               </ul>
            </div>
            </br>
            <table class="table--1aTBT9emfH" width="200">
               <colgroup>
                  <col class="col_1--5TSKjnuT7E">
                  <col class="col_2--YKLfiddUoQ">
                  <col class="col_3--3kO7FM0QDn">
                  <col class="col_4--2HuEbgLS2c">
                  <col class="col_5--1Q8JnXqems">
               </colgroup>
               <thead>
                  <tr>
                     <th class="th--1G-vGQPU9O" scope="col" >번호</th>
                     <th class="th--1G-vGQPU9O" scope="col" >상품정보</th>
                     <th class="th--1G-vGQPU9O" scope="col" >상품사진</th>
                     <th class="th--1G-vGQPU9O" scope="col" >수량선택</th>
                     <th class="th--1G-vGQPU9O" scope="col">size선택</th>
                     <th class="th--1G-vGQPU9O" scope="col" width="20%">주문금액</th>
                  </tr>
               </thead>
               <tbody>
                  <c:set var="sum" value="0" />
                  <c:forEach items="${cartLists}" var="cartList" varStatus="status">
                     <tr class="table_row--2U-tpJvyb0">
                        <td name="product_code" id="product_code" type="hidden" value="${cartList.product_code}" class="table_cell--275JhdiLLN" >${cartList.product_code}</td>
                        <td name="product_content" id="product_content" type="text" value="${cartList.product_content}" class="table_cell--275JhdiLLN" >${cartList.product_content}</td>
                        <td class="table_cell--275JhdiLLN" ><img src="${cartList.product_image}" width=70 height=70 align="center"/></td>
                        <td name="product_amount" id="product_amount" type="text" value="${cartList.product_amount}" class="table_cell--275JhdiLLN" >${cartList.product_amount}</td>
                        <td name="product_color" id="product_size" type="text" value="${cartList.product_size}" class="table_cell--275JhdiLLN" >${cartList.product_size}</td>
                        <td name="product_price" id="product_price" type="text" value="${cartList.product_price}" class="table_cell--275JhdiLLN" >${cartList.product_price}</td>
                     </tr>
                     <c:set var="sum" value="${sum + (cartList.product_price * cartList.product_amount)}" />
                  </c:forEach>
                     <tr>
                        <th class="table_cell--275JhdiLLN" colspan="6" value="${sum}" ></br>주문 총 금액: ${sum}원  </br></th>
                     </tr>   
                     </tbody>     
            </table>
            <table class="table" >
               <colgroup>
                  <col style="width:50%">
               </colgroup>
               <tr>
                  <td>회원 명</td>
                  <td><input type="text" name="member_name" id="member_name" required="required" class="ui selection dropdown"/></td>
               </tr>
               <tr>
                  <td>결제 방법 &nbsp;</br> </td>
                  <td>
                     <select name="pay_method" align="center" class="ui selection dropdown">
                        <option value="카드 결제">카드 결제</option>
                        <option value="계좌 이체">계좌 이체</option>
                     </select>
                  </td>
               </tr>
               <tr>
                  <td>
                     배송 받으실 주소 &nbsp;</br>
                  </td>
                  <td>
                     <input type="text" id="sample4_postcode" placeholder="우편번호" class="ui selection dropdown">
                     <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="ui selection dropdown"><br>
                     <input type="text" id="sample4_roadAddress" placeholder="도로명주소" class="ui selection dropdown">
                     <input type="text" id="sample4_jibunAddress" name="sample4_jibunAddress" placeholder="지번주소" class="ui selection dropdown">
                     <span id="guide" style="color:#999;display:none"></span>
                     <input type="text" id="sample4_detailAddress" placeholder="상세주소" class="ui selection dropdown">
                     <input type="text" id="sample4_extraAddress" placeholder="참고항목"  class="ui selection dropdown">
                     <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                     <script>
                        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
                        function sample4_execDaumPostcode() {
                            new daum.Postcode({
                                oncomplete: function(data) {
                                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                        
                                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                                    var extraRoadAddr = ''; // 참고 항목 변수
                        
                                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                        extraRoadAddr += data.bname;
                                    }
                                    // 건물명이 있고, 공동주택일 경우 추가한다.
                                    if(data.buildingName !== '' && data.apartment === 'Y'){
                                       extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                    }
                                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                    if(extraRoadAddr !== ''){
                                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                                    }
                        
                                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                    document.getElementById('sample4_postcode').value = data.zonecode;
                                    document.getElementById("sample4_roadAddress").value = roadAddr;
                                    document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                                    
                                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                                    if(roadAddr !== ''){
                                        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                                    } else {
                                        document.getElementById("sample4_extraAddress").value = '';
                                    }
                        
                                    var guideTextBox = document.getElementById("guide");
                                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                                    if(data.autoRoadAddress) {
                                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                                        guideTextBox.style.display = 'block';
                        
                                    } else if(data.autoJibunAddress) {
                                        var expJibunAddr = data.autoJibunAddress;
                                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                                        guideTextBox.style.display = 'block';
                                    } else {
                                        guideTextBox.innerHTML = '';
                                        guideTextBox.style.display = 'none';
                                    }
                                }
                            }).open();
                        }
                     </script>
                  </td>
                  <td>
                     &nbsp;
                     </br>
                  </td>
               </tr>
               <tr>
                  <td>
                     회원 이메일 &nbsp;</br> 
                  </td>
                  <td> 
                     <input type="text" name="member_email" id="member_email" required="required" class="ui selection dropdown"/>
                  </td>
                  &nbsp;
               </tr>
         </form>
         </td>
         </tr>
         </table>
         <h3> 주문 금액 정보</h3>
         </br> 
         <div class="order_calculator--2zlH_jz09P">
            <div class="product_price_detail--uc8kecGUYk">
               <dl class="product_price--2hbbWXbdsD">
                  <dt> 총 상품 금액</dt>
                  <dd>
                     <span class="price--mkyVLxZMtX">${sum}</span>원 
                     </br>+
                  </dd>
               </dl>
               <dl class="product_price--2hbbWXbdsD">
                  <dt> 배송비</dt>
                  <dd>
                     <span class="price--mkyVLxZMtX">2500</span>원 
                  </dd>
               </dl>
            </div>
            <div class="product_price_total--3Qb27-JOGF">
               <span class="text_mart--2kMJYDiHte">총 주문금액
               <span class="price--mkyVLxZMtX" value="${sum+2500}"> ${sum+2500}
               </span>원
               </span>
            </div>
         </div>
         <button type="button" class="popup btn btn-style btn-primary" style="float: right;" >취소</button>&nbsp;
         <button id="check_module" type="button" class="popup btn btn-style btn-primary" style="float: right;">주문</button>
         </p>
         <script>
            $("#check_module").click(function () {
            var IMP = window.IMP;
            var ordersu_product_code ='${productDes.product_code}';
            var memberName = $("#member_name").val();
            var ordersu_addr = $("#sample4_jibunAddress").val();
            var ordersu_email = $("#member_email").val();
            var ordersu_product_name = '${productDes.product_name}';
            var ordersu_product_price = '${sum+2500}';
            var ordersu_product_date = '${productDes.product_date}';
            //var a = $('#dlrjdi').val();//해당페이지에 있는 값 뽑아오기.
            
            alert(ordersu_product_code+'+'+memberName+'+'+ordersu_addr+'+'+ordersu_email+'+'+
            		ordersu_product_name+'+'+ordersu_product_price+'+'+ordersu_product_date);
            IMP.init('imp02152838');
            IMP.request_pay({
            	//pg: 'inicis', 
            	pay_method: 'card',
            	merchant_uid: 'merchant_' + new Date().getTime(),
            	name: '${productDes.product_content}',
            	amount: 100,//가격
            	buyer_email: ordersu_email,
            	buyer_code: ordersu_product_code,     
	            buyer_tel: '010-9279-6456',       
	            buyer_postcode: '123-456',
	            //m_redirect_url: 'orderSu?member_number=4' //결제 끝나고 랜딩되는 페이지 
            	}, function (rsp) {
            	console.log(rsp);
            	if (rsp.success) {
            		//서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            		alert(ordersu_product_code+'+'+memberName+'+'+ordersu_addr+'+'+ordersu_email+'+'+
            		ordersu_product_name+'+'+ordersu_product_price);
            		$.ajax({
            			url:"order",
            			type: 'POST',
            			data:{
            				imp_uid : rsp.imp_uid,//조건
            				buyer_code : ordersu_product_code,
            				name : ordersu_product_name,//product name
            				buyer_name : memberName,
            				buyer_addr : ordersu_addr,
            				buyer_email : ordersu_email,
            				amout : ordersu_product_price
            			},
            			success: function(result){
            				alert(result);
            				location.href="/orderSu?member_number=4";
            			}
            		});
		            var msg = '결제가 완료되었습니다.';
		            msg += '고유ID : ' + rsp.imp_uid;
		            msg += '상점 거래ID : ' + rsp.merchant_uid;
		            msg += '결제 금액 : ' + rsp.paid_amount;
		            msg += '카드 승인번호 : ' + rsp.apply_num;
	            } else {
	            var msg = '결제에 실패하였습니다.';
		            msg += '에러내용 : ' + rsp.error_msg;
		            }
		            alert(msg);
		            });
	            });
         </script>
         <!-- </form> -->
      </section>
      <!-- //about breadcrumb -->
      <script id="check_module" src="assets/js/bootstrap.min.js"></script>
   </body>
</html>