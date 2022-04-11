package com.third.prj.movie.service;

import java.util.List;
import java.util.Map;

import com.third.prj.point.service.PointCriteriaVO;

public interface MovieService {
	
	MovieVO movieDetail(MovieVO vo);
	
	//프로시저수정쓸것들..?-(rjh-2022/04/05)
	int procedureCall(Map<String, Object> map);

	List<MovieVO> movieList();
	
	//공연 구매내역
	List<MovieViewVO> mvBuyList(MovieViewVO vo);
	
	//공연 예매 내역 리스트
	public List<MovieViewVO> mvBuyList2(PointCriteriaVO cri);
	
	//공연 예매 리스트 페이징
	public int mvBuyTotal(PointCriteriaVO cri);
	
	//영화 등록
	int movieInsert(MovieVO vo);
	
	List<MovieVO> mList();
	//통합검색
	List<MovieVO> searchAll(String searchName);
}
