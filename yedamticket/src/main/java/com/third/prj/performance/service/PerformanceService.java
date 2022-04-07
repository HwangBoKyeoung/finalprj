package com.third.prj.performance.service;

import java.util.List;
import java.util.Map;

public interface PerformanceService {

	List<PerformanceVO> perSelectList(CriteriaVO cri);
	PerformanceVO perSelect(PerformanceVO vo);
	int perforUpdate(PerformanceVO vo);
	
//	프로시저 호출(update에 필요)
	int procedureCall(Map<String, Object> map);
	
	public int countperf(CriteriaVO cri);
	public int totalPerf();
}
