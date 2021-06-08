<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Boutique | Ecommerce bootstrap template</title>
    <script src="../script/jquery-3.6.0.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function () {
		$('#reviews-tab').click(function () {
// 			alert("실행됨");
			$.getJSON('<c:url value="/detail/ajax" />',function(rdata){
				$.each(rdata,function(index,item){
 					nowdate=new Date(item.review_board_date);
 					date_str = nowdate.getFullYear() + ". " + (nowdate.getMonth() + 1) + ". " + nowdate.getDate();
 					$('table').append("<tr><th scope='row'>" + item.member_id + "</th><td>"
 							+ date_str + "</td><td>" + item.review_board_content + "</td></tr>");
 					
// 					$('table').append("<tr><td>" + item.member_id + "</td><td>" 
//  							+ date_str + "</td><td>" + item.review_board_content + "</td></tr>");
				});
			});
			$(this).unbind();
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
    <link rel="stylesheet" href='<c:url value="/resources/css/custom.css" />'>
    
   
  </head>
  <body>
    <div class="page-holder bg-light">
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
                <div class="col-lg-6 p-lg-0"><a class="product-view d-block h-100 bg-cover bg-center" style="background: url(img/product-5.jpg)" href="img/product-5.jpg" data-lightbox="productview" title="Red digital smartwatch"></a><a class="d-none" href="img/product-5-alt-1.jpg" title="Red digital smartwatch" data-lightbox="productview"></a></div>
                <div class="col-lg-6">
                  <button class="close p-4" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                  <div class="p-5 my-md-4">
                    <h2 class="h4">${pb.product_title}</h2> 
                    <p class="text-muted">${pb.product_price}$</p>
                    <div class="row align-items-stretch mb-4">
                      <div class="col-sm-7 pr-sm-0">
                        <div class="border d-flex align-items-center justify-content-between py-1 px-3"><span class="small text-uppercase text-gray mr-4 no-select">Quantity</span>
<!--                             카트 수량 -->
						<form action='<c:url value="/product/cart" />' method="get"><input type="hidden" name="product_num" value="${pb.product_num}" >
                          <div class="quantity">
                            <button type="button" class="dec-btn p-0"><i class="fas fa-caret-left"></i></button>
                            <input name="cart_count" class="form-control border-0 shadow-0 p-0" type="text" value="1" readonly="readonly" > 
                            <button type="button" class="inc-btn p-0"><i class="fas fa-caret-right"></i></button>
                          </div>
                        </div>
                      </div>
<%--                       '<c:url value="/product/cart?product_num=${pL.product_num}cart_count=?" />' --%>
                      <div class="col-sm-5 pl-sm-0"> <button type="submit" class="btn btn-dark btn-sm btn-block h-100 d-flex align-items-center justify-content-center px-0" name="cartgo"> Add to cart </button></div>
                      </form>
                          
                    </div><a class="btn btn-link text-dark p-0" href="#"><i class="far fa-heart mr-2"></i>Add to wish list</a>
                          </div>
                        </div>
                      </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <section class="py-5">
        <div class="container">
          <div class="row mb-5">
            <div class="col-lg-6">
              <!-- PRODUCT SLIDER-->
              <div class="row m-sm-0">
                <div class="col-sm-2 p-sm-0 order-2 order-sm-1 mt-2 mt-sm-0">
                  <div class="owl-thumbs d-flex flex-row flex-sm-column" data-slider-id="1">
                    <div class="owl-thumb-item flex-fill mb-2 mr-2 mr-sm-0"><img class="w-100" src='<c:url value="/resources/upload/${pb.product_image}" />' alt="..."></div>
                    <div class="owl-thumb-item flex-fill mb-2 mr-2 mr-sm-0"><img class="w-100" src='<c:url value="/resources/upload/${pb.product_detail_img2}" />' alt="..."></div>
                    <div class="owl-thumb-item flex-fill mb-2 mr-2 mr-sm-0"><img class="w-100" src='<c:url value="/resources/upload/${pb.product_detail_img3}" />' alt="..."></div>
                    <div class="owl-thumb-item flex-fill mb-2"><img class="w-100" src='<c:url value="/resources/upload/${pb.product_detail_img4}" />' alt="..."></div>
                  </div>
                </div>
                <div class="col-sm-10 order-1 order-sm-2">
                  <div class="owl-carousel product-slider" data-slider-id="1">
                  <a class="d-block" href='<c:url value="/resources/upload/${pb.product_image}" />' data-lightbox="product" title="Product item 1">
                  <img class="img-fluid" src='<c:url value="/resources/upload/${pb.product_image}" />' alt="..."></a>
                  <a class="d-block" href='<c:url value="/resources/upload/${pb.product_detail_img2}" />' data-lightbox="product" title="Product item 2">
                  <img class="img-fluid" src='<c:url value="/resources/upload/${pb.product_detail_img2}" />' alt="..."></a>
                  <a class="d-block" href='<c:url value="/resources/upload/${pb.product_detail_img3}" />' data-lightbox="product" title="Product item 3">
                  <img class="img-fluid" src='<c:url value="/resources/upload/${pb.product_detail_img3}" />' alt="..."></a>
                  <a class="d-block" href='<c:url value="/resources/upload/${pb.product_detail_img4}" />' data-lightbox="product" title="Product item 4">
                  <img class="img-fluid" src='<c:url value="/resources/upload/${pb.product_detail_img4}" />' alt="..."></a></div>
                </div>
              </div>
            </div>
            <!-- PRODUCT DETAILS-->
            <div class="col-lg-6">
              <h1>${pb.product_title}</h1> <!-- subject -->
              <p class="text-muted lead">${pb.product_price}$</p> <!-- price -->
              <div class="row align-items-stretch mb-4">
                      <div class="col-sm-7 pr-sm-0">
                        <div class="border d-flex align-items-center justify-content-between py-1 px-3"><span class="small text-uppercase text-gray mr-4 no-select">Quantity</span>
<!--                             카트 수량 -->
						<form action='<c:url value="/product/cart" />' method="get"><input type="hidden" name="product_num" value="${pb.product_num}" >
                          <div class="quantity">
                            <button type="button" class="dec-btn p-0"><i class="fas fa-caret-left"></i></button>
                            <input name="cart_count" class="form-control border-0 shadow-0 p-0" type="text" value="1" readonly="readonly" > 
                            <button type="button" class="inc-btn p-0"><i class="fas fa-caret-right"></i></button>
                          </div>
                        </div>
                      </div>
<%--                       '<c:url value="/product/cart?product_num=${pL.product_num}cart_count=?" />' --%>
                      <div class="col-sm-5 pl-sm-0"> <button type="submit" class="btn btn-dark btn-sm btn-block h-100 d-flex align-items-center justify-content-center px-0" > Add to cart </button></div>
                      
                    </div>

                <select class="opt" onchange="categoryChange(this)" name="product_size" id="product_size" >
					<option disabled selected>사이즈를 선택해주세요</option>
					<option value="size-S">size-Small</option>
					<option value="size-M">size-Medium</option>
					<option value="size-L">size-Large</option>
					
				</select>
				<br>
				
					<div id='result'></div>
					<br>
					</form>
				<!-- 제이쿼리를 사용하여 색상과 사이즈가 일치하는 정보를 화면에 띄우기 -->
              <!-- 추천 기능 -->
		<div><b>찜목록 추가하기</b>
			<c:choose>
					<c:when test="${wishCheck == 1 }">
					
						<input type="image"   src='<c:url value="/resources/img/heart.png" />'  
						class="heart" value="${pb.product_num }" width="30" height="30">
					</c:when>
					<c:otherwise>
						
						<input type="image"   src='<c:url value="/resources/img/heart_empty.png" />'  
						class="heart" value="${pb.product_num }" width="30" height="30">
					</c:otherwise>
				</c:choose>	
		</div><br> <!-- wish -->
		    </div>
          </div>
          <!-- DETAILS TABS-->
          <ul class="nav nav-tabs border-0" id="myTab" role="tablist">
            <li class="nav-item"><a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">Description</a></li>
            <li class="nav-item"><a class="nav-link" id="reviews-tab" data-toggle="tab" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false">Reviews</a></li>
          </ul>
          <div class="tab-content mb-5" id="myTabContent">
            <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
              <div class="p-4 p-lg-5 bg-white">
                <h6 class="text-uppercase">제품 상세설명 </h6>
                <p class="text-muted text-small mb-0">${pb.product_detail_text}</p>
              </div>
            </div>
            <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
              <div class="p-4 p-lg-5 bg-white">             
              	<!-- 후기(review) -->
						
						
						<table class="type07">
							  <thead>
							  <tr>
							    <th scope="cols">ID</th>
							    <th scope="cols">DATE</th>
							    <th scope="cols">REVIEW</th>
							  </tr>		
							  </thead>
<!-- 							  <tbody>					  							   -->
<!-- 							  <tr> -->
<!-- 							    <th scope="row"></th> -->
<!-- 							    <td></td> -->
<!-- 							    <td></td> -->
<!-- 							  </tr>							 						    -->
<!-- 							  </tbody> -->
							</table>
						
<!-- 					<table> -->
						
<!-- 						<tr><td></td><td></td> -->
						
<!-- 						<td></td></tr> -->
						
<!-- 						</table> -->          	 			
					<hr>
                <div class="row">
                  <div class="col-lg-8">
                   <div id="reply">

					 <c:if test="${empty sessionScope.id}">
					  <p>소감을 남기시려면 <a href='<c:url value="/member/login" />'>로그인</a>해주세요</p>
					 </c:if>
					 
					 <c:if test="${!empty sessionScope.id}">
					 <section class="replyForm">
					  <form method="post" action='<c:url value="/product/review" />'>
					  <input type="hidden" name="product_num" value="${pb.product_num}">
					   <div class="input_area">
					    <textarea name="repCon" id="repCon"></textarea>
					   </div>
					   
					   <div class="input_area">
					    <button type="submit" id="reply_btn">후기 남기기</button>
					   </div>
					  	
					  </form>
					 </section>
					 </c:if>					
					</div>
                </div>
              </div>
            </div>
          </div>
          <!-- RELATED PRODUCTS-->
          <h2 class="h5 text-uppercase mb-4">관련 상품</h2>
          <div class="row">
            <!-- PRODUCT-->
            <div class="col-lg-3 col-sm-6">
              <div class="product text-center skel-loader">
                <div class="d-block mb-3 position-relative"><a class="d-block" href='<c:url value="/product/detail" />'><img class="img-fluid w-100" src='<c:url value="/resources/img/product-1.jpg" />' alt="..."></a>
                  <div class="product-overlay">
                    <ul class="mb-0 list-inline">
                      <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-outline-dark" href="#"><i class="far fa-heart"></i></a></li>
                      <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-dark" href="#">Add to cart</a></li>
                      <li class="list-inline-item mr-0"><a class="btn btn-sm btn-outline-dark" href="#productView" data-toggle="modal"><i class="fas fa-expand"></i></a></li>
                    </ul>
                  </div>
                </div>
                <h6> <a class="reset-anchor" href='<c:url value="/product/detail" />'>Kui Ye Chen’s AirPods</a></h6>
                <p class="small text-muted">$250</p>
              </div>
            </div>
            <!-- PRODUCT-->
            <div class="col-lg-3 col-sm-6">
              <div class="product text-center skel-loader">
                <div class="d-block mb-3 position-relative"><a class="d-block" href='<c:url value="/product/detail" />'><img class="img-fluid w-100" src='<c:url value="/resources/img/product-2.jpg" />' alt="..."></a>
                  <div class="product-overlay">
                    <ul class="mb-0 list-inline">
                      <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-outline-dark" href="#"><i class="far fa-heart"></i></a></li>
                      <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-dark" href="#">Add to cart</a></li>
                      <li class="list-inline-item mr-0"><a class="btn btn-sm btn-outline-dark" href="#productView" data-toggle="modal"><i class="fas fa-expand"></i></a></li>
                    </ul>
                  </div>
                </div>
                <h6> <a class="reset-anchor" href='<c:url value="/product/detail" />'>Air Jordan 12 gym red</a></h6>
                <p class="small text-muted">$300</p>
              </div>
            </div>
            <!-- PRODUCT-->
            <div class="col-lg-3 col-sm-6">
              <div class="product text-center skel-loader">
                <div class="d-block mb-3 position-relative"><a class="d-block" href='<c:url value="/product/detail" />'><img class="img-fluid w-100" src='<c:url value="/resources/img/product-3.jpg" />' alt="..."></a>
                  <div class="product-overlay">
                    <ul class="mb-0 list-inline">
                      <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-outline-dark" href="#"><i class="far fa-heart"></i></a></li>
                      <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-dark" href="#">Add to cart</a></li>
                      <li class="list-inline-item mr-0"><a class="btn btn-sm btn-outline-dark" href="#productView" data-toggle="modal"><i class="fas fa-expand"></i></a></li>
                    </ul>
                  </div>
                </div>
                <h6> <a class="reset-anchor" href='<c:url value="/product/detail" />'>Cyan cotton t-shirt</a></h6>
                <p class="small text-muted">$25</p>
              </div>
            </div>
            <!-- PRODUCT-->
            <div class="col-lg-3 col-sm-6">
              <div class="product text-center skel-loader">
                <div class="d-block mb-3 position-relative"><a class="d-block" href='<c:url value="/product/detail" />'><img class="img-fluid w-100" src='<c:url value="/resources/img/product-4.jpg" />' alt="..."></a>
                  <div class="product-overlay">
                    <ul class="mb-0 list-inline">
                      <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-outline-dark" href="#"><i class="far fa-heart"></i></a></li>
                      <li class="list-inline-item m-0 p-0"><a class="btn btn-sm btn-dark" href="#">Add to cart</a></li>
                      <li class="list-inline-item mr-0"><a class="btn btn-sm btn-outline-dark" href="#productView" data-toggle="modal"><i class="fas fa-expand"></i></a></li>
                    </ul>
                  </div>
                </div>
                <h6> <a class="reset-anchor" href='<c:url value="/product/detail" />'>Timex Unisex Originals</a></h6>
                <p class="small text-muted">$351</p>
              </div>
            </div>
          </div>
        </div>
      </section>
      
	<!-- Footer start -->
	<c:import url="/resources/inc/footer.jsp" />
	<!-- Footer end -->
	
      <!-- JavaScript files-->
      <script src='<c:url value="/resources/vendor/jquery/jquery.min.js"/>'></script>
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
      <script type="text/javascript">
      
     /*  function categoryChange(e) {
      	
      	var good_a = ["RED-SMALL", "RED-MEDIUM", "RED-LARGE"];
      	var good_b = ["GREEN-SMALL", "GREEN-MEDIUM", "GREEN-LARGE"];
      	var good_c = ["BLUE-SMALL", "BLUE-MEDIUM", "BLUE-LARGE"];
      	var target = document.getElementById("good");

      	if(e.value == "a") var d = good_a;
      	else if(e.value == "b") var d = good_b;
      	else if(e.value == "c") var d = good_c;

      	target.options.length = 0;

      	for (x in d) {
      		var opt = document.createElement("option");
      		opt.value = d[x];
      		opt.innerHTML = d[x];
      		target.appendChild(opt);
      	}	
      }
      
      function ch(e) {
    	  // 선택된 데이터 가져오기
    	  const value = e.value;
    	  
    	  // 데이터 출력
    	  document.getElementById('result').innerText
    	    = value;
    	} */
      </script>
      <script type="text/javascript">
      	$(document).ready(function () {
			$('.wbtn2').click(function () {
				var num = 0;
				num++;
				if(num == 1){
					
				}else {
					alert("취소되었습니다.");
					num = 0;
				}
			});
		});
      </script>
      <script type="text/javascript">

	$(document).ready(function(){
		
		// heart 클릭 
		 $('.heart').click(function() {
			 
			 $.ajax('<c:url value="/wish/ajax" />',{
					data : {product_num : $(this).val()},
					success : function(returnData){
						if(returnData == "-1"){
							
							if (confirm("로그인이 필요한 서비스 입니다 로그인 하시겠습니까?") == true){//확인
		 						// 비밀번호 일치 여부를 확인 하여 일치하면 삭제, 일치하지 않으면 다시 돌아오기 
		 						location.href='<c:url value="/member/login" />';
		 					}else{//취소
		 						return false;
		 					}
							
						}else if(returnData == "0") { // 삭제처리
// 							alert("삭제처리 됨 ");
							
						}else {  // 삽입 처리
// 							alert("삽입 처리 됨 ");
						}
						
					}
					
				});
				
				var src = $(this).attr( 'src' );
// 				alert(src);
				if (src == "/seven/resources/img/heart.png"){
					$(this).attr('src','<c:url value="/resources/img/heart_empty.png" />');// 비어있는 하트 (기본값 default)
				} else {
					$(this).attr('src','<c:url value="/resources/img/heart.png" />'); // 빨간 하트 
				}
				

		 }); // $('.heart').click(function(){}); 
		 
		 
	}); // $(document).ready(function(){})

</script>
      <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    </div>
  </body>
</html>