package com.third.prj.moviereservation.serviceImpl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.moviereservation.mapper.MovieReservMapper;
import com.third.prj.moviereservation.service.MovieReservService;
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
	
}
