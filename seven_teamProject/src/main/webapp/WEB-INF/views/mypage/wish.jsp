<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop | My page</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href='<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css" />'>
<!-- Lightbox-->
<link rel="stylesheet"
	href='<c:url value="/resources/vendor/lightbox2/css/lightbox.min.css" />'>
<!-- Range slider-->
<link rel="stylesheet"
	href='<c:url value="/resources/vendor/nouislider/nouislider.min.css" />'>
<!-- Bootstrap select-->
<link rel="stylesheet"
	href='<c:url value="/resources/vendor/bootstrap-select/css/bootstrap-select.min.css" />'>
<!-- Owl Carousel-->
<link rel="stylesheet"
	href='<c:url value="/resources/vendor/owl.carousel2/assets/owl.carousel.min.css" />'>
<link rel="stylesheet"
	href='<c:url value="/resources/vendor/owl.carousel2/assets/owl.theme.default.css" />'>
<!-- Google fonts-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Libre+Franklin:wght@300;400;700&amp;display=swap">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Martel+Sans:wght@300;400;800&amp;display=swap">
<!-- theme stylesheet-->
<link rel="stylesheet" href='<c:url value="/resources/css/style.default.css" />' id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href='<c:url value="/resources/css/custom.css" />'>
<!-- Favicon-->
<link rel="shortcut icon"
	href='<c:url value="/resources/img/favicon.png" />'>
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

<script src='<c:url value="/resources/script/jquery-3.6.0.js" />'></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		// heart 클릭 
		 $('.heart').click(function() {
			 
			 $.ajax('<c:url value="/wish/ajax" />',{
					data : {product_num : $(this).val()},
					success : function(returnData){

						if(returnData == "-1"){
							
							if (confirm("로그인이 필요한 서비스 입니다 로그인 하시겠습니까?") == true){//확인
		 						// 비밀번호 일치 여부를 확인 하여 일치하면 삭제, 일치하지 않으면 다시 돌아오기 
		 						location.href='<c:url value="/member/login" />';
		 					}else{//취소
		 						return false;
		 					}
							
						}else if(returnData == "0") { // 삭제처리
// 							alert("삭제처리 됨 ");
							
						}else {  // 삽입 처리
// 							alert("삽입 처리 됨 ");
						}
						
					}
					
				});
				
				var src = $(this).attr( 'src' );
// 				alert(src);
				if (src == "/seven/resources/img/heart.png"){
					$(this).attr('src','<c:url value="/resources/img/heart_empty.png" />');// 비어있는 하트 (기본값 default)
				} else {
					$(this).attr('src','<c:url value="/resources/img/heart.png" />'); // 빨간 하트 
				}
				

		 }); // $('.heart').click(function(){}); 
		 
		 
	}); // $(document).ready(function(){})

</script>


</head>
<body>
<c:choose>
	<c:when test="${empty sessionScope.id }">
	<script> 
		alert("You must be logged in to access this page")
		location.href='<c:url value="/member/login"/>'
	</script>
	</c:when>
</c:choose>
	<!-- Header start-->
	<c:import url="/resources/inc/header.jsp" />
	<!-- Header end -->


	<div class="container py-5">
		<h2 class="page-header"> HELLO! ${mb.member_name } </h2>

<!-- 비동기 방식으로 각 페이지 연결 하여 구현  -->
		<div class="row">
			<div class="col-lg-2">
				<!-- 사이드 메뉴바 -->
				<c:import url="/resources/inc/mypageSideNav.jsp" />
			</div>

			<div class="col-lg-10">
				<!--본문 내용 -->
				<div class="card-header"> MY WISH </div>
				<div class="card-body">
					
					<!-- wish List 관련 페이지 입니다.  -->
										 
					<table class="table table-hover">
						<tbody>
					
						<!-- 반복 -->
							<c:choose>
								<c:when test="${empty proList }"> <!-- if -->
									<tr>
										<td colspan="3"> <h3> Add to wishList </h3> </td> <!-- wishList가 비어있을 경우 -->
									</tr>
								</c:when>
								<c:otherwise> <!-- else list에 내용이 존재 하는 경우  -->
									<c:forEach var="proList" items="${proList }">
										<tr>
											<td width="160" onclick="location.href='<c:url value="/product/detail?product_num=${proList.product_num}" />'">
												<img alt="제품 사진" src='<c:url value="/resources/upload/${proList.product_image}" />' width="150" height="150" >  
											</td>
											<td onclick="location. href='<c:url value="/product/detail?product_num=${proList.product_num}" />'">  <h4><small>  ${proList.product_title } </small> </h4> </td>
											<td align="right">
												<input type="image" src='<c:url value="/resources/img/heart.png" />'  class="heart" value="${proList.product_num }" width="30" height="30">
											 </td>
										</tr>
									</c:forEach>		
								</c:otherwise>
							</c:choose>
						<!-- 반복 -->
						</tbody>
					</table>
					
					

				</div>
			</div>
		</div>
	</div>


	<!-- Footer start -->
	<c:import url="/resources/inc/footer.jsp" />
	<!-- Footer end -->
</body>
</html>