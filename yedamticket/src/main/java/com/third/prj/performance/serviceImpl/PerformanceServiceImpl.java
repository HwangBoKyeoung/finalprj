package com.third.prj.performance.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
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
	public PerformanceVO perforSelect(PerformanceVO vo) {
		return mapper.perforSelect(vo);
	}

	@Override
	public List<PerformanceVO> companyPerforSelectList(CriteriaVO cri) {
		return mapper.companyPerforSelectList(cri);
	}

	@Override
	public int procedureCall(Map map) {
		return mapper.procedureCall(map);
	}

	@Override
	public int getTotal(CriteriaVO cri) {
		return mapper.getTotal(cri);
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
	public PerformanceVO pSelect(PerformanceVO vo) {
		// TODO Auto-generated method stub
		return mapper.pSelect(vo);
	}



}
