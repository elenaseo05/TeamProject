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
<link rel="stylesheet"
	href='<c:url value="/resources/css/style.default.css" />'
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet"
	href='<c:url value="/resources/css/custom.css" />'>
<!-- Favicon-->
<link rel="shortcut icon"
	href='<c:url value="/resources/img/favicon.png" />'>
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<script src='<c:url value="/resources/script/jquery-3.6.0.js" />'></script>
 <script type="text/javascript">
 
 $(document).ready(function() {
	 

	 $('#join').submit(function() {
		var pass = $('#member_pass').val();
		if (pass == "" ) {
			$('#passResult').html('ENTER YOUR PASSWORD');
			$('#member_pass').focus();
			return false;
		}
		
	 });
		
 });
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
				<div class="card-header"> UPDATE YOUR INFORMATION  </div>
				<div class="card-body">
							
					<!-- 회원 정보 수정 관련 페이지입니다 -->
					<form action='<c:url value="/mypage/updatefin" />' method="post" id="join">
		
						<div class="form-group row">
							<label class="col-sm-2 col-form-label"> ID </label>
							<div class="col-sm-10">
								<input type="text" name="member_id" readonly="readonly" value='${mb.member_id }' class="form-control" id="member_id">
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-sm-2 col-form-label" for="inputPassword3"> PASSWORD </label>
							<div class="col-sm-10">
								<input type="password" name="member_pass" id="member_pass" placeholder="Password" class="form-control">
								<small> <div id="passResult"> </div>  </small>
							</div>
						</div>
						
						<div align="center">
							<input type="submit" value="회원정보 수정" class="btn btn-sm btn-secondary" >
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer start -->
	<c:import url="/resources/inc/footer.jsp" />
	<!-- Footer end -->
</body>
</html>
