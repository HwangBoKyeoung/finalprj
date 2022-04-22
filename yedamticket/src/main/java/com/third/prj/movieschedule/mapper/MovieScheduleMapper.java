package com.third.prj.movieschedule.mapper;

import java.util.List;

import com.third.prj.movieschedule.service.MovieScheduleVO;

public interface MovieScheduleMapper {
	
	List<MovieScheduleVO> movieSchdtList(MovieScheduleVO vo);
	//영화스케쥴 등록
	int movieSchInsert(MovieScheduleVO vo);
	
}
