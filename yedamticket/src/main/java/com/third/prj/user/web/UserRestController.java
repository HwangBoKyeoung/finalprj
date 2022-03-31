package com.third.prj.user.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.third.prj.user.service.UserService;
import com.third.prj.user.service.UserVO;

@RestController
public class UserRestController {
	
	@Autowired
	private UserService userDao;
	
	@RequestMapping("/ajaxUserSearch.do")
	public List<UserVO> ajaxUserSearch(@RequestParam("key") String key, @RequestParam("val") String val) {
		return userDao.userSearch(key, val);
	}

}
