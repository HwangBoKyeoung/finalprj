package com.third.prj.moviehall.service;

import java.util.List;

public interface MovieHallService {
	List<MovieHallVO> movieHallList(MovieHallVO vo);
	List<MovieHallVO> movieLocList(MovieHallVO vo);
}
