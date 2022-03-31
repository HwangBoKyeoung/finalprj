package com.third.prj.manager.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.third.prj.manager.service.ManagerService;
import com.third.prj.manager.service.ManagerVO;

@RestController
public class ManagerRestController {

	@Autowired
	private ManagerService managerDao;

	// 관리자 검색
	@PostMapping("/ajaxManagerSerch.do")
	public List<ManagerVO> ajaxManagerSerch(@RequestParam("key") String key, @RequestParam("val") String val) {
		return managerDao.managerSearch(key, val);
	}

}
