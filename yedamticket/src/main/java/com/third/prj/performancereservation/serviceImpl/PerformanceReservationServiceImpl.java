package com.third.prj.performancereservation.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.performancereservation.mapper.PerformanceReservationMapper;
import com.third.prj.performancereservation.service.PerformanceReservationService;
import com.third.prj.performancereservation.service.PerformanceReservationVO;
import com.third.prj.performancereservation.service.PerformanceReservationViewVO;

@Repository("performanceReservationDao")
public class PerformanceReservationServiceImpl implements PerformanceReservationService{

	@Autowired
	private PerformanceReservationMapper mapper;

	@Override
	public List<PerformanceReservationViewVO> userTicket(PerformanceReservationViewVO performancereservationviewVO) {
		return mapper.userTicket(performancereservationviewVO);
	}

	@Override
	public int cancelReserv(PerformanceReservationVO performanceReservationVO) {
		return mapper.cancelReserv(performanceReservationVO);
	}

	@Override
	public int ticketReserv(PerformanceReservationVO performanceReservationVO) {
		return mapper.ticketReserv(performanceReservationVO);
	}

	@Override
	public int pReservation(PerformanceReservationVO prvo) {
		// TODO Auto-generated method stub
		return mapper.pReservation(prvo);
	}

	@Override
	public List<PerformanceReservationVO> searchSeatNo(PerformanceReservationVO prvo) {
		// TODO Auto-generated method stub
		return mapper.searchSeatNo(prvo);
	}

	@Override
	public List<PerformanceReservationVO> userTicket(PerformanceReservationVO performancereservationVO) {
		// TODO Auto-generated method stub
		return mapper.userTicket(performancereservationVO);
	}

	@Override
	public int ticketToMarket(int PReservNo) {
		return mapper.ticketToMarket(PReservNo);
	}

	@Override
	public List<PerformanceReservationViewVO> TicketMarket(PerformanceReservationViewVO performanceReservationViewVO) {
		return mapper.TicketMarket(performanceReservationViewVO);
	}
}