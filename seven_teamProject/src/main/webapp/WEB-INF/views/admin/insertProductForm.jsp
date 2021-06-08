<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Boutique | Ecommerce bootstrap template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href='<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css" />'>
    <!-- Lightbox-->
    <link rel="stylesheet" href='<c:url value="/resources/vendor/lightbox2/css/lightbox.min.css" />'>
    <!-- Range slider-->
    <link rel="stylesheet" href='<c:url value="/resources/vendor/nouislider/nouislider.min.css" />'>
    <!-- Bootstrap select-->
    <link rel="stylesheet" href='<c:url value="/resources/vendor/bootstrap-select/css/bootstrap-select.min.css" />'>
    <!-- Owl Carousel-->
    <link rel="stylesheet" href='<c:url value="/resources/vendor/owl.carousel2/assets/owl.carousel.min.css" />'>
    <link rel="stylesheet" href='<c:url value="/resources/vendor/owl.carousel2/assets/owl.theme.default.css" />'>
    <!-- Google fonts-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Libre+Franklin:wght@300;400;700&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Martel+Sans:wght@300;400;800&amp;display=swap">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href='<c:url value="/resources/css/style.default.css" />' id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href='<c:url value="/resources/css/custom.css" />'>
    <!-- Favicon-->
    <link rel="shortcut icon" href='<c:url value="/resources/img/favicon.png" />'>
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
    <div class="page-holder">
      <header class="header bg-white">
      </header>
      <!-- navbar-->
     <!-- Header start-->
	<c:import url="/resources/inc/header.jsp" />
	<!-- Header end -->
      <!--  Modal -->
      
<div class="container py-5">
<h1>상품 등록</h1>
 <div class="card mb-4" id="forms">
  <div class="card-header">Forms</div>
 <div class="card-body">
<h4 class="mb-5">Horizontal form</h4>
<form action='<c:url value="/admin/insertProductPro" />' method="post" enctype="multipart/form-data">
 
<div class="form-group row">
<label class="col-sm-2 col-form-label" for="inputEmail3">상품명</label>
 <div class="col-sm-10">
<input class="form-control" id="inputEmail3" type="text" name="product_title" placeholder="상품명">
 </div>
</div>
 
<div class="form-group row">
<label class="col-sm-2 col-form-label" for="inputEmail3">가격</label>
 <div class="col-sm-10">
<input class="form-control" id="inputEmail3" type="number" name="product_price" value="10" min="0" step="0.1" placeholder="가격">
 </div>
</div>
 
<div class="form-group row">
<label class="col-sm-2 col-form-label" for="inputEmail3">이미지</label>
 <div class="col-sm-10">
<input class="form-control" id="inputEmail3" type="file" name="product_image">
 </div>
</div>

<div class="form-group row">                              
<div class="col-sm-2">색상</div>
<div class="col-sm-10">
<div class="custom-control custom-radio">
<input type="radio" name=product_color value=red>RED &nbsp;
<input type="radio" name=product_color value=green>GREEN &nbsp;
<input type="radio" name=product_color value=blue>BLUE &nbsp;
</div>
</div>
</div>

<div class="form-group row">                              
<div class="col-sm-2">사이즈</div>
<div class="col-sm-10">
<div class="custom-control custom-radio">
<input type="radio" name=product_size value=small>SMALL &nbsp;
<input type="radio" name=product_size value=medium>MEDIUM &nbsp;
<input type="radio" name=product_size value=large>LARGE &nbsp;
</div>
</div>
</div>

<div class="form-group row">
<label class="col-sm-2 col-form-label" for="inputEmail3">수량</label>
 <div class="col-sm-10">
<input class="form-control" id="inputEmail3" type="number" name="product_stock" value="1" min="0" placeholder="수량">
 </div>
</div>

<div class="form-group row">                              
<div class="col-sm-2">카테고리</div>
<div class="col-sm-10">
<div class="custom-control custom-radio">
<input type="radio" name=product_category value=clothing>CLOTHING &nbsp;
<input type="radio" name=product_category value=shoes>SHOES &nbsp;
<input type="radio" name=product_category value=accessory>ACCESSORY &nbsp;
</div>
</div>
</div>

<div class="form-group row">
<label class="col-sm-2 col-form-label" for="inputEmail3">상세설명</label>
 <div class="col-sm-10">
<input class="form-control" id="inputEmail3" type="text" name="product_detail_text" placeholder="상세설명">
 </div>
</div>

<div class="form-group row">
<label class="col-sm-2 col-form-label" for="inputEmail3">상세이미지1</label>
 <div class="col-sm-10">
<input class="form-control" id="inputEmail3" type="file" name="product_detail_img1">
 </div>
</div>

<div class="form-group row">
<label class="col-sm-2 col-form-label" for="inputEmail3">상세이미지2</label>
 <div class="col-sm-10">
<input class="form-control" id="inputEmail3" type="file" name="product_detail_img2">
 </div>
</div>

<div class="form-group row">
<label class="col-sm-2 col-form-label" for="inputEmail3">상세이미지3</label>
 <div class="col-sm-10">
<input class="form-control" id="inputEmail3" type="file" name="product_detail_img3">
 </div>
</div>

<div class="form-group row">
<label class="col-sm-2 col-form-label" for="inputEmail3">상세이미지4</label>
 <div class="col-sm-10">
<input class="form-control" id="inputEmail3" type="file" name="product_detail_img4">
 </div>
</div>

<div class="form-group row">
<label class="col-sm-2 col-form-label" for="inputEmail3">배송정보</label>
 <div class="col-sm-10">
<input class="form-control" id="inputEmail3" type="text" name="product_detail_del_info" placeholder="배송정보">
 </div>
</div>

<div class="form-group row">
<label class="col-sm-2 col-form-label" for="inputEmail3">할인</label>
 <div class="col-sm-10">
<input class="form-control" id="inputEmail3" type="text" name="product_detail_sale" placeholder="할인">
 </div>
</div>


<div class="form-group row">
<label class="col-sm-2 col-form-label" for="inputEmail3">관리자 메모</label>
 <div class="col-sm-10">
<input class="form-control" id="inputEmail3" type="text" name="product_detail_admin_note" placeholder="관리자 메모">
 </div>
</div>









<div class="form-group row">
<div class="col-sm-10">
<button class="btn btn-primary" type="submit">등록</button>
</div>
</div>
</form>
 </div>
 </div>
</div>


      <footer class="bg-dark text-white">
      </footer>
      <!-- JavaScript files-->
      <script src='<c:url value="/resources/vendor/jquery/jquery.min.js" />'></script>
      <script src='<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />'></script>
      <script src='<c:url value="/resources/vendor/lightbox2/js/lightbox.min.js" />'></script>
      <script src='<c:url value="/resources/vendor/nouislider/nouislider.min.js" />'></script>
      <script src='<c:url value="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js" />'></script>
      <script src='<c:url value="/resources/vendor/owl.carousel2/owl.carousel.min.js" />'></script>
      <script src='<c:url value="/resources/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js" />'></script>
      <script src='<c:url value="/resources/js/front.js" />'></script>
      <script>
        // ------------------------------------------------------- //
        //   Inject SVG Sprite - 
        //   see more here 
        //   https://css-tricks.com/ajaxing-svg-sprite/
        // ------------------------------------------------------ //
        function injectSvgSprite(path) {
        
            var ajax = new XMLHttpRequest();
            ajax.open("GET", path, true);
            ajax.send();
            ajax.onload = function(e) {
            var div = document.createElement("div");
            div.className = 'd-none';
            div.innerHTML = ajax.responseText;
            document.body.insertBefore(div, document.body.childNodes[0]);
            }
        }
        // this is set to BootstrapTemple website as you cannot 
        // inject local SVG sprite (using only 'icons/orion-svg-sprite.svg' path)
        // while using file:// protocol
        // pls don't forget to change to your domain :)
        injectSvgSprite('https://bootstraptemple.com/files/icons/orion-svg-sprite.svg'); 
        
      </script>
      <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    </div>
  </body>
</html>