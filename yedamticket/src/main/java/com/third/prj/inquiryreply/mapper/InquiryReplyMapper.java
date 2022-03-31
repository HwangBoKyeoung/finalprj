package com.third.prj.inquiryreply.mapper;


import com.third.prj.inquiryreply.service.InquiryReplyVO;

public interface InquiryReplyMapper {
	
	InquiryReplyVO inquiryReplySelect(InquiryReplyVO vo); //댓글가져오기
	int inquiryReplyInsert(InquiryReplyVO vo);			  //댓글입력
	int inquiryReplyUpdate(InquiryReplyVO vo); 			  //댓글수정
	int inquiryReplyDelete(InquiryReplyVO vo);			  //댓글삭제
	
	InquiryReplyVO selectReplyNo(); 				      //최신키값 가져오기

}
