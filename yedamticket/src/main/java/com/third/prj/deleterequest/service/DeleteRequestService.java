package com.third.prj.deleterequest.service;

import java.util.List;

import com.third.prj.performance.service.PerformanceVO;

public interface DeleteRequestService {

	//젠체리스트
	List<DeleteRequestVO> delSelectList();
	//단건조회
	DeleteRequestVO delSelect(DeleteRequestVO vo);
	//등록
	int delInsert(DeleteRequestVO vo);
	//수정
	int delUpdate(DeleteRequestVO vo);
	//삭제(필요없을것같음 - RJH)
	int delDelete(DeleteRequestVO vo);
	//검색
	List<DeleteRequestVO> delSearch(String key, String val);
	//삭제처리상세페이지
	PerformanceVO updatedel(PerformanceVO vo);
	
}
