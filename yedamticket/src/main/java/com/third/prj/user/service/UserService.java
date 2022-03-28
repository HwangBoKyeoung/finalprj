package com.third.prj.user.service;

import com.third.prj.user.vo.UserVO;

public interface UserService {
	int userInsert(UserVO vo);
	int idChk(UserVO vo);
}
