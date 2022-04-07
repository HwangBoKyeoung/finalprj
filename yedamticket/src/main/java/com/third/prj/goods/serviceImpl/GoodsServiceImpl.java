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
	public List<GoodsVO> goodsList(String goodsCd) {
		return mapper.goodsList(goodsCd);
	}

	@Override
	public int goodsUpdate(GoodsVO vo) {
		return mapper.goodsUpdate(vo);
	}


	@Override
	public GoodsVO goodsSelect(GoodsVO vo) {
		// TODO Auto-generated method stub
		return mapper.goodsSelect(vo);
	}

	@Override
	public List<GoodsVO> goodsLi() {
		// TODO Auto-generated method stub
		return mapper.goodsLi();
	}

	@Override
	public int goodsDelete(GoodsVO vo) {
		// TODO Auto-generated method stub
		return mapper.goodsDelete(vo);
	}
	
}
