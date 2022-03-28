package com.third.prj.faq.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.prj.faq.service.FaqService;
import com.third.prj.faq.vo.FaqVO;

@Controller
public class FaqController {
	
	@Autowired FaqService faqDao;
	
	@RequestMapping("/faqList.do")
	public String noticeList(Model model) {
		model.addAttribute("faqs", faqDao.faqSelectList());

		return "faq/faqList";
	}
	@RequestMapping("/faqWriteForm")
	public String faqWriteForm() {
		return "faq/faqWriteForm";
	}
	@RequestMapping("/faqWrite.do")
	public String faqWrite(FaqVO vo ) {
		int n = faqDao.faqInsert(vo);
		
		if(n != 0) {
			return "faq/faqList";
		}else {
			return "faq/faqError";
		}
		
	}
}
