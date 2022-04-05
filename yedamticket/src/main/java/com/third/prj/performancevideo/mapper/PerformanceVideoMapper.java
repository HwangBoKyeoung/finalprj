package com.third.prj.performancevideo.mapper;

import com.third.prj.performancevideo.service.PerformanceVideoVO;

public interface PerformanceVideoMapper {

//	int PVideoUpdate(PerformanceVideoVO vo);
	//performanceVideo조회 - 22/04/01(RJH)
	PerformanceVideoVO pervSelect(PerformanceVideoVO vo);
	
}
