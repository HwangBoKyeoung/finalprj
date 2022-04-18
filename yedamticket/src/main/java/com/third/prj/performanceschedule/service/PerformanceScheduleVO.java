package com.third.prj.performanceschedule.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.third.prj.performance.service.PerformanceVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PerformanceScheduleVO {
	
	private int PSchNo;
	//행사시작일자
	@JsonFormat(pattern = "YYYY-DD-MM")
	private Date frDt;
	//행사종료일자
	@JsonFormat(pattern = "YYYY-DD-MM")
	private Date trDt;
	private String addr;
	private int no;
	//행사시작 시간
	private String time;
	//행사종료 시간
	private String endTime;
	private int pNo;
	
	private String start;
	private String title;
	
	
	private PerformanceVO performanceVO;
}
