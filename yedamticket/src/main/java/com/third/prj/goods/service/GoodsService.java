package com.third.prj.goods.service;

import java.util.List;

import com.third.prj.goods.vo.GoodsVO;

public interface GoodsService {
	List<GoodsVO> goodsList(String  goodsCd);
}
