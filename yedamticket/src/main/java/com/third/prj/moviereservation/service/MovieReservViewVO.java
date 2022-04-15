package com.third.prj.moviereservation.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MovieReservViewVO {
	private String name;
	private String cancelCd;
	private String docId;
	private String seatName;
	private String schTime; 
	private String schDate;
	private Date reservDt;
	private String UId;
	private int MvReservNo;
}