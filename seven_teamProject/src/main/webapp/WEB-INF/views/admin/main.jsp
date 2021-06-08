<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Boutique | Ecommerce bootstrap template inwook</title>
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
      <!-- navbar-->
	<!-- Header start-->
	<c:import url="/resources/inc/header.jsp" />
	<!-- Header end -->
      
      
      <!--  Modal -->
<div class="container">
<!-- HERO SECTION-->

<section class="py-5 bg-light">
 <div class="container">
  <div class="row px-4 px-lg-5 py-lg-4 align-items-center">
   <div class="col-lg-6">
    <h1 class="h2 text-uppercase mb-0">관리자</h1>
   </div>
 <div class="col-lg-6 text-lg-right">
  <nav aria-label="breadcrumb">
   <ol class="breadcrumb justify-content-lg-end mb-0 px-0">
    <li class="breadcrumb-item"><a href='<c:url value="/admin/insertProduct" />'>상품등록</a></li>
    <li class="breadcrumb-item"><a href='<c:url value="/admin/manageProduct" />'>상품관리</a></li>
    <li class="breadcrumb-item"><a href='<c:url value="/admin/selectMember" />'>회원관리</a></li>
    <li class="breadcrumb-item"><a href='<c:url value="/admin/selectProduct" />'>매출조회</a></li>
   </ol>
  </nav>
 </div>
   <div class="col-lg-6 text-lg-right">
    <nav aria-label="breadcrumb"></nav>
   </div>
  </div>
 </div>
</section>


<section class="py-5">
<h2 class="h5 text-uppercase mb-4"><a href='<c:url value="/admin/selectMember" />'>회원관리</a></h2>
<div class="row">            
            
<div class="col-lg-4">
 <div class="card border-0 rounded-0 p-lg-4 bg-light">
  <div class="card-body">
<h5 class="text-uppercase mb-4">신규 회원</h5>
<ul class="list-unstyled mb-0">
<script src='<c:url value="/resources/script/jquery-3.6.0.js" />'></script>
<script type="text/javascript">
 <li class="d-flex align-items-center justify-content-between"><strong class="small font-weight-bold">Red digital smartwatch</strong><span>$250</span></li>
 <li class="border-bottom my-2"></li>
 <li class="d-flex align-items-center justify-content-between"><strong class="small font-weight-bold">Gray Nike running shoes</strong><span>$351</span></li>
 <li class="border-bottom my-2"></li>
 <li class="d-flex align-items-center justify-content-between"><strong class="text-uppercase small font-weight-bold">Total</strong><span>$601</span></li>
</script>
</ul>
  </div>
 </div>
</div>

<div class="col-lg-4">
 <div class="card border-0 rounded-0 p-lg-4 bg-light">
  <div class="card-body">
<h5 class="text-uppercase mb-4">취소 요청</h5>
<ul class="list-unstyled mb-0">
 <li class="d-flex align-items-center justify-content-between"><strong class="small font-weight-bold">Red digital smartwatch</strong><span>$250</span></li>
 <li class="border-bottom my-2"></li>
 <li class="d-flex align-items-center justify-content-between"><strong class="small font-weight-bold">Gray Nike running shoes</strong><span>$351</span></li>
 <li class="border-bottom my-2"></li>
 <li class="d-flex align-items-center justify-content-between"><strong class="text-uppercase small font-weight-bold">Total</strong><span>$601</span></li>
</ul>
  </div>
 </div>
</div>

<div class="col-lg-4">
 <div class="card border-0 rounded-0 p-lg-4 bg-light">
  <div class="card-body">
<h5 class="text-uppercase mb-4">환불 요청</h5>
<ul class="list-unstyled mb-0">
 <li class="d-flex align-items-center justify-content-between"><strong class="small font-weight-bold">Red digital smartwatch</strong><span>$250</span></li>
 <li class="border-bottom my-2"></li>
 <li class="d-flex align-items-center justify-content-between"><strong class="small font-weight-bold">Gray Nike running shoes</strong><span>$351</span></li>
 <li class="border-bottom my-2"></li>
 <li class="d-flex align-items-center justify-content-between"><strong class="text-uppercase small font-weight-bold">Total</strong><span>$601</span></li>
</ul>
  </div>
 </div>
</div>
</div>
</section>



<section class="py-5">
<h2 class="h5 text-uppercase mb-4"><a href='<c:url value="/admin/selectProduct" />'>매출</a></h2>
<div class="row">            
            
<div class="col-lg-4">
 <div class="card border-0 rounded-0 p-lg-4 bg-light">
  <div class="card-body">
<h5 class="text-uppercase mb-4">Monthly Best 3</h5>
<ul class="list-unstyled mb-0">
 <li class="d-flex align-items-center justify-content-between"><strong class="small font-weight-bold">Red digital smartwatch</strong><span>$250</span></li>
 <li class="border-bottom my-2"></li>
 <li class="d-flex align-items-center justify-content-between"><strong class="small font-weight-bold">Gray Nike running shoes</strong><span>$351</span></li>
 <li class="border-bottom my-2"></li>
 <li class="d-flex align-items-center justify-content-between"><strong class="text-uppercase small font-weight-bold">Total</strong><span>$601</span></li>
</ul>
  </div>
 </div>
</div>

<div class="col-lg-4">
 <div class="card border-0 rounded-0 p-lg-4 bg-light">
  <div class="card-body">
<h5 class="text-uppercase mb-4">Weekly Best 3</h5>
<ul class="list-unstyled mb-0">
 <li class="d-flex align-items-center justify-content-between"><strong class="small font-weight-bold">Red digital smartwatch</strong><span>$250</span></li>
 <li class="border-bottom my-2"></li>
 <li class="d-flex align-items-center justify-content-between"><strong class="small font-weight-bold">Gray Nike running shoes</strong><span>$351</span></li>
 <li class="border-bottom my-2"></li>
 <li class="d-flex align-items-center justify-content-between"><strong class="text-uppercase small font-weight-bold">Total</strong><span>$601</span></li>
</ul>
  </div>
 </div>
</div>

<div class="col-lg-4">
 <div class="card border-0 rounded-0 p-lg-4 bg-light">
  <div class="card-body">
<h5 class="text-uppercase mb-4">WORST 3</h5>
<ul class="list-unstyled mb-0">
 <li class="d-flex align-items-center justify-content-between"><strong class="small font-weight-bold">Red digital smartwatch</strong><span>$250</span></li>
 <li class="border-bottom my-2"></li>
 <li class="d-flex align-items-center justify-content-between"><strong class="small font-weight-bold">Gray Nike running shoes</strong><span>$351</span></li>
 <li class="border-bottom my-2"></li>
 <li class="d-flex align-items-center justify-content-between"><strong class="text-uppercase small font-weight-bold">Total</strong><span>$601</span></li>
</ul>
  </div>
 </div>
</div>
</div>
</section>

<section class="py-5">
<h2 class="h5 text-uppercase mb-4">리뷰</h2>
<div class="row">            
            
<div class="col-lg-4">
 <div class="card border-0 rounded-0 p-lg-4 bg-light">
  <div class="card-body">
<h5 class="text-uppercase mb-4">리뷰 많은순</h5>
<ul class="list-unstyled mb-0">
 <li class="d-flex align-items-center justify-content-between"><strong class="small font-weight-bold">Red digital smartwatch</strong><span>$250</span></li>
 <li class="border-bottom my-2"></li>
 <li class="d-flex align-items-center justify-content-between"><strong class="small font-weight-bold">Gray Nike running shoes</strong><span>$351</span></li>
 <li class="border-bottom my-2"></li>
 <li class="d-flex align-items-center justify-content-between"><strong class="text-uppercase small font-weight-bold">Total</strong><span>$601</span></li>
</ul>
  </div>
 </div>
</div>

<div class="col-lg-4">
 <div class="card border-0 rounded-0 p-lg-4 bg-light">
  <div class="card-body">
<h5 class="text-uppercase mb-4">평점 높은순</h5>
<ul class="list-unstyled mb-0">
 <li class="d-flex align-items-center justify-content-between"><strong class="small font-weight-bold">Red digital smartwatch</strong><span>$250</span></li>
 <li class="border-bottom my-2"></li>
 <li class="d-flex align-items-center justify-content-between"><strong class="small font-weight-bold">Gray Nike running shoes</strong><span>$351</span></li>
 <li class="border-bottom my-2"></li>
 <li class="d-flex align-items-center justify-content-between"><strong class="text-uppercase small font-weight-bold">Total</strong><span>$601</span></li>
</ul>
  </div>
 </div>
</div>

<div class="col-lg-4">
 <div class="card border-0 rounded-0 p-lg-4 bg-light">
  <div class="card-body">
<h5 class="text-uppercase mb-4">평점 낮은순</h5>
<ul class="list-unstyled mb-0">
 <li class="d-flex align-items-center justify-content-between"><strong class="small font-weight-bold">Red digital smartwatch</strong><span>$250</span></li>
 <li class="border-bottom my-2"></li>
 <li class="d-flex align-items-center justify-content-between"><strong class="small font-weight-bold">Gray Nike running shoes</strong><span>$351</span></li>
 <li class="border-bottom my-2"></li>
 <li class="d-flex align-items-center justify-content-between"><strong class="text-uppercase small font-weight-bold">Total</strong><span>$601</span></li>
</ul>
  </div>
 </div>
</div>
</div>
</section>



</div>
<!--         </section> -->
</div>
      
      
      
	<!-- Footer start -->
	<c:import url="/resources/inc/footer.jsp" />
	<!-- Footer end -->
      <!-- JavaScript files-->
      <script src='<c:url value="/resources/vendor/jquery/jquery.min.js" />'></script>
      <script src='<c:url value="/resources/script/jquery-3.6.0.js" />'></script>
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
<!--       <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"> -->
  </body>
</html>