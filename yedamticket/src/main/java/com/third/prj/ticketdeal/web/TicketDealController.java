package com.third.prj.ticketdeal.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TicketDealController {
	
	@RequestMapping("/ticketassignment_1.do")
	public String ticketAssignment_1() {
		return "ticket/ticketassignment_1";
	}
}
