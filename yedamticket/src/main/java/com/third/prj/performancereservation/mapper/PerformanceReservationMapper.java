package com.third.prj.performancereservation.mapper;

import java.util.List;

import com.third.prj.performancereservation.service.PerformanceReservationVO;
import com.third.prj.performancereservation.service.PerformanceReservationViewVO;

public interface PerformanceReservationMapper {
	// 보유 티켓
	List<PerformanceReservationViewVO> userTicket(PerformanceReservationViewVO performancereservationviewVO);
	
	// 예약상태 취소
	int cancelReserv(PerformanceReservationVO performanceReservationVO);
}
