package com.third.prj.movie.service;

import java.util.List;

import com.third.prj.movie.service.MovieVO;

public interface MovieService {
	
	MovieVO movieDetail(MovieVO vo);
	List<MovieVO> movieList();

}
