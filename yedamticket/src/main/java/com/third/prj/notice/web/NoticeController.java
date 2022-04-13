package com.third.prj.notice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.third.prj.notice.service.CriteriaVO;
import com.third.prj.notice.service.NoticeService;
import com.third.prj.notice.service.NoticeVO;
import com.third.prj.notice.service.PageVO;


@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeDao;

	@RequestMapping("/noticeList.do")
	public String noticeList(Model model, CriteriaVO cri) {
		PageVO pageVO = new PageVO(cri, noticeDao.getTotal(cri)); //(기준, 토탈)
		model.addAttribute("pageVO", pageVO); //페이지네이션전달		
		model.addAttribute("list", noticeDao.getList(cri)); //게시글전달
		return "notice/noticeList";
	}

	
	

	@RequestMapping("/noticeSelect.do")
	public String noticeSelect(NoticeVO vo, Model model) { // model객체는 처리된 결과를 실어서 페이지로 보낸다
		vo = noticeDao.noticeSelect(vo);
		if (vo != null) {
			model.addAttribute("notice", vo);
			noticeDao.noticeHitUpdate(vo.getNoticeNo()); //조회수 증가 메소드
			return "notice/noticeSelect";
		} else {
			model.addAttribute("message", "게시글이 존재하지 않습니다");
			return "notice/noticeError";
		}

	}

	@RequestMapping("/managerNoticeUpdateForm.do")
	public String noticeUpdateForm(NoticeVO vo, Model model) {
		vo = noticeDao.noticeSelect(vo);
		model.addAttribute("notice", vo);
		return "manager/manager/managerNoticeUpdateForm";
	}

	@RequestMapping("/managerNoticeUpdate.do")
	public String noticeUpdate(NoticeVO vo) {
		int n = noticeDao.noticeUpdate(vo);

		if (n != 0) {
			return "redirect:managerNotice.do";
		}
		return "notice/noticeError";
	}


	
	//관리자페이지
	@RequestMapping("/managerNotice.do")
	public String managerNotice(Model model, CriteriaVO cri) {
		PageVO pageVO = new PageVO(cri, noticeDao.getTotal(cri)); //(기준, 토탈)
		model.addAttribute("pageVO", pageVO); //페이지네이션전달		
		model.addAttribute("list", noticeDao.getList(cri)); //게시글전달
		return "manager/manager/managerNoticeList";
	}
	@RequestMapping("/managerNoticeWriteForm.do")
	public String noticeWriteForm() {
		return "manager/manager/managerNoticeWriteForm";
	}
	
	@RequestMapping("/noticeWrite.do")
	public String noticeWrite(NoticeVO vo) {
		int n = noticeDao.noticeInsert(vo);

		if (n != 0) {
			return "redirect:managerNotice.do";
		}
		return "notice/noticeError";
	}
	
	@RequestMapping("/noticeDelete.do")
	public String noticeDelete(NoticeVO vo) {
		int n = noticeDao.noticeDelete(vo);

		if (n != 0) {
			return "redirect:managerNotice.do";
		}
		return "notice/noticeError";
	}

}