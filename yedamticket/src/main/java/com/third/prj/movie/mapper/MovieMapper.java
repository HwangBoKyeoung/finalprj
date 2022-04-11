package com.third.prj.movie.mapper;

import java.util.Map;
import java.util.List;

import com.third.prj.movie.service.CriteriaVO;
import com.third.prj.movie.service.MovieVO;
import com.third.prj.movie.service.movieCriteria;

public interface MovieMapper {
	//황규복
	MovieVO movieDetail(MovieVO vo);
	List<MovieVO> movieList();
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
