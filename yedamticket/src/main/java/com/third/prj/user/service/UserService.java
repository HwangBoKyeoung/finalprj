package com.third.prj.user.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface UserService {
	
	List<UserVO> userList();
	UserVO userSelect(UserVO vo);
	int userInsert(UserVO vo);
	
//	검색
	List<UserVO> userSearch(@Param("key")String key, @Param("val") String val);
//	아이디체크
	int idChk(UserVO vo);
//	security
	UserVO getUser(UserVO vo);
//	이메일체크
	UserVO emailCheck(UserVO vo);
  
}
