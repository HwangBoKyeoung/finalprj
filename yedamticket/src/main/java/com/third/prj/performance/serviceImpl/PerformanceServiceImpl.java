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
	public PerformanceVO perSelect(PerformanceVO vo) {
		return mapper.perSelect(vo);
	}

	@Override
	public List<PerformanceVO> perSelectList(CriteriaVO cri) {
		return mapper.perSelectList(cri);
	}

	@Override
	public int procedureCall(Map map) {
		return mapper.procedureCall(map);
	}


	@Override
	public int countperf(CriteriaVO cri) {
		return mapper.countperf(cri);
	}


	@Override
	public int totalPerf() {
		return 0;
	}

}
