package com.third.prj.user.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserPointViewVo {
	private int charge;
	private Date chargeDt;
	private String Uid;
	private int point;
}
