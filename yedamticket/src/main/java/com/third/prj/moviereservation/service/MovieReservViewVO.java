package com.third.prj.moviereservation.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MovieReservViewVO {
	private int mvReservNo;
	private String reservDt;
	private String cancelCd;
	private int mvNo;
	private String UId;
	private String schDate;
	private String seatStatCd;
	private String seatName;
	private String reservLoc;
	private String reservHall;
	private String docId;
	private String schTime; 
	private String name; //영화이름
	private String genre; //영화장르
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
	private String renames; //변경된 파일명
	private String audience;//관객수
	private String confirm; //관리자 승인여부
	private String refuseRs; //거부사유
	private String searchName; //검색
	
}