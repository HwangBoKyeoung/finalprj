package com.third.prj.performanceschedule.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PerformanceScheduleVO {
	
	private int pSchNo;
	private Date frDt;
	private int no;
	private String time;
	private int pNo;
	
}
