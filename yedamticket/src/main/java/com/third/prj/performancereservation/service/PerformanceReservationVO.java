package com.third.prj.performancereservation.service;

import java.sql.Date; 

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PerformanceReservationVO {
	
	private int pReservNo;
	private Date reserveDttm;
	private String cancelCd;
	private String uId;
	private int pSchNo;
	private String seatStatCd;
	private String seatNo;
	
	
}
