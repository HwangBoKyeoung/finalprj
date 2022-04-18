package com.third.prj.user.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.third.prj.faq.service.FaqService;
import com.third.prj.movie.service.MovieService;
import com.third.prj.movie.service.MovieViewVO;
import com.third.prj.moviereservation.service.MovieReservVO;
import com.third.prj.notice.service.NoticeService;
import com.third.prj.performance.service.PerformanceService;
import com.third.prj.performance.service.PerformanceViewVO;
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
      return "signup/signup/signup_1";
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
      vo = userDao.userSelect(vo);

      model.addAttribute("users", vo);
      return "manager/user/managerUserSelect";
   }

   @RequestMapping("/userLogin.do")
   public ModelAndView userSelect(HttpSession session, UserVO vo, ModelAndView mv) {
//      userDao.userSelect(vo);
//      session.setAttribute("sessionId", vo.getUId());
//      session.setAttribute("sessionPwd", vo.getPwd());
      String msg = "";
      String url = "";
      UserVO login = userDao.loginChk(vo, session);
      BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(10);
      boolean pwdChk = pwdEncoder.matches(vo.getPwd(), login.getPwd());

      if (login != null && pwdChk) {
         int i = userDao.reservChk(vo);
         msg = "어서오세요 " + vo.getUId() + "님 \n\n 현재 결제해야 할 항목은 " + i + "건 입니다.";

         url = "home.do";

         session.setAttribute("sessionId", vo.getUId());
         session.setAttribute("sessionEmail", vo.getEmail());
         session.setAttribute("sessionName", vo.getName());
         session.setAttribute("sessionAddr", vo.getAddr());
         session.setAttribute("sessionPhone", vo.getPhone());
         mv.addObject("msg", msg);
         mv.addObject("url", url);
         mv.setViewName("user/alert");
      } else {
         msg = "아이디나 비밀번호가 일치하지 않습니다 다시 로그인 해주세요";
         url = "userLoginForm.do";
         mv.addObject("msg", msg);
         mv.addObject("url", url);
         mv.setViewName("user/alert");
      }
      return mv;
   }

   @RequestMapping("/userSelect.do")
   public String userSelect(HttpSession session, UserVO vo) {
      userDao.userSelect(vo);
      session.setAttribute("sessionId", vo.getUId());
      session.setAttribute("sessionPwd", vo.getPwd());
      System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
      System.out.println("id :" + vo.getUId());
      System.out.println("pwd :" + vo.getPwd());
      System.out.println("name :" + vo.getName());
      System.out.println("email :" + vo.getEmail());
      System.out.println("phone :" + vo.getPhone());
      System.out.println("addr :" + vo.getAddr());
      System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
      return "home/home";
   }

   @RequestMapping("/userService.do")
   public String userService(Model model) {
      model.addAttribute("notices", noticeDao.noticeSelectList());
      model.addAttribute("faqs", faqDao.faqSelectList());
      return "user/userService";
   }

   @RequestMapping("/userPage.do")
   public String userPage(Model model,UserVO vo, HttpSession session,UserCriteriaVO cri,UserPointViewVo pvo) {
      
      cri.setUId((String)session.getAttribute("sessionId"));
      vo.setUId((String)session.getAttribute("sessionId"));
      pvo.setUId((String)session.getAttribute("sessionId"));

      model.addAttribute("userPoint", userDao.userPoint(pvo));
      model.addAttribute("mvList", userDao.mvRList(cri));
      model.addAttribute("pfList", userDao.pfRList(cri));

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
   public String userDelete(UserVO vo, HttpSession session) {
      int n = userDao.userDelete(vo);

      if (n != 0) {
         session.invalidate();
         return "redirect:/";
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



//	@RequestMapping("/companyMyPage.do")
//	public String companyMyPage() {
//		return "companyMyPage/companyMyPage";
//	}

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
        }
            return  "아이디와 이메일이 일치하지 않습니다.\n입력하신 정보를 다시 한번 확인해주세요";
    }

}