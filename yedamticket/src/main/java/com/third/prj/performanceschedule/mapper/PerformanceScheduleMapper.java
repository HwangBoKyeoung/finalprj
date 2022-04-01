package com.third.prj.performanceschedule.mapper;


import java.util.List;

import com.third.prj.performanceschedule.service.PerformanceScheduleVO;

public interface PerformanceScheduleMapper {

	List<PerformanceScheduleVO> PerformanceScheduleList();
	int PSchedulUpdate(PerformanceScheduleVO vo);
	
	//performanceSchdule 프로시저에서 조회용도 - 22/04/01(RJH)
	PerformanceScheduleVO persSelect(PerformanceScheduleVO vo);

}
