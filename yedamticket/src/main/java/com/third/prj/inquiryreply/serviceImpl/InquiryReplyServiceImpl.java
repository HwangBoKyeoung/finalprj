package com.third.prj.inquiryreply.serviceImpl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.inquiryreply.mapper.InquiryReplyMapper;
import com.third.prj.inquiryreply.service.InquiryReplyService;
import com.third.prj.inquiryreply.service.InquiryReplyVO;

@Repository("inquiryReplyDao")
public class InquiryReplyServiceImpl implements InquiryReplyService{

	@Autowired
	private InquiryReplyMapper map;
	@Override
	public InquiryReplyVO inquiryReplySelect(InquiryReplyVO vo) {
		// TODO Auto-generated method stub
		return map.inquiryReplySelect(vo);
	}

	@Override
	public int inquiryReplyInsert(InquiryReplyVO vo) {
		// TODO Auto-generated method stub
		return map.inquiryReplyInsert(vo);
	}

	@Override
	public int inquiryReplyUpdate(InquiryReplyVO vo) {
		// TODO Auto-generated method stub
		return map.inquiryReplyUpdate(vo);
	}

	@Override
	public int inquiryReplyDelete(InquiryReplyVO vo) {
		// TODO Auto-generated method stub
		return map.inquiryReplyDelete(vo);
	}

	@Override
	public InquiryReplyVO selectReplyNo() {
		// TODO Auto-generated method stub
		return map.selectReplyNo();
	}

}
