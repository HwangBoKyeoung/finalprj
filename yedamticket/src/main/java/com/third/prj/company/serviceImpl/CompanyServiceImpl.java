package com.third.prj.company.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.company.service.CompanyMapper;
import com.third.prj.company.service.CompanyService;
import com.third.prj.company.vo.CompanyVO;

@Repository("companyDao")
public class CompanyServiceImpl implements CompanyService{

	@Autowired
	private CompanyMapper map;
	
	@Override
	public int companyInsert(CompanyVO vo) {
		return map.companyInsert(vo);
	}

	@Override
	public int cidChk(CompanyVO vo) {
		int i = map.cidChk(vo);
		return i;
	}
	
}
