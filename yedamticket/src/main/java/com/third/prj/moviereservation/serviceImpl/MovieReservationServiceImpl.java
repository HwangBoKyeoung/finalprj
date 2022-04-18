package com.third.prj.moviereservation.serviceImpl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.moviereservation.mapper.MovieReservMapper;
import com.third.prj.moviereservation.service.MovieReservService;
import com.third.prj.moviereservation.service.MovieReservViewVO;
import com.third.prj.moviereservation.service.MovieReservationVO;
@Repository("movieReservationDao")
public class MovieReservationServiceImpl implements MovieReservService{
	@Autowired
	private MovieReservMapper mapper;
	@Override
	public int movieReservationInsert(MovieReservationVO vo) {
		// TODO Auto-generated method stub
		return mapper.movieReservationInsert(vo);
	}
	@Override
	public List<MovieReservationVO> seatSearch(MovieReservationVO vo) {
		// TODO Auto-generated method stub
		return mapper.seatSearch(vo);
	}
	@Override
	public MovieReservationVO movieReservationSelect(MovieReservationVO vo) {
		// TODO Auto-generated method stub
		return mapper.movieReservationSelect(vo);
	}
	@Override
	public List<MovieReservViewVO> userMovie(MovieReservViewVO moviereservviewVO) {
		return mapper.userMovie(moviereservviewVO);
	}
	@Override
	public int cancelreservMovie(Map<String, Object> map) {
		return mapper.cancelreservMovie(map);
	}
}
