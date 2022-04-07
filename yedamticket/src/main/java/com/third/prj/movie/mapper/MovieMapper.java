package com.third.prj.movie.mapper;

import java.util.Map;
import java.util.List;

import com.third.prj.movie.service.MovieVO;
import com.third.prj.movie.service.MovieViewVO;
import com.third.prj.movie.service.MvCriteriaVO;
import com.third.prj.performance.service.PerformanceVO;
import com.third.prj.performance.service.PerformanceViewVO;
import com.third.prj.user.service.UserCriteriaVO;

public interface MovieMapper {
	
	MovieVO movieDetail(MovieVO vo);
	
	//프로시저수정쓸것들..?-(rjh-2022/04/05)
	int procedureCall(Map<String, Object> map);

	List<MovieVO> movieList();
	
//	//공연 구매내역
//	List<MovieViewVO> mvBuyList(MovieViewVO vo);
	
	
	//공연 예매 내역 리스트
		public List<MovieViewVO> mvBuyList(MvCriteriaVO cri);
		
		//공연 예매 리스트 페이징
		public int mvBuyTotal(MvCriteriaVO cri);
	

}
