package com.seven.seven;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.support.HandlerMethodInvocationException;

import com.seven.domain.PageBean;
import com.seven.domain.ProductBean;
import com.seven.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	private ProductService productService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		PageBean pb=new PageBean();
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
	
		
		
		if(request.getParameter("pageNum")!=null) {
			
			pb.setPageNum(request.getParameter("pageNum"));
		}else {
			
			pb.setPageNum("1");
		}
		pb.setPageSize(8);
		
		List<ProductBean> productList=productService.getHighList(pb);
		
		
		pb.setCount(productService.getProductCount());
		
		model.addAttribute("productList",productList);
		model.addAttribute("pb",pb);
	
		
		
		
		return "home";
		
		
		
	}
	
	@RequestMapping("/sendEmail.do")
	public String sendEmail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String emailSub = request.getParameter("emailSub");
		String host = "smtp.naver.com";
		final String username ="itseven123";
		final String password ="TDPC5R9T8FRW";
		int port=465;
		
		String recipient = emailSub;
		String subject = "seven의 소식을 정기적으로 받아보실 수 있습니다!";
		String body= "안녕하세요 seven입니다. \n 고객님의 구독신청에 감사드립니다.";
		
		Properties props = System.getProperties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un=username;
			String pw=password;
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true);
		
		Message mimeMessage= new MimeMessage(session);
		mimeMessage.setFrom(new InternetAddress("itseven123@naver.com"));
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		mimeMessage.setSubject(subject);
		mimeMessage.setText(body);
		Transport.send(mimeMessage);
		
		return "redirect:/";
	}
	
	
	
	
	
	
}
