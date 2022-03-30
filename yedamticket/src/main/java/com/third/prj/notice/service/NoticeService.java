package com.third.prj.notice.service;

import java.util.List;

public interface NoticeService {
	List<NoticeVO> noticeSelectList();

	NoticeVO noticeSelect(NoticeVO vo);

	int noticeInsert(NoticeVO vo);

	int noticeUpdate(NoticeVO vo);

	int noticeDelete(NoticeVO vo);

	void noticeHitUpdate(int noticeNo);

//	// 게시물 총 갯수
//	public int countBoard();
//
//	// 페이징 처리 게시글 조회
//	public List<NoticeVO> selectBoard(PagingVO vo);

	//페이징 
	public List<NoticeVO> getList(CriteriaVO cri);
	
	//전체 게시글수
	public int getTotal(CriteriaVO cri);

}
