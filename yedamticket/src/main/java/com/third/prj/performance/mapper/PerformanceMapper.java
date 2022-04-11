package com.third.prj.performance.mapper;

import java.util.List;
import java.util.Map;

import com.third.prj.performance.service.CriteriaVO;
import com.third.prj.performance.service.PerformanceVO;
import com.third.prj.performancereservation.service.PerformanceReservationVO;


public interface PerformanceMapper {

	List<PerformanceVO> companyPerforSelectList(CriteriaVO vo);
	PerformanceVO perforSelect(PerformanceVO vo);
	int perforUpdate(PerformanceVO vo);
	
//	프로시저 호출(update에 필요)
	int procedureCall(Map<String, Object> map);
	
	//기업회원 마이페이지
	int getTotal(CriteriaVO cri);

	//황규복
	//그냥 공연전체리스트
	List<PerformanceVO> pList(CriteriaVO cri);
	//공연예정
	List<PerformanceVO> epList();
	//공연선택
	PerformanceVO pSelect(PerformanceVO vo);

}
