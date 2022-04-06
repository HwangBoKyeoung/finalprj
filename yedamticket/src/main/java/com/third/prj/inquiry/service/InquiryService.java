package com.third.prj.inquiry.service;

import java.util.List;

import com.third.prj.notice.service.CriteriaVO;

public interface InquiryService {

	List<InquiryVO> inquirySelectList();
	InquiryVO inquirySelect(InquiryVO vo);
	int inquiryInsert(InquiryVO vo);
	int inquiryUpdate(InquiryVO vo);
	int inquiryDelete(InquiryVO vo);

	List<InquiryVO> inquirySearch(String key, String val);
	
	public List<InquiryVO> getList(CriteriaVO cri);
	
	// 전체 게시글수
	public int getTotal(CriteriaVO cri);
	
}
