package com.third.prj.mail.web;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailController {
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "mailSending.do")
	public String mailSending(HttpServletRequest request) {

		String setfrom = "qqoxmaos2@gmail.com";
		String id = request.getParameter("id"); // 받는 사람 아이디
		String email = request.getParameter("email"); // 받는 사람 이메일
		String all = id + "@" + email; // 아이디 형식 완성
		String content = request.getParameter("content"); // 내용
		String subject = request.getParameter("subject"); // 제목
		System.out.println(content);
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setSubject(subject); // 제목
			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(all); // 받는사람 이메일
			messageHelper.setText(content); // 메일 내용
 
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		return "signup/signup_2"; 
	}
	
	@RequestMapping(value = "mailSending2.do")
	public String mailSending2(HttpServletRequest request) {

		String setfrom = "qqoxmaos2@gmail.com";
		String id = request.getParameter("id"); // 받는 사람 아이디
		String email = request.getParameter("email"); // 받는 사람 이메일
		String all = id + "@" + email; // 아이디 형식 완성
		String content = request.getParameter("content"); // 내용
		String subject = request.getParameter("subject"); // 제목
		System.out.println(content);
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setSubject(subject); // 제목
			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(all); // 받는사람 이메일
			messageHelper.setText(content); // 메일 내용
 
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		return "signup/signup_2"; 
	}
	
}
