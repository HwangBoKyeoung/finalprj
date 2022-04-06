package com.third.prj.point.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PointVO {
	
	private int charge;
	private Date payDt;
	private String cancelCd;
	private int payNo;
	private String Uid;
	private int pay;
	private String buyCtntCd;
	
}
