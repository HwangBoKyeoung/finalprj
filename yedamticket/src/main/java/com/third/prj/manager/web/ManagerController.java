package com.third.prj.manager.web;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	
	@Inject
	private BCryptPasswordEncoder pwdEncoder;

	// 관리자 리스트 페이지
	@RequestMapping("/manager.do")
	public String manager(Model model, CriteriaVO cri) {
		PageVO pageVO = new PageVO(cri, managerDao.getTotal(cri));
		model.addAttribute("manas", managerDao.managerSelectList(cri));
		model.addAttribute("pagaVO",pageVO);
		return "manager/manager/manager";
	}

	// 관리자 등록 폼
	@GetMapping("/managerForm.do")
	public String managerForm() {
		return "manager/manager/managerForm";
	}

	// 관리자 등록
	@RequestMapping("/managerInsert.do")
	public String managerInsert(ManagerVO vo) {
		String encodedPwd = vo.getPwd();
		String decodedPwd = pwdEncoder.encode(encodedPwd);
		vo.setPwd(decodedPwd);
		int n = managerDao.managerInsert(vo);
		if (n != 0) {
			return "redirect:manager.do";
		}
		return "manager/manager/managerError";
	}

	// 관리자 상세정보
	@RequestMapping("/managerSelet.do")
	public String managerSelet(ManagerVO vo, Model model) {
		vo = managerDao.managerSelect(vo);
		model.addAttribute("mana", vo);
		return "manager/manager/managerSelect";
	}

	// 관리자 정보변경
	@RequestMapping("/managerUpdate.do")
	public String managerUpdate(ManagerVO vo) {
		int n = managerDao.managerUpdate(vo);
		if (n != 0) {
			return "redirect:manager.do";
		}
		return "manager/manager/managerError";
	}

	// 관리자 정보 삭제
	@RequestMapping("/managerDelete.do")
	public String managerDelete(ManagerVO vo) {
//		ManagerVO vo = new ManagerVO();
//		vo.setMId(id);
		int n = managerDao.managerDelete(vo);
		if (n != 0) {
			return "redirect:/manager.do";
		}
		return "manager/manager/managerError";
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
		return "company/manager/managerLoginForm";
	}
	  
		//관리자회원 로그인
		@RequestMapping("/manaLogin.do")
		public ModelAndView companyLogin(HttpSession session, ManagerVO vo, ModelAndView mv) {
			String msg = "";
	        String url = "";
			ManagerVO login = managerDao.manaLogin(vo, session);
			boolean pwdChk = pwdEncoder.matches(vo.getPwd(), login.getPwd());
			
			if(login != null && pwdChk) {
				msg = "로그인 성공";
				url = "homeM.do";	
				session.setAttribute("sessionId", vo.getMId());
				session.setAttribute("sessionName", vo.getName());
				session.setAttribute("sessionAuthCd", vo.getAuthCd());
				mv.addObject("msg", msg);
				mv.addObject("url", url);
				mv.setViewName("company/alert");
				
			}else {
				msg = "아이디가 비밀번호가 일치하지 않습니다 다시 로그인 해주세요";
				url = "managerLoginForm.do";
				mv.addObject("msg", msg);
				mv.addObject("url", url);
				mv.setViewName("company/alert");
			}
			return mv;
		}

}
