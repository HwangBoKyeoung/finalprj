package com.third.prj.manager.service;

import java.util.List;

public interface ManagerService {

	List<ManagerVO> managerSelectList(CriteriaVO cri);
	ManagerVO managerSelect(ManagerVO vo);
	int managerInsert(ManagerVO vo);
	int managerUpdate(ManagerVO vo);
	int managerDelete(ManagerVO vo);
	
//	관리자아이디중복체크
	int idCheck(String MId);
//	관리자 검색
	List<ManagerVO> managerSearch(String key, String val);
	
	//페이징처리
	int countmana(CriteriaVO cri);
	
	//로그인
	ManagerVO manaLogin(ManagerVO vo);
}
