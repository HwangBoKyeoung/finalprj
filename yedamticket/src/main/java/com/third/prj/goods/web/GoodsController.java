package com.third.prj.goods.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.third.prj.goods.service.CriteriaVO;
import com.third.prj.goods.service.GoodsService;
import com.third.prj.goods.service.GoodsVO;
import com.third.prj.goods.service.PageVO;


@Controller
public class GoodsController {
	
	@Autowired
	private GoodsService goodsDao;
	
	/*
	 * @Autowired private String upLoadPath;
	 */
	
	@RequestMapping("/cGoodsList.do")
	public String cGoodsList(Model model) {
		String goodsCd="1";
		model.addAttribute("cGoods",goodsDao.goodsList(goodsCd));
		return "goods/cGoodsList";
	}
	
	@RequestMapping("/mGoodsList.do")
	public String mGoodsList(Model model) {
		String goodsCd="0";
		model.addAttribute("mGoods",goodsDao.goodsList(goodsCd));
		return "goods/mGoodsList";
	}
	
	@RequestMapping("/goodsUpdateForm.do")
	public String goodsUpdateForm(GoodsVO vo) {
		goodsDao.goodsUpdate(vo);
		return "goods/goodsUpdateForm";
	}
	
	@RequestMapping("/goodsUpdate.do")
	public String goodsUpdate(GoodsVO vo, MultipartFile file) {
		/*
		 * String fileName = file.getOriginalFilename(); String id =
		 * UUID.randomUUID().toString(); // 고유한 유니크 아이디 생성 // 파일명 치환 String targetFile =
		 * id + fileName.substring(fileName.lastIndexOf("."));
		 * 
		 * File target = new File(upLoadPath, targetFile); // 파일 경로객체생성 try {
		 * FileCopyUtils.copy(file.getBytes(), target); // 파일전송 targetFile = upLoadPath
		 * + File.separator + targetFile; // 실제 경로를 포함해서 // DB vo.setFileCd(fileName);
		 * vo.setFileRe(targetFile); } catch(Exception e) { e.printStackTrace(); }
		 */
		int u = goodsDao.goodsUpdate(vo);
		
		if (u != 0) {
			return "redirect:goodsPage.do";
		}
		return "goods/goodsErr";
	}
	@RequestMapping("/goodsDelete.do")
	public String goodsDelete(GoodsVO vo) {
		int u = goodsDao.goodsDelete(vo);
		
		if (u != 0) {
			return "redirect:goodsPage.do";
		}
		return "goods/goodsErr";
	}
	
	//전체 조회
	@RequestMapping("/goodsPage.do")
	public String goodsPage(Model model, CriteriaVO cri) {
		PageVO pageVO = new PageVO(cri, goodsDao.getTotal(cri));
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("gods", goodsDao.getList(cri));
		return "goods/goodsPage";
	}
	
	//한건 조회
	@RequestMapping("/goodsSelect.do")
	public String goodsSelect(GoodsVO vo, Model model) {
		vo = goodsDao.goodsSelect(vo);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("goodsSelect run");
		System.out.println(vo);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		model.addAttribute("gds", vo);
			return "goods/goodsUpdateForm";
	}
	
	
	

}
