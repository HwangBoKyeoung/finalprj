package com.third.prj.point.vo;

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
	private String uId;
	private int pay;
	private String buyCtntCd;
}
