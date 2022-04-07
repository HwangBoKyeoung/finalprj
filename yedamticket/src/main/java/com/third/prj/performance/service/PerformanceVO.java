package com.third.prj.performance.service;

import com.third.prj.performancereservation.service.PerformanceReservationVO;
import com.third.prj.performanceschedule.service.PerformanceScheduleVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PerformanceVO {
	
	private int pNo;  //공연번호
	private String name; //공연이름
	private String content; //공연설명
	private String cId; //기업회원
	private String actor; //출연자
	private String fileCd; // 파일번호
	private String loc;  //공연지역
	private String addr; //공연장 상세주소
	private String price;	//공연가격
	
	private PerformanceReservationVO performanceReservationVO;
	private PerformanceScheduleVO performanceScheduleVO;
	
	//검색용
	private String frDt;
  
}
