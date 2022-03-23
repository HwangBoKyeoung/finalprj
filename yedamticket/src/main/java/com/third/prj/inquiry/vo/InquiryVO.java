package com.third.prj.inquiry.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class InquiryVO {
	private int inNo;
	private String title;
	private String content;
	private Date inDt;
	private String uId;
}
