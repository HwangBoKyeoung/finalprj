package com.third.prj.performance.service;

import java.sql.Date; 

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PerformanceViewVO {
	private int pReservNo;
	private String name;
	private Date payDt;
	private int pay;
	private int charge;
	private int point;
	private String buyCtntCd;
	private String UId;
}
