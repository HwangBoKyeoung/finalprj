package com.third.prj.movie.service;

import java.util.Map;
import java.util.List;


public interface MovieService {
	//황규복

	List<MovieVO> movieList();
	MovieVO movieDetail(MovieVO vo);
	//결제페이지로갈 영화상세정보
	MovieVO mDetail(MovieVO vo);
	List<MovieVO> mList();
	//프로시저수정쓸것들..?-(rjh-2022/04/05)
	int procedureCall(Map<String, Object> map);

	//페이징
	List<MovieVO> mvListPaging(CriteriaVO cri);
	//기업회원페이지 상세페이지겸 수정페이지
	MovieVO mvSelect(MovieVO vo);
	//검색
		int getTotal(CriteriaVO cri);
}
