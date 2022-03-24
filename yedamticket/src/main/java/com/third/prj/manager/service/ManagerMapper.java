package com.third.prj.manager.service;

import java.util.List;

import com.third.prj.manager.vo.ManagerVO;

public interface ManagerMapper {

	List<ManagerVO> managerSelectList();
	ManagerVO managerSelect(ManagerVO vo);
	int managerInsert(ManagerVO vo);
	int managerUpdate(ManagerVO vo);
	int managerDelete(ManagerVO vo);
}
