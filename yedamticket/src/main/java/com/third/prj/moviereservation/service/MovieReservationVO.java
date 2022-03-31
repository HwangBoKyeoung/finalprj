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
	private String uId;
	private String schDate;
	private String seatStatCd;
	private String seatName;
}
