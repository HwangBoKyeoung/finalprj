package com.third.prj.user.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	@RequestMapping("/userLoginForm.do")
	public String userLoiginForm() {
		return "user/userLoginForm";
	}
}
