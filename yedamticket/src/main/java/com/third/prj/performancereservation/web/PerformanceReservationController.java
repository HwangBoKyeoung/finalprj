package com.third.prj.performancereservation.web;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.prj.performancereservation.mapper.PerformanceReservationMapper;
import com.third.prj.performancereservation.service.PerformanceReservationService;
import com.third.prj.performancereservation.service.PerformanceReservationVO;
import com.third.prj.performancereservation.service.PerformanceReservationViewVO;

@Controller
public class PerformanceReservationController {
	@Autowired
	private PerformanceReservationService performancereservationDao;

	@RequestMapping("/ticketassignment_1.do")
	public String ticketAssignment_1(PerformanceReservationViewVO performancereservationviewVO, HttpSession session,
			Model model) {
		String UId = (String) session.getAttribute("sessionId");

		performancereservationviewVO.setUId(UId);
		performancereservationDao.userTicket(performancereservationviewVO);
		model.addAttribute("prInfo", performancereservationDao.userTicket(performancereservationviewVO));
		return "ticket/ticketassignment_1";
	}

	@RequestMapping("/ticketassignment_cancel.do")
	public String ticketCancel(PerformanceReservationVO performanceReservationVO,
			@RequestParam("PReservNo2") int PReservNo2) {
		System.out.println("===============================" + PReservNo2);
		performanceReservationVO.setPReservNo(PReservNo2);
		int i = performancereservationDao.cancelReserv(performanceReservationVO);
		if (i != 0) {
			return "redirect:ticketassignment_1.do";
		}
		return "ticket/ticketassignment_error";
	}

	@RequestMapping("/ticketassignment_error.do")
	public String ticketAssignmentError() {
		return "ticket/ticketassignment_error";
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
		String pReservNo = httpServletRequest.getParameter("PReservNo");
		String price = httpServletRequest.getParameter("price");
		String loc = httpServletRequest.getParameter("loc");
		String ownerAddr = httpServletRequest.getParameter("ownerAddr");
		String buyerAddr = httpServletRequest.getParameter("buyerAddr");

		model.addAttribute("RId", RId);
		model.addAttribute("PReservNo", pReservNo);
		model.addAttribute("price", price);
		model.addAttribute("loc", loc);
		model.addAttribute("ownerAddr", ownerAddr);
		model.addAttribute("buyerAddr", buyerAddr);
		return "ticket/ticketassignment_personal_3";
	}

	@RequestMapping("/ticketassignment_personal_4.do")
	public String TicketAssignment_Personal_4(HttpServletRequest httpServletRequest, PerformanceReservationVO performanceReservationVO, Model model) {
		String RId = httpServletRequest.getParameter("RId");
		System.out.println(RId);
		System.out.println("====================" + performanceReservationVO);
		int i = performancereservationDao.ticketReserv(performanceReservationVO);
		if(i!=0) {
			return "ticket/ticketassignment_personal_4";
		}
		return "ticket/ticketassignment_error";
	}
	
	@RequestMapping("/reservedticket_1.do")
	public String ReservedTicket_1(HttpServletRequest httpServletRequest, Model model) {
		String name = httpServletRequest.getParameter("name");
		String PReservNo = httpServletRequest.getParameter("PReservNo");
		String frDt = httpServletRequest.getParameter("frDt");
		String seatNo = httpServletRequest.getParameter("seatNo");
		String loc = httpServletRequest.getParameter("loc");
		String price = httpServletRequest.getParameter("price");
		
		model.addAttribute("name", name);
		model.addAttribute("PReservNo",PReservNo);
		model.addAttribute("frDt", frDt);
		model.addAttribute("seatNo", seatNo);
		model.addAttribute("loc", loc);
		model.addAttribute("price", price);
		
		return "ticket/reservedticket_1";
	}
	
	
}