package com.third.prj.user.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
	
	@RequestMapping("/signup_1.do")
	public String signUp_1() {
		return "signup/signup_1";
	}
	
	@RequestMapping(value = "/signup_3.do", method = RequestMethod.GET) 
	public String signUp_3(@RequestParam String email, Model model) {
		model.addAttribute("email", email);
		return "signup/signup_3";
	}
	
}
