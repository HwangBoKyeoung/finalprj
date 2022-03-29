package com.third.prj.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.third.prj.company.service.CompanyVO;

public interface CompanyMapper {
	int companyInsert(CompanyVO vo);
	int cidChk(CompanyVO vo);
	List<CompanyVO> companyList();
	CompanyVO companySelect(CompanyVO vo);
	List<CompanyVO> companySearch(@Param("key") String key, @Param("val") String val);
}
