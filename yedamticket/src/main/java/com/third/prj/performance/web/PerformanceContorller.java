package com.third.prj.performance.web;

import java.io.File;
import java.sql.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.third.prj.performance.service.CriteriaVO;
import com.third.prj.performance.service.PageVO;
import com.third.prj.performance.service.PerformanceService;
import com.third.prj.performance.service.PerformanceVO;
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

//	@Autowired
//	private PerformanceImageService periDao;

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
	public String pList(Model model , CriteriaVO cri, PerformanceVO vo, PerformanceScheduleVO psvo) {
		PageVO pageVO = new PageVO(cri, perDao.getTotal(cri));
		System.out.println("pList");
		model.addAttribute("pageVO", pageVO); //페이지네이션전달
		System.out.println("start"+cri.getStartDate());
		System.out.println("end"+cri.getEndDate());
		model.addAttribute("performance",perDao.pList(cri));
		
		model.addAttribute("vo", vo);
		System.out.println("************************************"+vo);
		model.addAttribute("psvo", psvo);
		System.out.println("===================================="+psvo);
//		model.addAttribute("Eperformance",perDao.epList());
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
		return "performance/pPayForm";
	}
	//공연 결제하기
	@RequestMapping("/pPay.do")
	@ResponseBody
	public String pPay(PerformanceReservationVO vo,PointVO pointVO, PerformanceVO pvo,UserVO userVO) {
		performanceReservationDao.pReservation(vo);
		System.out.println("preservationVO"+vo);
		int n=pointDao.payInsert(pointVO);
		userDao.payPoint(userVO);
		System.out.println("n"+n);

		perDao.updatePerformanceAudience(pvo);
		if(n != 0) {
			return "success";
		}else {
			return "fail";
		}
		
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

		vo = perDao.perforSelect(vo);
		System.out.println("==================================" + vo.getPNo());
		//vvo.setPNo(vo.getPNo());

		model.addAttribute("pers", vo);
		return "companyMyPage/companyPerforUpdateForm";
	}
	
	@RequestMapping("/managerPerforSelect.do")
	public String managerPerforSelect(PerformanceVO vo, Model model) {
		model.addAttribute("pers", perDao.perforSelect(vo));
		return "manager/manager/managerPerforSelect";
	}

	/*
	 * @PostMapping("/performanceUpdate.do") public String performanceUpdate(Model
	 * model, PerformanceVO vo) { int n = perDao.perforUpdate(vo); if(n !=0) {
	 * return "redirect:/conPage.do"; } return "manager/admin/managerError"; }
	 */

	// 기업회원 공연수정
	@RequestMapping("/companyPerforUpdate.do")
	public String perSelect(PerformanceVO vo,MultipartFile file) {
		String fileName = file.getOriginalFilename();
		String id = UUID.randomUUID().toString();
		String load = upLoadPath;
 
		try {
			String targetFile = id + fileName.substring(fileName.lastIndexOf('.'));
			System.out.println(targetFile);
			File target = new File(load, targetFile);
			FileCopyUtils.copy(file.getBytes(), target);
				vo.setFileCd(fileName);
				vo.setRenames(targetFile);
		}catch (Exception e) {
			e.printStackTrace();
		}
		perDao.performanceUpdate(vo);
			return "redirect:/companyPerforList.do";
	}
	// 프로시저 수정
//	@RequestMapping("/performanceUpdate.do")
//	public String perSelect() {
//		return "";
//	}
	
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
	//관리자페이지 공연 인기순위
	@RequestMapping("/perforpopularitychart.do")
	public String perforpopularitychart() {
		return "manager/manager/managerPerfoPoprChart";
	}
	@RequestMapping("/perforPop.do")
	@ResponseBody
	public List<PerformanceVO> perforPop(PerformanceVO vo){
		List<PerformanceVO> list = perDao.performancePopChart();
		return list;
	}

	
}
