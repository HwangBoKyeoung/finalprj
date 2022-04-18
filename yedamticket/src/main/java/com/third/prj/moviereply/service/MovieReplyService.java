package com.third.prj.moviereply.service;

import java.util.List;

public interface MovieReplyService {
	
	List<MovieReplyVO> movieReplyList(MovieReplyVO vo);
	int movieReplyInsert(MovieReplyVO vo);
	int movieReplyDelete(MovieReplyVO vo);
	//평균별점만 가져오기
		MovieReplyVO getStar(MovieReplyVO vo);
	MovieReplyVO selectReplyNo();
	
}
