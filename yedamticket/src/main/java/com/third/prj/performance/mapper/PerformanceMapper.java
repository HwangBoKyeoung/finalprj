package com.third.prj.performance.mapper;

import java.util.List;
import java.util.Map;

import com.third.prj.performance.service.PerformanceVO;
import com.third.prj.performance.service.PerformanceViewVO;
import com.third.prj.point.service.PointCriteriaVO;

public interface PerformanceMapper {

	List<PerformanceVO> perSelectList();
	PerformanceVO perSelect(PerformanceVO vo);
	int perforUpdate(PerformanceVO vo);
	
//	프로시저 호출(update에 필요)
	int procedureCall(Map<String, Object> map);
	
	//공연 구매내역
	List<PerformanceViewVO> pfBuyList(PerformanceViewVO vo);
	
	//공연 예매 내역 리스트
	public List<PerformanceVO> pfBuyList2(PointCriteriaVO cri);
	
	//공연 예매 리스트 페이징
	public int pfBuyTotal(PointCriteriaVO cri);
	
	

	
}
