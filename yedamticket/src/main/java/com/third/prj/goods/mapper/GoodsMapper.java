package com.third.prj.goods.mapper;

import java.util.List;

import com.third.prj.goods.service.GoodsVO;

public interface GoodsMapper {
	
	List<GoodsVO> goodsList();
	//굿즈등록
	int goodsInsert(GoodsVO vo);
	
}
