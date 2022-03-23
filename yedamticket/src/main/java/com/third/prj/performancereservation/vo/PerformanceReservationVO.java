package com.third.prj.performancereservation.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PerformanceReservationVO {
	private int pReservNo;
	private Date reserveDttm;
	private String cancelCd;
	private String uId;
	private int pSchNo;
	private String seatStatCd;
	private String seatNo;
}
