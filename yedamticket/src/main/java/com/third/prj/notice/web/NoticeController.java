package com.third.prj.notice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.prj.notice.service.NoticeService;
import com.third.prj.notice.service.NoticeVO;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeDao;

	@RequestMapping("/noticeList.do")
	public String noticeList(Model model) {
		model.addAttribute("notices", noticeDao.noticeSelectList());

		return "notice/noticeList";
	}

	@RequestMapping("/noticeWriteForm.do") 
	public String noticeWriteForm() {
		return "notice/noticeWriteForm";
	}

	@RequestMapping("/noticeWrite.do")
	public String noticeWrite(NoticeVO vo) {
		int n = noticeDao.noticeInsert(vo);

		if (n != 0) {
			return "redirect:noticeList.do";
		}
		return "notice/noticeError";
	}

	@PostMapping("/noticeSelect.do")
	public String noticeSelect(NoticeVO vo, Model model) {
		vo = noticeDao.noticeSelect(vo);
		if (vo != null) {
			model.addAttribute("notice", vo);
			noticeDao.noticeHitUpdate(vo.getNoticeNo()); 
			return "notice/noticeSelect";
		} else {
			model.addAttribute("message", "게시글이 존재하지 않습니다");
			return "notice/noticeError";
		}

	}

	@RequestMapping("/noticeUpdateForm.do")
	public String memberUpdateForm(NoticeVO vo, Model model) {
		vo = noticeDao.noticeSelect(vo);
		model.addAttribute("notice", vo);

		return "notice/noticeUpdateForm";
	}

	@RequestMapping("/noticeUpdate.do")
	public String noticeUpdate(NoticeVO vo) {
		int n = noticeDao.noticeUpdate(vo);

		if (n != 0) {
			return "redirect:noticeList.do";
		}
		return "notice/noticeError";
	}

	@RequestMapping("/noticeDelete.do")
	public String noticeDelete(NoticeVO vo) {
		int n = noticeDao.noticeDelete(vo);

		if(n !=0) {
			return "redirect:noticeList.do";
		}
		return "notice/noticeError";
	}


}