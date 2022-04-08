package com.third.prj.manager.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.third.prj.company.service.CompanyVO;
import com.third.prj.manager.service.CriteriaVO;
import com.third.prj.manager.service.ManagerService;
import com.third.prj.manager.service.ManagerVO;
import com.third.prj.manager.service.PageVO;

@Controller
public class ManagerController {

	@Autowired
	private ManagerService managerDao;

	// 관리자 리스트 페이지
	@RequestMapping("/admin.do")
	public String admin(Model model, CriteriaVO cri) {
		model.addAttribute("managers", managerDao.managerSelectList(cri));
		int total = managerDao.countmana(cri);
		model.addAttribute("pageVO", new PageVO(cri, total));
		return "manager/admin/admin";
	}

	// 관리자 등록 폼
	@GetMapping("/adminForm.do")
	public String adminForm() {
		return "manager/admin/adminForm";
	}

	// 관리자 등록
	@RequestMapping("/adminInsert.do")
	public String adminInsert(ManagerVO vo) {
		int n = managerDao.managerInsert(vo);
		if (n != 0) {
			return "redirect:admin.do";
		}
		return "manager/admin/managerError";
	}

	// 관리자 상세정보
	@RequestMapping("/managerSelet.do")
	public String managerSelet(ManagerVO vo, Model model) {
		vo = managerDao.managerSelect(vo);
		model.addAttribute("mana", vo);
		return "manager/admin/adminSelect";
	}

	// 관리자 정보변경
	@RequestMapping("/adminUpdate.do")
	public String adminUpdate(ManagerVO vo) {
		int n = managerDao.managerUpdate(vo);
		if (n != 0) {
			return "redirect:admin.do";
		}
		return "manager/admin/managerError";
	}

	// 관리자 정보 삭제
	@RequestMapping("/admindelete.do")
	public String admindelete(ManagerVO vo) {
//		ManagerVO vo = new ManagerVO();
//		vo.setMId(id);
		int n = managerDao.managerDelete(vo);
		if (n != 0) {
			return "redirect:/admin.do";
		}
		return "manager/admin/managerError";
	}

	// 관리자 등록 아이디 중복확인
	@ResponseBody
	@RequestMapping("/idCheck.do")
	public int idCheck(String MId) throws Exception {
		int result = managerDao.idCheck(MId);
		return result;
	}
	
	@RequestMapping("/managerLoginForm.do")
	public String managerLoginForm() {
		return "admin/managerLoginForm";
	}
	  
		//기업회원 로그인
		@RequestMapping("/manaLogin.do")
		public ModelAndView companyLogin(HttpSession session, ManagerVO vo, ModelAndView mv) {
			String msg = "";
	        String url = "";
			vo = managerDao.manaLogin(vo);
			if(vo == null) {
				msg = "아이디가 비밀번호가 일치하지 않습니다 다시 로그인 해주세요";
				url = "managerLoginForm.do";
				mv.addObject("msg", msg);
				mv.addObject("url", url);
				mv.setViewName("company/alert");
			}else {
				msg = "로그인 성공";
				url = "homeM.do";	
				session.setAttribute("sessionId", vo.getMId());
				session.setAttribute("pwd", vo.getPwd());
				mv.addObject("msg", msg);
				mv.addObject("url", url);
				mv.setViewName("company/alert");
			}
			return mv;
		}

}
