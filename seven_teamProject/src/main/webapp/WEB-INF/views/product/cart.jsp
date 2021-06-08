<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Boutique | Ecommerce bootstrap template</title>
    <script src='<c:url value="/resources/script/jquery-3.6.0.js" />'></script>
    <script type="text/javascript">
     $(document).ready(function(){
    
    	$('.inc-btnn').click(function(){

     		var siblings = $(this).siblings('input[type="text"]');
     		siblings.val(parseInt(siblings.val(), 10) + 1);
     		var a = siblings.val();
      		
			
     		
     		 var b = $(this).siblings('input[type="hidden"]').val();
     		 location.href="${pageContext.request.contextPath}/product/cartupdate?product_num=" + b +"&cart_count=" + a; 
    				
    	});
    	
    	$('.dec-btnn').click(function(){
    		 var siblings = $(this).siblings('input[type="text"]');
    		 if (parseInt(siblings.val(), 10) >= 1) {
                 siblings.val(parseInt(siblings.val(), 10) - 1);
             };    		
    		 var c = siblings.val();
    		var d = $(this).siblings('input[type="hidden"]').val();
    		
    		location.href="${pageContext.request.contextPath}/product/cartupdate?product_num=" + d +"&cart_count=" + c;
    		
    		
    		
    	});
    	
    	
    	
    	
    });
     
    
    </script>
    
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
  
  <style type="text/css">
   .empt {color: #ccc;
   font-size: 28px;
   font-weight: normal;
   text-align: center;}
  
  
  
  </style>  
  </head>
  <body>
    <div class="page-holder">
      <!-- navbar-->
	<!-- Header start-->
	<c:import url="/resources/inc/header.jsp" />
	<!-- Header end -->
      <!--  Modal -->
      <div class="modal fade" id="productView" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-body p-0">
              <div class="row align-items-stretch">
                <div class="col-lg-6 p-lg-0"><a class="product-view d-block h-100 bg-cover bg-center" style="background: url(img/product-5.jpg)" href="img/product-5.jpg" data-lightbox="productview" title="Red digital smartwatch"></a><a class="d-none" href="img/product-5-alt-1.jpg" title="Red digital smartwatch" data-lightbox="productview"></a><a class="d-none" href="img/product-5-alt-2.jpg" title="Red digital smartwatch" data-lightbox="productview"></a></div>
                <div class="col-lg-6">
                  <button class="close p-4" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                  <div class="p-5 my-md-4">
                    <ul class="list-inline mb-2">
                      <li class="list-inline-item m-0"><i class="fas fa-star small text-warning"></i></li>
                      <li class="list-inline-item m-0"><i class="fas fa-star small text-warning"></i></li>
                      <li class="list-inline-item m-0"><i class="fas fa-star small text-warning"></i></li>
                      <li class="list-inline-item m-0"><i class="fas fa-star small text-warning"></i></li>
                      <li class="list-inline-item m-0"><i class="fas fa-star small text-warning"></i></li>
                    </ul>
                    <!--  <h2 class="h4">Red digital smartwatch</h2>
                    <p class="text-muted">$250</p>
                    <p class="text-small mb-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ut ullamcorper leo, eget euismod orci. Cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus. Vestibulum ultricies aliquam convallis.</p>
                    <div class="row align-items-stretch mb-4">
                      <div class="col-sm-7 pr-sm-0">
                        <div class="border d-flex align-items-center justify-content-between py-1 px-3"><span class="small text-uppercase text-gray mr-4 no-select">Quantity</span>
                          <div class="quantity">
                            <button class="dec-btn p-0"><i class="fas fa-caret-left"></i></button>
                            <input class="form-control border-0 shadow-0 p-0" type="text" value="1">
                            <button class="inc-btn p-0"><i class="fas fa-caret-right"></i></button>
                          </div>
                        </div>
                      </div> -->
                     <%--  <div class="col-sm-5 pl-sm-0"><a class="btn btn-dark btn-sm btn-block h-100 d-flex align-items-center justify-content-center px-0" href='<c:url value="/product/cart" />'>Add to cart</a></div>
                    </div><a class="btn btn-link text-dark p-0" href="#"><i class="far fa-heart mr-2"></i>Add to wish list</a> --%>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="container"> 
        <!-- HERO SECTION-->
        <section class="py-5 bg-light">
          <div class="container">
            <div class="row px-4 px-lg-5 py-lg-4 align-items-center">
              <div class="col-lg-6">
                <h1 class="h2 text-uppercase mb-0">Cart</h1>
              </div>
              <div class="col-lg-6 text-lg-right">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb justify-content-lg-end mb-0 px-0">
                    <li class="breadcrumb-item"><a href='<c:url value="/" />'>Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Cart</li>
                  </ol>
                </nav>
              </div>
            </div>
          </div>
        </section>
        <section class="py-5">
          <h2 class="h5 text-uppercase mb-4">Shopping cart</h2>
          <div class="row">
            <div class="col-lg-8 mb-4 mb-lg-0">
              <!-- CART TABLE-->
              <div class="table-responsive mb-4">
                <table class="table">
                  <thead class="bg-light">
                  
                  
                    <tr>
                      <th class="border-0" scope="col"> <strong class="text-small text-uppercase">Product</strong></th>
                      <th class="border-0" scope="col"> <strong class="text-small text-uppercase">Price</strong></th>
                      <th class="border-0" scope="col" style="width: -5px !important;" > <strong class="text-small text-uppercase">Count</strong></th>
                      <th class="border-0" scope="col"> <strong class="text-small text-uppercase">Total</strong></th>
                      <th class="border-0" scope="col"> <strong class="text-small text-uppercase">delete</strong> 
                      </th>
                    </tr>
                 
                  </thead>
                  <tbody>
<!--                   상품칸이 비워져 있을때 -->
					<c:choose>
						 <c:when test="${empty pbList }">
						 	
					
						
						<tr> 
                  			<th colspan="5" class="empt" id="empty">                  	 
                   	 		empty            	 
                  	
                 			</th>                   	
                 		</tr> 	 
					
						 
						 </c:when>
						 
						 <c:otherwise>
						 	<c:if test="${!empty pbList}">
				
				
				<c:forEach var="cb" items="${cbList }" varStatus="status">
				
				<input type="hidden" name="product_num" value="${cb.product_num}" id="product_num">
                    <tr>
                      <th class="pl-0 border-0" scope="row">
                        <div class="media align-items-center"><a class="reset-anchor d-block animsition-link" href='<c:url value="/product/detail" />'><img src='<c:url value="/resources/upload/${cb. product_image }" />' alt="..." width="70"/></a>
                          <div class="media-body ml-3"><strong class="h6"><a class="reset-anchor animsition-link" href='<c:url value="/product/detail" />'>${cb.product_title }(${cb.product_size })</a></strong></div>
                        </div>
                      </th>
                      <td class="align-middle border-0">
                        <p class="mb-0 small">${cb.product_price }</p>
                      </td>
                      
                      
                      <td class="align-middle border-light">
                       <div class="border d-flex" style="width:70px !important;"><span class="small text-uppercase text-gray headings-font-family"></span>
                          <div class="quantity" style="width:70px !important;">
                            <button class="dec-btnn"><i class="fas fa-caret-left"></i></button>
                            <input class=" form-control-sm border-0 shadow-0" type="text" value="${cb.cart_count}" id="count"/>
                            <input type="hidden" value="${cb.product_num}" name="product_num2" id="product_num2">
                            <button class="inc-btnn" ><i class="fas fa-caret-right" ></i></button>
                          </div>
                        </div>   
                      </td>

                      
                      <td class="align-middle border-0">
                        <p class="mb-0 small">${cb.product_price*cb.cart_count }</p>
                      </td>
                      <td class="align-middle border-0"><a class="reset-anchor" href='<c:url value="/product/deletePro?product_num=${cb.product_num }&product_size=${cb.product_size }"/>'><i class="fas fa-trash-alt small text-muted"></i></a></td>
                    </tr>
                    
                   </c:forEach>
                  
                    
                    
                    </c:if>
						 
						 </c:otherwise>
						
						</c:choose>
                    
                   
           
                  </tbody>
                </table>
              </div>
              <!-- CART NAV-->
              <div class="bg-light px-4 py-3">
                <div class="row align-items-center text-center">
                  <div class="col-md-6 mb-3 mb-md-0 text-md-left"><a class="btn btn-link p-0 text-dark btn-sm" href='<c:url value="/product/shop" />'><i class="fas fa-long-arrow-alt-left mr-2"> </i>Continue shopping</a></div>
                  <div class="col-md-6 text-md-right"><a class="btn btn-outline-dark btn-sm" href='<c:url value="/product/checkoutList" />'>Procceed to checkout<i class="fas fa-long-arrow-alt-right ml-2"></i></a></div>
                </div>
              </div>
            </div>
            <!-- ORDER TOTAL-->
            <div class="col-lg-4">
              <div class="card border-0 rounded-0 p-lg-4 bg-light">
                <div class="card-body">
                  <h5 class="text-uppercase mb-4">Cart total</h5>
                  <ul class="list-unstyled mb-0">
                    <li class="d-flex align-items-center justify-content-between"><strong class="text-uppercase small font-weight-bold"></strong><span class="text-muted small"> 
                   
                    <li class="border-bottom my-2"></li>
                    <li class="d-flex align-items-center justify-content-between mb-4"><strong class="text-uppercase small font-weight-bold">Total</strong><span>${total }</span></li>
                    
                    <li>
                      <form action="#">
                        <div class="form-group mb-0">
                          <input class="form-control" type="text" placeholder="Enter your coupon">
                          <button class="btn btn-dark btn-sm btn-block" type="submit"> <i class="fas fa-gift mr-2"></i>Apply coupon</button>
                        </div>
                      </form>
                      
                                
                   
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </section>
        
      </div>
      
	<!-- Footer start -->
	<c:import url="/resources/inc/footer.jsp" />
	<!-- Footer end -->
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