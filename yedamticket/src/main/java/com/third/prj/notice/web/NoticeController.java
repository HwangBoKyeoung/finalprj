package com.third.prj.notice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.prj.faq.service.FaqService;
import com.third.prj.notice.service.NoticeService;
import com.third.prj.notice.service.NoticeVO;
import com.third.prj.notice.service.PagingVO;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeDao;
	@Autowired
	private FaqService faqDao;


	/*
	 * @RequestMapping("/noticeList.do") public String noticeList(Model model) {
	 * model.addAttribute("notices", noticeDao.noticeSelectList());
	 * 
	 * return "notice/noticeList"; }
	 */
	
	@GetMapping("/noticeList.do")
	public String noticeList(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = noticeDao.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("notices", noticeDao.selectBoard(vo));
		return "notice/noticePaging";
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
	public String noticeUpdateForm(NoticeVO vo, Model model) {
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
	
	@RequestMapping("/userService.do")
	public String userService(Model model) {
		model.addAttribute("notices", noticeDao.noticeSelectList());
		model.addAttribute("faqs", faqDao.faqSelectList());
		return "user/userService";
		
	}


}