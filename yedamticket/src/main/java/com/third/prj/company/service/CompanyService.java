package com.third.prj.company.service;

import com.third.prj.company.vo.CompanyVO;

public interface CompanyService {
	int companyInsert(CompanyVO vo);
	int cidChk(CompanyVO vo);
}
