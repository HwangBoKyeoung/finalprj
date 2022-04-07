package com.third.prj.goods.service;

import java.util.List;

public interface GoodsService {
	
	List<GoodsVO> goodsList(String goodsCd);
	List<GoodsVO> goodsLi();
	GoodsVO goodsSelect(GoodsVO vo);
	
	int goodsUpdate(GoodsVO vo);
	int goodsDelete(GoodsVO vo);
}
