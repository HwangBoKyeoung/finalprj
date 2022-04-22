package com.third.prj.goods.web;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.third.prj.goods.service.GoodsService;
import com.third.prj.goods.service.GoodsVO;

import com.third.prj.goods.service.CriteriaVO;
import com.third.prj.goods.service.PageVO;

@Controller
public class GoodsController {

	@Autowired
	private GoodsService goodsDao;

	@Autowired
	private String upLoadPath;

	@RequestMapping("/cGoodsList.do")
	public String cGoodsList(Model model,GoodsVO vo) {
		String goodsCd = "pf";
		vo.setGoodsCd(goodsCd);
		model.addAttribute("cGoods", goodsDao.cGoodsList(vo));
		return "goods/cGoodsList";
	}

	@RequestMapping("/mGoodsList.do")
	public String mGoodsList(Model model,GoodsVO vo) {
	
		String goodsCd = "mv";
		vo.setGoodsCd(goodsCd);
		model.addAttribute("mGoods", goodsDao.mGoodsList(vo));

		return "goods/mGoodsList";
	}

	@RequestMapping("/goodsUpdateForm.do")
	public String goodsUpdateForm(GoodsVO vo) {
		goodsDao.goodsUpdate(vo);
		return "goods/goodsUpdateForm";
	}

	@RequestMapping("/goodsUpdate.do")
	public String goodsUpdate(GoodsVO vo, MultipartFile file) { // , MultipartFile file

		String fileName = file.getOriginalFilename();
		String id = UUID.randomUUID().toString(); // 고유한 유니크 아이디 생성
		// 파일명 치환
		// String targetFile = id + fileName;
		String targetFile = id + fileName.substring(fileName.lastIndexOf("."));
		System.out.println(targetFile);
		File target = new File(upLoadPath, targetFile); // 파일 경로객체생성
		try {
			FileCopyUtils.copy(file.getBytes(), target); // 파일전송
			targetFile = File.separator + targetFile; // 실제 경로를 포함해서
			// DB
			vo.setFileCd(fileName);
			vo.setFileRe(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

		int u = goodsDao.goodsUpdate(vo);

		if (u != 0) {
			return "redirect:goodsPage.do";
		}
		return "goods/goodsErr";
	}

	@RequestMapping("/goodsInsertForm.do")
	public String goodsInsertForm() {
		return "goods/goodsInsertForm";
	}

	@RequestMapping("/goodsInsert.do")
	public String goodsInsert(GoodsVO vo, MultipartFile file, HttpServletRequest request) {
		String fileName = file.getOriginalFilename(); // 원본파일명
		String id = UUID.randomUUID().toString(); // 고유한 유니크 아이디 생성
		System.out.println("fileName : " + fileName);
		System.out.println("id : " + id);

		String load = "C/DEV/apache-tomcat-9.0.56/webapps/upload";

		String targetFile = id + fileName.substring(fileName.lastIndexOf(".")); // 마지막으로 만나느 .을 출력, 업로드시 같은 이름의 파일을 덮어써
																				// 버리는 현상 방지
		System.out.println("targetFile : " + targetFile);

		// File target = new
		// File(request.getSession().getServletContext().getRealPath("upload"),targetFile);
		// File target = new
		// File(request.getServletContext().getRealPath("upload"),targetFile);
		File target = new File(upLoadPath, targetFile);

		System.out.println("---------------------------------------------------------");
		System.out.println(request.getSession().getServletContext().getRealPath(load));
		System.out.println("---------------------------------------------------------");
		System.out.println("target :" + target);

		try {
			FileCopyUtils.copy(file.getBytes(), target);
			System.out.println("copy suss");

			vo.setFileCd(fileName);
			vo.setFileRe(targetFile);

			goodsDao.goodsInsert(vo);
			System.out.println("insert suss");

		} catch (Exception e) {
			System.out.println("error");

			e.printStackTrace();
		}
		System.out.println("====================================================");
		System.out.println(vo.getGoodsCd());
		System.out.println("====================================================");
		if (vo.getGoodsCd().equals("mv")) {
			return "redirect:mGoodsList.do";
		} else {
			return "redirect:cGoodsList.do";
		}
	}

	@RequestMapping("/goodsDelete.do")
	public String goodsDelete(GoodsVO vo) {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("vo : " + vo);
		int d = goodsDao.goodsDelete(vo);

		System.out.println("d : " + d);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

		if (d != 0) {
			return "redirect:goodsPage.do";
		}
		return "goods/goodsErr";

	}

	// 전체 조회
	@RequestMapping("/goodsPage.do")
	public String goodsPage(Model model, CriteriaVO cri) {
		PageVO pageVO = new PageVO(cri, goodsDao.getTotal(cri));
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("gods", goodsDao.getList(cri));
		return "goods/goodsPage";
	}

	// 한건 조회
	@RequestMapping("/goodsSelect.do")
	public String goodsSelect(GoodsVO vo, Model model) {
		vo = goodsDao.goodsSelect(vo);
		// System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		// System.out.println("goodsSelect run");
		// System.out.println(vo);
		// System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		model.addAttribute("gds", vo);
		return "goods/goodsUpdateForm";
	}

}
