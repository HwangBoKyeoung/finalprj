package com.third.prj.performancereservation.service;

import java.util.List;

public interface PerformanceReservationService {

	// 보유 티켓
	List<PerformanceReservationVO> userTicket(PerformanceReservationVO performancereservationVO);
	
	//공연 결제
	int pReservation(PerformanceReservationVO prvo);
	//loc와 P_sch_no를 넘기면 예약된좌석리스트를 가져옴
	List<PerformanceReservationVO> searchSeatNo(PerformanceReservationVO prvo);
}
