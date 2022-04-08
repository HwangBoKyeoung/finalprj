package com.third.prj.performance.mapper;

import java.util.List;
import java.util.Map;

import com.third.prj.performance.service.CriteriaVO;
import com.third.prj.performance.service.PerformanceVO;

public interface PerformanceMapper {

	List<PerformanceVO> perSelectList(CriteriaVO vo);
	PerformanceVO perSelect(PerformanceVO vo);
	int perforUpdate(PerformanceVO vo);
	
//	프로시저 호출(update에 필요)
	int procedureCall(Map<String, Object> map);
	
	//기업회원 마이페이지
	int getTotal(CriteriaVO cri);
}
