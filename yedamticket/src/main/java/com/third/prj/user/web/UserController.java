package com.third.prj.user.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.third.prj.faq.service.FaqService;
import com.third.prj.notice.service.NoticeService;
import com.third.prj.recaptcha.VerifyRecaptcha;
import com.third.prj.user.service.UserService;
import com.third.prj.user.service.UserVO;

@Controller
public class UserController {

	@Autowired
	private FaqService faqDao;
	
	@Autowired
	private UserService userDao;

	@Autowired
	private NoticeService noticeDao;

	@RequestMapping("/signup_1.do")
	public String signUp_1() {
		return "signup/signup_1";
	}

	@RequestMapping(value = "/signup_3.do", method = RequestMethod.GET)
	public String signUp_3(@RequestParam String email, Model model) {
		model.addAttribute("email", email);
		return "signup/signup_3";
	}

	@PostMapping("/signup_4.do")
	public String signUp_4(UserVO userVO) {
		int n = userDao.userInsert(userVO);
		if (n != 0) {
			return "home/home";
		}
		return "signup/signup_error";
	}

	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(UserVO userVO) {
		int i = userDao.idChk(userVO);
		return i;
	}

	@ResponseBody
	@RequestMapping(value = "VerifyRecaptcha", method = RequestMethod.POST)
	public int VerifyRecaptcha(HttpServletRequest request) {
		VerifyRecaptcha.setSecretKey("6LfYlAwfAAAAAHv7aqyCEWaO9aQ_218wKAjEy9eT");
		String gRecaptchaResponse = request.getParameter("recaptcha");
		try {
			if (VerifyRecaptcha.verify(gRecaptchaResponse))
				return 0; // 성공
			else
				return 1; // 실패
		} catch (Exception e) {
			e.printStackTrace();
			return -1; // 에러
		}
	}

	@RequestMapping("/userLoginForm.do")
	public String userLoiginForm(String error) {
		return "user/user/userLoginForm";
	}

	@RequestMapping("/user.do")
	public String user(Model model) {
		model.addAttribute("users", userDao.userList());
		return "manager/user/user";
	}

	@RequestMapping("/userSelet.do")
	public String userSelet(UserVO vo, Model model) {
		vo = userDao.userSelect(vo);
		model.addAttribute("users", vo);
		return "manager/user/userSelect";
	}

	@RequestMapping("/userSelect.do")
	public String userSelect(HttpSession session, UserVO vo, Model model) {
		userDao.userSelect(vo);
		session.setAttribute("sessionId", vo.getUid());
		System.out.println("----------------sessionId : " + session.getAttribute("sessionId") + "-----------------------");
		return "home/home";
	}
	
	@RequestMapping("/userService.do")
	public String userService(Model model) {
		model.addAttribute("notices", noticeDao.noticeSelectList());
		model.addAttribute("faqs", faqDao.faqSelectList());
		return "user/userService";
	}

	@RequestMapping("/userPage.do")
	public String userPage() {
		return "user/userPage";
	}
	@RequestMapping("/userUpdateForm.do")
	public String userUpdateForm() {
		return "user/userUpdateForm";
	}
	
}