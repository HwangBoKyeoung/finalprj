package com.third.prj.movieschedule.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MovieScheduleVO {
	private int mvSchNo;
	private Date schDt;
	private int no;
	private String time;
	private int mvHallNo;
}
