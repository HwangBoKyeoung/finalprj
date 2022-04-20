package com.third.prj.movie.mapper;

import java.util.List;
import java.util.Map;

import com.third.prj.movie.service.CriteriaVO;
import com.third.prj.movie.service.MovieVO;

import com.third.prj.movie.service.MovieViewVO;
import com.third.prj.performance.service.PerformanceVO;
import com.third.prj.point.service.PointCriteriaVO;


public interface MovieMapper {
	//황규복
	MovieVO movieDetail(MovieVO vo);
	//결제하면 관객수 늘리기
	int audienceInsert(MovieVO vo);
	List<MovieVO> movieList();
	List<MovieVO> movieReservList();
	//결제페이지로갈 영화상세정보
	MovieVO mDetail(MovieVO vo);
	List<MovieVO> mList();
	//프로시저수정쓸것들..?-(rjh-2022/04/05)
	int procedureCall(Map<String, Object> map);
	
	//검색프로시저
	int searchProcedure(Map<String,Object> map);
	
	//공연 구매내역
	List<MovieViewVO> mvBuyList(MovieViewVO vo);
		
	//영화 예매 내역 리스트
	public List<MovieViewVO> mvBuyList2(PointCriteriaVO cri);
	
	//영화 예매 리스트 페이징
	public int mvBuyTotal(PointCriteriaVO cri);
	
	//영화 등록
	int movieInsert(MovieVO vo);
	
	/*
	 * //통합검색 List<MovieVO> searchAll(String searchName);
	 */
	
	//영화검색
	List<MovieVO> movieSearch(String SearchName);
	//공연검색
	List<PerformanceVO> perSearch(String SearchName);

	//페이징
	List<MovieVO> mvListPaging(CriteriaVO cri);
	//기업회원페이지 상세페이지겸 수정페이지
	MovieVO mvSelect(MovieVO vo);
	//검색
	int getTotal(CriteriaVO cri);
	
	//인기검색어
	int popularSearch(MovieVO vo);
		
}
