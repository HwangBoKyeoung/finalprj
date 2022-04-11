package com.third.prj.performance.service;

import java.util.List;
import java.util.Map;



public interface PerformanceService {

	List<PerformanceVO> companyPerforSelectList(CriteriaVO cri);
	PerformanceVO perforSelect(PerformanceVO vo);
	int perforUpdate(PerformanceVO vo);

//	프로시저 호출(update에 필요)
	int procedureCall(Map<String, Object> map);
	
	//리스트 페이징처리
	int getTotal(CriteriaVO cri);
	//황규복
	//그냥 공연전체리스트
	List<PerformanceVO> pList(CriteriaVO cri);
	//공연예정
	List<PerformanceVO> epList();
	//공연선택
	PerformanceVO pSelect(PerformanceVO vo);

}
