package com.third.prj.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.third.prj.company.service.CompanyVO;
import com.third.prj.company.service.CriteriaVO;

public interface CompanyMapper {
	
	List<CompanyVO> companyList(CriteriaVO cri);
	CompanyVO companySelect(CompanyVO vo);
	int companyInsert(CompanyVO vo);

//	company 아이디 체크
	int cidChk(CompanyVO vo);
//	company 검색
	List<CompanyVO> companySearch(@Param("key") String key, @Param("val") String val);
//  company 로그인
	CompanyVO companyLogin(CompanyVO vo);
	int countcompany(CriteriaVO cri);
}
