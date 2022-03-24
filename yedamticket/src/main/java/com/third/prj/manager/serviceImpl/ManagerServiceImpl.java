package com.third.prj.manager.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.manager.service.ManagerMapper;
import com.third.prj.manager.service.ManagerService;
import com.third.prj.manager.vo.ManagerVO;

@Repository("managerDao")
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	private ManagerMapper map;

	@Override
	public List<ManagerVO> managerSelectList() {
		return map.managerSelectList();
	}

	@Override
	public ManagerVO managerSelect(ManagerVO vo) {
		return map.managerSelect(vo);
	}

	@Override
	public int managerInsert(ManagerVO vo) {
		return map.managerInsert(vo);
	}

	@Override
	public int managerUpdate(ManagerVO vo) {
		return map.managerUpdate(vo);
	}

	@Override
	public int managerDelete(ManagerVO vo) {
		return map.managerDelete(vo);
	}
	
	
}
