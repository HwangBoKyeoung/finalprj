package com.third.prj.moviereservation.service;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MovieReservVO {
	private String mvReservNo; //영화 예약번호
	private String reservDt; //영화 예약 날짜
	private String schDate; //영화 상영날짜
	private String schTime; //영화 상영시간
	private String seatName; // 영화 좌석번호
	private String docId; // 영화 코드
	private String name; // 영화 이름
	private String Uid;

}
