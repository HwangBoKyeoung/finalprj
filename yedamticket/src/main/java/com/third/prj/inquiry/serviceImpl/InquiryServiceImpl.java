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
		// TODO Auto-generated method stub
		return map.inquirySelectList();
	}

	@Override
	public InquiryVO inquirySelect(InquiryVO vo) {
		// TODO Auto-generated method stub
		return map.inquirySelect(vo);
	}

	@Override
	public int inquiryInsert(InquiryVO vo) {
		// TODO Auto-generated method stub
		return map.inquiryInsert(vo);
	}

	@Override
	public int inquiryUpdate(InquiryVO vo) {
		// TODO Auto-generated method stub
		return map.inquiryUpdate(vo);
	}

	@Override
	public int inquiryDelete(InquiryVO vo) {
		// TODO Auto-generated method stub
		return map.inquiryDelete(vo);
	}

	@Override
	public int replyupdate(InquiryVO vo) {
		// TODO Auto-generated method stub
		return map.replyupdate(vo);
	}

	@Override
	public int replyInsert(InquiryVO vo) {
		// TODO Auto-generated method stub
		return map.replyInsert(vo);
	}
	
	
	
}
