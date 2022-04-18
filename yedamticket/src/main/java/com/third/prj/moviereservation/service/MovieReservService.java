package com.third.prj.moviereservation.service;

import java.util.List;
import java.util.Map;

public interface MovieReservService {
	int movieReservationInsert(MovieReservationVO vo);
	List<MovieReservationVO> seatSearch(MovieReservationVO vo);
	MovieReservationVO movieReservationSelect(MovieReservationVO vo);
	
	// 유저가 예약한 영화목록(view)
	List<MovieReservViewVO> userMovie(MovieReservViewVO moviereservviewVO);
	
	// 영화 취소
	int cancelreservMovie(Map<String, Object> map);
}
