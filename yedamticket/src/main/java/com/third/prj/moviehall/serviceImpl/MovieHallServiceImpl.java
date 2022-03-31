package com.third.prj.moviehall.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.moviehall.mapper.MovieHallMapper;
import com.third.prj.moviehall.service.MovieHallService;
import com.third.prj.moviehall.service.MovieHallVO;
@Repository("movieHallDao")
public class MovieHallServiceImpl implements MovieHallService {
	
	@Autowired
	private MovieHallMapper mapper;
	
	@Override
	public List<MovieHallVO> movieHallList(MovieHallVO vo) {
		return mapper.movieHallList(vo);
	}
	
	@Override
	public List<MovieHallVO> movieLocList(MovieHallVO vo) {
		return mapper.movieLocList(vo);
	}
	
}
