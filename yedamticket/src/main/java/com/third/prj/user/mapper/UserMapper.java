package com.third.prj.user.mapper;

import com.third.prj.user.service.UserVO;

public interface UserMapper {
	int userInsert(UserVO vo);
	int idChk(UserVO vo);
}
