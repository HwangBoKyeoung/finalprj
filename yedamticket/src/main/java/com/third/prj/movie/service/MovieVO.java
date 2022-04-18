package com.third.prj.movie.service;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.third.prj.moviereservation.service.MovieReservVO;
import com.third.prj.performance.service.PerformanceVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MovieVO {
	
	private int mvNo; //영화번호
	private String name; //영화이름
	private String genre; //영화장르
	@JsonFormat(pattern = "yyyy.MM.dd")
	private String startDate; //영화개봉일
	private String director; //영화감독
	private String rating; //영화관람등급
	private String distributor; //영화배급사
	private String country; //영화국가
	private String runtime; //영화상영시간
	private String content; //영화설명
	private String CId; //기업회원아이디
	private String actor; //출연자이름
	private String fileCd; //파일구분코드
	private String docId; //영화코드
	private String renames; //변경된 파일명
	private String audience;//관객수
	private String confirm; //관리자 승인여부
	private String refuseRs; //거부사유
	
	private String searchName;
	
	private MovieReservVO movieReservVO;
	private PerformanceVO performanceVO;
	

}
