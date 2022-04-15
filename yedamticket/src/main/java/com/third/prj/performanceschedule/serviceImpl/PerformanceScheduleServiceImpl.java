package com.third.prj.performanceschedule.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.performanceschedule.mapper.PerformanceScheduleMapper;
import com.third.prj.performanceschedule.service.PerformanceScheduleService;
import com.third.prj.performanceschedule.service.PerformanceScheduleVO;

@Repository("pfmcDao")
//@Repository("persDao")
public class PerformanceScheduleServiceImpl implements PerformanceScheduleService {
	
	@Autowired PerformanceScheduleMapper mapper;
	
	
	@Override
	public List<PerformanceScheduleVO> PerformanceScheduleList() {
		return mapper.PerformanceScheduleList();
	}


	@Override
	public int PSchedulUpdate(PerformanceScheduleVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int pScheduleInsert(PerformanceScheduleVO vo) {
		// TODO Auto-generated method stub
		return mapper.pScheduleInsert(vo);
	}
	@Override
	public List<PerformanceScheduleVO> PerformanceScheduleList2(PerformanceScheduleVO vo) {
		// TODO Auto-generated method stub
		return mapper.PerformanceScheduleList2(vo);
	}


	@Override
	public PerformanceScheduleVO pSchSelect(PerformanceScheduleVO psvo) {
		// TODO Auto-generated method stub
		return mapper.pSchSelect(psvo);
	}




}
