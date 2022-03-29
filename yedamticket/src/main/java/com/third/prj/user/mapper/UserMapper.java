package com.third.prj.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.third.prj.user.service.UserVO;

public interface UserMapper {
	int userInsert(UserVO vo);
	int idChk(UserVO vo);
	
	List<UserVO> userList();
	UserVO userSelect(UserVO vo);
	List<UserVO> userSearch(@Param("key")String key, @Param("val") String val);
}
