package com.third.prj.manager.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
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

	@Override
	public List<ManagerVO> managerSearch(String key, String val) {
		// TODO Auto-generated method stub
		return map.managerSearch(key, val);
	}

	
	@Override
	public int idCheck(String MId) {
		return map.idCheck(MId);
	}
	
	
}
