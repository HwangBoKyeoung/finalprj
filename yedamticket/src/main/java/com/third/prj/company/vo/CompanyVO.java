package com.third.prj.company.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CompanyVO {
	private String email;
	private String pwd;
	private String addr;
	private String phone;
	private String bizno;
	private String dealAgreeCd;
	private String name;
	private String cId;
	private Date rdt;
}
