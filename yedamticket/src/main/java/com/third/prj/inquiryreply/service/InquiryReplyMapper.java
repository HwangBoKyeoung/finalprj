package com.third.prj.inquiryreply.service;

import java.util.List;

import com.third.prj.inquiryreply.vo.InquiryReplyVO;

public interface InquiryReplyMapper {
	
	List<InquiryReplyVO> inquiryReplySelect(InquiryReplyVO vo);//댓글가져오기
	int inquiryReplyInsert(InquiryReplyVO vo);//댓글 삽입하기
	int inquiryReplyUpdate(InquiryReplyVO vo); //댓글삭제 하기
	int inquiryReplyDelete(InquiryReplyVO vo);
	
	InquiryReplyVO selectReplyNo(); //최신키값 가져오기

}
