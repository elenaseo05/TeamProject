<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <div class="card-header">메뉴 들어갈 곳</div> -->
<div class="card-body">
	<nav class="row">
		<div class="col-xs-6" >
			<ul>
				<li class="page-item"><a href='<c:url value="/mypage/update" />'> MY INFO </a></li>
				<!-- 회원 정보 수정 페이지 / 비밀번호 입력 후 일치하면 정보 조회 및 수정 가능 -->
				<li class="page-item"><a href='<c:url value="/mypage/wish" />'> WISH LIST </a></li>
				<!-- 삭제, 장바구니 추가 등 기능 구현  -->
				<li class="page-item"><a href='<c:url value="/mypage" />'> HISTORY </a></li>
				<!-- 주문 내역, 배송상태, 주문 상태확인  -->
			</ul>
		</div>
	</nav>
</div>