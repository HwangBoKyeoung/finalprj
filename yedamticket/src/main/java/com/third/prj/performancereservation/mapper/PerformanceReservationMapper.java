package com.third.prj.performancereservation.mapper;

import java.util.List;

import com.third.prj.performancereservation.service.PerformanceReservationVO;
import com.third.prj.performancereservation.service.PerformanceReservationViewVO;

public interface PerformanceReservationMapper {
	// 보유 티켓

	List<PerformanceReservationViewVO> userTicket(PerformanceReservationViewVO performancereservationviewVO);
	
	// 예약상태 취소
	int cancelReserv(PerformanceReservationVO performanceReservationVO);

	List<PerformanceReservationVO> userTicket(PerformanceReservationVO performancereservationVO);
	//공연 결제
	int pReservation(PerformanceReservationVO prvo);
	//loc와 P_sch_no를 넘기면 예약된좌석리스트를 가져옴
	List<PerformanceReservationVO> searchSeatNo(PerformanceReservationVO prvo);
}
