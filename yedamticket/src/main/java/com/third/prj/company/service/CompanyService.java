package com.third.prj.company.service;

import java.util.List;

public interface CompanyService {

	List<CompanyVO> companyList(CriteriaVO cri);

	CompanyVO companySelect(CompanyVO vo);

	int companyInsert(CompanyVO vo);

//	company 아이디 체크
	int cidChk(CompanyVO vo);


//  company 로그인
	CompanyVO companyLogin(CompanyVO vo);
	
	int getTotal(CriteriaVO cri);
}
