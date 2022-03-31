package com.third.prj.performanceschedule.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.third.prj.performanceschedule.mapper.PerformanceScheduleMapper;
import com.third.prj.performanceschedule.service.PerformanceScheduleService;
import com.third.prj.performanceschedule.service.PerformanceScheduleVO;

public class PerformanceScheduleServiceImpl implements PerformanceScheduleService {
	
	@Autowired PerformanceScheduleMapper map;
	
	@Override
	public List<PerformanceScheduleVO> PerformanceScheduleList() {
		// TODO Auto-generated method stub
		return map.PerformanceScheduleList();
	}

}
