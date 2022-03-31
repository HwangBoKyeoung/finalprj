package com.third.prj.performance.mapper;

import java.util.List;
import java.util.Map;

import com.third.prj.performance.service.PerformanceVO;

public interface PerformanceMapper {

	List<PerformanceVO> perSelectList();
	PerformanceVO perSelect(PerformanceVO vo);
	int perforUpdate(PerformanceVO vo);
	int perforDelete(PerformanceVO vo);
	
	public void procedureCall(Map map);
}
