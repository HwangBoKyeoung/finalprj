package com.third.prj.performance.mapper;

import java.util.List;
import java.util.Map;

import com.third.prj.performance.service.CriteriaVO;
import com.third.prj.performance.service.PerformanceVO;
import com.third.prj.performance.service.PerformanceViewVO;
import com.third.prj.performancereservation.service.PerformanceReservationVO;
import com.third.prj.point.service.PointCriteriaVO;
import com.third.prj.user.service.UserCriteriaVO;

public interface PerformanceMapper {

	List<PerformanceVO> companyPerforSelectList(CriteriaVO vo);

	PerformanceVO perforSelect(PerformanceVO vo);

	int perforUpdate(PerformanceVO vo);

//	프로시저 호출(update에 필요)
	int procedureCall(Map<String, Object> map);
	int performanceUpdate(PerformanceVO vo);
	
	// 공연 구매내역
	List<PerformanceViewVO> pfBuyList(PerformanceViewVO vo);

	// 공연 예매 내역 리스트
	public List<PerformanceVO> pfBuyList2(PointCriteriaVO cri);

	public int pfBuyTotal(PointCriteriaVO cri);

	// 공연 등록
	int perInsert(PerformanceVO vo);

	// 기업회원 마이페이지
	int getTotal(CriteriaVO cri);

	// 공연 양수내역 리스트
	public List<PerformanceReservationVO> prList(UserCriteriaVO cri);

	// 황규복
	// 그냥 공연전체리스트
	List<PerformanceVO> pList(CriteriaVO cri);

	// 공연예정
	List<PerformanceVO> epList();

	// 공연선택
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
