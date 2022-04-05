package com.third.prj.movie.mapper;

import java.util.List;

import com.third.prj.movie.service.MovieVO;

public interface MovieMapper {
	
	MovieVO movieDetail(MovieVO vo);
	List<MovieVO> movieList();
}
