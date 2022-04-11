package com.third.prj.manager.service;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface ManagerService {

	List<ManagerVO> managerSelectList(CriteriaVO cri);
	ManagerVO managerSelect(ManagerVO vo);
	int managerInsert(ManagerVO vo);
	int managerUpdate(ManagerVO vo);
	int managerDelete(ManagerVO vo);
	
//	관리자아이디중복체크
	int idCheck(String MId);
	//리스트 처리 + 검색
	int getTotal(CriteriaVO cri);
	
	//로그인
	ManagerVO manaLogin(ManagerVO vo);
	ManagerVO manaLogin(ManagerVO vo, HttpSession session);
}
