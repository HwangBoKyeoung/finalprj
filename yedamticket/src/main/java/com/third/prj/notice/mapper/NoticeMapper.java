package com.third.prj.notice.mapper;

import java.util.List;

import com.third.prj.notice.service.NoticeVO;

public interface NoticeMapper {
	List<NoticeVO> noticeSelectList();
	NoticeVO noticeSelect(NoticeVO vo);
	int noticeInsert(NoticeVO vo);
	int noticeUpdate(NoticeVO vo);
	int noticeDelete(NoticeVO vo);

	void noticeHitUpdate(int noticeNo );
}
