package com.third.prj.point.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PointVO {
	
	private int charge;
	private Date payDt;
	private int pay;
	private String cancelCd;
	private int payNo;
	private String Uid;
	private String buyCtntCd;
	
	//류지희
	private String dayDate;
	private int sales;
}
