package com.seven.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seven.domain.MemberBean;
import com.seven.service.MemberService;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	/*
	 * @RequestMapping
	 * value = "" ← 주소줄에 표시할 가상의 주소
	 * return ""; ← 실제 이동할 물리적 주소 ( 파일의 '이름만' 입력 )
	 * return "redirect:XXX" ← XXX라는 가상의 주소로 이동
	 * (Tip) 하이퍼링크는 모두 GET방식으로 전송됩니다
	 */
	@Autowired
    private JavaMailSender mailSender;
	
	
	@Inject
	private MemberService memberService;
	
	//		●회원가입 시작 ↓
	@RequestMapping(value = "/member/insert", method = RequestMethod.GET)
	public String insert() {		
		return "member/insertForm";
	}
	
	@RequestMapping(value = "/member/insertPro", method = RequestMethod.POST)
	public String insertPro(MemberBean mb) {
		System.out.println("확인");
		memberService.insertMember(mb);
		return "redirect:/";
	}
	//		●회원가입 끝 ↑
	
	
	//		●로그인 시작 ↓
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login() {		
		return "member/loginForm";
	}
	
	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberBean mb, HttpSession session, Model model) {
		System.out.println("잘되나");
		MemberBean mb2 = memberService.userCheck(mb);
		// userCheck의 결과를 mb2에 담아서 결과가 있으면 ( =ID&PASS가 일치하면 ) 세션 ID 부여 후 home.jsp로 이동
		if(mb2 != null) {
			session.setAttribute("id", mb.getMember_id());
			return "redirect:/";
			// 가상주소 / 으로 이동 → HomeController에 의해 home.jsp 페이지로 이동
		}else {
			model.addAttribute("error", "입력하신 정보가 일치하지 않습니다");
			return "member/error";
		}
	}	
	//		●로그인 끝 ↑
	
	
	//		●로그아웃 시작 ↓
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	//		●로그아웃 끝 ↑
	
	
	//		●회원정보수정 시작 ↓ mypage myInfo.jsp
	@RequestMapping(value = "/member/update", method = RequestMethod.GET)
	public String update(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		MemberBean mb = memberService.getMember(id);
		model.addAttribute("mb", mb);
		return "member/updateForm";
	}
	
	@RequestMapping(value = "/member/updatePro", method = RequestMethod.POST)
	public String updatePro(MemberBean mb, Model model) {
		
		MemberBean mb2 = memberService.userCheck(mb);
		// userCheck의 결과를 mb2에 담아서 결과가 있으면 ( =ID&PASS가 일치하면 )
		if(mb2 != null) {
			memberService.updateMember(mb);
			return "redirect:/";
			// 가상주소 / 으로 이동 → HomeController에 의해 home.jsp 페이지로 이동
		}else {
			model.addAttribute("error", "입력하신 정보가 일치하지 않습니다");
			return "member/error";
		}
	}
	//		●회원정보수정 끝 ↑
	
	
	//		●회원정보삭제 시작 ↓
	@RequestMapping(value = "/member/delete", method = RequestMethod.GET)
	public String delete() {
		return "member/deleteForm";
	}
	
	@RequestMapping(value = "/member/deletePro", method = RequestMethod.POST)
	public String deletePro(MemberBean mb, Model model) {
		
		MemberBean mb2 = memberService.userCheck(mb);
		// userCheck의 결과를 mb2에 담아서 결과가 있으면 ( =ID&PASS가 일치하면 )
		if(mb2 != null) {
			memberService.deleteMember(mb);
			return "redirect:/";
			// 가상주소 / 으로 이동 → HomeController에 의해 home.jsp 페이지로 이동
		}else {
			model.addAttribute("error", "입력하신 정보가 일치하지 않습니다");
			return "member/error";
		}
	}
	//		●회원정보삭제 끝 ↑
	
	
	//		●회원List 시작 ↓
	@RequestMapping(value = "/member/list", method = RequestMethod.GET)
	public String list(Model model) {
		List<MemberBean> mbList = memberService.getMemberList();
		model.addAttribute("mbList", mbList);
		return "redirect:/";
	}
	//		●회원List 끝 ↑
	
	/* 비밀번호 찾기 */
	@RequestMapping(value = "/member/findpw", method = RequestMethod.GET)
	public void findPwGET() throws Exception{
	}

	@RequestMapping(value = "/member/findpw", method = RequestMethod.POST)
	public void findPwPOST(@ModelAttribute MemberBean mb, HttpServletResponse response) throws Exception{
//		memberService.findPw(response, mb);
		System.out.println(mb.getMember_id());
		System.out.println(mb.getMember_email());
		memberService.findPw(response, mb);
	}
	
	
	
	
//	회원가입시 아이디중복확인
		@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
		public @ResponseBody int idCheck(@RequestParam("id") String id) throws Exception {
			MemberBean ck = memberService.idCheck2(id);
			if(ck != null) return 1;
			else return 0;
		}
		
  
}




