package com.third.prj.user.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	@RequestMapping("/signup_1.do")
	public String signUp_1() {
		return "signup/signup_1";
	}
	
//	@RequestMapping("/signup_2.do")
//	public String signUp_2() {
//		return "signup/signup_2";
//	}
	
	@RequestMapping("/signup_3.do") 
	public String signUp_3() {
		return "signup/signup_3";
	}
}
