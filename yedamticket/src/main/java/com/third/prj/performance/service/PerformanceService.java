package com.third.prj.performance.service;

import java.util.List; 
import java.util.Map;


public interface PerformanceService {

	List<PerformanceVO> perSelectList();
	PerformanceVO perSelect(PerformanceVO vo);
	int perforUpdate(PerformanceVO vo);
	
//	프로시저 호출(update에 필요)
	int procedureCall(Map<String, Object> map);
	//공연 구매내역
	List<PerformanceViewVO> pfBuyList(PerformanceViewVO vo);
	
	
}
