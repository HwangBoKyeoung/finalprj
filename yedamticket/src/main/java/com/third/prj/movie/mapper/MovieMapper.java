package com.third.prj.movie.mapper;

import java.util.Map;
import java.util.List;

import com.third.prj.movie.service.CriteriaVO;
import com.third.prj.movie.service.MovieVO;

public interface MovieMapper {
	
	MovieVO movieDetail(MovieVO vo);
	
	//프로시저수정쓸것들..?-(rjh-2022/04/05)
	int procedureCall(Map<String, Object> map);

	List<MovieVO> movieList();


	//페이징
	List<MovieVO> mvListPaging(CriteriaVO cri);
	//기업회원페이지 상세페이지겸 수정페이지
	MovieVO mvSelect(MovieVO vo);
		
}
