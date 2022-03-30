package com.third.prj.performance.service;

import java.util.List;

public interface PerformanceService {

	List<PerformanceVO> perSelectList();
	PerformanceVO perSelect(PerformanceVO vo);
	int perforUpdate(PerformanceVO vo);
	int perforDelete(PerformanceVO vo);
}
