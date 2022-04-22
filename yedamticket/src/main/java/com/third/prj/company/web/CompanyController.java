package com.third.prj.company.web;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.third.prj.company.service.CompanyService;
import com.third.prj.company.service.CompanyVO;
import com.third.prj.company.service.CriteriaVO;
import com.third.prj.company.service.PageVO;
import com.third.prj.movie.service.MovieService;
import com.third.prj.movie.service.MovieVO;
import com.third.prj.performance.service.PerformanceService;
import com.third.prj.performance.service.PerformanceVO;

@Controller
public class CompanyController {

   @Autowired
   private CompanyService companyDao;

   @Autowired
   private MovieService movieDao;
   
   @Autowired
   private PerformanceService perDao;
   
//   @Autowired
//   private BCryptPasswordEncoder pwdEncoder;

   @RequestMapping("/signupB_1.do")
   public String signUpB_2() {
      return "signup/signupB_1";
   }
   
   @RequestMapping(value = "/signupB_2.do", method = RequestMethod.GET)
   public String signUpB_2(HttpSession session) {
      session.getAttribute("all");
      return "signup/signupB_2";
   }
   
   @RequestMapping(value = "/signupB_3.do")
	public String signUpB_3(CompanyVO companyVO, Model model, HttpServletRequest httpServletRequest) {
	   System.out.println("*******************************************************************");
	   System.out.println("===================================="+companyVO);
	   
//	   주소 VO에 담기
	  String addr = httpServletRequest.getParameter("addr");
      String addr2 = httpServletRequest.getParameter("addr2");
      String addr3 = addr + " " + addr2;
      companyVO.setAddr(addr3);
      
//      사업자등록번호 VO에 담기
      String bizno = httpServletRequest.getParameter("bizno");
      companyVO.setNono(bizno);
      
//      패스워드 VO에 담기
      String encodedPwd = companyVO.getPwd();
      BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(10);
      String decodedPwd = pwdEncoder.encode(encodedPwd);
      companyVO.setPwd(decodedPwd);
      
      int n = companyDao.companyInsert(companyVO);
      if (n != 0) {
         return "redirect:home.do";
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
   @RequestMapping("/managerCompany.do")
   public String managerCompany(Model model, CriteriaVO cri) {
      PageVO pageVO = new PageVO(cri, companyDao.getTotal(cri));
      model.addAttribute("coms", companyDao.companyList(cri));
      model.addAttribute("pageVO",pageVO);      
      return "manager/company/managerCompany";
   }
   
   //기업회원 상세정보(관리자페이지)
   @RequestMapping("/managerCompanySelect.do")
   public String managerCompanySelect(CompanyVO vo, Model model,PerformanceVO pvo, MovieVO mvo) {
      vo = companyDao.companySelect(vo);
      model.addAttribute("com",vo);
      System.out.println("=================="+vo.getCId());
//      model.addAttribute("mv", movieDao.cMovieList(mvo));
//      model.addAttribute("pf", perDao.cperList(pvo));
      return "manager/company/managerCompanySelect";
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
        System.out.println("***************************"+vo);
        CompanyVO login = companyDao.companyLogin(vo, session);
        BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(10);
        System.out.println("==========================="+vo);
        if(vo != null && pwdEncoder.matches(vo.getPwd(), login.getPwd())) {
           msg = "로그인 성공";
         url = "home.do";   

         session.setAttribute("sessionName", login.getName());
         System.out.println("=====================================================");
         System.out.println(login.getName());
         System.out.println(vo.getCId());
         System.out.println("=====================================================");	
         session.setAttribute("sessionId", login.getCId());
         session.setAttribute("pwd", login.getPwd());
         mv.addObject("msg", msg);
         mv.addObject("url", url);
         mv.setViewName("company/alert");
        } else {
           msg = "아이디가 비밀번호가 일치하지 않습니다 다시 로그인 해주세요";
         url = "companyLoginForm.do";
         mv.addObject("msg", msg);
         mv.addObject("url", url);
         mv.setViewName("company/alert");
        }
      return mv;
   }
   //기업 마이페이지 메인 겸 조회/수정
   @RequestMapping("/companyMyPage.do")
   public String companyMyPage(Model model, CompanyVO vo, HttpSession session) {
      vo.setCId((String)session.getAttribute("sessionId"));
      model.addAttribute("cmp", companyDao.companySelect(vo));
      return "companyMyPage/companyMyPage";
   }
   
   //기업회원 수정
   @RequestMapping("/companyUpdate.do")
   public String companyUpdate(CompanyVO vo) {
      String pwd = vo.getPwd();
      BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(10);
      String encyPwd = pwdEncoder.encode(pwd);
      vo.setPwd(encyPwd);
      int u = companyDao.companyUpdate(vo);
      if (u != 0) {
         return "redirect:companyMyPage.do";
      }
      return "companyMyPage/companyPageError";
   }
   

}
