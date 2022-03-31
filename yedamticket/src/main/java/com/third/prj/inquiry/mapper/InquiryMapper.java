package com.third.prj.inquiry.mapper;

import java.util.List;  

import com.third.prj.inquiry.service.InquiryVO;


public interface InquiryMapper {

	List<InquiryVO> inquirySelectList();
	InquiryVO inquirySelect(InquiryVO vo);
	int inquiryInsert(InquiryVO vo);
	int inquiryUpdate(InquiryVO vo);
	int inquiryDelete(InquiryVO vo);
	

	 
}
