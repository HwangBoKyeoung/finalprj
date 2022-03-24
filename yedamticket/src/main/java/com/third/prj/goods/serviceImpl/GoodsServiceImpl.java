package com.third.prj.goods.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.goods.service.GoodsMapper;
import com.third.prj.goods.service.GoodsService;
import com.third.prj.goods.vo.GoodsVO;
@Repository("goodsDao")
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsMapper map;

	@Override
	public List<GoodsVO> goodsList(String goodsCd) {
		// TODO Auto-generated method stub
		return map.goodsList(goodsCd);
	}
	
	

}
