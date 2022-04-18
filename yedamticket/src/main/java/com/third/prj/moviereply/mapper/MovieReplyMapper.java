package com.third.prj.moviereply.mapper;

import java.util.List;

import com.third.prj.moviereply.service.MovieReplyVO;

public interface MovieReplyMapper {
	
	List<MovieReplyVO> movieReplyList(MovieReplyVO vo);
	int movieReplyInsert(MovieReplyVO vo);
	int movieReplyDelete(MovieReplyVO vo);
	//평균별점만 가져오기
		MovieReplyVO getStar(MovieReplyVO vo);
	MovieReplyVO selectReplyNo();
	
}
