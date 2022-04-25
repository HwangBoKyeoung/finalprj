package com.third.prj.faq.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.faq.mapper.FaqMapper;
import com.third.prj.faq.service.CriteriaVO;
import com.third.prj.faq.service.CriteriaVO2;
import com.third.prj.faq.service.FaqService;
import com.third.prj.faq.service.FaqVO;

@Repository("faqDao")
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private FaqMapper mapper;

	@Override
	public List<FaqVO> faqSelectList() {
		return mapper.faqSelectList();
	}

	@Override
	public FaqVO faqSelect(FaqVO vo) {
		return mapper.faqSelect(vo);
	}

	@Override
	public int faqInsert(FaqVO vo) {
		return mapper.faqInsert(vo);
	}

	@Override
	public int faqUpdate(FaqVO vo) {
		return mapper.faqUpdate(vo);
	}

	@Override
	public int faqDelete(FaqVO vo) {
		return mapper.faqDelete(vo);
	}

	@Override
	public List<FaqVO> managerFaqList(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.managerFaqList(cri);
	}

	@Override
	public int getTotal(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.getTotal(cri);
	}

	@Override
	public List<FaqVO> managerFaqList2(CriteriaVO2 cri) {
		// TODO Auto-generated method stub
		return mapper.managerFaqList2(cri);
	}

	@Override
	public int getTotal2(CriteriaVO2 cri) {
		// TODO Auto-generated method stub
		return mapper.getTotal2(cri);
	}

}