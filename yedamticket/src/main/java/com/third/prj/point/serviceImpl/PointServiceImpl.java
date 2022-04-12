package com.third.prj.point.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.point.mapper.PointMapper;
import com.third.prj.point.service.PointService;
import com.third.prj.point.service.PointVO;

@Repository("pointDao")
public class PointServiceImpl implements PointService{
	@Autowired
	private PointMapper mapper;
	@Override
	public int payInsert(PointVO vo) {
		// TODO Auto-generated method stub
		return mapper.payInsert(vo);
	}
	@Override
	public List<PointVO> managerMovieSaleList() {
		// TODO Auto-generated method stub
		return mapper.managerMovieSaleList();
	}
	
	
}
