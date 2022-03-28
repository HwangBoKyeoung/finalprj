package com.third.prj.company.service;

import com.third.prj.company.vo.CompanyVO;

public interface CompanyMapper {
	int companyInsert(CompanyVO vo);
	int cidChk(CompanyVO vo);
}
