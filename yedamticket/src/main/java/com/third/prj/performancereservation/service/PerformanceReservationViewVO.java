package com.third.prj.performancereservation.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PerformanceReservationViewVO {
	private int PReservNo;
	private Date reserveDttm;
	private String status;
	private String UId;
	private int PSchNo;
	private String seatStatCd;
	private String seatNo;
	private String RId;
	private String cancelCd;
	@JsonFormat(pattern = "YYYY-DD-MM")
	private Date frDt;
	private String time;
	private int Pno;
	private String name; //공연이름
	private String content; //공연설명
	private String CId; //기업회원
	private String actor; //출연자
	private String fileCd; // 파일번호
	private String loc;  //공연지역
	private String addr; //공연장 상세주소
	private String price;	//공연가격
	
}