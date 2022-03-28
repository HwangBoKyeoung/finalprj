package com.third.prj.moviereservation.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MovieReservationVO {
	private int mvReservNo;
	private Date reservDt;
	private String cancelCd;
	private int mvNo;
	private String uId;
	private int mvSchNo;
	private String seatStatCd;
}
