package com.third.prj.performancereservation.service;

import java.util.List;

public interface PerformanceReservationService {

	// 보유 티켓
	List<PerformanceReservationVO> userTicket(PerformanceReservationVO performancereservationVO);
}