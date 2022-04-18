package com.third.prj.confirmrequest.service;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ConfirmVO {
	//영화
	private String mvNo;
	private String genre;
	private String rating;
	private String director;
	private String country;

	//공연
	private String pNo;
	private String loc;
	private String addr;
	
	//굿즈
	private String gNo;
	private String seller;
	private String goodsCd;
	
	//공통
	private String CId;
	private String confirm;
	private String refuseRs;
	private String name;
	private String fileCd;
	private String content;
	private String price;
	private String actor;
}
