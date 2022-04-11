package com.third.prj.performanceschedule.web;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.third.prj.performanceschedule.service.PerformanceScheduleService;
import com.third.prj.performanceschedule.service.PerformanceScheduleVO;


@Controller
public class PerformanceScheduleController {
	@Autowired PerformanceScheduleService pfmcDao;
	
	@RequestMapping("/concertSch.do")
	public String concertSch(Model model) {
//		List<PerformanceScheduleVO> list = pfmcDao.PerformanceScheduleList();
//		model.addAttribute("schs", list);
		return "consert/concert";
	}
	
	@RequestMapping("/consertCalender.do")
	@ResponseBody
	public List consertCalender(HttpServletRequest req, HttpServletResponse res) {
		res.setContentType("text/json; charset=utf-8");
		List<PerformanceScheduleVO> list = pfmcDao.PerformanceScheduleList();
//		model.addAttribute("schs", list);
		return list;
	}
	
	@RequestMapping("/consertSchedule.do")
	public String consertSchedule() {
		return "consert/consertSchedule";
	}
	
	@RequestMapping("/ajaxModalForm.do")
	@ResponseBody
	public List<PerformanceScheduleVO> ajaxModalForm(PerformanceScheduleVO vo) {
		System.out.println("---------"+vo.getStart());
		//vo.setFrDt(vo.getStart());
		System.out.println("*********"+vo);
		List<PerformanceScheduleVO> list = pfmcDao.PerformanceScheduleList2(vo);
		return list;
	}
	
	@RequestMapping("/modalForm.do")
	public String modalForm(Model model, PerformanceScheduleVO vo) {
		return "u/consert/modalForm";
	}
}
