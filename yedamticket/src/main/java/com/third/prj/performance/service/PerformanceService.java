package com.third.prj.performance.service;

import java.util.List;
import java.util.Map;

import com.third.prj.performanceschedule.service.PerformanceScheduleVO;

public interface PerformanceService {

	List<PerformanceVO> perSelectList();
	PerformanceVO perSelect(PerformanceVO vo);
	int perforUpdate(PerformanceVO vo);

//	프로시저 호출(update에 필요)
	int procedureCall(Map<String, Object> map);
	
	//황규복
	//그냥 공연전체리스트
	List<PerformanceVO> pList();
	//pList에서 공연검색
	List<PerformanceVO> pSearch(PerformanceVO vo);
}
