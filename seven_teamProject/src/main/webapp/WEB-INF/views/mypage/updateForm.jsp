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
<script src='<c:url value="/resources/js/zipcode.js" />'></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src='<c:url value="/resources/script/jquery-3.6.0.js" />'></script>
<script type="text/javascript">
 
 
 $(document).ready(function() {
	 

	 $('#update').submit(function() {
		var pass = $('#member_pass').val();
		var pass2 = $('#pass2').val();
		
		if (pass == "" ) {
			$('#passResult').html('ENTER YOUR PASSWORD');
			$('#member_pass').focus();
			return false;
		}
		
		if (pass != "" ) {
			$('#passResult').html(' ');
		}
		
		if (pass2 == "" ) {
			$('#passResult2').html('ENTER YOUR PASSWORD');
			$('#pass2').focus();
			return false;
		}
		
		if (pass2 != "" ) {
			$('#passResult2').html(' ');
		}
		
		if (pass != pass2) {
			$('#passResult2').html('PASSWORDS DO NOT MATCH');
			$('#pass2').focus();
			return false;
		} else {
			$('#passResult2').html(' ');
		}
		
		alert("COMPLETE"); 
		
	 });
		

	$('#checkDelete').click(function() { 
		if (confirm("Are you sure you want to DELETE this item?") == true){//확인
			 
			$('#update').attr('action', '<c:url value="/mypage/deletePro" />').submit();
		 
		 }else{//취소
			     return false;
		 }
	
	
	
	});
	
	
	$('#checkReset').click(function() { 
		
		if (confirm("Are you sure you want to CALCEL?") == true){//확인
			// mypage 로이동
			location.href='<c:url value="/mypage" />';
		} else{//취소
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
		<h2 class="page-header">HELLO! ${mb.member_name } </h2>

<!-- 비동기 방식으로 각 페이지 연결 하여 구현  -->
		<div class="row">
			<div class="col-lg-2">
				<!-- 사이드 메뉴바 -->
					<c:import url="/resources/inc/mypageSideNav.jsp" />
					
			</div>

			<div class="col-lg-10">
				<!--본문 내용 -->
				<div class="card-header"> UPDATE YOUR INFORMATION </div>
				<div class="card-body">
					
							
					<!-- 회원 정보 수정 관련 페이지입니다 -->
					<!-- css 수정! / -->
					<form action='<c:url value="/mypage/updatePro" />' method="post" id="update" name="update" >

						<div class="form-group row">
							<label class="col-sm-2 col-form-label"> ID </label>
							<div class="col-sm-10">
								<input type="text" name="member_id" readonly="readonly"
									value='${mb.member_id }' class="form-control">
							</div>
						</div>

						<div class="form-group row">
							<label class="col-sm-2 col-form-label" for="inputPassword3"> PASSWORD </label>
							<div class="col-sm-10">
								<input type="password" id="member_pass" name="member_pass" placeholder="Password" class="form-control">
								<small><div id="passResult"> </div> </small> 
							</div>
						</div>

						<div class="form-group row">
							<label class="col-sm-2 col-form-label" for="inputPassword3">PASSWORDCHECK </label>
							<div class="col-sm-10">
								<input type="password" id="pass2" name="pass2" placeholder="Password" class="form-control">
								<small><div id="passResult2"> </div> </small> 
							</div>
						</div>


						<div class="form-group row">
							<label class="col-sm-2 col-form-label"> NAME </label>
							<div class="col-sm-10">
								<input type="text" name="member_name" value='${mb.member_name }' class="form-control">
							</div>
						</div>


						<div class="form-group row">
							<label class="col-sm-2 col-form-label" for="inputEmail3"> EMAIL</label>
							<div class="col-sm-10">
								<input type="text" name="member_email" value='${mb.member_email }' class="form-control">
							</div>
						</div>

						<div class="form-group row">
							<label class="col-sm-2 col-form-label"> ADDRESS</label> 
							
							<div class="col-sm-10">
								<div class="form-inline">
									<input type="text" id="sample6_postcode" placeholder="우편번호" name="member_zipcode" value='${mb.member_zipcode }' class="form-control mb-2 mr-sm-2"  >

									<input type="button" value="우편번호 찾기" class="btn btn-primary form-control mb-2 mr-sm-2"  onclick="sample6_execDaumPostcode()">
								</div>
							</div>
							
							<label class="col-sm-2 col-form-label"> </label>
							<div class="col-sm-10">
								<div class="form-inline">
									<input type="text" id="sample6_address" placeholder="주소" name="member_address" value='${mb.member_address }' class="form-control mb-2 mr-sm-2" > 
									<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="member_address2" value='${mb.member_address2 }' class="form-control mb-2 mr-sm-2" >
									<input type="text" id="sample6_extraAddress" placeholder="참고항목" class="form-control mb-2 mr-sm-2" >
								</div>
							</div>

						</div>


						<div class="form-group row">
							<label class="col-sm-2 col-form-label"> PHONE </label>
							<div class="col-sm-10">
								<input type="text" name="member_phone" value='${mb.member_phone }' class="form-control">
							</div>
						</div>

						<div align="center">
							<input type="submit" value="edit" class="btn btn-sm btn-secondary" >
							<input type="button" value="delete" class="btn btn-sm btn-secondary" id="checkDelete" onclick="checkDelete()">
							<input type="reset" value="cancel" class="btn btn-sm btn-secondary" id="checkReset">
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
