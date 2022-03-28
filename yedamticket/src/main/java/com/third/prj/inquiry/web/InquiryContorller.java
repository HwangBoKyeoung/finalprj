package com.third.prj.inquiry.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.prj.inquiry.service.InquiryService;
import com.third.prj.inquiry.vo.InquiryVO;
import com.third.prj.inquiryreply.vo.InquiryReplyVO;

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

}
