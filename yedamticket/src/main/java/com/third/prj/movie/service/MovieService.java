package com.third.prj.movie.service;

import java.util.Map;
import java.util.List;

import com.third.prj.movie.service.MovieVO;

public interface MovieService {
	//황규복

	List<MovieVO> movieList();
	MovieVO movieDetail(MovieVO vo);
	List<MovieVO> mList();
	//프로시저수정쓸것들..?-(rjh-2022/04/05)
	int procedureCall(Map<String, Object> map);

	
}
