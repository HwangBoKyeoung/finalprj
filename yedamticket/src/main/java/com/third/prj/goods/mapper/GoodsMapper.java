package com.third.prj.goods.mapper;

import java.util.List;

import com.third.prj.goods.service.CriteriaVO;
import com.third.prj.goods.service.GoodsVO;

public interface GoodsMapper {
	
	List<GoodsVO> goodsList(String goodsCd);
	List<GoodsVO> goodsLi();
	GoodsVO goodsSelect(GoodsVO vo);
	
	int goodsUpdate(GoodsVO vo);
	int goodsDelete(GoodsVO vo);
	// 페이징
	public List<GoodsVO> getList(CriteriaVO cri);
	// 전체 게시글수
	public int getTotal(CriteriaVO cri);
}
