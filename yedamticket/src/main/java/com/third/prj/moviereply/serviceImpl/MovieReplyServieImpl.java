package com.third.prj.moviereply.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.moviereply.mapper.MovieReplyMapper;
import com.third.prj.moviereply.service.MovieReplyService;
import com.third.prj.moviereply.service.MovieReplyVO;

@Repository("movieReplyDao")
public class MovieReplyServieImpl implements MovieReplyService{
	@Autowired
	private MovieReplyMapper map;

	@Override
	public List<MovieReplyVO> movieReplyList(MovieReplyVO vo) {
		// TODO Auto-generated method stub
		return map.movieReplyList(vo);
	}

	@Override
	public int movieReplyInsert(MovieReplyVO vo) {
		// TODO Auto-generated method stub
		return map.movieReplyInsert(vo);
	}

	@Override
	public int movieReplyDelete(MovieReplyVO vo) {
		// TODO Auto-generated method stub
		return map.movieReplyDelete(vo);
	}

	@Override
	public MovieReplyVO selectReplyNo() {
		// TODO Auto-generated method stub
		return map.selectReplyNo();
	}
}
