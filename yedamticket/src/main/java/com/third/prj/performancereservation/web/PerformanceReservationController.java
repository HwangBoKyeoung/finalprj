package com.third.prj.performancereservation.web;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.prj.moviereservation.service.MovieReservService;
import com.third.prj.moviereservation.service.MovieReservViewVO;
import com.third.prj.performancereservation.service.PerformanceReservationService;
import com.third.prj.performancereservation.service.PerformanceReservationVO;
import com.third.prj.performancereservation.service.PerformanceReservationViewVO;
import com.third.prj.user.service.UserService;
import com.third.prj.user.service.UserVO;

@Controller
public class PerformanceReservationController {
	@Autowired
	private PerformanceReservationService performancereservationDao;

	@Autowired
	private MovieReservService moviereservDao;
	
	@Autowired
	private UserService userDao;

	// TicketMarket
	// -------------------------------------------------------------------------------------------------------

	@RequestMapping("/ticketmarket_1.do")
	public String ticketMarket_1(PerformanceReservationViewVO performancereservationViewVO, Model model) {
		List<PerformanceReservationViewVO> tic = performancereservationDao.TicketMarket(performancereservationViewVO);
		model.addAttribute("list", tic);

		return "ticket/ticketmarket_1";
	}

	@RequestMapping("/ticketmarket_2.do")
	public String ticketMarket_2(HttpServletRequest httpServletRequest, Model model) {
		String name = httpServletRequest.getParameter("name");
		String pReservNo = httpServletRequest.getParameter("PReservNo");
		String date = httpServletRequest.getParameter("date");
		String seat = httpServletRequest.getParameter("seatNo");
		String price = httpServletRequest.getParameter("price");
		int price2 = Integer.parseInt(price);
		price2 *= 1.1;
		String loc = httpServletRequest.getParameter("loc");
		String buyerAddr = httpServletRequest.getParameter("buyerAddr");
		String ownerAddr = httpServletRequest.getParameter("ownerAddr");
		String UId = httpServletRequest.getParameter("UId");

		model.addAttribute("name", name);
		model.addAttribute("PReservNo", pReservNo);
		model.addAttribute("date", date);
		model.addAttribute("seatNo", seat);
		model.addAttribute("price", price2);
		model.addAttribute("loc", loc);
		model.addAttribute("buyerAddr", buyerAddr);
		model.addAttribute("ownerAddr", ownerAddr);
		model.addAttribute("UId", UId);
		return "ticket/ticketmarket_2";
	}

	@RequestMapping("/ticketmarket_3.do")
	public String ticketMarket_3(HttpServletRequest httpServletRequest, Model model) {
		String name = httpServletRequest.getParameter("name");
		String pReservNo = httpServletRequest.getParameter("PReservNo");
		String date = httpServletRequest.getParameter("date");
		String seat = httpServletRequest.getParameter("seatNo");
		String price = httpServletRequest.getParameter("price");
		String loc = httpServletRequest.getParameter("loc");
		String buyerAddr = httpServletRequest.getParameter("buyerAddr");
		String ownerAddr = httpServletRequest.getParameter("ownerAddr");
		String UId = httpServletRequest.getParameter("UId");

		model.addAttribute("name", name);
		model.addAttribute("PReservNo", pReservNo);
		model.addAttribute("date", date);
		model.addAttribute("seatNo", seat);
		model.addAttribute("price", price);
		model.addAttribute("loc", loc);
		model.addAttribute("buyerAddr", buyerAddr);
		model.addAttribute("ownerAddr", ownerAddr);
		model.addAttribute("UId", UId);
		return "ticket/ticketmarket_3";
	}

	@RequestMapping("/ticketmarket_4.do")
	public String TicketMarket_4(HttpServletRequest httpServletRequest, Model model, HttpSession session,
			Map<String, Object> map) {
		String PReservNo = httpServletRequest.getParameter("PReservNo");
//		String point = httpServletRequest.getParameter("point");
		String price = httpServletRequest.getParameter("price");
		String UId = httpServletRequest.getParameter("UId");
		String sessionId = (String) session.getAttribute("sessionId");

		int price2 = Integer.parseInt(price);
		int PReservNo2 = Integer.parseInt(PReservNo);

		map.put("p1", sessionId);
		map.put("p2", UId);
		map.put("p3", price2);
		map.put("p4", PReservNo2);

		userDao.reservedBuy(map);
		return "redirect:userPage.do";
	}
	// TicketMarket
	// END----------------------------------------------------------------------------------------------------

	// TicketAssignment
	// ---------------------------------------------------------------------------------------------------

	@RequestMapping("/ticketassignment_1.do")
	public String ticketAssignment_1(PerformanceReservationViewVO performancereservationviewVO, MovieReservViewVO moviereservviewVO,HttpSession session, Model model) {
		String UId = (String) session.getAttribute("sessionId");

		performancereservationviewVO.setUId(UId);
		moviereservviewVO.setUId(UId);
		performancereservationDao.userTicket(performancereservationviewVO);
		moviereservDao.userMovie(moviereservviewVO);
		
		
		model.addAttribute("prInfo", performancereservationDao.userTicket(performancereservationviewVO));
		model.addAttribute("mrInfo", moviereservDao.userMovie(moviereservviewVO));
		return "ticket/ticketassignment_1";
	}

	@RequestMapping("/ticketassignment_2.do")
	public String ticketAssignment_2(HttpServletRequest httpServletRequest, Model model) {
		String name = httpServletRequest.getParameter("name");
		String pReservNo = httpServletRequest.getParameter("PReservNo");
		String date = httpServletRequest.getParameter("date");
		String seat = httpServletRequest.getParameter("seatNo");
		String price = httpServletRequest.getParameter("price");
		String loc = httpServletRequest.getParameter("loc");

		model.addAttribute("name", name);
		model.addAttribute("PReservNo", pReservNo);
		model.addAttribute("date", date);
		model.addAttribute("seatNo", seat);
		model.addAttribute("price", price);
		model.addAttribute("loc", loc);

		return "ticket/ticketassignment_2";
	}

	@RequestMapping("/ticketassignment_cancel.do")
	public String ticketCancel(PerformanceReservationVO performanceReservationVO,
			@RequestParam("PReservNo2") int PReservNo2) {
		performanceReservationVO.setPReservNo(PReservNo2);
		int i = performancereservationDao.cancelReserv(performanceReservationVO);
		if (i != 0) {
			return "redirect:userPage.do";
		}
		return "ticket/ticketassignment_error";
	}

	@RequestMapping("/ticketassignment_error.do")
	public String ticketAssignmentError() {
		return "ticket/ticketassignment_error";
	}

	// TicketAssignment
	// END------------------------------------------------------------------------------------------------

	// TicketAssignment_personal
	// ------------------------------------------------------------------------------------------

	@RequestMapping("/ticketassignment_personal_1.do")
	public String TicketAssignment_Personal_1(Model model, HttpServletRequest httpServletRequest) {
		String name = httpServletRequest.getParameter("name");
		String pReservNo = httpServletRequest.getParameter("PReservNo");
		String date = httpServletRequest.getParameter("date");
		String seat = httpServletRequest.getParameter("seatNo");
		String price = httpServletRequest.getParameter("price");
		String loc = httpServletRequest.getParameter("loc");

		model.addAttribute("name", name);
		model.addAttribute("PReservNo", pReservNo);
		model.addAttribute("date", date);
		model.addAttribute("seatNo", seat);
		model.addAttribute("price", price);
		model.addAttribute("loc", loc);
		return "ticket/ticketassignment_personal_1";
	}

	@RequestMapping("/ticketassignment_personal_2.do")
	public String TicketAssignment_Personal_2(HttpServletRequest httpServletRequest, Model model, LocalDate now) {
		String name = httpServletRequest.getParameter("name");
		String RId = httpServletRequest.getParameter("RId");
		String UId = httpServletRequest.getParameter("UId");
		String pReservNo = httpServletRequest.getParameter("PReservNo");
		String date = httpServletRequest.getParameter("date");
		String today = httpServletRequest.getParameter("today");
		String seat = httpServletRequest.getParameter("seatNo");
		String price = httpServletRequest.getParameter("price");
		String loc = httpServletRequest.getParameter("loc");
		String ownerAddr = httpServletRequest.getParameter("ownerAddr");
		String buyerAddr = httpServletRequest.getParameter("buyerAddr");

		model.addAttribute("name", name);
		model.addAttribute("RId", RId);
		model.addAttribute("UId", UId);
		model.addAttribute("PReservNo", pReservNo);
		model.addAttribute("date", date);
		model.addAttribute("today", today);
		model.addAttribute("seatNo", seat);
		model.addAttribute("price", price);
		model.addAttribute("loc", loc);
		model.addAttribute("ownerAddr", ownerAddr);
		model.addAttribute("buyerAddr", buyerAddr);

		return "ticket/ticketassignment_personal_2";
	}

	@RequestMapping("/ticketassignment_personal_3.do")
	public String TicketAssignment_Personal_3(HttpServletRequest httpServletRequest, Model model) {
		String RId = httpServletRequest.getParameter("RId");
		String UId = httpServletRequest.getParameter("UId");
		String pReservNo = httpServletRequest.getParameter("PReservNo");
		String price = httpServletRequest.getParameter("price");
		String loc = httpServletRequest.getParameter("loc");
		String ownerAddr = httpServletRequest.getParameter("ownerAddr");
		String buyerAddr = httpServletRequest.getParameter("buyerAddr");

		model.addAttribute("RId", RId);
		model.addAttribute("UId", UId);
		model.addAttribute("PReservNo", pReservNo);
		model.addAttribute("price", price);
		model.addAttribute("loc", loc);
		model.addAttribute("ownerAddr", ownerAddr);
		model.addAttribute("buyerAddr", buyerAddr);
		return "ticket/ticketassignment_personal_3";
	}

	@RequestMapping("/ticketassignment_personal_4.do")
	public String TicketAssignment_Personal_4(HttpServletRequest httpServletRequest,
			PerformanceReservationVO performanceReservationVO, Model model) {
		String RId = httpServletRequest.getParameter("RId");
		System.out.println(RId);
		System.out.println("====================" + performanceReservationVO);
		int i = performancereservationDao.ticketReserv(performanceReservationVO);
		if (i != 0) {
			model.addAttribute("msg", "양도 신청이 완료되었습니다!");
			return "user/alert3";
		}
		return "ticket/ticketassignment_error";
	}

	// TicketAssignment_personal
	// END---------------------------------------------------------------------------------------

	// TicketAssignment_market
	// --------------------------------------------------------------------------------------------

	@RequestMapping("/ticketassignment_market_1.do")
	public String TicketAssignment_Personal_4(HttpServletRequest httpServletRequest, Model model) {
		String name = httpServletRequest.getParameter("name");
		String pReservNo = httpServletRequest.getParameter("PReservNo");
		String date = httpServletRequest.getParameter("date");
		String seat = httpServletRequest.getParameter("seatNo");
		String price = httpServletRequest.getParameter("price");
		String loc = httpServletRequest.getParameter("loc");

		model.addAttribute("name", name);
		model.addAttribute("PReservNo", pReservNo);
		model.addAttribute("date", date);
		model.addAttribute("seatNo", seat);
		model.addAttribute("price", price);
		model.addAttribute("loc", loc);

		return "ticket/ticketassignment_market_1";
	}

	@RequestMapping("/ticketassignment_market_2.do")
	public String TicketAssignment_Market_2(HttpServletRequest httpServletRequest, Model model, LocalDate now) {
		String name = httpServletRequest.getParameter("name");
		String pReservNo = httpServletRequest.getParameter("PReservNo");
		String date = httpServletRequest.getParameter("date");
		String today = httpServletRequest.getParameter("today");
		String seat = httpServletRequest.getParameter("seatNo");
		String price = httpServletRequest.getParameter("price");
		String loc = httpServletRequest.getParameter("loc");
		String ownerAddr = httpServletRequest.getParameter("ownerAddr");

		model.addAttribute("name", name);
		model.addAttribute("PReservNo", pReservNo);
		model.addAttribute("date", date);
		model.addAttribute("today", today);
		model.addAttribute("seatNo", seat);
		model.addAttribute("price", price);
		model.addAttribute("loc", loc);
		model.addAttribute("ownerAddr", ownerAddr);
		return "ticket/ticketassignment_market_2";
	}

	@RequestMapping("/ticketassignment_market_3.do")
	public String TicketAssignment_Market_3(HttpServletRequest httpServletRequest, Model model, HttpSession session) {
		String PReservNo = httpServletRequest.getParameter("PReservNo");
		String price = httpServletRequest.getParameter("price");
		String loc = httpServletRequest.getParameter("loc");
		String ownerAddr = httpServletRequest.getParameter("ownerAddr");
		String sessionId = (String) session.getAttribute("sessionId");
		int PReservNo2 = Integer.parseInt(PReservNo);

		model.addAttribute("PReservNo", PReservNo);
		model.addAttribute("price", price);
		model.addAttribute("loc", loc);
		model.addAttribute("ownerAddr", ownerAddr);
		model.addAttribute("sessionId", sessionId);
		model.addAttribute("msg","자유거래 등록이 완료되었습니다.");	
		
		performancereservationDao.ticketToMarket(PReservNo2);
		
		return "ticket/ticketassignment_market_3";
	}
	// TicketAssignment_market
	// END-----------------------------------------------------------------------------------------

	// ReservedTicket
	// -----------------------------------------------------------------------------------------------------

	@RequestMapping("/reservedticket_1.do")
	public String ReservedTicket_1(HttpServletRequest httpServletRequest, Model model, UserVO userVO,
			HttpSession session) {
		String name = httpServletRequest.getParameter("name");
		String PReservNo = httpServletRequest.getParameter("PReservNo");
		String frDt = httpServletRequest.getParameter("frDt");
		String seatNo = httpServletRequest.getParameter("seatNo");
		String loc = httpServletRequest.getParameter("loc");
		long price = Long.parseLong((httpServletRequest.getParameter("price")));
		String UId = httpServletRequest.getParameter("UId");
		long price2 = price;

		String sessionId = (String) session.getAttribute("sessionId");

		userVO = userDao.getUser2(sessionId);
		long point = userVO.getPoint();

		model.addAttribute("point", point);
		model.addAttribute("name", name);
		model.addAttribute("PReservNo", PReservNo);
		model.addAttribute("frDt", frDt);
		model.addAttribute("seatNo", seatNo);
		model.addAttribute("loc", loc);
		model.addAttribute("price", price2);
		model.addAttribute("UId", UId);

		return "ticket/reservedticket_1";
	}

	@RequestMapping("/reservedticket_2.do")
	public String ReservedTicket_2(HttpServletRequest httpServletRequest, Model model, HttpSession session,
			Map<String, Object> map) {
		String PReservNo = httpServletRequest.getParameter("PReservNo");
//		String point = httpServletRequest.getParameter("point");
		String price = httpServletRequest.getParameter("price");
		String UId = httpServletRequest.getParameter("UId");
		String sessionId = (String) session.getAttribute("sessionId");

		int price2 = Integer.parseInt(price);
		int PReservNo2 = Integer.parseInt(PReservNo);

		map.put("p1", sessionId);
		map.put("p2", UId);
		map.put("p3", price2);
		map.put("p4", PReservNo2);

		userDao.reservedBuy(map);
		return "redirect:userPage.do";
	}

	// ReservedTicket
	// END--------------------------------------------------------------------------------------------------

	// CancelReservedTicket
	// --------------------------------------------------------------------------------------------------
	@RequestMapping("/cancelticket_1.do")
	public String CancelTicket_1(PerformanceReservationVO performanceReservationVO,
			HttpServletRequest httpServletRequest, @RequestParam("CPReservNo") int CPReservNo) {
		performanceReservationVO.setPReservNo(CPReservNo);
		int i = performancereservationDao.cancelReserv(performanceReservationVO);
		if (i != 0) {
			return "redirect:userPage.do";
		} else {
			return "user/errorPage";
		}
	}

	@RequestMapping("/cancelPersonalTicket.do")
	public String cancelPersonalTicket(Map<String, Object> map, HttpServletRequest request, HttpSession session) {
		String UId = (String) session.getAttribute("sessionId");
		int reserv = Integer.parseInt(request.getParameter("pr3PReservNo2"));
		int price = Integer.parseInt(request.getParameter("pr3price"));
		
		map.put("p1", UId);
		map.put("p2", price);
		map.put("p3", reserv);
		int i = performancereservationDao.cancelpersonalPerf(map);
		if(i != 0) {
			return "user/userPage";			
		}else {
			return "user/errorPage";
		}
	}
	
	// CancelReservedTicket
	// END-----------------------------------------------------------------------------------------------

}
