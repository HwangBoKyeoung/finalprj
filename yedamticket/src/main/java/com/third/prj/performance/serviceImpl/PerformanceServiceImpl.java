package com.third.prj.performance.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.performance.mapper.PerformanceMapper;
import com.third.prj.performance.service.PerformanceService;
import com.third.prj.performance.service.PerformanceVO;
import com.third.prj.performanceschedule.service.PerformanceScheduleVO;

@Repository("perDao")
public class PerformanceServiceImpl implements PerformanceService {

	@Autowired
	public PerformanceMapper mapper;
	
	@Override
	public int perforUpdate(PerformanceVO vo) {
		return mapper.perforUpdate(vo);
	}


	@Override
	public PerformanceVO perSelect(PerformanceVO vo) {
		return mapper.perSelect(vo);
	}

	@Override
	public List<PerformanceVO> perSelectList() {
		return mapper.perSelectList();
	}

	@Override
	public int procedureCall(Map map) {
		return mapper.procedureCall(map);
	}


	@Override
	public List<PerformanceVO> pList() {
		// TODO Auto-generated method stub
		return mapper.pList();
	}


	@Override
	public List<PerformanceVO> pSearch(PerformanceVO vo) {
		// TODO Auto-generated method stub
		return mapper.pSearch(vo);
	}


	

}
