package com.third.prj.performanceschedule.web;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.third.prj.performanceschedule.service.PerformanceScheduleService;


@Controller
public class PerformanceScheduleController {
	@Autowired PerformanceScheduleService pfmcDao;
	
	@RequestMapping("/consertCalender.do")
	@ResponseBody
	public List consertCalender(HttpServletRequest req, HttpServletResponse res) {
		res.setContentType("text/json; charset=utf-8");
		
		return pfmcDao.PerformanceScheduleList();
	}
	
	@RequestMapping("/consertSchedule.do")
	public String consertSchedule() {
		return "consert/consertSchedule";
	}
}
