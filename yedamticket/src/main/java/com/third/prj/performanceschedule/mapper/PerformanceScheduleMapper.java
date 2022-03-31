package com.third.prj.performanceschedule.mapper;


import java.util.List;

import com.third.prj.performanceschedule.service.PerformanceScheduleVO;

public interface PerformanceScheduleMapper {

	List<PerformanceScheduleVO> PerformanceScheduleList();
	int PSchedulUpdate(PerformanceScheduleVO vo);

}
