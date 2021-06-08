package com.seven.controller;

import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seven.domain.CartBean;
import com.seven.domain.MemberBean;
import com.seven.domain.OrdersBean;
import com.seven.domain.ProductBean;
import com.seven.service.CartService;
import com.seven.service.MemberService;
import com.seven.service.OrdersService;

@Controller
public class OrdersController{
	
//	+-----------------+--------------+
//	| Field           | Type         |
//	+-----------------+--------------+
//	| member_id       | varchar(45)  |
//	| member_pass     | varchar(45)  |
//	| member_name     | varchar(100) |
//	| member_email    | varchar(100) |
//	| member_address  | varchar(200) |
//	| member_zipcode  | int(11)      |
//	| member_address2 | varchar(100) |
//	| member_phone    | varchar(45)  |
//	| member_birth    | date         |
//	| member_joindate | date         |
//	+-----------------+--------------+
	
	@Inject
	private OrdersService ordersService;
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private CartService cartService;
	
	
	
	//----------- 구매 내역 관련 페이지 -----------
	
	
	
	
	
	@RequestMapping(value = "/product/checkoutList", method = RequestMethod.GET)
	public String checkout(HttpSession session,Model model) {
		
		String id=(String)session.getAttribute("id");
		MemberBean mb = memberService.getMember(id);
		
//		
				
				List<CartBean> cbList=cartService.getCartList(id);
				List<ProductBean> pbList = cartService.getProductList(id);
				
				
				model.addAttribute("pbList",pbList);
				model.addAttribute("cbList",cbList);
				model.addAttribute("mb",mb);
				
				
				float total= 0;
				for(int i = 0; i < cbList.size(); i++) {
					CartBean cb=cbList.get(i);
					total =total+(cb.getCart_count()*cb.getProduct_price());
					
				}
				model.addAttribute("total",total);
				
				return "product/checkoutForm";
				// 가상주소 / 으로 이동 → HomeController에 의해 home.jsp 페이지로 이동
		
		
	}
		
	@RequestMapping(value = "/product/order",method = RequestMethod.POST)
	public String oder(OrdersBean ob,HttpSession session,HttpServletRequest request) {
		
		String id=(String)session.getAttribute("id");				
		ob.setMember_id(id);
		
		ob.setOrders_date(new Timestamp(System.currentTimeMillis()));			
		System.out.println(request.getParameter("sample6_address"));	
		ob.setOrders_address(request.getParameter("sample6_address")+" "+request.getParameter("sample6_detailAddress") +" " + request.getParameter("sample6_postcode"));
		ob.setOrders_payment(request.getParameter("orders_payment"));
		
		ob.setOrders_size(request.getParameter("product_size"));
		
		System.out.println(ob.getOrders_payment());
		int subNum = 0;
		 
		 for(int i = 1; i <= 10; i ++) {
		  subNum += (int)(Math.random() * 10);
		 }
		 
		 ob.setOrders_num2(subNum);
		 ob.setOrders_status("processing");	 
		 	
	 	List<CartBean> cbList=cartService.getCartList(id);

		for(int i = 0; i < cbList.size(); i++) {
			CartBean cb=cbList.get(i);
			
			ob.setOrders_count(cb.getCart_count());
			ob.setProduct_num(cb.getProduct_num());
			
			
			
			 ordersService.insertOrders(ob);
		}		 
		 	System.out.println("삭제");
		 	CartBean cb = new CartBean();
		 	cb.setMember_id(id);
		 	
			cartService.cartAllDelete(cb);

			 
		
		return "mypage/mypage";
	
	
	}

	
		
	
//	@RequestMapping(value = "/product/delete",method = RequestMethod.GET)
//		public String deleteProduct(OrdersBean ob,HttpSession session) {
//				
//				String id=(String)session.getAttribute("id");
//				ob.setMember_id(id);
//				ordersService.deleteOrders(ob);
//				
//				return "redirect:/product/checkoutList";
//			
//				
//		}

		
	/*
	 * @RequestMapping(value = "/product/checkoutForm", method = RequestMethod.GET)
	 * public String checkout2(HttpSession session,Model model, HttpServletRequest
	 * request,OrdersBean ob) {
	 * 
	 * String id=(String)session.getAttribute("id"); ob.setOrders_count(1);
	 * ob.setMember_id(id); ob.setOrders_date(new
	 * Timestamp(System.currentTimeMillis())); ordersService.insertOrders(ob);
	 * System.out.println("dd");
	 * 
	 * System.out.println(id);
	 * 
	 * 
	 * return "redirect:/product/checkoutList"; }
	 */
	// deletePro
		
	
	@RequestMapping(value = "/product/delete",method = RequestMethod.GET)
		public String deleteProduct(OrdersBean ob,HttpSession session) {
				
				String id=(String)session.getAttribute("id");
				ob.setMember_id(id);
				ordersService.deleteOrders(ob);
				
				return "redirect:/product/checkoutList";
			
				
		}
	
	
	//----------- 구매 내역 관련 페이지 -----------
	
	@RequestMapping(value = "/order/cancel",method = RequestMethod.GET )
	public String cancle(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("============cancel()  시작!-==================");
		int orders_num2 = Integer.parseInt(request.getParameter("orders_num2"));
		String id = (String) session.getAttribute("id");

		// 기준키 필
		OrdersBean orderBean = new OrdersBean();
		orderBean.setOrders_status("calceled"); // cancel 로 파라미터 다르게전달
		orderBean.setOrders_num2(orders_num2);
		orderBean.setMember_id(id);

		ordersService.updateStatus(orderBean);
		// 이 기능은 단순 DB 구현으로 주문내역 취소 시 결제 내역 환불하는 코드는 따로 구현 하여
		return "mypage/mypage"; // mypage.jsp 로 이동
	}
	
	//----------- 구매 내역 관련 페이지 -----------
	
	
}
	
