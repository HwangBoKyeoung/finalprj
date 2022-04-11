package com.third.prj.movievideo.mapper;

import com.third.prj.movievideo.service.MovieVideoVO;

public interface MovieVideoMapper {

//	int PVideoUpdate(PerformanceVideoVO vo);
	// performanceVideo조회 - 22/04/01(RJH)
	MovieVideoVO mvvSelect(MovieVideoVO vo);
}
