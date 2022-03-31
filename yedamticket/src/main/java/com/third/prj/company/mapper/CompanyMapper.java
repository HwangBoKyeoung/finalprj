package com.third.prj.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.third.prj.company.service.CompanyVO;

public interface CompanyMapper {
	
	List<CompanyVO> companyList();
	CompanyVO companySelect(CompanyVO vo);
	int companyInsert(CompanyVO vo);

//	company 아이디 체크
	int cidChk(CompanyVO vo);
//	company 검색
	List<CompanyVO> companySearch(@Param("key") String key, @Param("val") String val);
	
}
