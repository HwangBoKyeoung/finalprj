package com.third.prj.inquiry.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.third.prj.inquiry.service.InquiryService;
import com.third.prj.inquiry.service.InquiryVO;
import com.third.prj.inquiryreply.service.InquiryReplyService;
import com.third.prj.inquiryreply.service.InquiryReplyVO;


@Controller
public class InquiryContorller {
	
	@Autowired
	private InquiryService inquiryDao;
	
	@Autowired
	private InquiryReplyService irDao;
	
	@Autowired
	private InquiryReplyService inquiryReplyDao;
	
	//상담페이지(상담리스트)
	@RequestMapping("/inquiry.do")
	public String inquiryList(Model model) {
		model.addAttribute("inquirys", inquiryDao.inquirySelectList());
		return"manager/inquiry/inquiry";
	}
	
	//상담상세페이지
	@RequestMapping("/inquirySelect.do")
	public String inquirySelect(InquiryVO vo, InquiryReplyVO replyvo, Model model) {
//		new 답변VO
//		답변Vo.set(vo.get답변ID())
		replyvo.setInNo(vo.getInNo());
		vo = inquiryDao.inquirySelect(vo);
		replyvo = irDao.inquiryReplySelect(replyvo);
		model.addAttribute("inq",vo);
		model.addAttribute("inqReply", replyvo);
		return "manager/inquiry/inquirySelect";
	}
	
	//1:1문의
	@RequestMapping("/inqList.do")
	public String inqList(Model model) {
		model.addAttribute("inqs", inquiryDao.inquirySelectList());
		return"inquiry/inqList";
	}
	
	@RequestMapping("/inqSelect.do")
	public String inqSelect(InquiryVO vo, Model model) {
		vo = inquiryDao.inquirySelect(vo);
		model.addAttribute("inqs",vo);
		return "inquiry/inqSelect";
	}
	
	@RequestMapping("/inqWriteForm.do")
	public String inqWriteForm() {
		return "inquiry/inqWriteForm";
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
		return "inquiry/inqUpdateForm";
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
	
	@RequestMapping("/inqReply.do")
	@ResponseBody
	public InquiryReplyVO inqReply(InquiryReplyVO vo){
		return inquiryReplyDao.inquiryReplySelect(vo);
	} 
	
}
