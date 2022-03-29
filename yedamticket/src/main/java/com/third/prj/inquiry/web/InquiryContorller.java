package com.third.prj.inquiry.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.prj.inquiry.service.InquiryService;
import com.third.prj.inquiry.service.InquiryVO;
import com.third.prj.notice.service.NoticeVO;

@Controller
public class InquiryContorller {
	
	@Autowired
	private InquiryService inquiryDao;
	
	//상담페이지(상담리스트)
	@RequestMapping("/inquiry.do")
	public String inquiryList(Model model) {
		model.addAttribute("inquirys", inquiryDao.inquirySelectList());
		return"manager/inquiry/inquiry";
	}
	//상담상세페이지
	@RequestMapping("/inquirySelect.do")
	public String inquirySelect(InquiryVO vo, Model model) {
		vo = inquiryDao.inquirySelect(vo);
		model.addAttribute("inq",vo);
		return "manager/inquiry/inquirySelect";
	}
	
	//1:1문의
	@RequestMapping("/inqList.do")
	public String inqList(Model model) {
		model.addAttribute("inqs", inquiryDao.inquirySelectList());
		return"user/inqList";
	}
	
	@RequestMapping("/inqSelect.do")
	public String inqSelect(InquiryVO vo, Model model) {
		vo = inquiryDao.inquirySelect(vo);
		model.addAttribute("inqs",vo);
		return "user/inqSelect";
	}
	
	@RequestMapping("/inqWriteForm.do")
	public String inqWriteForm() {
		return "user/inqWriteForm";
	}
	@RequestMapping("/inqWrite.do")
	public String inqWrite(InquiryVO vo) {
		int n = inquiryDao.inquiryInsert(vo);
		
		if(n != 0) {
			return "redirect:inqList.do";
		}
		return "user/inqError";
	}
	
	@RequestMapping("/inqUpdateForm.do")
	public String inqUpdateForm(InquiryVO vo, Model model) {
		vo = inquiryDao.inquirySelect(vo);
		model.addAttribute("inqs", vo);

		return "user/inqUpdateForm";
	}

	@RequestMapping("/inqUpdate.do")
	public String inqUpdate(InquiryVO vo) {
		int n = inquiryDao.inquiryUpdate(vo);

		if (n != 0) {
			return "redirect:inqList.do";
		}
		return "inq/inqError";
	}

	@RequestMapping("/inqDelete.do")
	public String inqDelete(InquiryVO vo) {
		int n = inquiryDao.inquiryDelete(vo);

		if(n !=0) {
			return "redirect:inqList.do";
		}
		return "notice/inqError";
	}
}
