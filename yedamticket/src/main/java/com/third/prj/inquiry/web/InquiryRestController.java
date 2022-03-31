package com.third.prj.inquiry.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.third.prj.inquiry.service.InquiryService;
import com.third.prj.inquiry.service.InquiryVO;

@RestController
public class InquiryRestController {
	
	@Autowired
	private InquiryService inquiryDao;
	
	@PostMapping("/ajaxInqSearch.do")
	public List<InquiryVO> ajaxInqSearch(@RequestParam("key") String key, @RequestParam("val") String val) {
		return inquiryDao.inquirySearch(key, val);
	}
	
}
