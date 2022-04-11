package com.third.prj.inquiry.service;

import java.util.List;

public interface InquiryService {

	List<InquiryVO> inquirySelectList();
	//관리자 페이지- 상담 페이징처리
	List<InquiryVO> manaerInquiryList(CriteriaVO cri);
	
	InquiryVO inquirySelect(InquiryVO vo);
	int inquiryInsert(InquiryVO vo);
	int inquiryUpdate(InquiryVO vo);
	int inquiryDelete(InquiryVO vo);

	
	int getTotal(CriteriaVO cri);
}
