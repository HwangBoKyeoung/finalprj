package com.third.prj.movie.service;

import java.sql.Date; 

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MovieViewVO {

	private int  mvReservNo;
	private String name;
	private Date payDt;
	private int pay;
	private int charge;
	private int point;
	private String buyCtntCd;
	private String UId;
}
