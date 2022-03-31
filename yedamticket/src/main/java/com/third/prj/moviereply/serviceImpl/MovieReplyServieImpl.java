package com.third.prj.moviereply.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.moviereply.mapper.MovieReplyMapper;
import com.third.prj.moviereply.service.MovieReplyService;
import com.third.prj.moviereply.service.MovieReplyVO;

@Repository("movieReplyDao")
public class MovieReplyServieImpl implements MovieReplyService {
	
	@Autowired
	private MovieReplyMapper mapper;

	@Override
	public List<MovieReplyVO> movieReplyList(MovieReplyVO vo) {
		return mapper.movieReplyList(vo);
	}

	@Override
	public int movieReplyInsert(MovieReplyVO vo) {
		return mapper.movieReplyInsert(vo);
	}

	@Override
	public int movieReplyDelete(MovieReplyVO vo) {
		return mapper.movieReplyDelete(vo);
	}

	@Override
	public MovieReplyVO selectReplyNo() {
		return mapper.selectReplyNo();
	}
}
