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
		return 0;
	}

}
