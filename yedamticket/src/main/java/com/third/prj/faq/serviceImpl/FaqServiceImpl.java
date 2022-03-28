package com.third.prj.faq.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.faq.mapper.FaqMapper;
import com.third.prj.faq.service.FaqService;
import com.third.prj.faq.service.FaqVO;

@Repository("faqDao")
public class FaqServiceImpl implements FaqService {
	@Autowired
	private FaqMapper map;

	@Override
	public List<FaqVO> faqSelectList() {
		return map.faqSelectList();
	}

	@Override
	public FaqVO faqSelect(FaqVO vo) {
		// TODO Auto-generated method stub
		return map.faqSelect(vo);
	}

	@Override
	public int faqInsert(FaqVO vo) {
		// TODO Auto-generated method stub
		return map.faqInsert(vo);
	}

	@Override
	public int faqUpdate(FaqVO vo) {
		// TODO Auto-generated method stub
		return map.faqUpdate(vo);
	}

	@Override
	public int faqDelete(FaqVO vo) {
		// TODO Auto-generated method stub
		return map.faqDelete(vo);
	}

}