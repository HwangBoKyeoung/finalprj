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
	private InquiryMapper map;
	
	@Override
	public List<InquiryVO> inquirySelectList() {
		return map.inquirySelectList();
	}

	@Override
	public InquiryVO inquirySelect(InquiryVO vo) {
		return map.inquirySelect(vo);
	}

	@Override
	public List<InquiryVO> inquirySearch(String key, String val) {
		return map.inquirySearch(key, val);
	}
	
	@Override
	public int inquiryInsert(InquiryVO vo) {
		return map.inquiryInsert(vo);
	}

	@Override
	public int inquiryUpdate(InquiryVO vo) {
		return map.inquiryUpdate(vo);
	}

	@Override
	public int inquiryDelete(InquiryVO vo) {
		return map.inquiryDelete(vo);
	}
}
