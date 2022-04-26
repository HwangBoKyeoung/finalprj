package com.third.prj.user.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.third.prj.faq.service.FaqService;
import com.third.prj.movie.service.MovieService;
import com.third.prj.moviereservation.service.MovieReservVO;
import com.third.prj.notice.service.NoticeService;
import com.third.prj.performance.service.PerformanceService;
import com.third.prj.performancereservation.service.PerformanceReservationVO;
import com.third.prj.performancereservation.service.PerformanceReservationViewVO;
import com.third.prj.point.service.PointCriteriaVO;
import com.third.prj.point.service.PointPageVO;
import com.third.prj.recaptcha.VerifyRecaptcha;
import com.third.prj.user.service.CriteriaVO;
import com.third.prj.user.service.PageVO;
import com.third.prj.user.service.UserCriteriaVO;
import com.third.prj.user.service.UserPageVO;
import com.third.prj.user.service.UserPointViewVo;
import com.third.prj.user.service.UserService;
import com.third.prj.user.service.UserVO;


@Controller
public class UserController {

   @Autowired
   private FaqService faqDao;

   @Autowired
   private UserService userDao;

   @Autowired
   private NoticeService noticeDao;

   @Autowired
   private PerformanceService perDao;

   @Autowired
   private MovieService movieDao;
   
   @RequestMapping("/signup_1.do")
   public String signUp_1() {
      return "signup/signup_1";
   }

   @RequestMapping(value = "/signup_3.do", method = RequestMethod.GET)
   public String signUp_3(HttpSession session) {
      session.getAttribute("all");
      return "signup/signup_3";
   }

   @PostMapping("/signup_4.do")
   public String signUp_4(UserVO userVO, Model model, HttpServletRequest httpServletRequest) {
      String pwd = userVO.getPwd();
      BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(10);
      String encryptedPwd = pwdEncoder.encode(pwd);
      String addr = httpServletRequest.getParameter("addr");
      String addr2 = httpServletRequest.getParameter("addr2");
      String addr3 = addr + " " + addr2;
      userVO.setAddr(addr3);
      userVO.setPwd(encryptedPwd);
      int n = userDao.userInsert(userVO);
      if (n != 0) {
         return "home/home";
      }
      return "signup/signup_error";
   }

   @ResponseBody
   @RequestMapping(value = "/idChk", method = RequestMethod.POST)
   public int idChk(UserVO userVO) {
      int i = userDao.idChk(userVO);
      return i;
   }

   @ResponseBody
   @RequestMapping(value = "VerifyRecaptcha", method = RequestMethod.POST)
   public int VerifyRecaptcha(HttpServletRequest request) {
      VerifyRecaptcha.setSecretKey("6LfYlAwfAAAAAHv7aqyCEWaO9aQ_218wKAjEy9eT");
      String gRecaptchaResponse = request.getParameter("recaptcha");
      try {
         if (VerifyRecaptcha.verify(gRecaptchaResponse))
            return 0; // 성공
         else
            return 1; // 실패
      } catch (Exception e) {
         e.printStackTrace();
         return -1; // 에러
      }
   }
   /*
    * 
    * 
    *    
    */

   @RequestMapping("/userLoginForm.do")
   public String userLoiginForm() {
      return "user/user/userLoginForm";
   }

   @RequestMapping("/managerUser.do")
   public String managerUser(Model model, CriteriaVO cri) {
      PageVO pageVO = new PageVO(cri, userDao.getTotal(cri));
      model.addAttribute("users", userDao.userList(cri));
      model.addAttribute("pageVO", pageVO);// 전체게시글 기준으로가지고옴
      return "manager/user/managerUser";
   }

   @RequestMapping("/managerUserSelect.do")
   public String managerUserSelect(UserVO vo, Model model) {
      vo = userDao.userSelectOne(vo);

      model.addAttribute("users", vo);
      return "manager/user/managerUserSelect";
   }

   @RequestMapping("/userLogin.do")
   public ModelAndView userSelect(HttpSession session, UserVO vo, ModelAndView mv) {
      
      System.out.println("userSelect start");
      userDao.userSelect(vo);
      System.out.println("userSelect end");
      
      session.setAttribute("sessionId", vo.getUId());
      session.setAttribute("sessionPwd", vo.getPwd());
      
      System.out.println("sessionId : " + vo.getUId());
      System.out.println("sessionPwd : " + vo.getPwd());
      
      System.out.println("idChk start");
      int idCheck = userDao.idChk(vo);
      System.out.println("idChk end");
      
      switch (idCheck) {
      case 1:
         String msg = "";
         String url = ""; 
         
         System.out.println("login > loginChk start");
         UserVO login = userDao.loginChk(vo, session);
         System.out.println("login > loginChk end");
         
         BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(10);
         boolean pwdChk = pwdEncoder.matches(vo.getPwd(), login.getPwd());

         if (login != null && pwdChk) {
            int i = userDao.reservChk(vo);
            msg = "어서오세요 " + vo.getUId() + "님 \n\n 현재 결제해야 할 항목은 " + i + "건 입니다.";
            url = "home.do";

            session.setAttribute("sessionId", login.getUId());
            session.setAttribute("sessionEmail", login.getEmail());
            session.setAttribute("sessionName", login.getName());
            session.setAttribute("sessionAddr", login.getAddr());
            session.setAttribute("sessionPhone", login.getPhone());
            session.setAttribute("sessionAuth", login.getRole());
            System.out.println("**********************"+login.getRole());
            session.setAttribute("sessionGrade", login.getMembership());
 
            mv.addObject("msg", msg);
            mv.addObject("url", url);
            mv.setViewName("user/alert");
         }else{
            msg = "비밀번호가 일치하지 않습니다 다시 로그인 해주세요";
            url = "userLoginForm.do";
            mv.addObject("msg", msg);
            mv.addObject("url", url);
            mv.setViewName("user/alert");
         }
         break;

      case 0:
         String msg2 = "아이디 또는 비밀번호를 확인해주세요";
         String url2 = "userLoginForm.do";
         mv.addObject("msg", msg2);
         mv.addObject("url", url2);
         mv.setViewName("user/alert");
         break;
      }
      return mv;
   }
  
  
   @RequestMapping("/userLogin1.do")
   @ResponseBody
   public UserVO userSelect1(HttpSession session, UserVO vo) {
	      UserVO login = userDao.loginChk(vo, session);
	      BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(10);
	      boolean pwdChk = pwdEncoder.matches(vo.getPwd(), login.getPwd());
	      
	      session.setAttribute("sessionId", vo.getUId());
	      
			
			if (login != null && pwdChk) {
				session.setAttribute("sessionId", vo.getUId());
				session.setAttribute("sessionEmail", vo.getEmail());
				session.setAttribute("sessionName", vo.getName());
				session.setAttribute("sessionAddr", vo.getAddr());
				session.setAttribute("sessionPhone", vo.getPhone());
				return login;
			} else {
				return login;
			}
			 
	      
   }

   @RequestMapping("/userService.do")
   public String userService(Model model) {
      model.addAttribute("notices", noticeDao.noticeSelectList());
      model.addAttribute("faqs", faqDao.faqSelectList());
      return "user/userService";
   }

   @RequestMapping("/userPage.do")
   public String userPage(Model model, UserVO vo, HttpSession session, UserCriteriaVO cri, UserPointViewVo pvo, PerformanceReservationViewVO performanceReservationViewVO) {
      
      cri.setUId((String)session.getAttribute("sessionId"));
      vo.setUId((String)session.getAttribute("sessionId"));
      pvo.setUId((String)session.getAttribute("sessionId"));

      model.addAttribute("userPoint", userDao.userPoint(pvo));
      model.addAttribute("mvList", userDao.mvRList(cri));
      model.addAttribute("pfList", userDao.pfRList(cri));
      model.addAttribute("prList", userDao.prList(cri));
      model.addAttribute("user", userDao.userSelectOne(vo));

      return "user/userPage";
   }

   @RequestMapping("/userUpdateForm.do")
   public String userUpdateForm(Model model, UserVO vo, HttpSession session) {
      vo.setUId((String) session.getAttribute("sessionId"));
      model.addAttribute("user", userDao.userSelectOne(vo));
      return "user/userUpdateForm";
   }

   @RequestMapping("/userUpdate.do")
   public String userUpdate(UserVO vo) {
      String pwd = vo.getPwd();
      BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(10);
      String encryptedPwd = pwdEncoder.encode(pwd);
      vo.setPwd(encryptedPwd);
      int n = userDao.userUpdate(vo);
      if (n != 0) {
         return "redirect:userUpdateForm.do";
      }
      return "user/errorPage";
   }

   @RequestMapping("/userDeleteForm.do")
   public String userDeleteForm() {
      return "user/userDeleteForm";
   }

   @RequestMapping("/userDelete.do")
   public String userDelete(UserVO vo, HttpSession session,RedirectAttributes rttr) {
	   UserVO login = userDao.loginChk(vo, session);
	      System.out.println("===========================================");
	      System.out.println("sesion : " + session.toString());
	      System.out.println("login : " + login);
	      System.out.println("vo : " + vo);
	      System.out.println("===========================================");

	      BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(10);
	      boolean pwdChk = pwdEncoder.matches(vo.getPwd(), login.getPwd());
	      System.out.println("pwdChk : " + pwdChk);

	      if (login != null && pwdChk) {
	         System.out.println("vo' UId : " + vo.getUId());
	         System.out.println("vo' pwd : " + vo.getPwd());

	         int result = userDao.userDelete(login);
	         System.out.println("result : " + result);

	         if (result == 1) {
	        	 session.invalidate();
	        	 
	            return "redirect:/";
	         }

	      }
	      return "user/errorPage";
   }

   @RequestMapping("/mvReservList.do")
   public String mvReservList(Model model,UserVO vo, MovieReservVO mvo, HttpSession session ,UserCriteriaVO cri) {
      System.out.println("=============== session userid"+(String)session.getAttribute("sessionId")+"===========================");
      cri.setUId((String)session.getAttribute("sessionId"));
      System.out.println("=============== cri userid"+cri.getUId() + "===============");
      UserPageVO pageVO = new UserPageVO(cri, userDao.getMTotal(cri)); //(기준, 토탈)
      
      model.addAttribute("pageVO", pageVO); //페이지네이션전달   

      model.addAttribute("mvList", userDao.mvRList(cri));

      vo.setUId((String) session.getAttribute("sessionId"));
      model.addAttribute("user", userDao.userSelectOne(vo));

      return "user/mvReservList";
   }

   @RequestMapping("pfReservList.do")
   public String pfReservList(Model model, HttpSession session, PerformanceReservationVO pvo, UserVO vo,
         UserCriteriaVO cri) {

      cri.setUId((String)session.getAttribute("sessionId"));
      UserPageVO pageVO = new UserPageVO(cri, userDao.getFTotal(cri)); //(기준, 토탈)
      
      model.addAttribute("pageVO", pageVO); //페이지네이션전달   

      model.addAttribute("pfList", userDao.pfRList(cri));

      System.out.println("*********************************************************");
      System.out.println(userDao.pfRList(cri));
      System.out.println("*********************************************************");
      
      vo.setUId((String) session.getAttribute("sessionId"));
      model.addAttribute("user", userDao.userSelectOne(vo));
      return "user/pfReservList";
   }
  
@RequestMapping("/userBuyList.do")
   public String userBuyList(Model model, HttpSession session, PointCriteriaVO cri, UserVO vo) {
      cri.setUId((String) session.getAttribute("sessionId"));
      PointPageVO pageVO = new PointPageVO(cri, perDao.pfBuyTotal(cri));
      model.addAttribute("pageVO", pageVO);
      model.addAttribute("list1", perDao.pfBuyList2(cri));
      model.addAttribute("list2", movieDao.mvBuyList2(cri));

      vo.setUId((String) session.getAttribute("sessionId"));
      model.addAttribute("user", userDao.userSelectOne(vo));

      return "user/userBuyList";
   }

	@RequestMapping("/userPointList.do")
	public String userPointList(Model model, HttpSession session, PointCriteriaVO cri, UserVO vo) {
		cri.setUId((String) session.getAttribute("sessionId"));
		PointPageVO pageVO = new PointPageVO(cri, userDao.pointBuyTotal(cri)); // (기준, 토탈)
		model.addAttribute("pageVO", pageVO); // 페이지네이션전달
		model.addAttribute("list3", userDao.pointBuyList2(cri));

		vo.setUId((String) session.getAttribute("sessionId"));
		model.addAttribute("user", userDao.userSelectOne(vo));
		return "user/userPointList";
	}

	@RequestMapping(value = "/loginChk", produces = "application/text; charset=utf8")
	@ResponseBody
	public String loginChk(UserVO userVO, @RequestParam("UId") String UId) {
		userVO = userDao.loginChk(userVO);
		String address = userVO.getAddr();
		System.out.println(address);
		return address;
	}

	// 아이디 찾기
	@RequestMapping(value = "/userSearch.do", method = RequestMethod.POST)
	@ResponseBody
	public String userIdSearch(@RequestParam("name") String name, @RequestParam("phone") String phone) {

		String result = userDao.searchId(name, phone);

		return result;
	}
  
	// 비밀번호 찾기 메일 발송
	
    @RequestMapping(value = "/findpw.do", produces = "application/x-www-form-urlencoded; charset=UTF-8")
    @ResponseBody
    public String findPwPOST(@ModelAttribute UserVO vo, @RequestParam("id") String Id, @RequestParam("email") String email) throws Exception {
    	System.out.println(Id);
    	System.out.println(email);
    	vo.setUId(Id);
    	vo.setEmail(email);
        if (!userDao.findPw(vo)) {
        	System.out.println(vo);
      
            return  "아이디와 이메일이 일치하지 않습니다.\n입력하신 정보를 다시 한번 확인해주세요";
        }
        
        return "해당 이메일로 임시 비밀번호가 전송되었습니다.\n이메일을 확인해주세요";
    }
    
@RequestMapping("/userInfoCheck.do")
   public String userInfoCheck(UserVO vo, HttpSession session) {
      session.setAttribute("sessionId", vo.getUId());
      session.setAttribute("sessionPwd", vo.getPwd());

      UserVO login = userDao.loginChk(vo, session);
      System.out.println("===========================================");
      System.out.println("sesion : " + session.toString());
      System.out.println("login : " + login);
      System.out.println("vo : " + vo);
      System.out.println("===========================================");

      BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(10);
      boolean pwdChk = pwdEncoder.matches(vo.getPwd(), login.getPwd());
      System.out.println("pwdChk : " + pwdChk);

      if (login != null && pwdChk) {
         System.out.println("vo' UId : " + vo.getUId());
         System.out.println("vo' pwd : " + vo.getPwd());

         int result = userDao.pwdCheck(login);
         System.out.println("result : " + result);

         if (result == 1) {
            return "redirect:userUpdateForm.do";
         }

      }
      return "user/userInfoCheck";
   }
  
  @RequestMapping("/userInfoCheckForm.do")
   public String userInfoCheckForm() {
      return "user/userInfoCheck";
   }
  
  
  
  
//  @RequestMapping(value="/userDelete.do", method=RequestMethod.POST)
// 	public String userDelete(UserVO vo,RedirectAttributes rttr,HttpSession session){
// 		userDao.userDelete(vo);
// 		session.invalidate();
// 		rttr.addFlashAttribute("msg", "이용해주셔서 감사합니다.");
// 		return "redirect:/user/alert";
// 	}
  
  @RequestMapping(value="/pwdCheck.do" , method=RequestMethod.POST)
	@ResponseBody
	public int pwCheck(UserVO vo) throws Exception{
		String userPwd = userDao.pwdCheck2(vo.getUId());
		
		if(vo == null || !BCrypt.checkpw(vo.getPwd(), userPwd)) {
			return 0;
		}
		
		return 1;
	}
  
  
}