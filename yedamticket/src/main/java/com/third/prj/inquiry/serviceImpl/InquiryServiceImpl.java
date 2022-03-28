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

}
