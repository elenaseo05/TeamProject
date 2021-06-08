package com.seven.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seven.domain.MemberBean;
import com.seven.domain.OrdersBean;
import com.seven.domain.ProductBean;
import com.seven.service.MemberService;
import com.seven.service.OrdersService;
import com.seven.service.WishService;

@Controller
public class MypageController {
	
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


	// 주소 맵핑!/ pagebean 파일 복사 
	@Inject
	private MemberService memberService;
	
	@Inject
	private WishService wishService;
	
	@Inject
	private OrdersService ordersService;
	
	
	
	
	//----------- 구매 내역 관련 페이지 -----------
	// main
	@RequestMapping(value = "/mypage",method = RequestMethod.GET )
	public String history(HttpServletRequest request, Model model, HttpSession session) {
		
		String member_id =(String)session.getAttribute("id"); // 세션 생성
		
		MemberBean mb = memberService.getMember(member_id); // 디비에서 정보 들고 오기
		List<OrdersBean> orderList = ordersService.getOrderList(member_id); // 디비에서 정보 들고 오기 
		List<ProductBean> proList = ordersService.getProductOrderList(member_id);
		
		model.addAttribute("mb", mb); // 데이터 이동 
		model.addAttribute("orderList", orderList); // 데이터 이동 
		model.addAttribute("proList", proList); // 데이터 이동 
		
		return "mypage/mypage"; // mypage.jsp 로 이동
	}
	//----------- 구매 내역 관련 페이지 -----------

	
	//----------- 회원 정보 수정 페이지 관련 -----------
	//updateCheck
	@RequestMapping(value = "/mypage/update",method = RequestMethod.GET )
	public String updateCheck(HttpSession session, Model model) {
		
		String id =(String)session.getAttribute("id"); // 세션 들고오
		MemberBean mb = memberService.getMember(id); // 디비에서 정보 들고 오기
		model.addAttribute("mb", mb); // 데이터를 updateForm 으로 이동 
		
		return "mypage/updateCheck";
		
	}
	
	//update
	@RequestMapping(value = "/mypage/updatefin",method = RequestMethod.POST )
	public String update(HttpServletRequest request, Model model, MemberBean mb) {
		
		String id = request.getParameter("member_id");
		
		MemberBean mb2 = memberService.userCheck(mb);

		if(mb2 == null) {
	
			model.addAttribute("error", "PASSWORD DOES NOT MATCH");
			
			return "member/error"; 
			
		} else {
			
			MemberBean mb3 = memberService.getMember(id);
			model.addAttribute("mb", mb3); // 데이터를 updateForm 으로 이동 
			
			return "mypage/updateForm";
		}
		
		
	}
	
	//updatePro
	@RequestMapping(value = "/mypage/updatePro",method = RequestMethod.POST)
	public String updatePro(MemberBean mb) {

		memberService.updateMember(mb);
		
		return "redirect:/mypage";
	}
	
	// deletePro
	@RequestMapping(value = "/mypage/deletePro",method = RequestMethod.POST)
	public String deleteProString(MemberBean mb, HttpSession session, Model model) {
	
		MemberBean mb2 = memberService.userCheck(mb);
		
		if(mb2 != null) { // 일치
			memberService.deleteMember(mb);
			session.invalidate();
			model.addAttribute("bye", "GOOD BYE!");
			return "mypage/bye";
		} else {
			model.addAttribute("error", "CHECK YOUR PASSWORD ");
			return "member/error"; 
		}
			
	}
	//----------- 회원 정보 수정 페이지 관련 -----------
	

	//----------- wish 페이지 -----------
	// wishList 

	
	@RequestMapping(value = "/mypage/wish", method = RequestMethod.GET)
	public String wishList(HttpSession session, Model model) {
		
		String member_id =(String)session.getAttribute("id"); // 세션 생성
		
		List<ProductBean> proList = wishService.getWishProductList(member_id); // 디비에서 정보 들고 오기 
		
		model.addAttribute("proList", proList); // 데이터 이동 
		
		
		MemberBean mb = memberService.getMember(member_id); // 디비에서 정보 들고 오기
		
		model.addAttribute("mb", mb); // 데이터 이동 
		return "mypage/wish";
		
	}
	
	//----------- wish 페이지  -----------
	
	
	
	
}
