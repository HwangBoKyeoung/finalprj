package com.third.prj.moviereservation.mapper;

import java.util.List;

import com.third.prj.moviereservation.service.MovieReservationVO;

public interface MovieReservMapper {
	int movieReservationInsert(MovieReservationVO vo);
	List<MovieReservationVO> seatSearch(MovieReservationVO vo);
}
