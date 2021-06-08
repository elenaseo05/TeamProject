<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<script src='<c:url value="/resources/script/jquery-3.6.0.js" />'></script>
<script type="text/javascript">


	$(document).ready(function(){
		
		$('#searchByPeriod').click(function(){
			$('table').html("<tr><td>ID</td><td>이름</td><td>e-mail</td><td>가입일</td></tr>");
			$.ajax({
				url : '<c:url value="/Ajax/selectMember_byPeriod" />',
				dataType : "json",
				data : {startDate : $('#startDate').val(), endDate : $('#endDate').val()},
				success : function(returnData){
					$.each(returnData, function(index, item){
						nowdate = new Date(item.member_joindate);
						date_str = nowdate.getFullYear() + ". " + (nowdate.getMonth() + 1) + ". " + nowdate.getDate();
						$('table').append("<tr><td>" + item.member_id + "</td><td>" + item.member_name + 
								"</td><td>" + item.member_email + "</td><td>" + date_str + "</td></tr>");
					});			
				}
			});
		});
		
		$('#searchByKewword').click(function(){
			$('table').html("<tr><td>ID</td><td>이름</td><td>e-mail</td><td>가입일</td></tr>");
			if($('#searchById').val() == "ID"){
				$.ajax({
					url : '<c:url value="/Ajax/selectMember_byId" />',
					dataType : "json",
					data : {keyword : $('#searchById').val()},
					success : function(returnData){
						$.each(returnData, function(index, item){
							nowdate = new Date(item.member_joindate);
							date_str = nowdate.getFullYear() + ". " + (nowdate.getMonth() + 1) + ". " + nowdate.getDate();
							$('table').append("<tr><td>" + item.member_id + "</td><td>" + item.member_name + 
									"</td><td>" + item.member_email + "</td><td>" + date_str + "</td></tr>");
						});			
					}
				});
			}
			
			if($('#searchByName').val() == "이름"){
				$.ajax({
					url : '<c:url value="/Ajax/selectMember_byName" />',
					dataType : "json",
					data : {keyword : $('#searchByName').val()},
					success : function(returnData){
						$.each(returnData, function(index, item){
							nowdate = new Date(item.member_joindate);
							date_str = nowdate.getFullYear() + ". " + (nowdate.getMonth() + 1) + ". " + nowdate.getDate();
							$('table').append("<tr><td>" + item.member_id + "</td><td>" + item.member_name + 
									"</td><td>" + item.member_email + "</td><td>" + date_str + "</td></tr>");
						});		
					}
				});
			}
		});
		
		
		
		
	});

</script>
</head>
<body>
<input type="date" id="startDate"> 부터
<input type="date" id="endDate"> 까지
<input type="button" value="조회" id="searchByPeriod"><br>
<select>
 <option id="searchById">ID</option>
 <option id="searchByName">이름</option>
</select>
<input type="text" placeholder="검색어 입력" id="keyword" name="keyword">
<input type="button" value="조회" id="searchByKewword">

<table border="1">
<tr><td>ID</td><td>이름</td><td>e-mail</td><td>가입일</td></tr>
</table>

</body>
</html>