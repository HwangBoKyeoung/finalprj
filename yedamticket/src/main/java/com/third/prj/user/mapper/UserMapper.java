package com.third.prj.user.mapper;

import java.util.List;

import com.third.prj.user.service.UserVO;

public interface UserMapper {
	int userInsert(UserVO vo);
	int idChk(UserVO vo);
	List<UserVO> userList();
	UserVO userSelect(UserVO vo);
	List<UserVO> userSearch(String key,String val);
	UserVO getUser(UserVO vo);
	UserVO emailCheck(UserVO vo);
}
