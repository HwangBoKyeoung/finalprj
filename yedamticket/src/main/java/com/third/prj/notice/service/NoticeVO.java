package com.third.prj.notice.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeVO {
	private int noticeNo;
	private String title;
	private String content;
	private Date wrDt;
	private int hit;
	private String writer;
}
