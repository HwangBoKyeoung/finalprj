package com.third.prj.performance.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.third.prj.performance.service.CriteriaVO;
import com.third.prj.performance.service.PageVO;
import com.third.prj.performance.service.PerformanceService;
import com.third.prj.performance.service.PerformanceVO;
import com.third.prj.performanceimage.service.PerformanceImageService;
import com.third.prj.performanceimage.service.PerformanceImageVO;

import com.third.prj.performancereservation.service.PerformanceReservationService;
import com.third.prj.performancereservation.service.PerformanceReservationVO;
import com.third.prj.performanceschedule.service.PerformanceScheduleVO;

@Controller
public class PerformanceContorller {

	@Autowired
	private PerformanceService perDao;
	@Autowired
	private PerformanceImageService periDao;
	@Autowired
	private PerformanceReservationService perRDao;

	//황규복 start
	//공연 리스트+예정 공연 리스트
	@RequestMapping("/pList.do")
	public String pList(Model model,CriteriaVO cri) {
		PageVO pageVO = new PageVO(cri, perDao.getTotal(cri));
		model.addAttribute("pageVO", pageVO); //페이지네이션전달
		model.addAttribute("performance",perDao.pList(cri));
		model.addAttribute("Eperformance",perDao.epList());
		return "performance/pList";
	}
	//공연 상세페이지 + 예약	
	@RequestMapping("/pBookingForm.do")
	public String pBookingForm(Model model,PerformanceVO vo) {
		System.out.println("name"+vo.getName());
		System.out.println("pNo"+vo.getPNo());
		
		vo = perDao.pSelect(vo);
		
		PerformanceScheduleVO pvo = new PerformanceScheduleVO();
		System.out.println("+++++++++++++++++++++++++++++++++++++++" + pvo);
		
		model.addAttribute("performance",perDao.pSelect(vo));
		
		return "performance/pBookingForm";
	}
	
	@RequestMapping("/searchSeatNo.do")
	@ResponseBody
	public List<PerformanceReservationVO> searchSeatNo(PerformanceReservationVO prvo) {
		return perRDao.searchSeatNo(prvo);
	}
	
	//공연 결제
	@RequestMapping("/pReservation.do")
	public String pReservation(Model model,PerformanceReservationVO prvo) {
		perRDao.pReservation(prvo);
		return "performance/pPayForm";
	}
	
	//황규복 end
	//한건조회
	@RequestMapping("/companyPerforUpdateForm.do")
	public String companyPerforUpdateForm(PerformanceVO vo, Model model) {
		PerformanceImageVO ivo = new PerformanceImageVO();

		vo = perDao.perforSelect(vo);
		System.out.println("==================================" + vo.getPNo());
		
		ivo.setFileCd(vo.getFileCd());
		
		ivo = periDao.periSelect(ivo);

		model.addAttribute("images", ivo);
		model.addAttribute("pers", vo);
		return "companyMyPage/companyPerforUpdateForm";
	}
  
	/*
	 * @PostMapping("/performanceUpdate.do") public String performanceUpdate(Model
	 * model, PerformanceVO vo) { int n = perDao.perforUpdate(vo); if(n !=0) {
	 * return "redirect:/conPage.do"; } return "manager/admin/managerError"; }
	 */

	//프로시저 수정
	@RequestMapping("/companyPerforUpdate.do")
	public String companyPerforUpdate(Model model, @RequestParam("lname") String lname, Map<String, Object> map, PerformanceVO vo) {

		PerformanceImageVO ivo = new PerformanceImageVO();

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

		return "redirect:/companyPerforList.do";
	}
	
	
}
