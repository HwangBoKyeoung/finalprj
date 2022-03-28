package com.third.prj.manager.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ManagerVO {
	private String mId;
	private String name;
	private String pwd;
	private String depart;
	private String phone;
	private String authCd;
	private String managerStat;
}
