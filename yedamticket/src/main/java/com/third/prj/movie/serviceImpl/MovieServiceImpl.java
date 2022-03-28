package com.third.prj.movie.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.movie.service.MovieMapper;
import com.third.prj.movie.service.MovieService;
import com.third.prj.movie.vo.MovieVO;

@Repository("movieDao")
public class MovieServiceImpl implements MovieService{
	@Autowired
	private MovieMapper map;
	@Override
	public MovieVO movieDetail(MovieVO vo) {
		// TODO Auto-generated method stub
		return map.movieDetail(vo);
	}
	
	
}
