package com.third.prj.inquiry.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.third.prj.inquiry.service.CriteriaVO;
import com.third.prj.inquiry.service.InquiryVO;

public interface InquiryMapper {

	List<InquiryVO> inquirySelectList();
	//관리자 페이지- 상담 페이징처리
	List<InquiryVO> inquiryList(CriteriaVO cri);
	
	InquiryVO inquirySelect(InquiryVO vo);
	int inquiryInsert(InquiryVO vo);
	int inquiryUpdate(InquiryVO vo);
	int inquiryDelete(InquiryVO vo);
	
	List<InquiryVO> inquirySearch(@Param("key") String key, @Param("val") String val);
	
	int countinq(CriteriaVO cri);

}
