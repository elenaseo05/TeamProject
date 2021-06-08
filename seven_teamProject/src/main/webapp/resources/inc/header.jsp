<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <header class="header bg-white">
        <div class="container px-0 px-lg-3">
          <nav class="navbar navbar-expand-lg navbar-light py-3 px-lg-0"><a class="navbar-brand" href='<c:url value="/" />'><span class="font-weight-bold text-uppercase text-dark">SEVEN</span></a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                  <!-- Link--><a class="nav-link" href='<c:url value="/" />'>Home</a>
                </li>
                <li class="nav-item">
                  <!-- Link--><a class="nav-link" href='<c:url value="/product/shop" />'>Shop</a>
                </li>
                <li class="nav-item"><a class="nav-link" href='<c:url value="/mypage/wish" />'> <i class="far fa-heart mr-1">Wish</i></a></li>             
                <li class="nav-item"><a class="nav-link" href='<c:url value="/product/cartList" />'> <i class="fas fa-dolly-flatbed mr-1 text-gray"></i>Cart</a></li>
              </ul>

              
              <!-- 로그인하지 않았을 때 ↓ -->
              <c:if test="${empty sessionScope.id}">
              <ul class="navbar-nav ml-auto">              
                <li class="nav-item"><a class="nav-link" href='<c:url value="/member/login" />'> <i class="fas fa-user-alt mr-1 text-gray"></i>Login | Join</a></li>
              </ul>
             </c:if>
              <!-- 로그인하지 않았을 때 ↑ -->
              
              <!-- 'admin'으로 로그인 했을 때 ↓ -->
              <c:choose>
              	<c:when test="${sessionScope.id eq 'admin'}">
              		<ul class="navbar-nav ml-auto">              
                		<li class="nav-item"><a class="nav-link" href='<c:url value="/admin/main" />'> <i class="fas fa-user-alt mr-1 text-gray"></i>관리자</a></li>
                		<li class="nav-item"><a class="nav-link" href='<c:url value="/member/logout" />'> <i class="fas fa-user-alt mr-1 text-gray"></i>Logout</a></li>
             		</ul>                	
              	</c:when>
              	<c:otherwise>
              		<c:if test="${!empty sessionScope.id}">
              			<ul class="navbar-nav ml-auto">              
                			<li class="nav-item"><a class="nav-link" href='<c:url value="/mypage" />'> <i class="fas fa-user-alt mr-1 text-gray"></i>${sessionScope.id} 님</a></li>
                			<li class="nav-item"><a class="nav-link" href='<c:url value="/member/logout" />'> <i class="fas fa-user-alt mr-1 text-gray"></i>Logout</a></li>
             			</ul>              		
              		</c:if>
              	</c:otherwise>
              </c:choose>
              <!-- 로그인 했을 때 ↑ -->
            </div>
          </nav>
        </div>
      </header>