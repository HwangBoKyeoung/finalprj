package com.third.prj.faq.service;

import java.util.List;

import com.third.prj.faq.vo.FaqVO;

public interface FaqService {
	List<FaqVO> faqSelectList();
	FaqVO faqSelect(FaqVO vo);
	int faqInsert(FaqVO vo);
	int faqUpdate(FaqVO vo);
	int faqDelete(FaqVO vo);
	

}
