package com.third.prj.inquiry.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	//상담페이지(상담리스트)
	@RequestMapping("/inquiry.do")
	public String inquiryList(Model model) {
		model.addAttribute("inquirys", inquiryDao.inquirySelectList());
		return"manager/inquiry/inquiry";
	}
	//상담상세페이지
	@RequestMapping("/inquirySelect.do")
	public String inquirySelect(InquiryVO vo,InquiryReplyVO replyvo, Model model) {
//		new 답변VO
//		답변Vo.set(vo.get답변ID())
		replyvo.setInNo(vo.getInNo());
		vo = inquiryDao.inquirySelect(vo);
		replyvo = irDao.inquiryReplySelect(replyvo);
		model.addAttribute("inq",vo);
		model.addAttribute("inqReply", replyvo);
		return "manager/inquiry/inquirySelect";
	}

}
