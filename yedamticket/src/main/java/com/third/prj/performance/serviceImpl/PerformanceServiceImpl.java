package com.third.prj.performance.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.performance.mapper.PerformanceMapper;
import com.third.prj.performance.service.CriteriaVO;
import com.third.prj.performance.service.PerformanceService;
import com.third.prj.performance.service.PerformanceVO;

@Repository("perDao")
public class PerformanceServiceImpl implements PerformanceService {

	@Autowired
	public PerformanceMapper mapper;
	
	@Override
	public int perforUpdate(PerformanceVO vo) {
		return mapper.perforUpdate(vo);
	}


	@Override
	public PerformanceVO perSelect(PerformanceVO vo) {
		return mapper.perSelect(vo);
	}

	@Override
	public List<PerformanceVO> perSelectList() {
		return mapper.perSelectList();
	}

	@Override
	public int procedureCall(Map map) {
		return mapper.procedureCall(map);
	}

	//황규복
	@Override
	public List<PerformanceVO> pList(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.pList(cri);
	}

	@Override
	public List<PerformanceVO> epList() {
		// TODO Auto-generated method stub
		return mapper.epList();
	}


	@Override
	public int getTotal(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.getTotal(cri);
	}


	@Override
	public PerformanceVO pSelect(PerformanceVO vo) {
		// TODO Auto-generated method stub
		return mapper.perSelect(vo);
	}


	

}
