package com.third.prj.company.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.company.mapper.CompanyMapper;
import com.third.prj.company.service.CompanyService;
import com.third.prj.company.service.CompanyVO;

@Repository("companyDao")
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private CompanyMapper mapper;
	
	@Override
	public int companyInsert(CompanyVO vo) {
		return mapper.companyInsert(vo);
	}

	@Override
	public int cidChk(CompanyVO vo) {
		int i = mapper.cidChk(vo);
		return i;
	}

	@Override
	public List<CompanyVO> companyList() {
		return mapper.companyList();
	}

	@Override
	public CompanyVO companySelect(CompanyVO vo) {
		return mapper.companySelect(vo);
	}

	@Override
	public List<CompanyVO> companySearch(String key, String val) {
		return mapper.companySearch(key, val);
	}
	
}
