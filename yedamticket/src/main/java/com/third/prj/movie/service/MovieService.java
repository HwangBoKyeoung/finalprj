package com.third.prj.movie.service;

import java.util.List;

public interface MovieService {
	
	MovieVO movieDetail(MovieVO vo);
	List<MovieVO> movieList();
}
