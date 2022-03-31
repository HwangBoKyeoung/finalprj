package com.third.prj.company.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.third.prj.company.service.CompanyService;
import com.third.prj.company.service.CompanyVO;

@RestController
public class CompanyRestController {

	@Autowired
	private CompanyService companyDao;
	
	@PostMapping("/ajaxCompanySearch.do")
	public List<CompanyVO> ajaxCompanySearch(@RequestParam("key")String key, @RequestParam("val") String val) {
		return companyDao.companySearch(key, val);
	}
}
