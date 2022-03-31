package com.third.prj.performance.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.prj.performance.service.PerformanceService;
import com.third.prj.performance.service.PerformanceVO;

@Controller
public class PerformanceContorller {

	@Autowired
	private PerformanceService perDao;
	
	@RequestMapping("/conPage.do")
	public String conPage(Model model) {
		model.addAttribute("pers", perDao.perSelectList());
		return "performance/perforList";
	}
	
//	@RequestMapping("/pserSelect.do")
//	public String perSelect(PerformanceVO vo, Model model) {
//		vo = perDao.perSelect(vo);
//		model.addAttribute("pers",vo);
//		return "performance/perforUpForm";
//	}
	
	@PostMapping("/performanceUpdate.do")
	public String performanceUpdate(Model model, PerformanceVO vo) {
		int n = perDao.perforUpdate(vo);
		if(n !=0) {
			return "redirect:/conPage.do";
		}
		return "manager/admin/managerError";
	}
	
	@RequestMapping("/pserSelect.do")
	public String perSelect(Model model, Map map, PerformanceVO vo) {
		map.put("p_name", vo.getName());
		perDao.procedureCall(map);
		System.out.println("프로시저콜 : ");
		
		return "performance/perforUpForm";
	}
	
}
