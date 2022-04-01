package com.third.prj.performance.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.prj.performance.service.PerformanceService;
import com.third.prj.performance.service.PerformanceVO;
import com.third.prj.performanceimage.service.PerformanceImageService;
import com.third.prj.performanceimage.service.PerformanceImageVO;
import com.third.prj.performanceschedule.service.PerformanceScheduleService;
import com.third.prj.performanceschedule.service.PerformanceScheduleVO;
import com.third.prj.performancevideo.service.PerformanceVideoService;
import com.third.prj.performancevideo.service.PerformanceVideoVO;

@Controller
public class PerformanceContorller {

	@Autowired
	private PerformanceService perDao;	
	
	@Autowired
	private PerformanceImageService periDao;
	@Autowired
	private PerformanceVideoService pervDao;
	
	@Autowired
	private PerformanceScheduleService persDao;
	
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
	public String perSelect(Model model, Map<String, Object> map, PerformanceVO vo) {
	
		PerformanceScheduleVO svo = new PerformanceScheduleVO();
		PerformanceVideoVO vvo = new PerformanceVideoVO();
		PerformanceImageVO ivo = new PerformanceImageVO();
				
		vo = perDao.perSelect(vo);
		model.addAttribute("pers",vo);
		svo = persDao.persSelect(svo);
		model.addAttribute("perse",svo);
		ivo = periDao.periSelect(ivo);
		model.addAttribute("persi",ivo);
		vvo=pervDao.pervSelect(vvo);
		model.addAttribute("persv",vvo);
		
		map.put("p_name", vo.getName());
		map.put("p_content", vo.getContent());
		map.put("p_actor",vo.getActor());
		map.put("p_loc", vo.getLoc());
		map.put("p_addr", vo.getAddr());
		map.put("p_price", vo.getPrice());
		map.put("p_Iname", ivo.getIname());
		map.put("p_Irname", ivo.getIrenames());
		map.put("p_frdt", svo.getFrDt());
		map.put("p_scno", svo.getPSchNo());
		map.put("p_time", svo.getTime());
		map.put("p_vname ", vvo.getVname());
		map.put("p_vrename ", vvo.getVrenames());
		map.put("p_cd", vvo.getFileCd());
		perDao.procedureCall(map);
		System.out.println(vo);
		System.out.println(ivo);
		System.out.println(svo);
		System.out.println(vvo);
		System.out.println("프로시저콜 : ");
		
		return "performance/perforUpForm";
	}
	
}
