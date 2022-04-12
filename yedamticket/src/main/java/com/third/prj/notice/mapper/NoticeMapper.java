package com.third.prj.notice.mapper;

import java.util.List; 

import com.third.prj.notice.service.CriteriaVO;
import com.third.prj.notice.service.NoticeVO;

public interface NoticeMapper {
	
	List<NoticeVO> noticeSelectList();
	NoticeVO noticeSelect(NoticeVO vo);
	int noticeInsert(NoticeVO vo);
	int noticeUpdate(NoticeVO vo);
	int noticeDelete(NoticeVO vo);
	
	// 조회수증가
	void noticeHitUpdate(int noticeNo);
	// 페이징
	public List<NoticeVO> getList(CriteriaVO cri);
	// 전체 게시글수
	public int getTotal(CriteriaVO cri);
	
	
	
}
