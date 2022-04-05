package com.third.prj.deleterequest.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.third.prj.deleterequest.service.DeleteRequestVO;
import com.third.prj.performance.service.PerformanceVO;

public interface DeleteRequestMapper {
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
	List<DeleteRequestVO> delSearch(@Param("key") String key,@Param("val") String val);
	//삭제처리상세페이지
	PerformanceVO updatedel(PerformanceVO vo);

}
