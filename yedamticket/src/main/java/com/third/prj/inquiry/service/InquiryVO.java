package com.third.prj.inquiry.service;

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
	private int refer; //글의그룹
	private int step; //답글의 순서
	private int depth; // 답글의 들어쓰기
	
}
