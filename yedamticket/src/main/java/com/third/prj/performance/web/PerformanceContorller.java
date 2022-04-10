package com.third.prj.performance.web;

import java.io.File;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.third.prj.performance.service.PerformanceService;
import com.third.prj.performance.service.PerformanceVO;
import com.third.prj.performanceimage.service.PerformanceImageService;
import com.third.prj.performanceimage.service.PerformanceImageVO;
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
	private String upLoadPath;

	// 모두조회
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

	// 한건조회
	@RequestMapping("/pserSelect.do")
	public String perSelect(PerformanceVO vo, Model model) {
		PerformanceVideoVO vvo = new PerformanceVideoVO();
		PerformanceImageVO ivo = new PerformanceImageVO();

		vo = perDao.perSelect(vo);
		System.out.println("==================================" + vo.getPNo());
		vvo.setPNo(vo.getPNo());

		ivo.setFileCd(vo.getFileCd());

		ivo = periDao.periSelect(ivo);
		vvo = pervDao.pervSelect(vvo);

		model.addAttribute("images", ivo);
		model.addAttribute("pers", vo);
		model.addAttribute("videos", vvo);
		return "performance/perforUpForm";
	}

	/*
	 * @PostMapping("/performanceUpdate.do") public String performanceUpdate(Model
	 * model, PerformanceVO vo) { int n = perDao.perforUpdate(vo); if(n !=0) {
	 * return "redirect:/conPage.do"; } return "manager/admin/managerError"; }
	 */

	// 프로시저 수정
	@RequestMapping("/performanceUpdate.do")
	public String perSelect(Model model, @RequestParam("lname") String lname, @RequestParam("vname") String vname,
			Map<String, Object> map, PerformanceVO vo) {

		PerformanceVideoVO vvo = new PerformanceVideoVO();
		PerformanceImageVO ivo = new PerformanceImageVO();

//		vo = perDao.perSelect(vo);
//		model.addAttribute("pers",vo);
//		svo = persDao.persSelect(svo);
//		model.addAttribute("perse",svo);
//		ivo = periDao.periSelect(ivo);
//		model.addAttribute("persi",ivo);
//		vvo=pervDao.pervSelect(vvo);
//		model.addAttribute("persv",vvo);

		map.put("vp_no", vo.getPNo());
		map.put("p_name", vo.getName());
		map.put("p_content", vo.getContent());
		map.put("p_actor", vo.getActor());
		map.put("p_loc", vo.getLoc());
		map.put("p_addr", vo.getAddr());
		map.put("p_price", vo.getPrice());
		map.put("p_lname", lname);
		map.put("p_vname", vname);
		map.put("p_cd", vo.getFileCd());

		perDao.procedureCall(map);
		System.out.println(vo);
		System.out.println(ivo);
		System.out.println(vvo);
		System.out.println("프로시저콜 : ");

		return "redirect:/conPage.do";
	}

	@RequestMapping("/perInsertForm.do")
	public String perForInsertForm() {
		return "performance/perInsertForm";
	}

	@RequestMapping("/perInsert.do")
	public String perInsert(PerformanceVO vo, MultipartFile file) {

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
			System.out.println("insert suss");

		} catch (Exception e) {
			System.out.println("error");

			e.printStackTrace();
		}
		return "redirect:home.do";
	}

}
