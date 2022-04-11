package com.third.prj.movie.serviceImpl;

import java.util.Map;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.movie.mapper.MovieMapper;
import com.third.prj.movie.service.CriteriaVO;
import com.third.prj.movie.service.MovieService;
import com.third.prj.movie.service.MovieVO;
import com.third.prj.movie.service.movieCriteria;

import lombok.extern.java.Log;

@Repository("movieDao")
@Log
public class MovieServiceImpl implements MovieService {
	
	@Autowired
	private MovieMapper mapper;
	
	@Override
	public MovieVO movieDetail(MovieVO vo) {
		return mapper.movieDetail(vo);
	}

	@Override
	public int procedureCall(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.procedureCall(map);
  }
	@Override
	public List<MovieVO> movieList() {
		// TODO Auto-generated method stub
		return mapper.movieList();
	}


	@Override
	public MovieVO mvSelect(MovieVO vo) {
		// TODO Auto-generated method stub
		return mapper.mvSelect(vo);
	}

	@Override
	public List<MovieVO> mvListPaging(CriteriaVO cri) {
		// TODO Auto-generated method stub
		log.info("movielist" + cri);
		return mapper.mvListPaging(cri);
	}

	@Override
	public int getTotal(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.getTotal(cri);
	}

	@Override
	public List<MovieVO> mList() {
		// TODO Auto-generated method stub
		return mapper.mList();
	}

	@Override
	public MovieVO mDetail(MovieVO vo) {
		// TODO Auto-generated method stub
		return mapper.mDetail(vo);
	}

}
