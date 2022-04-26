package com.third.prj.manager.serviceImpl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.manager.mapper.ManagerMapper;
import com.third.prj.manager.service.CriteriaVO;
import com.third.prj.manager.service.ManagerService;
import com.third.prj.manager.service.ManagerVO;

@Repository("managerDao")
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	private ManagerMapper mapper;

	@Autowired
	private ManagerService dao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ManagerVO> managerSelectList(CriteriaVO cri) {
		return mapper.managerSelectList(cri);
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
	public int idCheck(String MId) {
		return mapper.idCheck(MId);
	}

	@Override
	public int getTotal(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.getTotal(cri);
	}

	@Override
	public ManagerVO manaLogin(ManagerVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("manaLogin", vo);
	}

	@Override
	public ManagerVO manaLogin(ManagerVO vo, HttpSession session) {
		return mapper.manaLogin(vo);
	}

	@Override
	public int midChk(ManagerVO vo) {
		// TODO Auto-generated method stub
		return mapper.midChk(vo);
	}
	
	
}
