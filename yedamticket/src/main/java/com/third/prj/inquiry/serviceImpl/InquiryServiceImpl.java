package com.third.prj.inquiry.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.inquiry.mapper.InquiryMapper;
import com.third.prj.inquiry.service.InquiryService;
import com.third.prj.inquiry.service.InquiryVO;

@Repository("inquiryDao")
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	private InquiryMapper mapper;
	
	@Override
	public List<InquiryVO> inquirySelectList() {
		return mapper.inquirySelectList();
	}

	@Override
	public InquiryVO inquirySelect(InquiryVO vo) {
		return mapper.inquirySelect(vo);
	}

	@Override
	public List<InquiryVO> inquirySearch(String key, String val) {
		return mapper.inquirySearch(key, val);
	}
	
	@Override
	public int inquiryInsert(InquiryVO vo) {
		return mapper.inquiryInsert(vo);
	}

	@Override
	public int inquiryUpdate(InquiryVO vo) {
		return mapper.inquiryUpdate(vo);
	}

	@Override
	public int inquiryDelete(InquiryVO vo) {
		return mapper.inquiryDelete(vo);
	}
	
}
