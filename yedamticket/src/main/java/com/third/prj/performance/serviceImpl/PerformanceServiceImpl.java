package com.third.prj.performance.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.performance.mapper.PerformanceMapper;
import com.third.prj.performance.service.PerformanceService;
import com.third.prj.performance.service.PerformanceVO;

@Repository("perDao")
public class PerformanceServiceImpl implements PerformanceService{

	@Autowired
	public PerformanceMapper mapper;
	@Override
	public int perforUpdate(PerformanceVO vo) {
		// TODO Auto-generated method stub
		return mapper.perforUpdate(vo);
	}

	@Override
	public int perforDelete(PerformanceVO vo) {
		// TODO Auto-generated method stub
		return mapper.perforDelete(vo);
	}

	@Override
	public PerformanceVO perSelect(PerformanceVO vo) {
		// TODO Auto-generated method stub
		return mapper.perSelect(vo);
	}

	@Override
	public List<PerformanceVO> perSelectList() {
		// TODO Auto-generated method stub
		return mapper.perSelectList();
	}

	@Override
	public void procedureCall(Map map) {
		mapper.procedureCall(map);
	}

	
}
