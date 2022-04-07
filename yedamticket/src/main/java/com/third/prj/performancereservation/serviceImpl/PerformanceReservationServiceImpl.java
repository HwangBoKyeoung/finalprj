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
	private PerformanceReservationMapper map;

	@Override
	public List<PerformanceReservationViewVO> userTicket(PerformanceReservationViewVO performancereservationviewVO) {
		return map.userTicket(performancereservationviewVO);
	}

}