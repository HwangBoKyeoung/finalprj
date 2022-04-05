package com.third.prj.performance.service;

import java.util.List;
import java.util.Map;

public interface PerformanceService {

	List<PerformanceVO> perSelectList();
	PerformanceVO perSelect(PerformanceVO vo);
	int perforUpdate(PerformanceVO vo);
	int perforDelete(PerformanceVO vo);
	
//	프로시저 호출(update에 필요)
	int procedureCall(Map<String, Object> map);
	
}
