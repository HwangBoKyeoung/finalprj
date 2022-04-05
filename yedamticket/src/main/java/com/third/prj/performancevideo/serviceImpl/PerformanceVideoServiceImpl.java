package com.third.prj.performancevideo.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.performancevideo.mapper.PerformanceVideoMapper;
import com.third.prj.performancevideo.service.PerformanceVideoService;
import com.third.prj.performancevideo.service.PerformanceVideoVO;
@Repository("pervDao")
public class PerformanceVideoServiceImpl implements PerformanceVideoService {

	@Autowired
	private PerformanceVideoMapper map;
	@Override
	public PerformanceVideoVO pervSelect(PerformanceVideoVO vo) {
		// TODO Auto-generated method stub
		return map.pervSelect(vo);
	}

}
