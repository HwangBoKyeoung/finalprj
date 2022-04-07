package com.third.prj.goods.mapper;

import java.util.List;

import com.third.prj.goods.service.GoodsVO;

public interface GoodsMapper {
	
	List<GoodsVO> goodsList(String goodsCd);
	List<GoodsVO> goodsLi();
	GoodsVO goodsSelect(GoodsVO vo);
	
	int goodsUpdate(GoodsVO vo);
	int goodsDelete(GoodsVO vo);
}
