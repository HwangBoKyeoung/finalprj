package com.third.prj.moviereply.service;

import java.util.List;

public interface MovieReplyService {
	List<MovieReplyVO> movieReplyList(MovieReplyVO vo);
	int movieReplyInsert(MovieReplyVO vo);
	int movieReplyDelete(MovieReplyVO vo);
	MovieReplyVO selectReplyNo();
}
