package com.third.prj.company.mapper;

import com.third.prj.company.service.CompanyVO;

public interface CompanyMapper {
	int companyInsert(CompanyVO vo);
	int cidChk(CompanyVO vo);
}
