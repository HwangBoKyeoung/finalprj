package com.third.prj.performancereservation.mapper;

import java.util.List;
import java.util.Map;

import com.third.prj.performancereservation.service.PerformanceReservationVO;
import com.third.prj.performancereservation.service.PerformanceReservationViewVO;

public interface PerformanceReservationMapper {
	
	// 보유 티켓
	List<PerformanceReservationViewVO> userTicket(PerformanceReservationViewVO performancereservationviewVO);
	
	// 예약상태 취소
	int cancelReserv(PerformanceReservationVO performanceReservationVO);

	// 예약
	int ticketReserv(PerformanceReservationVO performanceReservationVO);
	
	List<PerformanceReservationVO> userTicket(PerformanceReservationVO performancereservationVO);
	
	//공연 결제
	int pReservation(PerformanceReservationVO performancereservationVO);
	
	//loc와 P_sch_no를 넘기면 예약된좌석리스트를 가져옴
	List<PerformanceReservationVO> searchSeatNo(PerformanceReservationVO performancereservationVO);

	// 자유시장으로 올리기
	int ticketToMarket(int PReservNo);	
	
	// 자유시장 리스트
	List<PerformanceReservationViewVO> TicketMarket(PerformanceReservationViewVO performanceReservationViewVO);
	
	// 개인이 갖고있는 티켓 환불
	int cancelpersonalPerf(Map<String, Object> map);
}
