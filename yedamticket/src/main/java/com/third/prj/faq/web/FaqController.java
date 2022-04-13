package com.third.prj.faq.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.prj.faq.service.CriteriaVO;
import com.third.prj.faq.service.FaqService;
import com.third.prj.faq.service.FaqVO;
import com.third.prj.faq.service.PageVO;

@Controller
public class FaqController {

	@Autowired
	FaqService faqDao;

	@RequestMapping("/faqList.do")
	public String faqList(Model model) {
		model.addAttribute("faqs", faqDao.faqSelectList());
		return "faq/faqList";
	}

	@RequestMapping("/faqWriteForm.do")
	public String faqWriteForm() {
		return "manager/faq/faqWriteForm";
	}

	@RequestMapping("/faqWrite.do")
	public String faqWrite(FaqVO vo) {
		int n = faqDao.faqInsert(vo);

		if (n != 0) {
			return "redirect:managerFaq.do";
		} else {
			return "manager/faq/faqError";
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
		return "manager/faq/faqUpdateForm";
	}

	
	
	@RequestMapping("/faqDelete.do")
	public String faqDelete(FaqVO vo) {
		int n = faqDao.faqDelete(vo);

		if(n !=0) {
			return "redirect:managerFaq.do";
		}
		return "faq/faqError";
	}
	//관리자페이지
	@RequestMapping("/managerFaq.do")
	public String managerFaq(Model model, CriteriaVO cri) {
		PageVO pageVO = new PageVO(cri, faqDao.getTotal(cri));
		model.addAttribute("faqs", faqDao.managerFaqList(cri));
		model.addAttribute("pageVO",pageVO);
		return "manager/manager/managerFaqList";
	}
	@RequestMapping("/managerFaqSelect.do")
	public String managerFaqSelect(Model model, FaqVO vo) {
		model.addAttribute("faqs", faqDao.faqSelect(vo));
		return "manager/manager/managerFaqUpdateForm";
	}
	@RequestMapping("/managerFaqUpdate.do")
	public String faqUpdate(FaqVO vo) {
		int n = faqDao.faqUpdate(vo);

		if (n != 0) {
			return "redirect:managerFaq.do";
		}
		return "faq/faqError";
	}
	
}
