package com.third.prj.point.service;

import java.util.List;

public interface PointService {
	
	//차감될 금액 삽입
	int payInsert(PointVO vo);
	
	
	//관리자페이지 - 매출관련 -2022/04/12(RJH)
	List<PointVO> managerMovieSaleList();
}
