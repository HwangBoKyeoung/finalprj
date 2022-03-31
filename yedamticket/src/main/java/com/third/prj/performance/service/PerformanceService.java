package com.third.prj.performance.service;

import java.util.List;
import java.util.Map;

public interface PerformanceService {

	List<PerformanceVO> perSelectList();
	PerformanceVO perSelect(PerformanceVO vo);
	int perforUpdate(PerformanceVO vo);
	int perforDelete(PerformanceVO vo);
	public void procedureCall(Map map);
}
