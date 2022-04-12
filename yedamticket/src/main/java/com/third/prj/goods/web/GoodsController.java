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


@Controller
public class GoodsController {
	
	@Autowired
	private GoodsService goodsDao;
	
	@Autowired 
	private String upLoadPath;
	
	@RequestMapping("/cGoodsList.do")
	public String cGoodsList(Model model) {
		model.addAttribute("cGoods",goodsDao.goodsList());
		return "goods/cGoodsList";
	}
	
	@RequestMapping("/mGoodsList.do")
	public String mGoodsList(Model model) {
		model.addAttribute("mGoods",goodsDao.goodsList());
		return "goods/mGoodsList";
	}
	
	@RequestMapping("/cGoodsUpdateForm.do")
	public String cGoodsUpdateForm() {
		return "goods/cGoodsUpdateForm";
	}
	
	@RequestMapping("/mGoodsUpdateForm.do")
	public String mGoodsUpdateForm() {
		return "goods/mGoodsUpdateForm";
	}
	
	@RequestMapping("/goodsInsertForm.do")
	public String goodsInsertForm() {
		return "goods/goodsInsertForm";
	}
	
	@RequestMapping("/goodsInsert.do")
	public String goodsInsert(GoodsVO vo, MultipartFile file, HttpServletRequest request) {
		String fileName = file.getOriginalFilename(); //원본파일명
		String id = UUID.randomUUID().toString(); //고유한 유니크 아이디 생성
		System.out.println("fileName : " + fileName);
		System.out.println("id : " + id);
		
		String load = "C/DEV/apache-tomcat-9.0.56/webapps/upload";
		
		String targetFile = id + fileName.substring(fileName.lastIndexOf(".")); //마지막으로 만나느 .을 출력, 업로드시 같은 이름의 파일을 덮어써 버리는 현상 방지
		System.out.println("targetFile : " + targetFile);
		
		//File target = new File(request.getSession().getServletContext().getRealPath("upload"),targetFile);
		//File target = new File(request.getServletContext().getRealPath("upload"),targetFile);
		File target = new File(upLoadPath,targetFile);
		
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
			
		}catch(Exception e) {
			System.out.println("error");
			
			e.printStackTrace();
		}
		System.out.println("====================================================");
		System.out.println(vo.getGoodsCd());
		System.out.println("====================================================");
		if(vo.getGoodsCd().equals("mv")) {
			return "redirect:mGoodsList.do";
		}else {
			return "redirect:cGoodsList.do";			
		}
	}
	

}
