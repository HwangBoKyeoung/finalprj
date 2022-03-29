package com.third.prj.inquiry.service;

import java.util.List;

public interface InquiryService {

	List<InquiryVO> inquirySelectList();
	InquiryVO inquirySelect(InquiryVO vo);
	
	List<InquiryVO> inquirySearch(String key, String val);
}
