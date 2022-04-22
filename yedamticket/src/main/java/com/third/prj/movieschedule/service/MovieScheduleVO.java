package com.third.prj.movieschedule.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MovieScheduleVO {
	
	private int mvSchNo;
	@JsonFormat(pattern="MM/dd/yyyy")
	private Date schDt;
	private String docId;
	private String time;
	private int mvHallNo;
	private Date startDate;
	
}
