package com.third.prj.manager.service;

import java.util.List;

public interface ManagerService {

	List<ManagerVO> managerSelectList();
	ManagerVO managerSelect(ManagerVO vo);
	int managerInsert(ManagerVO vo);
	int managerUpdate(ManagerVO vo);
	int managerDelete(ManagerVO vo);
	
	int idCheck(String MId);
	
	List<ManagerVO> managerSearch(String key, String val);
}
