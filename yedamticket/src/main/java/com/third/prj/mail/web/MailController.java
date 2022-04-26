package com.third.prj.mail.web;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MailController {

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "mailChk.do", method = RequestMethod.POST)
	public String mailChk(HttpSession session, Model model) {
		model.addAttribute("msg", "이메일 발송이 완료되었습니다.");
		return "user/alert2";
	}

	// 일반회원 메일전송
	@RequestMapping(value = "mailSending.do")
	public String mailSending(HttpServletRequest request, HttpSession session) {

		String setfrom = "qqoxmaos2@gmail.com";
		String id = request.getParameter("id"); // 받는 사람 아이디
		String email = request.getParameter("email"); // 받는 사람 이메일
		String all = id + "@" + email; // 아이디 형식 완성
		session.setAttribute("all", all);
		String content = request.getParameter("content"); // 내용
		String subject = request.getParameter("subject"); // 제목
		System.out.println(content);

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setSubject(subject); // 제목
			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(all); // 받는사람 이메일
			messageHelper.setText(content, true); // 메일 내용 "true"옵션으로 html태그 사용 가능
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		return "forward:/mailChk.do";
	}
	
	// 기업회원 메일전송
	@RequestMapping(value = "mailSending2.do")
	public String mailSending2(HttpServletRequest request, HttpSession session) {

		String setfrom = "qqoxmaos2@gmail.com";
		String id = request.getParameter("id"); // 받는 사람 아이디
		String email = request.getParameter("email"); // 받는 사람 이메일
		String all = id + "@" + email; // 아이디 형식 완성
		session.setAttribute("all", all);
		String content = request.getParameter("content"); // 내용
		String subject = request.getParameter("subject"); // 제목
		System.out.println(content);

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setSubject(subject); // 제목
			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(all); // 받는사람 이메일
			messageHelper.setText(content, true); // 메일 내용 "true"옵션으로 html태그 사용 가능
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		return "forward:/mailChk.do";
	}

}
