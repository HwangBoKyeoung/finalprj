package com.third.prj.deleterequest.service;

import java.util.List;

import com.third.prj.movie.service.MovieVO;
import com.third.prj.performance.service.PerformanceVO;


public interface DeleteRequestService {

	//젠체리스트
	List<DeleteRequestVO> deleteRequestList(CriteriaVO cri);
	//단건조회
	DeleteRequestVO deleteRequestSelect(DeleteRequestVO vo);
	//등록
	int deletePerforInsert(DeleteRequestVO vo);
	//수정
	int deleteRequestUpdate(DeleteRequestVO vo);
	
	//삭제처리상세페이지
	DeleteRequestVO deleteRequestPerforSelect(DeleteRequestVO vo);
	
	//영화삭제요청등록
	int deleteMovieInsert(DeleteRequestVO vo);
	
	//영화삭제처리상세페이지
	DeleteRequestVO deleteRequestMovieSelect(DeleteRequestVO vo);
	//페이징처리
	int getTotal(CriteriaVO cri);
	
	//기업마이페이지 삭제 현황(공연)
	List<DeleteRequestVO> companyMyDeletePerforList(CriteriaVO cri, PerformanceVO vo);
	int getTotalDeletePerfor(CriteriaVO cri, PerformanceVO vo);
	//기업마이페이지 삭제 현황(영화)
	List<DeleteRequestVO> companyMyDeleteMovieList(CriteriaVO cri,MovieVO vo);
	int getTotalDeleteMovie(CriteriaVO cri,MovieVO vo);
	
	//기업회원 마이페이지 공연 목록
	List<DeleteRequestVO> companyPerforSelectList(CriteriaVO cri, PerformanceVO vo);
	int getTotalPerfor(CriteriaVO cri,PerformanceVO vo);
	
	//기업회원 마이페이지 영화목록
	List<DeleteRequestVO> companyMovieSelectList(CriteriaVO cri,MovieVO vo);
	int getTotalMovie(CriteriaVO cri,MovieVO vo);
	
	//관리자 페이지 삭제요청 페이지
	List<DeleteRequestVO> managerPerforDelList(CriteriaVO cri);
	int getTotalPDel(CriteriaVO cri);
	
	List<DeleteRequestVO> managerMovieDelList(CriteriaVO cri);
	int getTotaMDel(CriteriaVO cri);
}
