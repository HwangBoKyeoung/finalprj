package com.third.prj.company.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	private String Cid;
	@JsonFormat(pattern = "yy-MM-dd", timezone="Asia/Seoul")
	private Date rdt;
	
}
