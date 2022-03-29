package com.third.prj.user.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVO {
	private String Uid; // not null
	private String email;
	private String pwd;
	private String addr;
	private Date birthDt;
	private String phone;
	private String name;
	private String dealAgreeCd;
	private int point;
	private String membership;
	private String loginCd;
	private Date rdt;
}