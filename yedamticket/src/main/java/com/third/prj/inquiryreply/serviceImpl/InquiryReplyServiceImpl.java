package com.third.prj.inquiryreply.serviceImpl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.inquiryreply.mapper.InquiryReplyMapper;
import com.third.prj.inquiryreply.service.InquiryReplyService;
import com.third.prj.inquiryreply.service.InquiryReplyVO;

@Repository("inquiryReplyDao")
public class InquiryReplyServiceImpl implements InquiryReplyService {

	@Autowired
	private InquiryReplyMapper mapper;
	
	@Override
	public InquiryReplyVO inquiryReplySelect(InquiryReplyVO vo) {
		return mapper.inquiryReplySelect(vo);
	}

	@Override
	public int inquiryReplyInsert(InquiryReplyVO vo) {
		return mapper.inquiryReplyInsert(vo);
	}

	@Override
	public int inquiryReplyUpdate(InquiryReplyVO vo) {
		return mapper.inquiryReplyUpdate(vo);
	}

	@Override
	public int inquiryReplyDelete(InquiryReplyVO vo) {
		return mapper.inquiryReplyDelete(vo);
	}

	@Override
	public InquiryReplyVO selectReplyNo() {
		return mapper.selectReplyNo();
	}

}
