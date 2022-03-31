package com.third.prj.inquiryreply.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.third.prj.inquiryreply.service.InquiryReplyService;
import com.third.prj.inquiryreply.service.InquiryReplyVO;

@RestController
public class InquiryReplyRestController {

	@Autowired
	private InquiryReplyService inquiryReplyDao;
	
	@PostMapping("/ajaxReplyInsert.do")
	public InquiryReplyVO ajaxReplyInsert(InquiryReplyVO vo, Model model) {
		int n = inquiryReplyDao.inquiryReplyInsert(vo);
		/* model.addAttribute("inqReply", vo); */
		if(n!=0) {
//			vo = inquiryReplyDao.selectReplyNo();
			return inquiryReplyDao.inquiryReplySelect(vo);
		}else {
			return null;
		}
	}
}
