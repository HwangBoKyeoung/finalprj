package com.third.prj.performance.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.performance.mapper.PerformanceMapper;
import com.third.prj.performance.service.PerformanceService;
import com.third.prj.performance.service.PerformanceVO;

@Repository("perDao")
public class PerformanceServiceImpl implements PerformanceService{

	@Autowired
	public PerformanceMapper map;
	@Override
	public int perforUpdate(PerformanceVO vo) {
		// TODO Auto-generated method stub
		return map.perforUpdate(vo);
	}

	@Override
	public int perforDelete(PerformanceVO vo) {
		// TODO Auto-generated method stub
		return map.perforDelete(vo);
	}

	@Override
	public PerformanceVO perSelect(PerformanceVO vo) {
		// TODO Auto-generated method stub
		return map.perSelect(vo);
	}

	@Override
	public List<PerformanceVO> perSelectList() {
		// TODO Auto-generated method stub
		return map.perSelectList();
	}

	
}
