package com.seven.service;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seven.dao.MemberDAO;
import com.seven.domain.MemberBean;
import com.seven.domain.PageBean;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO memberDao;

	@Override
	public void insertMember(MemberBean mb) {
		mb.setMember_joindate(new Timestamp(System.currentTimeMillis()));
		memberDao.insertMember(mb);		
	}

	@Override
	public MemberBean userCheck(MemberBean mb) {
		return memberDao.userCheck(mb);
	}

	@Override
	public MemberBean getMember(String id) {
		return memberDao.getMember(id);
	}

	@Override
	public void updateMember(MemberBean mb) {
		memberDao.updateMember(mb);		
	}

	@Override
	public void deleteMember(MemberBean mb) {
		memberDao.deleteMember(mb);
	}

	@Override
	public List<MemberBean> getMemberList() {
		return memberDao.getMemberList();
	}
	
	@Override
	public List<MemberBean> getMemberList_byPeriod(MemberBean mb) {
		return memberDao.getMemberList_byPeriod(mb);
	}
	
	@Override
	public List<MemberBean> getMemberList_byId(MemberBean mb) {
		return memberDao.getMemberList_byPeriod(mb);
	}
	
	@Override
	public List<MemberBean> getMemberList_byName(MemberBean mb) {
		return memberDao.getMemberList_byPeriod(mb);
	}

	@Override
	public void sendEmail(MemberBean mb, String div) throws Exception {
	
			// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com
			String hostSMTPid = "rudals8750@naver.com";
			String hostSMTPpwd = "";

			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "rudals8750@naver.com";
			String fromName = "seven";
			String subject = "";
			String msg = "";

			if(div.equals("findpw")) {
				subject = " 홈페이지 임시 비밀번호 입니다.";
				msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
				msg += "<h3 style='color: blue;'>";
				msg += mb.getMember_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
				msg += "<p>임시 비밀번호 : ";
				msg += mb.getMember_pass() + "</p></div>";
			}

			// 받는 사람 E-Mail 주소
			String mail = mb.getMember_email();
			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(587); //네이버 이용시 587

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg(msg);
				email.send();
			} catch (Exception e) {
				System.out.println("메일발송 실패 : " + e);
			}
		}

		//비밀번호찾기
		@Override
		public void findPw(HttpServletResponse response, MemberBean mb) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			MemberBean ck = memberDao.getMember(mb.getMember_id());
			PrintWriter out = response.getWriter();
			
			System.out.println(mb.getMember_id());
			// 가입된 아이디가 없으면
			if(ck == null) {
				out.print("등록되지 않은 아이디입니다.");
				out.close();
			}
			// 가입된 이메일이 아니면
			else if(!mb.getMember_email().equals(ck.getMember_email())) {
				out.print("등록되지 않은 이메일입니다.");
				out.close();
			}else {
				// 임시 비밀번호 생성
				String pw = "";
				for (int i = 0; i < 12; i++) {
					pw += (char) ((Math.random() * 26) + 97);
				}
				mb.setMember_pass(pw);
				// 비밀번호 변경
				memberDao.updatePw(mb);
				// 비밀번호 변경 메일 발송
				sendEmail(mb, "findpw");

				out.print("이메일로 임시 비밀번호를 발송하였습니다.");
				out.close();
			}
		}

		@Override
		public MemberBean idCheck(String id) {
			return memberDao.idCheck(id);
		}

		@Override
		public MemberBean idCheck2(String id) {
			return memberDao.idCheck2(id);
		}
		
		
		
		
		
		
	}

	


