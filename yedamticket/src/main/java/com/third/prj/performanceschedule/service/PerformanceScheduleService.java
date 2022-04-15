package com.third.prj.performanceschedule.service;

import java.util.List;

public interface PerformanceScheduleService {
	
	List<PerformanceScheduleVO> PerformanceScheduleList();
	int PSchedulUpdate(PerformanceScheduleVO vo);

	//공연스케쥴 등록
	int pScheduleInsert (PerformanceScheduleVO vo);

	//공연 테이블과 공연스케쥴테이블 조인
	PerformanceScheduleVO pSchSelect(PerformanceScheduleVO psvo);

	
	List<PerformanceScheduleVO> PerformanceScheduleList2(PerformanceScheduleVO vo);
}
