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
    		$('#submit').click(function(){
  			alert($('#orderame' + "님 주문 완료!").val());
				if($('#orderame').val()==""){
					alert("이름을 입력하세요");
					$('#orderame').focus();
					return false;
				}else if($('#email').val()==""){
					alert("이메일을 입력하세요");
					$('#email').focus();
					return false;
				}else if($('#phone').val()==""){
					alert("전화번호를 입력하세요");
					$('#phone').focus();
					return false;
				}else if($('#sample6_postcode').val()==""){
					alert("주소를 입력하세요");
					$('#sample6_postcode').focus();
					return false;
				}
    		});
    	});
    
    </script>
    
     <script type="text/javascript">
    $(document).ready(function(){
    	
    	$('.btn btn-dark btn-rgt').click(function(){
    		var ordername = $('#ordername').val();
    		var sample6_postcode = $('#sample6_postcode').val();
    		var sample6_address = $('#sample6_address').val();
    		var sample6_detailAddress = $('#sample6_postcode').val();
    		var sample6_extraAddress = $('#sample6_extraAddress').val();
    		
    		location.href="${pageContext.request.contextPath}/product/order?orders_name" + ordername +"&orders_address=" +sample6_addressd;
    		
    		
    		
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
  .btn-rgt {float: right;}
  
  </style>      
  
   <style type="text/css">
   .empt {color: #ccc;
   font-size: 28px;
   font-weight: normal;
   text-align: center;}
  
  
  
  </style> 
  <script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
</script>
        
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
                    <h2 class="h4">Red digital smartwatch</h2>
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
                      </div>
                      <div class="col-sm-5 pl-sm-0"><a class="btn btn-dark btn-sm btn-block h-100 d-flex align-items-center justify-content-center px-0" href='<c:url value="/product/cart" />'>Add to cart</a></div>
                    </div><a class="btn btn-link text-dark p-0" href="#"><i class="far fa-heart mr-2"></i>Add to wish list</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="container" style="position: relative;">
        <!-- HERO SECTION-->
        <section class="py-5 bg-light">
          <div class="container">
            <div class="row px-4 px-lg-5 py-lg-4 align-items-center">
              <div class="col-lg-6">
                <h1 class="h2 text-uppercase mb-0">Checkout</h1>
              </div>
              <div class="col-lg-6 text-lg-right">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb justify-content-lg-end mb-0 px-0">
                    <li class="breadcrumb-item"><a href='<c:url value="/" />'>Home</a></li>
                    <li class="breadcrumb-item"><a href='<c:url value="/product/cart" />'>Cart</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                  </ol>
                </nav>
              </div>
            </div>
          </div>
        </section>
        <section class="py-5">
        
        </section>
         <!-- BILLING ADDRESS-->
         <h2 class="h5 text-uppercase mb-4">Billing details</h2>
         <div class="row">
           <div class="col-lg-8">
             <form action='<c:url value="/product/order"/>' method="post">
               <div class="row">
                 <div class="col-lg-6 form-group">
                   <label class="text-small text-uppercase" for="name" >*Name</label><br>
                   <input class="form-control form-control-lg" name="orders_name" id="orderame" value="${mb.member_name}" type="text"  placeholder="Name" style="width: 300px;">
                 </div>
<!--                   <div class="col-lg-6 form-group"> -->
<!--                     <label class="text-small text-uppercase" for="lastName">Last name</label> -->
<!--                     <input class="form-control form-control-lg" id="lastName" type="text" placeholder="Enter your last name"> -->
<!--                   </div> -->
                 <div class="col-lg-6 form-group">
                   <label class="text-small text-uppercase" for="email">*Email address</label>
                   <input class="form-control form-control-lg" id="email" type="email" value="${mb.member_email}" placeholder="Email" style="width: 300px;">
                 </div>
                 <div class="col-lg-6 form-group">
                   <label class="text-small text-uppercase" for="phone">*Phone number</label>
                   <input class="form-control form-control-lg" id="phone" type="tel" value="${mb.member_phone}" placeholder="Phone" style="width: 300px;">
                 </div>
                 <div class="col-lg-6 form-group">
                   <label class="text-small text-uppercase" for="company">Company name (optional)</label>
                   <input class="form-control form-control-lg" id="company" type="text" placeholder="Your company name" style="width: 300px;">
                 </div>
                 <!-- <div class="col-lg-6 form-group">
                   <label class="text-small text-uppercase" for="country">Country</label>
                   <select class="selectpicker country" id="country" data-width="fit" data-style="form-control form-control-lg" data-title="Select your country"></select>
                 </div> -->
                 <div class="col-lg-12 form-group">
                 
<!--                     <label class="text-small text-uppercase" for="address" >*Address line 1</label> -->
<!--                     <input class="form-control form-control-lg" id="sample6_postcode" type="text" placeholder="House number and street name" style="width:500px !important;" > -->
<!--                     <button class="btn btn-dark" type="button" value="Zip Code Search" onclick="sample6_execDaumPostcode()">Zip Code Search</button> -->
                   
                   
					
                   <input type="text" name="sample6_postcode" id="sample6_postcode" value="${mb.member_zipcode}" placeholder="Postal Code" class="form-control form-control-lg" style="display: inline-block;width:200px !important;"><input type="button" class="btn btn-dark" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="margin-left: 10px; margin-bottom: 5px;"><br>
					<input type="text" name="sample6_address" id="sample6_address" value="${mb.member_address}" placeholder="Address Line 1" class="form-control form-control-lg" style="margin-top: 10px; margin-bottom: 12px; width: 500px;"><br>
					<input type="text" name="sample6_detailAddress" id="sample6_detailAddress" value="${mb.member_address2}" placeholder="Address Line 2" class="form-control form-control-lg" style="display: inline-block; width:300px !important;">
					<input type="text" name="sample6_extraAddress" id="sample6_extraAddress" placeholder="See Also" class="form-control form-control-lg" style="display: inline-block; width:192px !important; margin-left: 5px;">                 
                 </div>
				
				
				<div class="col-lg-6 form-group">
				<h3>구매목록</h3>
				
				
				
				 <div class="table-responsive1 mb-4">
				 <table class="table" style="width:750px;">
				 <thead class="bg-light">
				  <tr>
				   <th class="border-0" scope="col"> <strong class="text-small text-uppercase">product</strong></th>
				  <th class="border-0" scope="col" style="width: -5px !important;"> <strong class="text-small text-uppercase">Count</strong></th>
				  <th class="border-0" scope="col"> <strong class="text-small text-uppercase">Total</strong></th>
				  <th class="border-0" scope="col"> <strong class="text-small text-uppercase">delete</strong></th>
				  </tr>
				  </thead>
				  <tbody>
				 
				 <c:forEach var="cb" items="${cbList }">
                    <tr>
                      <th class="pl-0 border-0" scope="row">
                        <div class="media align-items-center"><a class="reset-anchor d-block animsition-link" href='<c:url value="/product/detail" />'><img src='<c:url value="/resources/upload/${cb. product_image }" />' alt="..." width="70"/></a>
                          <input type="hidden" name="product_size" id="product_size" value="${cb.product_size}">
                          <div class="media-body ml-3"><strong class="h6"><a class="reset-anchor animsition-link" href='<c:url value="/product/detail" />'>${cb.product_title }(${ cb.product_size})</a></strong></div>
                        </div>
                      </th>
<!--                       <td class="align-middle border-0"> -->
<%--                         <p class="mb-0 small">${cb.product_price }</p> --%>
<!--                       </td> -->
                       

                      <td class="align-middle border-light">
                       <div class="border d-flex" style="width:70px !important;"><span class="small text-uppercase text-gray headings-font-family"></span>
                          <div class="quantity" style="width:70px !important;">
<!--                             <button class="dec-btn"><i class="fas fa-caret-left"></i></button> -->
                            <input class="form-control form-control-sm border-0 shadow-0" type="text" value="${cb.cart_count}" readonly="readonly"/>
<!--                             <button class="inc-btn"><i class="fas fa-caret-right"></i></button> -->
                          </div>
                        </div> 
                        
                        
                        
                        
                      </td>
                      <td class="align-middle border-0">
                        <p class="mb-0 small">${cb.product_price*cb.cart_count }</p>
                      </td>
                      <td class="align-middle border-0"><a class="reset-anchor" href='<c:url value="/product/delete?product_num=${cb.product_num }"/>'><i class="fas fa-trash-alt small text-muted"></i></a></td>
                      
                    </tr>
                   </c:forEach>
                   </tbody>
				 </table>
				 </div>
				</div>
				</div>
				
				<div class="payment">
				 <input type="radio" value="card" name="orders_payment" checked="checked">카드
                   <input type="radio" value="cash" name="orders_payment">무통장입급
				</div>
<!--                   <div style="display:block; width: 100%;padding-left: 20px;"> class=" col-lg-6  form-group" -->
                    <!-- <div class="custom-control custom-checkbox">
                      <input class="custom-control-input" id="alternateAddressCheckbox" type="checkbox">
                      <label class="custom-control-label text-small" for="alternateAddressCheckbox">Alternate billing address</label>
                    </div> -->
<!--                   </div> -->
<!--                   <div class="col-lg-12"> -->
<!--                     <div class="row d-none" id="alternateAddress"> -->
<!--                       <div class="col-12 mt-4"> -->
<!--                         <h2 class="h4 text-uppercase mb-4">Alternative billing details</h2> -->
<!--                       </div> -->
<!--                       <div class="col-lg-6 form-group"> -->
<!--                         <label class="text-small text-uppercase" for="firstName2">Name</label> -->
<!--                         <input class="form-control form-control-lg" id="firstName2" type="text" placeholder="Enter your first name"> -->
<!--                       </div> -->
<!--                       <div class="col-lg-6 form-group"> -->
<!--                         <label class="text-small text-uppercase" for="lastName2">Last name</label> -->
<!--                         <input class="form-control form-control-lg" id="lastName2" type="text" placeholder="Enter your last name"> -->
<!--                       </div> -->
<!--                       <div class="col-lg-6 form-group"> -->
<!--                         <label class="text-small text-uppercase" for="email2">Email address</label> -->
<!--                         <input class="form-control form-control-lg" id="email2" type="email" placeholder="e.g. Jason@example.com"> -->
<!--                       </div> -->
<!--                       <div class="col-lg-6 form-group"> -->
<!--                         <label class="text-small text-uppercase" for="phone2">Phone number</label> -->
<!--                         <input class="form-control form-control-lg" id="phone2" type="tel" placeholder="e.g. +02 245354745"> -->
<!--                       </div> -->
<!--                       <div class="col-lg-6 form-group"> -->
<!--                         <label class="text-small text-uppercase" for="company2">Company name (optional)</label> -->
<!--                         <input class="form-control form-control-lg" id="company2" type="text" placeholder="Your company name"> -->
<!--                       </div> -->
<!--                       <div class="col-lg-6 form-group"> -->
<!--                         <label class="text-small text-uppercase" for="country2">Country</label> -->
<!--                         <select class="selectpicker country" id="country2" data-width="fit" data-style="form-control form-control-lg" data-title="Select your country"></select> -->
<!--                       </div> -->
<!--                       <div class="col-lg-12 form-group"> -->
<!--                         <label class="text-small text-uppercase" for="address2">Address line 1</label> -->
<!--                         <input class="form-control form-control-lg" id="address2" type="text" placeholder="House number and street name"> -->
<!--                       </div> -->
<!--                       <div class="col-lg-12 form-group"> -->
<!--                         <label class="text-small text-uppercase" for="address2">Address line 2</label> -->
<!--                         <input class="form-control form-control-lg" id="addressalt2" type="text" placeholder="Apartment, Suite, Unit, etc (optional)"> -->
<!--                       </div> -->
<!--                       <div class="col-lg-6 form-group"> -->
<!--                         <label class="text-small text-uppercase" for="city3">Town/City</label> -->
<!--                         <input class="form-control form-control-lg" id="city3" type="text"> -->
<!--                       </div> -->
<!--                       <div class="col-lg-6 form-group"> -->
<!--                         <label class="text-small text-uppercase" for="state4">State/County</label> -->
<!--                         <input class="form-control form-control-lg" id="state4" type="text"> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
                  <div class="col-lg-12 form-group">
 					<button class="btn btn-dark" type="button"><a href='<c:url value="/product/cartList"/>'>Back Cart</a></button>         
<%--                     <button class="btn btn-dark btn-rgt" type="submit" ><a href='<c:url value="/product/shop" />'>Place order</a></button>         --%>
                    <button class="btn btn-dark btn-rgt" type="submit" id="submit">Place order</button>        
              </form>
                  </div>
                  
                </div>
            </div>
            
            <!-- ORDER SUMMARY-->
            <div class="col-lg-4" style="display: block; position: absolute; right: 30px; top: 350px;">
              <div class="card border-0 rounded-0 p-lg-4 bg-light">
                <div class="card-body">
                  <h5 class="text-uppercase mb-4">Your order</h5>
                  <ul class="list-unstyled mb-0">
                   
                    <li class="border-bottom my-2"></li>
                    <li class="d-flex align-items-center justify-content-between"><strong class="text-uppercase small font-weight-bold">Total</strong><span>${total }</span></li>
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