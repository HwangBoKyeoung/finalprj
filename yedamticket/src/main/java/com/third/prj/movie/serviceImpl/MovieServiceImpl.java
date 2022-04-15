package com.third.prj.movie.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.movie.mapper.MovieMapper;
import com.third.prj.movie.service.CriteriaVO;
import com.third.prj.movie.service.MovieService;
import com.third.prj.movie.service.MovieVO;

import com.third.prj.movie.service.MovieViewVO;
import com.third.prj.point.service.PointCriteriaVO;


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
	public List<MovieViewVO> mvBuyList(MovieViewVO vo) {
		// TODO Auto-generated method stub
		return mapper.mvBuyList(vo);
	}

	@Override
	public List<MovieViewVO> mvBuyList2(PointCriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.mvBuyList2(cri);
	}

	@Override
	public int mvBuyTotal(PointCriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.mvBuyTotal(cri);
	}

	@Override
	public int movieInsert(MovieVO vo) {
		// TODO Auto-generated method stub
		return mapper.movieInsert(vo);
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
	public List<MovieVO> searchAll(String searchName) {
		// TODO Auto-generated method stub
		return mapper.searchAll(searchName);
	}

	public MovieVO mDetail(MovieVO vo) {
		// TODO Auto-generated method stub
		return mapper.mDetail(vo);
	}

	@Override
	public int audienceInsert(MovieVO vo) {
		// TODO Auto-generated method stub
		return mapper.audienceInsert(vo);
	}
}
