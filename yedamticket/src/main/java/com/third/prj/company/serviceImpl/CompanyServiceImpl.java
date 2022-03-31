package com.third.prj.company.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.company.mapper.CompanyMapper;
import com.third.prj.company.service.CompanyService;
import com.third.prj.company.service.CompanyVO;
import com.third.prj.manager.service.ManagerVO;

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

	@Override
	public List<CompanyVO> companyList() {
		// TODO Auto-generated method stub
		return map.companyList();
	}

	@Override
	public CompanyVO companySelect(CompanyVO vo) {
		// TODO Auto-generated method stub
		return map.companySelect(vo);
	}

	@Override
	public List<CompanyVO> companySearch(String key, String val) {
		// TODO Auto-generated method stub
		return map.companySearch(key, val);
	}
	
}
