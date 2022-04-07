package com.third.prj.inquiry.mapper;

import java.util.List; 

import org.apache.ibatis.annotations.Param;

import com.third.prj.inquiry.service.InquiryVO;
import com.third.prj.notice.service.CriteriaVO;

public interface InquiryMapper {

	List<InquiryVO> inquirySelectList();
	InquiryVO inquirySelect(InquiryVO vo);
	int inquiryInsert(InquiryVO vo);
	int inquiryUpdate(InquiryVO vo);
	int inquiryDelete(InquiryVO vo);
	
	List<InquiryVO> inquirySearch(@Param("key") String key, @Param("val") String val);
	
	public List<InquiryVO> getList(CriteriaVO cri);
	
	// 전체 게시글수
	public int getTotal(CriteriaVO cri);

}
