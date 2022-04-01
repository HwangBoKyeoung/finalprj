package com.third.prj.moviehall.mapper;

import java.util.List;

import com.third.prj.moviehall.service.MovieHallVO;

public interface MovieHallMapper {
	
	List<MovieHallVO> movieHallList(MovieHallVO vo);
	List<MovieHallVO> movieLocList(MovieHallVO vo);
	
}
