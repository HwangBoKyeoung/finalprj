package com.third.prj.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.third.prj.manager.service.ManagerVO;

public interface ManagerMapper {

	List<ManagerVO> managerSelectList();
	ManagerVO managerSelect(ManagerVO vo);
	int managerInsert(ManagerVO vo);
	int managerUpdate(ManagerVO vo);
	int managerDelete(ManagerVO vo);
	
	int idCheck(String MId);
	
	List<ManagerVO> managerSearch(@Param("key") String key, @Param("val") String val);
}
