package com.third.prj.goods.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.goods.mapper.GoodsMapper;
import com.third.prj.goods.service.GoodsService;
import com.third.prj.goods.service.GoodsVO;

@Repository("goodsDao")
public class GoodsServiceImpl implements GoodsService {
	
	@Autowired
	private GoodsMapper mapper;

	@Override
	public List<GoodsVO> goodsList() {
		return mapper.goodsList();
	}

	@Override
	public int goodsInsert(GoodsVO vo) {
		// TODO Auto-generated method stub
		return mapper.goodsInsert(vo);
	}
	
}
