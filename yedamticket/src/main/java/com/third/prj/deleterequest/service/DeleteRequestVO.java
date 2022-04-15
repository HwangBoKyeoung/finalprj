package com.third.prj.deleterequest.service;

import java.sql.Date;

import com.third.prj.movie.service.MovieVO;
import com.third.prj.performance.service.PerformanceVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DeleteRequestVO {
	
	private int delReqNo;
	private Date delDt;
	private String CId;
	private String deleteCd;
	private String content;
	private int mvNo;
	private int pNo;
	private String refusal;
	
	private PerformanceVO performanceVO;
	private MovieVO movieVO;
	
}
