package com.third.prj.moviereservation.service;

import java.util.List;

public interface MovieReservService {
	int movieReservationInsert(MovieReservationVO vo);
	List<MovieReservationVO> seatSearch(MovieReservationVO vo);
}
