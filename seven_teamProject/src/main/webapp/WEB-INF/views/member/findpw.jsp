<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src='<c:url value="/resources/script/jquery-3.6.0.js" />'></script>
<script>
	$(function(){
		
// 		alert("11111");
		$("#findBtn").click(function(){
			$.ajax({
				url : '<c:url value="/member/findpw" />',
				type : "POST",
				data : {
					id : $("#member_id").val(),
					email : $("#member_email").val()
				},
				success : function(result) {
					alert(result);
				}
			});
		});


	})
</script>
<style type="text/css">
.mybtn{
  width:150px;
  height:40px;
  padding:0;
  display:inline; 
  border-radius: 4px; 
  background: #212529;
  color: #fff;
  margin-top: 20px;
  border: solid 2px #212529; 
  transition: all 0.5s ease-in-out 0s;
}
.mybtn:hover .mybtn:focus {
  background: white;
  color: #212529;
  text-decoration: none;
}
</style>
<title>비밀번호 찾기</title>
</head>
<body>
<form action='<c:url value="/member/findpw" />' method="post">
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4 w3-auto" style="width: 382px;height: 456.3px;">
			<div class="w3-center w3-large w3-margin-top">
				<h3>FIND PASSWORD</h3>
			</div>
			<div>
				<p>
					<label>ID</label>
					<input class="w3-input" type="text" id="member_id" name="member_id" placeholder="회원가입한 아이디를 입력하세요" required>
				</p>
				<p>
					<label>E-mail</label>
					<input class="w3-input" type="text" id="member_email" name="member_email" placeholder="회원가입한 이메일주소를 입력하세요" required>
				</p>
				<p class="w3-center">
					<button type="submit" id="findBtn" class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">Search</button>
					<button type="button"  class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">Login</button>
				</p>
			</div>
		</div>
	</div>
	</form>
</body>
</html>