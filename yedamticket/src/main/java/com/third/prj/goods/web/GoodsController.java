package com.third.prj.goods.web;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.third.prj.goods.service.GoodsService;


@Controller
public class GoodsController {
	@Autowired
	private GoodsService goodsDao;
	
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
	
	@RequestMapping("/cGoodsUpdateForm.do")
	public String cGoodsUpdateForm() {
		
		return "goods/cGoodsUpdateForm";
	}

}
