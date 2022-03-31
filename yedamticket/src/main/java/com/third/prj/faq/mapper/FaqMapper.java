package com.third.prj.faq.mapper;

import java.util.List;

import com.third.prj.faq.service.FaqVO;

public interface FaqMapper {
	
	List<FaqVO> faqSelectList();
	FaqVO faqSelect(FaqVO vo);
	int faqInsert(FaqVO vo);
	int faqUpdate(FaqVO vo);
	int faqDelete(FaqVO vo);
	
}
