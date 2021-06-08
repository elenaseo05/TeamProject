<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>SEVEN loginForm</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css'>
  <link rel="stylesheet" href='<c:url value="/resources/css/style.css" />'>
  <link rel="stylesheet" href='<c:url value="/resources/css/loginForm.css" />'>
	<script src='<c:url value="/resources/script/jquery-3.6.0.js" />'></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<!-- google signin api -->
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
	<script type="text/javascript">
	var code = "";     //이메일전송 인증번호 저장위한 코드
	
	
// <우편번호 다음 api>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
	$(document).ready(function(){
		//유효성검사 (메일,이름)
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	    var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
	    var getName= RegExp(/^[가-힣]+$/);
		
		
		$('#fr2').submit(function(){
			if($('#id').val()==""){
				alert("아이디를 입력하세요");
				$('#id').focus();
				return false;
			}
			
			if($('#pass').val()==""){
				alert("비밀번호를 입력하세요");
				$('#pass').focus();
				return false;
			}
			
			if($('#pass-ck').val()==""){
				alert("비밀번호를 재확인해주세요");
				$('#pass-ck').focus();
				return false;
			}
			
			
			if ($("#id").val()==($("#pass").val())) {
			      alert("비밀번호가 ID와 일치합니다");
			      $("#pass").val("");
			      $("#pass").focus();
			     
			    }
			
// 			if($("#pass").val() != ($("#pass2").val())){ 
// 			      alert("비밀번호가 일치하지 않습니다.");
// 			      $("#pass").val("");
// 			      $("#pass2").val("");
// 			      $("#pass").focus();
// 			      return false;
// 			     }
			
			if($('#name').val()==""){
				alert("이름 입력하세요");

  
				$('#name').focus();
				return false;
			}
			
			if (!getName.test($("#name").val())) {
		        alert("이름이 형식에 맞지 않습니다");
		        $("#name").val("");
		        $("#name").focus();
		        return false;
		      }
			
			if($('#email').val()==""){
				alert("이메일 입력하세요");
				$('#email').focus();
				return false;
			}
			
			 if(!getMail.test($("#email").val())){
			        alert("이메일형식에 맞게 입력해주세요")
			        $("#email").val("");
			        $("#email").focus();
			        return false;
			      }
			
  
			if($('#sample6_address').val()==""){
				alert("주소 입력하세요");
				$('sample6_address').focus();
				return false;
			}
			
			
			if($('#phone').val()==""){
				alert("전화번호 입력하세요");
				$('#phone').focus();
				return false;
			}
		
		});

	    
	});
	 
	
	
	
	</script>
</head>
<body>
<!-- partial:index.partial.html -->
<div class="container" id="container">
	<div class="scrollBox">
	<div class="scrollCon">
	<div class="form-container sign-up-container">
		<form action='<c:url value="/member/insertPro"/>' method="post" style="display: block;"  id="fr2">
			<h3 class="h1-ca">Create Account</h3>
			<div class="social-container">
				<a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
				<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
				<a href="#" class="social"><i class="fab fa-instagram"></i></a>
			</div>
<!-- 			<span>or use your email for registration</span> -->
			<input type="text" placeholder="id" name="member_id" maxlength="12" id="id"/>
			<input type="password" placeholder="Password" name="member_pass" maxlength="12" id="pass"/>
<!-- 			<input type="password" placeholder="Password check" name="member_pass2" maxlength="12" id="pass2"/> -->
			<input type="text" placeholder="Name" name="member_name" id="name"/>

		    <input type="email" placeholder="Email" name="member_email" id="email"/> 
<!-- 			<button type="button"   id="mail_check_button">인증번호 전송</button> -->
<!-- 			<input type="email" placeholder="Email_Check" name="member_emailCheck" id="mail_check_input_box"/> -->
<!-- 			 <input type="email" placeholder="Email" name="member_email" id="member_email" class="member_email"/>  -->
  
<!-- 			<button type="button"   id="mail_check_button" value="인증번호 전송"></button> -->
<!-- 			<input type="email" placeholder="Email_Check" name="member_email2" id="member_email2"class="member_email2"/> -->
	
              
			
			
			<input type="text" id="sample6_postcode" placeholder="우편번호" name="member_zipcode" class="post-01">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="post-02">
			<input type="text" id="sample6_address" placeholder="주소" name="member_address"><br>
			<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="member_address2">
			<input type="text" id="sample6_extraAddress" placeholder="참고항목" >
			 
			<input type="text" placeholder="phone" name="member_phone" id="phone"/>
<!-- 			<input type="text" placeholder="birth" name="member_birth"/> -->
			
			<button type="submit" class="sgn-btn">Sign Up</button>
			
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form action='<c:url value="/member/loginPro" />' method="post">
			<h1 class="h1-sgn-in">Sign in</h1>
			<div class="social-container">
				<a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
				<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
				<a href="#" class="social"><i class="fab fa-instagram"></i></a>
			</div>
			<span>or use your account</span>
			<input type="text" placeholder="ID" name="member_id" id="id"/>
			<input type="password" placeholder="Password" name="member_pass" id="pass"/>
			<a href='<c:url value="/member/findpw" />'>Forgot your password?</a>
	<button type="submit">Sign In</button>
		
<%-- 		<div id="naver_id_login" style="text-align:center"><a href="${url}"><img width="223" src="${pageContext.request.contextPath}/resources/img/btn_naver.png"/></a></div> --%>
	
	
	</a>
	
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Welcome Back!</h1>
				<p>To keep connected with us please login with your personal info</p>
				<button class="ghost" id="signIn">Sign In</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Hello, Friend!</h1>
				<p>Enter your personal details and start journey with us</p>
				<button class="ghost" id="signUp">Sign Up</button>
			</div>
		</div>
	</div>
</div>
<!-- partial -->
  <script src='<c:url value="/resources/js/script.js" />'></script>
</body>
</html>