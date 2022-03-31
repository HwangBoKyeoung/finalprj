package com.third.prj.performanceschedule.service;

import java.util.List;

public interface PerformanceScheduleService {
	List<PerformanceScheduleVO> PerformanceScheduleList();
	int PSchedulUpdate(PerformanceScheduleVO vo);
}
