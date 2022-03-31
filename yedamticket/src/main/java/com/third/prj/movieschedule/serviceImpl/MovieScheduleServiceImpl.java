package com.third.prj.movieschedule.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.movieschedule.mapper.MovieScheduleMapper;
import com.third.prj.movieschedule.service.MovieScheduleService;
import com.third.prj.movieschedule.service.MovieScheduleVO;
@Repository("movieScheduleDao")
public class MovieScheduleServiceImpl implements MovieScheduleService{
	@Autowired
	private MovieScheduleMapper map;
	@Override
	public List<MovieScheduleVO> movieSchdtList(MovieScheduleVO vo) {
		// TODO Auto-generated method stub
		return map.movieSchdtList(vo);
	}

}
