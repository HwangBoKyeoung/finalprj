package com.third.prj.performance.service;

import java.util.List;

import com.third.prj.point.service.PointCriteriaVO;

public interface PerformanceService {

	List<PerformanceVO> companyPerforSelectList(CriteriaVO cri);
	PerformanceVO perforSelect(PerformanceVO vo);
	int performanceUpdate(PerformanceVO vo);


	//공연 구매내역
	List<PerformanceViewVO> pfBuyList(PerformanceViewVO vo);
	
	//공연 예매 내역 리스트
	public List<PerformanceVO> pfBuyList2(PointCriteriaVO cri);
	
	//공연 구매 리스트 페이징
	public int pfBuyTotal(PointCriteriaVO cri);
	
	//공연 등록
	int perInsert(PerformanceVO vo);
	
	
	//리스트 페이징처리
	int getTotal(CriteriaVO cri);
	//황규복
	//그냥 공연전체리스트
	List<PerformanceVO> pList(CriteriaVO cri);
	//공연예정
	List<PerformanceVO> epList();
	//공연선택
	PerformanceVO pSelect(PerformanceVO vo);
	//지역별 공연리스트
	List<PerformanceVO> locPlist(PerformanceVO vo);
	
//	관객수 업데이트 쿼리 (류지희)
	int updatePerformanceAudience(PerformanceVO vo);
	//관리자페이지 업데이트쿼리(류지희)
		List<PerformanceVO> performancePopChart();
		
//	관리자페이지 기업회원조회
		List<PerformanceVO> cperList(PerformanceVO vo);
}
