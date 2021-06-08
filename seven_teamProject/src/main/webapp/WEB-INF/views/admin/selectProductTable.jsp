<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이인욱_통합구현구현_실기시험_파일_test2.jsp</title>
<script src='<c:url value="/resources/script/jquery-3.6.0.js" />'></script>
<script type="text/javascript">

	$(document).ready(function(){
		$('#btn').click(function(){
			$.getJSON('<c:url value="/ajaxtest/ajaxtest2" />', function(returnData){
				$.each(returnData, function(index, item){
					nowdate = new Date(item.date);
					date_str = nowdate.getFullYear() + ". " + (nowdate.getMonth() + 1) + ". " + nowdate.getDate();
					$('table').append("<tr><td>" + item.id + "</td><td>" + item.pass + 
							"</td><td>" + item.name + "</td><td>" + date_str + "</td></tr>");
				});
			});
		});
	});

</script>
</head>
<body>

<input type="button" value="회원목록조회" id="btn">
<table border="1">
<tr><td>아이디</td><td>비밀번호</td><td>이름</td><td>날짜</td></tr>
</table>


<h1>board/list.jsp</h1>
<h1>글목록[전체글 개수 : ${pb.count}]</h1>
<a href='<c:url value="/board/fwrite" />'>글쓰기</a>


<table border="1">
<tr><td>글번호</td><td>글쓴이</td><td>제목</td>
    <td>글쓴날짜</td><td>조회수</td></tr>
    	<c:forEach var="bb" items="${bbList}">
 <tr><td>${bb.num}</td>
     <td>${bb.name}</td>
     <td><a href='<c:url value="/board/content?num=${bb.num}" />'>
         ${bb.subject}</a></td>
    <td>${bb.date}</td>
    <td>${bb.readcount}</td></tr>
    	</c:forEach>
</table>

<c:if test="${pb.startPage > pb.pageBlock}">
	<a href='<c:url value="/board/list?pageNum=${pb.startPage - pb.pageBlock}" />'>이전</a>
</c:if>


<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}" step="1">
	<a href='<c:url value="/board/list?pageNum=${i}"/>'>${i}</a>
</c:forEach>


<c:if test="${pb.endPage < pb.pageCount}">
	<a href='<c:url value="/board/list?pageNum=${pb.startPage +pb.pageBlock}" />'>이전</a>
</c:if>

</body>
</html>