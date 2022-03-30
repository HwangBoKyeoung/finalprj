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
	private NoticeMapper map;

	@Override
	public List<NoticeVO> noticeSelectList() {
		return map.noticeSelectList();
	}

	@Override
	public NoticeVO noticeSelect(NoticeVO vo) {
		return map.noticeSelect(vo);
	}

	@Override
	public int noticeInsert(NoticeVO vo) {
		return map.noticeInsert(vo);
	}

	@Override
	public int noticeUpdate(NoticeVO vo) {
		return map.noticeUpdate(vo);
	}

	@Override
	public int noticeDelete(NoticeVO vo) {
		return map.noticeDelete(vo);
	}

	@Override
	public void noticeHitUpdate(int noticeNo) {
		map.noticeHitUpdate(noticeNo);

	}

//	@Override
//	public int countBoard() {
//		// TODO Auto-generated method stub
//		return map.countBoard();
//	}
//
//	@Override
//	public List<NoticeVO> selectBoard(PagingVO vo) {
//		// TODO Auto-generated method stub
//		return map.selectBoard(vo);
//	}

	@Override
	public List<NoticeVO> getList(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return map.getList(cri);
	}

	@Override
	public int getTotal(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return map.getTotal(cri);
	}


}