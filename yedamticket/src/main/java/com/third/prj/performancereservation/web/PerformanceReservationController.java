package com.third.prj.performancereservation.web;

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
	public String ticketAssignment_1(PerformanceReservationViewVO performancereservationviewVO ,HttpSession session, Model model) {
		String Uid = (String) session.getAttribute("sessionId");
		performancereservationviewVO.setUid(Uid);
		System.out.println("-------------------------------" + performancereservationviewVO);
		performancereservationDao.userTicket(performancereservationviewVO);
		System.out.println("-------------------------------||" + performancereservationviewVO);
		model.addAttribute("prInfo", performancereservationDao.userTicket(performancereservationviewVO));
//		session.getAttribute("sessionId");
		return "ticket/ticketassignment_1";
	}
}