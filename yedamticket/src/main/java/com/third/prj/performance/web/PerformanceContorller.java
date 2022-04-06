package com.third.prj.performance.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.prj.performance.service.PerformanceService;
import com.third.prj.performance.service.PerformanceVO;
import com.third.prj.performanceimage.service.PerformanceImageService;
import com.third.prj.performanceimage.service.PerformanceImageVO;

@Controller
public class PerformanceContorller {

	@Autowired
	private PerformanceService perDao;

	@Autowired
	private PerformanceImageService periDao;


	//모두조회
	@RequestMapping("/conPage.do")
	public String conPage(Model model) {
		model.addAttribute("pers", perDao.perSelectList());
		return "performance/perforList";
	}

	@RequestMapping("/pList.do")
	public String pList() {
		
		return "performance/pList";
	}
	
//	@RequestMapping("/pserSelect.do")
//	public String perSelect(PerformanceVO vo, Model model) {

	//한건조회
	@RequestMapping("/pserSelect.do")
	public String perSelect(PerformanceVO vo, Model model) {
		PerformanceImageVO ivo = new PerformanceImageVO();

		vo = perDao.perSelect(vo);
		System.out.println("==================================" + vo.getPNo());
		
		ivo.setFileCd(vo.getFileCd());
		
		ivo = periDao.periSelect(ivo);

		model.addAttribute("images", ivo);
		model.addAttribute("pers", vo);
		return "performance/perforUpForm";
	}
  
	/*
	 * @PostMapping("/performanceUpdate.do") public String performanceUpdate(Model
	 * model, PerformanceVO vo) { int n = perDao.perforUpdate(vo); if(n !=0) {
	 * return "redirect:/conPage.do"; } return "manager/admin/managerError"; }
	 */

	//프로시저 수정
	@RequestMapping("/performanceUpdate.do")
	public String perSelect(Model model, @RequestParam("lname") String lname, Map<String, Object> map, PerformanceVO vo) {

		PerformanceImageVO ivo = new PerformanceImageVO();

//		vo = perDao.perSelect(vo);
//		model.addAttribute("pers",vo);
//		svo = persDao.persSelect(svo);
//		model.addAttribute("perse",svo);
//		ivo = periDao.periSelect(ivo);
//		model.addAttribute("persi",ivo);

		map.put("vp_no", vo.getPNo());
		map.put("p_name", vo.getName());
		map.put("p_content", vo.getContent());
		map.put("p_actor", vo.getActor());
		map.put("p_loc", vo.getLoc());
		map.put("p_addr", vo.getAddr());
		map.put("p_price", vo.getPrice());
		map.put("p_lname", lname);
		map.put("p_cd", vo.getFileCd());

		perDao.procedureCall(map);
		System.out.println(vo);
		System.out.println(ivo);
		System.out.println("프로시저콜 : ");

		return "redirect:/conPage.do";
	}
	
	
}
