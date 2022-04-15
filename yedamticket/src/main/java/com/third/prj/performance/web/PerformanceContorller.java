package com.third.prj.performance.web;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.ResponseBody;

import com.third.prj.performance.service.CriteriaVO;
import com.third.prj.performance.service.PageVO;
import com.third.prj.performance.service.PerformanceService;
import com.third.prj.performance.service.PerformanceVO;
import com.third.prj.performanceimage.service.PerformanceImageService;
import com.third.prj.performanceimage.service.PerformanceImageVO;

import com.third.prj.performancereservation.service.PerformanceReservationService;
import com.third.prj.performancereservation.service.PerformanceReservationVO;
import com.third.prj.performanceschedule.service.PerformanceScheduleService;
import com.third.prj.performanceschedule.service.PerformanceScheduleVO;
import com.third.prj.point.service.PointService;
import com.third.prj.point.service.PointVO;
import com.third.prj.user.service.UserService;
import com.third.prj.user.service.UserVO;


@Controller
public class PerformanceContorller {

	@Autowired
	private PerformanceService perDao;
	
	@Autowired
	private PerformanceScheduleService persDao;

	@Autowired
	private PerformanceImageService periDao;

	@Autowired
	private String upLoadPath;
	
	@Autowired
	private PerformanceReservationService performanceReservationDao;

	@Autowired
	private PerformanceScheduleService perSDao;
	@Autowired
	private UserService userDao;
	@Autowired
	private PointService pointDao;

	//황규복 start
	@RequestMapping("/pList.do")
	public String pList(Model model , CriteriaVO cri) {
		PageVO pageVO = new PageVO(cri, perDao.getTotal(cri));
		System.out.println("pList");
		model.addAttribute("pageVO", pageVO); //페이지네이션전달
		System.out.println("start"+cri.getStartDate());
		System.out.println("end"+cri.getEndDate());
		model.addAttribute("performance",perDao.pList(cri));
		model.addAttribute("Eperformance",perDao.epList());
		return "performance/pList";

	}


//	@RequestMapping("/pserSelect.do")
//	public String perSelect(PerformanceVO vo, Model model) {
	
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
		System.out.println("pschNO"+prvo.getPSchNo());
		System.out.println("LOC"+prvo.getLoc());
		System.out.println(prvo);
		System.out.println("===============" + performanceReservationDao.searchSeatNo(prvo));
		return performanceReservationDao.searchSeatNo(prvo);
	}
	
	//공연 결제폼으로
	@RequestMapping("/pReservation.do")
	public String pReservation(Model model,PerformanceReservationVO prvo,UserVO uservo,PerformanceScheduleVO psvo) {
		
		model.addAttribute("sch",perSDao.pSchSelect(psvo));
		model.addAttribute("re",prvo);
		model.addAttribute("user",userDao.userSelectOne(uservo));
		return "user/performance/pPayForm";
	}
	//공연 결제하기
	@RequestMapping("/pPay.do")
	public String pPay(PerformanceReservationVO vo,PointVO pointVO) {
		performanceReservationDao.pReservation(vo);
		pointDao.payInsert(pointVO);
		return "home/home";
	}
	//지역별 공연리스트
	@RequestMapping("/locPlist.do")
	@ResponseBody
	public List<PerformanceVO> locPlist(PerformanceVO vo){
		return perDao.locPlist(vo);
	}
	//황규복 end
	//한건조회
	@RequestMapping("/companyPerforUpdateForm.do")
	public String companyPerforUpdateForm(PerformanceVO vo, Model model) {
		PerformanceImageVO ivo = new PerformanceImageVO();
		vo = perDao.perforSelect(vo);
		System.out.println("==================================" + vo.getPNo());
		//vvo.setPNo(vo.getPNo());

		ivo.setFileCd(vo.getFileCd());

		ivo = periDao.periSelect(ivo);

		model.addAttribute("images", ivo);
		model.addAttribute("pers", vo);
		return "companyMyPage/companyPerforUpdateForm";
	}
	// 프로시저 수정
	@RequestMapping("/performanceUpdate.do")
	public String perSelect() {
		return "";
	}
	
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

	@RequestMapping("/perInsertForm.do")
	public String perForInsertForm() {
		return "performance/perInsertForm";
	}

	@RequestMapping("/perInsert.do")
	public String perInsert(PerformanceVO vo, MultipartFile file,PerformanceScheduleVO pvo) {
		
		System.out.println("==============="+vo);
		
		String fileName = file.getOriginalFilename(); // 원본파일명
		String id = UUID.randomUUID().toString();// 고유한 아이디 생성
		System.out.println("fileName: " + fileName);
		System.out.println("id: " + id);

		String targetFile = id + fileName.substring(fileName.lastIndexOf("."));

		File target = new File(upLoadPath, targetFile);

		try {
			FileCopyUtils.copy(file.getBytes(), target);
			System.out.println("copy suss");

			vo.setFileCd(fileName);
			vo.setRenames(targetFile);
			
			perDao.perInsert(vo);
			pvo.setPNo(vo.getPNo());
			persDao.pScheduleInsert(pvo);
			System.out.println("insert suss");

		} catch (Exception e) {
			System.out.println("error");

			e.printStackTrace();
		}
		return "redirect:home.do";
	}

}
