package com.third.prj.goods.service;

import java.util.List;

public interface GoodsService {
	
	List<GoodsVO> goodsList();
	//굿즈등록
	int goodsInsert(GoodsVO vo);
}
