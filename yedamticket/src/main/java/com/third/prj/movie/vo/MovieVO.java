package com.third.prj.movie.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MovieVO {
	private int mvNo;
	private String name;
	private String genre;
	private String startTime;
	private String director;
	private String rating;
	private String distibutor;
	private String country;
	private Date mvDt;
	private String content;
	private String cId;
	private String actor;
	private String fileCd;
}
