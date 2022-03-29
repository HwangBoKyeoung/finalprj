package com.third.prj.inquiry.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.prj.inquiry.service.InquiryVO;

public interface InquiryMapper {

	List<InquiryVO> inquirySelectList();
	InquiryVO inquirySelect(InquiryVO vo);
	List<InquiryVO> inquirySearch(@Param("key") String key,@Param("val") String val);
}
