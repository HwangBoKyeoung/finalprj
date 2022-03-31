package com.third.prj.manager.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.manager.mapper.ManagerMapper;
import com.third.prj.manager.service.ManagerService;
import com.third.prj.manager.service.ManagerVO;

@Repository("managerDao")
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	private ManagerMapper mapper;

	@Override
	public List<ManagerVO> managerSelectList() {
		return mapper.managerSelectList();
	}

	@Override
	public ManagerVO managerSelect(ManagerVO vo) {
		return mapper.managerSelect(vo);
	}

	@Override
	public int managerInsert(ManagerVO vo) {
		return mapper.managerInsert(vo);
	}

	@Override
	public int managerUpdate(ManagerVO vo) {
		return mapper.managerUpdate(vo);
	}

	@Override
	public int managerDelete(ManagerVO vo) {
		return mapper.managerDelete(vo);
	}

	@Override
	public List<ManagerVO> managerSearch(String key, String val) {
		return mapper.managerSearch(key, val);
	}

	
	@Override
	public int idCheck(String MId) {
		return mapper.idCheck(MId);
	}
	
	
}
