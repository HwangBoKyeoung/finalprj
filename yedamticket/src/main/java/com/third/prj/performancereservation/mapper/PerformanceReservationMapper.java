package com.third.prj.performancereservation.mapper;

import java.util.List;

import com.third.prj.performancereservation.service.PerformanceReservationVO;

public interface PerformanceReservationMapper {
	// 보유 티켓
	List<PerformanceReservationVO> userTicket(PerformanceReservationVO performancereservationVO);
	//공연 결제
		int pReservation(PerformanceReservationVO prvo);
}
