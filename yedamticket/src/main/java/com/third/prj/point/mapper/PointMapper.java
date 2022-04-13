package com.third.prj.point.mapper;

import java.util.List;
import java.util.Map;

import com.third.prj.point.service.PointVO;

public interface PointMapper {
	//차감될 금액 삽입
	int payInsert(PointVO vo);
	
	//관리자페이지 - 매출관련 -2022/04/12(RJH)
	List<PointVO> managerMovieSaleList();
	
	List<PointVO> managerPerforSaleList();
}
