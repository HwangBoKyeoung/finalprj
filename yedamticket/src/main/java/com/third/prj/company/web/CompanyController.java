package com.third.prj.company.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.third.prj.company.service.CompanyService;
import com.third.prj.company.service.CompanyVO;

@Controller
public class CompanyController {

	@Autowired
	private CompanyService companyDao;

	@RequestMapping("/signupB_1.do")
	public String signUpB_2() {
		return "signup/signupB_1";
	}
	
	@RequestMapping(value = "/signupB_2.do", method = RequestMethod.GET)
	public String signUpB_2(@RequestParam String email, Model model) {
		model.addAttribute("email", email);
		return "signup/signupB_2";
	}
	
	@PostMapping("/signupB_3.do")
	public String signUpB_3(CompanyVO companyVO) {
		int n = companyDao.companyInsert(companyVO);
		if (n != 0) {
			return "home/home";
		}
		return "signup/signup_error";
	}
	
	@ResponseBody
	@RequestMapping(value = "/cidChk", method = RequestMethod.POST)
	public int cidChk(CompanyVO companyVO) {
		int i = companyDao.cidChk(companyVO);
		return i;
	}
	
	//기업회원 리스트(관리자페이지)
	@RequestMapping("/company.do")
	public String company(Model model) {
		model.addAttribute("companys", companyDao.companyList());
		return "manager/company/company";
	}
	
	//기업회원 상세정보(관리자페이지)
	@RequestMapping("/companySelect.do")
	public String companySelet(CompanyVO vo, Model model) {
		vo = companyDao.companySelect(vo);
		model.addAttribute("com",vo);
		return "manager/company/companySelect";
	}
	//기업회원 로그인폼
	@RequestMapping("/companyLoginForm.do")
	public String companyLogin() {
		return "company/company/companyLoginForm";
	}
	//기업회원 로그인
	@RequestMapping("/companyLogin.do")
	public ModelAndView companyLogin(HttpSession session, CompanyVO vo, ModelAndView mv) {
		String msg = "";
        String url = "";
		vo = companyDao.companyLogin(vo);
		if(vo == null) {
			msg = "아이디가 비밀번호가 일치하지 않습니다 다시 로그인 해주세요";
			url = "companyLoginForm.do";
			mv.addObject("msg", msg);
			mv.addObject("url", url);
			mv.setViewName("company/alert");
		}else {
			msg = "로그인 성공";
			url = "home.do";	
			session.setAttribute("sessionId", vo.getCid());
			session.setAttribute("pwd", vo.getPwd());
			mv.addObject("msg", msg);
			mv.addObject("url", url);
			mv.setViewName("company/alert");
		}
		return mv;
	}
}
