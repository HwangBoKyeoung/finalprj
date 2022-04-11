package com.third.prj.performancereservation.service;

import java.util.List;

public interface PerformanceReservationService {

	// 보유 티켓
	List<PerformanceReservationViewVO> userTicket(PerformanceReservationViewVO performancereservationviewVO);
	
	// 예약상태 취소
	int cancelReserv(PerformanceReservationVO performanceReservationVO);
}
