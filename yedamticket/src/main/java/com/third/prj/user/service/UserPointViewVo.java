package com.third.prj.user.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserPointViewVo {
	private int charge;
	private Date chargeDt;
	private String UId;
	private int point;
	private int pay;
	private Date payDt;
	private int tempPoint;
	private String buyCtntCd;
	private int payNo;
}
