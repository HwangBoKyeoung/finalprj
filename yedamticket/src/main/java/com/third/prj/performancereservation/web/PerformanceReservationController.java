package com.third.prj.performancereservation.web;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.prj.performancereservation.service.PerformanceReservationService;
import com.third.prj.performancereservation.service.PerformanceReservationViewVO;

@Controller
public class PerformanceReservationController {
	@Autowired
	private PerformanceReservationService performancereservationDao;

	/*
	 * @RequestMapping("/ticketassignment_1.do") public String
	 * ticketAssignment_1(PerformanceReservationVO performancereservationVO,
	 * HttpSession session, Model model) {
	 * performancereservationDao.userTicket(performancereservationVO);
	 * model.addAttribute("performancereservationInfo", performancereservationVO);
	 * session.getAttribute("sessionId");
	 * System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	 * System.out.println(session.getAttribute("sessionId"));
	 * System.out.println(performancereservationVO);
	 * System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@"); return
	 * "ticket/ticketassignment_1"; }
	 */

	@RequestMapping("/ticketassignment_1.do")
	public String ticketAssignment_1(PerformanceReservationViewVO performancereservationviewVO, HttpSession session, Model model) {
		String Uid = (String) session.getAttribute("sessionId");
		performancereservationviewVO.setUid(Uid);
		performancereservationDao.userTicket(performancereservationviewVO);
		model.addAttribute("prInfo", performancereservationDao.userTicket(performancereservationviewVO));
		return "ticket/ticketassignment_1";
	}

	@RequestMapping("/ticketassignment_2.do")
	public String ticketAssignment_2(HttpServletRequest httpServletRequest, Model model) {
		String name = httpServletRequest.getParameter("name");
		String date = httpServletRequest.getParameter("date");
		String seat = httpServletRequest.getParameter("seatNo");
		String price = httpServletRequest.getParameter("price");
		String loc = httpServletRequest.getParameter("loc");
		
		model.addAttribute("name", name);
		model.addAttribute("date", date);
		model.addAttribute("seatNo", seat);
		model.addAttribute("price", price);
		model.addAttribute("loc", loc);
		
		return "ticket/ticketassignment_2";
	}

	@RequestMapping("/ticketassignment_personal_1.do")
	public String TicketAssignment_Personal_1(Model model, HttpServletRequest httpServletRequest) {
		String name = httpServletRequest.getParameter("name");
		String date = httpServletRequest.getParameter("date");
		String seat = httpServletRequest.getParameter("seatNo");
		String price = httpServletRequest.getParameter("price");
		String loc = httpServletRequest.getParameter("loc");
		
		model.addAttribute("name", name);
		model.addAttribute("date", date);
		model.addAttribute("seatNo", seat);
		model.addAttribute("price", price);
		model.addAttribute("loc", loc);
		return "ticket/ticketassignment_personal_1"; 
	}
}