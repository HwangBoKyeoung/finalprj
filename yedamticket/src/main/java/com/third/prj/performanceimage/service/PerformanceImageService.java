package com.third.prj.performanceimage.service;

import java.util.Map;

public interface PerformanceImageService {

	//int PImageUpdate(PerformanceImageVO vo);
	
	//performanceImage 조회 - 22/04/01(RJH)
	PerformanceImageVO periSelect(PerformanceImageVO vo);
	//per_pro 프로시저 호출용 - 22/03/31(RJH)
	int procedureCall(Map<String, Object> map);
	
}
