package com.third.prj.user.service;

import java.util.List;

public interface UserService {
	int userInsert(UserVO vo);
	int idChk(UserVO vo);
	List<UserVO> userList();
	UserVO userSelect(UserVO vo);
	List<UserVO> userSearch(String key,String val);
	UserVO getUser(UserVO vo);
}
