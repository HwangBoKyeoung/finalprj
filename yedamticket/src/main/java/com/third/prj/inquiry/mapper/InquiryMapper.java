package com.third.prj.inquiry.mapper;

import java.util.List; 

import com.third.prj.inquiry.service.InquiryVO;

public interface InquiryMapper {

	List<InquiryVO> inquirySelectList();
	InquiryVO inquirySelect(InquiryVO vo);
	//1:1문의
	int inquiryInsert(InquiryVO vo);
	int inquiryUpdate(InquiryVO vo);
	int inquiryDelete(InquiryVO vo);
	
	//답글
	int replyupdate(InquiryVO vo);
	int replyInsert(InquiryVO vo);

	
	 
}
