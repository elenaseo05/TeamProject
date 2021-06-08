
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  -->
    <title>Boutique | Ecommerce bootstrap template </title>
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
<!--       일단 될지 않될지 몰라서 넣어둠 -->
       <c:forEach var="pL" items="${productList }">
       
       
      <div class="modal fade" id="pp${pL.product_num }" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-body p-0">
              <div class="row align-items-stretch">
                <div class="col-lg-6 p-lg-0"><a class="product-view d-block h-100 bg-cover bg-center" style="background: url('<c:url value="/resources/upload/${pL.product_image}" />')" href='<c:url value="/resources/upload/${pL.product_image}" />' data-lightbox="productview" title="${pL.product_title }"></a></div>
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
                    
<!--                     이미지누루면 확대돼서 나오는 이미지
문제는 for 문을 돌려서 나오는 값을 for문을 빠져나가서도 값을 부를수 있냐 이것인데.......
어떻게 해야 이것이 나오는 건가요........
-->
                    <h2 class="h4">${pL.product_title}</h2>
                    <p class="text-muted">${pL.product_price}</p>
                    <p class="text-small mb-4">${pL.product_detail_text}</p>
                    <div class="row align-items-stretch mb-4">
                      <div class="col-sm-7 pr-sm-0">
                        <div class="border d-flex align-items-center justify-content-between py-1 px-3"><span class="small text-uppercase text-gray mr-4 no-select">Quantity</span>
                          <div class="quantity">
                            <button class="dec-btn p-0"><i class="fas fa-caret-left"></i></button>
                            <input class="form-control border-0 shadow-0 p-0" type="text" value="1"> 
<!--                             카트 수량 -->
                            <button class="inc-btn p-0"><i class="fas fa-caret-right"></i></button>
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-5 pl-sm-0"><a class="btn btn-dark btn-sm btn-block h-100 d-flex align-items-center justify-content-center px-0" href='<c:url value="/product/cart?product_num=${pL.product_num}" />'>Add to cart</a></div>
                    </div><a class="btn btn-link text-dark p-0" href='<c:url value="/product/wish?product_num=${pL.product_num}" />'><i class="far fa-heart mr-2"></i>Add to wish list</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      </c:forEach>
      
      <div class="container">
        <!-- HERO SECTION-->
<section class="py-5 bg-light">
 <div class="container">
  <div class="row px-4 px-lg-5 py-lg-4 align-items-center">
   <div class="col-lg-6">
    <h1 class="h2 text-uppercase mb-0">product management</h1>
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
          <div class="container p-0">
            <div class="row">
              <!-- SHOP SIDEBAR-->
              <div class="col-lg-3 order-2 order-lg-1">
                <h5 class="text-uppercase mb-4"></h5>
                <div class="py-2 px-4 bg-dark text-white mb-3"><strong class="small text-uppercase font-weight-bold">Fashion</strong></div>
              <form name="category">
              		<input type="hidden" name="category1">
              </form>
                <ul class="list-unstyled small text-muted pl-lg-4 font-weight-normal">
                  <li class="mb-2"><a class="reset-anchor" href="javascript:formSubmit('clothing')" >CLOTHES</a></li>
                  <li class="mb-2"><a class="reset-anchor" href="javascript:formSubmit('shoes')">SHOES</a></li>
          
                  <li class="mb-2"><a class="reset-anchor" href="javascript:formSubmit('accessory')">ACCESSORIES</a></li>
                 
                </ul>
               
               
               
       <br>
       <br>
       <br>
       <br>
       <form action='<c:url value="/product/shop" />' method=get>
                <h6 class="text-uppercase mb-4">Price range</h6>
                <div class="price-range pt-4 mb-5">
                  
                 <div id="range"></div>
                  
                  <div class="row pt-2">
                    <div class="col-6"><strong class="small font-weight-bold text-uppercase">From<input type="hidden" name="lower" id="lower"></strong></div>
                    <div class="col-6 text-right"><strong class="small font-weight-bold text-uppercase">To<input type="hidden" name="upper" id="upper"></strong></div>
                  </div>
                 	 <input id="search11" class="btn btn-outline-dark btn-sm" type="submit" value="search">
                </div>
                  </form>
                  
                
                
                
                
                
                </div>
                
<!--                 <h6 class="text-uppercase mb-3"></h6> -->
<!--                 <div class="custom-control custom-checkbox mb-1"> -->
<!--                   <input class="custom-control-input" id="customCheck1" type="checkbox"> -->
<!--                   <label class="custom-control-label text-small" for="customCheck1">Returns Accepted</label> -->
<!--                 </div> -->
<!--                 <div class="custom-control custom-checkbox mb-1"> -->
<!--                   <input class="custom-control-input" id="customCheck2" type="checkbox"> -->
<!--                   <label class="custom-control-label text-small" for="customCheck2">Returns Accepted</label> -->
<!--                 </div> -->
<!--                 <div class="custom-control custom-checkbox mb-1"> -->
<!--                   <input class="custom-control-input" id="customCheck3" type="checkbox"> -->
<!--                   <label class="custom-control-label text-small" for="customCheck3">Completed Items</label> -->
<!--                 </div> -->
<!--                 <div class="custom-control custom-checkbox mb-1"> -->
<!--                   <input class="custom-control-input" id="customCheck4" type="checkbox"> -->
<!--                   <label class="custom-control-label text-small" for="customCheck4">Sold Items</label> -->
<!--                 </div> -->
<!--                 <div class="custom-control custom-checkbox mb-1"> -->
<!--                   <input class="custom-control-input" id="customCheck5" type="checkbox"> -->
<!--            <div class="custom-control custom-checkbox mb-4">
<!--                   <input class="custom-control-input" id="customCheck6" type="checkbox"> -->
<!--                   <label class="custom-control-label text-small" for="customCheck6">Authorized Seller</label> -->
<!--                 </div> -->
<!--                 <h6 class="text-uppercase mb-3"></h6> -->
<!--                 <div class="custom-control custom-radio"> -->
<!--                   <input class="custom-control-input" id="customRadio1" type="radio" name="customRadio"> -->
<!--                   <label class="custom-control-label text-small" for="customRadio1">All Listings</label> -->
<!--                 </div> -->
<!--                 <div class="custom-control custom-radio"> -->
<!--                   <input class="custom-control-input" id="customRadio2" type="radio" name="customRadio"> -->
<!--                   <label class="custom-control-label text-small" for="customRadio2">Best Offer</label> -->
<!--                 </div> -->
<!--                 <div class="custom-control custom-radio"> -->
<!--                   <input class="custom-control-input" id="customRadio3" type="radio" name="customRadio"> -->
<!--                   <label class="custom-control-label text-small" for="customRadio3">Auction</label> -->
<!--                 </div> -->
<!--                 <div class="custom-control custom-radio"> -->
<!--                   <input class="custom-control-input" id="customRadio4" type="radio" name="customRadio"> -->
<!--                   <label class="custom-control-label text-small" for="customRadio4">Buy It Now</label> -->
<!--                 </div> -->
<!--               </div> -->
              <!-- SHOP LISTING-->
              <div class="col-lg-9 order-1 order-lg-2 mb-5 mb-lg-0">
                <div class="row mb-3 align-items-center">
                  <div class="col-lg-6 mb-2 mb-lg-0">
<!--                     <p class="text-small text-muted mb-0">Showing 1–12 of 53 results</p> -->
                  </div>
                  <div class="col-lg-6">
                    <ul class="list-inline d-flex align-items-center justify-content-lg-end mb-0">
                    
<!--                     네모 박스 정렬 -->
<!--                       <li class="list-inline-item text-muted mr-3"><a class="reset-anchor p-0" href="#"><i class="fas fa-th-large"></i></a></li> -->
<!--                       <li class="list-inline-item text-muted mr-3"><a class="reset-anchor p-0" href="#"><i class="fas fa-th"></i></a></li> -->
<!--                       <li class="list-inline-item"> -->


<!--        정렬-->
 				<form action='<c:url value="/product/shop" />' method="get">
                        <select class="selectpicker ml-auto" name="sorting" data-width="200" data-style="bs-select-form-control" data-title="정렬" onchange="formChange(this.form)">
                        
<!--                           <option value="default">order</option> -->
          
          				  <option value="popularity">인기순</option>
                          <option value="low-high">가격낮은순</option>
                          <option value="high-low">가격높은순</option>
                        </select>
                        </form>
<!--                       </li> -->
                    </ul>
                  </div>
                </div>
                <div class="row">
                  <!-- PRODUCT-->
                  
                  <c:forEach var="pL" items="${productList }">
                  <div class="col-lg-4 col-sm-6">
                    <div class="product text-center">
                      <div class="mb-3 position-relative">
                        <div class="badge text-white badge-"></div><a class="d-block" href='<c:url value="/product/detail?product_num=${pL.product_num}" />'><img class="img-fluid w-100" src='<c:url value="/resources/upload/${pL.product_image}" />' alt="..."></a>
                        <div class="product-overlay">
                          <ul class="mb-0 list-inline">
                            <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-dark" href='<c:url value="/admin/updateProduct?product_num=${pL.product_num}" />'>수정</a></li>
                            <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-dark" href='<c:url value="/admin/deleteProduct?product_num=${pL.product_num}" />'>삭제</a></li>                            
                          </ul>
                        </div>
                      </div>
                      <h6> <a class="reset-anchor" href='<c:url value="/product/detail?product_num=${pL.product_num}" />'>${pL.product_title}</a></h6>
                      <p class="small text-muted">${pL.product_price}</p>
                    </div>
                  </div>
                  </c:forEach>
                 
                
                 
                <!-- PAGINATION-->
                <nav aria-label="Page navigation example">
                  <ul class="pagination justify-content-center justify-content-lg-end"> 
                  <c:if test="${pb.startPage > pb.pageBlock }">
                    <li class="page-item"><a class="page-link" href='<c:url value="/product/shop?pageNum=${pb.startPage-pb.pageBlock}" />' aria-label="Previous"><span aria-hidden="true">«</span></a></li>
				</c:if>
				
				
						<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage}" step="1">
							 <li class="page-item active"><a class="page-link" href='<c:url value="/product/shop?pageNum=${i}" />'>${i}</a></li>
						</c:forEach>
						
						
						<c:if test="${pb.endPage < pb.pageCount }">
                    		<li class="page-item"><a class="page-link" href='<c:url value="/product/shop?pageNum=${pb.startPage+pb.pageBlock}" />' aria-label="Next"><span aria-hidden="true">»</span></a></li>
						</c:if>
                 
                 
              
                  </ul>
                </nav>
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
      <!-- Nouislider Config-->
      
      <script>
        var range = document.getElementById('range');
        noUiSlider.create(range, {
           
        
        	range: {
                'min': 0,
                'max': 150
            },
            step: 0.50,
            start: [0, 40],
            margin: 0,
            connect: true,
            direction: 'ltr',
            orientation: 'horizontal',
            behaviour: 'tap-drag',
            tooltips: true,
            
            
        });
        var inputLower=document.getElementById('lower');
        inputUpper=document.getElementById('upper');
        
        range.noUiSlider.on('update',function (values,handle){
        	if(handle){
        		
        	inputUpper.value=values[handle];
        	}else{
        		inputLower.value=values[handle];
        	}
        });
        
        inputUpper.addEventListener('change',function(){
        	range.noUiSlider.set([null,this.value]);
        });
        inputLower.addEventListener('change',function(){
        	range.noUiSlider.set([null,this.value]);
        });
        
        function formChange(obj)
    	{
    		//alert("함수호출확인");
    		
    		
    		obj.submit(); //obj자체가 form이다.
    		//『폼객체.submit();』 함수의 호출을 통해
    		//form 객체의 데이터를 서버로 전송하는 것이 가능하다.
    		
    		
    	}
        
        
		$(document).ready(function(){
			var form=document.category;
		
			formSubmit = function(categoryName){
				form.category1.value=categoryName;
				form.action='<c:url value="/product/shop" />';
				form.method="get";
				form.submit();
			}
		})
		
        
        
      </script>
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
