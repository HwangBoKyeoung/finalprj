package com.third.prj.user.web;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.prj.faq.service.FaqService;
import com.third.prj.notice.service.NoticeService;

@Controller
public class UserController {
	@Autowired NoticeService noticeDao;
	@Autowired FaqService faqDao;
	
	@RequestMapping("/userLoginForm.do")
	public String userLoiginForm() {
		return "user/user/userLoginForm";
	}
	
	@RequestMapping("/userService.do")
	public String userService(Model model) {
		model.addAttribute("notices", noticeDao.noticeSelectList());
		model.addAttribute("faqs", faqDao.faqSelectList());
		return "user/userService";
	}
}
