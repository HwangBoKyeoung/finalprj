package com.third.prj.moviereply.mapper;

import java.util.List;

import com.third.prj.moviereply.service.MovieReplyVO;

public interface MovieReplyMapper {
	
	List<MovieReplyVO> movieReplyList(MovieReplyVO vo);
	int movieReplyInsert(MovieReplyVO vo);
	int movieReplyDelete(MovieReplyVO vo);
	
	MovieReplyVO selectReplyNo();
	
}
