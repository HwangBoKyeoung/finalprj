package com.third.prj.user.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.user.service.UserMapper;
import com.third.prj.user.service.UserService;
import com.third.prj.user.vo.UserVO;

@Repository("userDao")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper map;
	
	@Override
	public int userInsert(UserVO vo) {
		return map.userInsert(vo);
	}

}
