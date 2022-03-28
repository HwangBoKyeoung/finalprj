package com.third.prj.faq.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.prj.faq.service.FaqService;
import com.third.prj.faq.service.FaqVO;

@Controller
public class FaqController {

	@Autowired
	FaqService faqDao;

	@RequestMapping("/faqList.do")
	public String faqList(Model model) {
		model.addAttribute("faqs", faqDao.faqSelectList());

		return "faq/faqList";
	}

	@RequestMapping("/faqWriteForm")
	public String faqWriteForm() {
		return "faq/faqWriteForm";
	}

	@RequestMapping("/faqWrite.do")
	public String faqWrite(FaqVO vo) {
		int n = faqDao.faqInsert(vo);

		if (n != 0) {
			return "faq/faqList";
		} else {
			return "faq/faqError";
		}
	}
	@PostMapping("/faqSelect.do")
	public String faqSelect(FaqVO vo, Model model) {
		vo = faqDao.faqSelect(vo);
		if (vo != null) {
			model.addAttribute("faqs", vo);
			return "faq/faqSelect";
		} else {
			model.addAttribute("message", "게시글이 존재하지 않습니다");
			return "faq/faqError";
		}

	}

	@RequestMapping("/faqUpdateForm.do")
	public String faqUpdate(FaqVO vo, Model model) {
		vo = faqDao.faqSelect(vo);
		model.addAttribute("faqs", vo);
		return "faq/faqUpdateForm";
	}

	@RequestMapping("/faqUpdate.do")
	public String faqUpdate(FaqVO vo) {
		int n = faqDao.faqUpdate(vo);

		if (n != 0) {
			return "redirect:faqList.do";
		}
		return "faq/faqError";
	}
	@RequestMapping("/faqDelete.do")
	public String faqDelete(FaqVO vo) {
		int n = faqDao.faqDelete(vo);

		if(n !=0) {
			return "redirect:faqList.do";
		}
		return "faq/faqError";
	}
}
