package com.third.prj.notice.serviceImpl;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.notice.mapper.NoticeMapper;
import com.third.prj.notice.service.CriteriaVO;
import com.third.prj.notice.service.NoticeService;
import com.third.prj.notice.service.NoticeVO;

@Repository("noticeDao")
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeMapper mapper;

	@Override
	public List<NoticeVO> noticeSelectList() {
		return mapper.noticeSelectList();
	}

	@Override
	public NoticeVO noticeSelect(NoticeVO vo) {
		return mapper.noticeSelect(vo);
	}

	@Override
	public int noticeInsert(NoticeVO vo) {
		return mapper.noticeInsert(vo);
	}

	@Override
	public int noticeUpdate(NoticeVO vo) {
		return mapper.noticeUpdate(vo);
	}

	@Override
	public int noticeDelete(NoticeVO vo) {
		return mapper.noticeDelete(vo);
	}

	@Override
	public void noticeHitUpdate(int noticeNo) {
		mapper.noticeHitUpdate(noticeNo);

	}

	@Override
	public List<NoticeVO> getList(CriteriaVO cri) {
		return mapper.getList(cri);
	}

	@Override
	public int getTotal(CriteriaVO cri) {
		return mapper.getTotal(cri);
	}

}