package com.third.prj.moviereservation.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MovieReservationVO {
	
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
	
}
