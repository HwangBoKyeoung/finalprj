package com.third.prj.inquiry.service;

import java.util.List;

import com.third.prj.inquiry.vo.InquiryVO;

public interface InquiryService {

	List<InquiryVO> inquirySelectList();
	InquiryVO inquirySelect(InquiryVO vo);
}
