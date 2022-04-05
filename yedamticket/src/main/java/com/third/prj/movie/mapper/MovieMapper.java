package com.third.prj.movie.mapper;

import java.util.Map;

import com.third.prj.movie.service.MovieVO;

public interface MovieMapper {
	
	MovieVO movieDetail(MovieVO vo);
	
	//프로시저수정쓸것들..?-(rjh-2022/04/05)
	int procedureCall(Map<String, Object> map);
	
	
}
