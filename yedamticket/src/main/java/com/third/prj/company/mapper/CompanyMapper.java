package com.third.prj.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.third.prj.company.service.CompanyVO;
import com.third.prj.company.service.CriteriaVO;

public interface CompanyMapper {
	
	List<CompanyVO> companyList(CriteriaVO cri);
	CompanyVO companySelect(CompanyVO vo);
	int companyInsert(CompanyVO vo);
	int companyUpdate(CompanyVO vo);
	
//	company 아이디 체크
	int cidChk(CompanyVO vo);
//  company 로그인
	CompanyVO companyLogin(CompanyVO vo);
	
	//관리자 -기업회원 리스트
	int getTotal(CriteriaVO cri);
	
	
	
}
