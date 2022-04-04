package com.third.prj.performanceschedule.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PerformanceScheduleVO {
	
	private int pSchNo;
	@JsonFormat(pattern = "YYYY-DD-MM")
	private Date frDt;
	private int no;
	private String time;
	private int pNo;
	private String start;
	String title;
}
