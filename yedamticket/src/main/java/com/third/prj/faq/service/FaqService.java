package com.third.prj.faq.service;

import java.util.List;

public interface FaqService {

	List<FaqVO> faqSelectList();

	FaqVO faqSelect(FaqVO vo);

	int faqInsert(FaqVO vo);

	int faqUpdate(FaqVO vo);

	int faqDelete(FaqVO vo);

	// 관리자페이지 FAQ
	List<FaqVO> managerFaqList(CriteriaVO cri);

	int getTotal(CriteriaVO cri);

	// 관리자페이지 FAQ
	List<FaqVO> managerFaqList2(CriteriaVO2 cri);

	int getTotal2(CriteriaVO2 cri);
}
