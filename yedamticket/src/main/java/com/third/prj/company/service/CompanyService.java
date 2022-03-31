package com.third.prj.company.service;

import java.util.List;


public interface CompanyService {
	int companyInsert(CompanyVO vo);
	int cidChk(CompanyVO vo);
	
	List<CompanyVO> companyList();
	CompanyVO companySelect(CompanyVO vo);
	
	List<CompanyVO> companySearch(String key, String val);
}
