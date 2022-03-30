package com.third.prj.inquiry.service;

import java.util.List;

public interface InquiryService {

	List<InquiryVO> inquirySelectList();
	InquiryVO inquirySelect(InquiryVO vo);
	//1:1문의
	int inquiryInsert(InquiryVO vo);
	int inquiryUpdate(InquiryVO vo);
	int inquiryDelete(InquiryVO vo);
	
	//답글
	int maxNum();

	void updateReply(InquiryVO vo);
	
}
