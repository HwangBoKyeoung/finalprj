package com.third.prj.manager.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		return "redirect:admin.do";
		}
		return "manager/admin/managerError";
	}
	//관리자 상세정보
	@RequestMapping("/managerSelet.do")
	public String managerSelet(ManagerVO vo, Model model) {
		vo = managerDao.managerSelect(vo);
		model.addAttribute("mana",vo);
		return "manager/admin/adminSelect";
	}
	//관리자 정보변경
	@RequestMapping("/adminUpdate.do")
	public String adminUpdate(ManagerVO vo) {
		int n = managerDao.managerUpdate(vo);
		if(n != 0 ) {
			return "redirect:admin.do";
		}
		return "manager/admin/managerError";
	}
	
	//관리자 정보 삭제
	@RequestMapping("/admindelete.do")
	public String admindelete(@RequestParam("MId") String id) {
		ManagerVO vo = new ManagerVO();
		vo.setMId(id);
		int n = managerDao.managerDelete(vo);
		if(n != 0) {
			return "redirect:/admin.do";
		}
		return "manager/admin/managerError";
	}
	
	
	
}
