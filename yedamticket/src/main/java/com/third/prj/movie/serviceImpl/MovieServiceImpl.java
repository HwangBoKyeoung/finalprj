package com.third.prj.movie.serviceImpl;

import java.util.Map;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.movie.mapper.MovieMapper;
import com.third.prj.movie.service.MovieService;
import com.third.prj.movie.service.MovieVO;

@Repository("movieDao")
public class MovieServiceImpl implements MovieService {
	
	@Autowired
	private MovieMapper mapper;
	
	@Override
	public MovieVO movieDetail(MovieVO vo) {
		return mapper.movieDetail(vo);
	}

	@Override
	public int procedureCall(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.procedureCall(map);
  }
  
	@Override
	public List<MovieVO> movieList() {
		// TODO Auto-generated method stub
		return mapper.movieList();
	}
	
}
