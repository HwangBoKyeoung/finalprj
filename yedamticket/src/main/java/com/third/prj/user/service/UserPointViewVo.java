package com.third.prj.user.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserPointViewVo {
	private int charge;
	private String chargeDt;
	private String UId;
	private int point;
	private int pay;
	private String payDt;
	private int tempPoint;
	private String buyCtntCd;
	private int payNo;
}
