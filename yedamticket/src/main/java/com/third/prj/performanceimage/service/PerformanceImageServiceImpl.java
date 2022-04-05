package com.third.prj.performanceimage.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.performanceimage.mapper.PerformanceImageMapper;

@Repository("periDao")
public class PerformanceImageServiceImpl implements PerformanceImageService{
	
	@Autowired
	PerformanceImageMapper mapper;

	@Override
	public int procedureCall(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.procedureCall(map);
		
	}

	//조회 메소드
	@Override
	public PerformanceImageVO periSelect(PerformanceImageVO vo) {
		// TODO Auto-generated method stub
		return mapper.periSelect(vo);
	}

}
