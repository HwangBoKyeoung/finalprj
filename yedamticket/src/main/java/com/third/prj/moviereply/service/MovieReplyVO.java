package com.third.prj.moviereply.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MovieReplyVO {
	
	private int mvReNo;
	private int mvNo;
	private String content;
	private String star;
	private Date wrDt;
	private String uid;
	
}
