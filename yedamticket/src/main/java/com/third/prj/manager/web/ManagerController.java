package com.third.prj.manager.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.prj.manager.service.ManagerService;
import com.third.prj.manager.vo.ManagerVO;

@Controller
public class ManagerController {

	@Autowired
	private ManagerService managerDao;
	
	//관리자 리스트 페이지
	@RequestMapping("/admin.do")
	public String admin(Model model) {
		model.addAttribute("managers", managerDao.managerSelectList());
		return "manager/admin/admin";
	}
	//관리자 등록 폼
	@GetMapping("/adminForm.do")
	public String adminForm() {
		return "manager/admin/adminForm";
	}
	//관리자 등록
	@RequestMapping("/adminInsert.do")
	public String adminInsert(ManagerVO vo) {
		int n = managerDao.managerInsert(vo);
		if(n!=0) {
		return "redire:admin.do";
		}
		return "manager/managerError";
	}
}
