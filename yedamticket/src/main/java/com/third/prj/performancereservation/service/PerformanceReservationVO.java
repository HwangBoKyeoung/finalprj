package com.third.prj.performancereservation.service;

import java.sql.Date; 

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PerformanceReservationVO {
	
	private int PReservNo;
	private Date reserveDttm;
	private String status;
	private String Uid;
	private int PSchNo;
	private String seatStatCd;
	private String seatNo;
	private String Rid;
	private String cancelCd;
	private String UId;
	private int PSchNo;
	private String seatStatCd;
	private String loc;//구역
	private String seatNo;//좌석번호
}
