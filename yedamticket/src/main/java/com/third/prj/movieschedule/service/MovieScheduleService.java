package com.third.prj.movieschedule.service;

import java.util.List;

public interface MovieScheduleService {

	List<MovieScheduleVO> movieSchdtList(MovieScheduleVO vo);

	// 영화스케쥴 등록
	int movieSchInsert(MovieScheduleVO vo);

}
