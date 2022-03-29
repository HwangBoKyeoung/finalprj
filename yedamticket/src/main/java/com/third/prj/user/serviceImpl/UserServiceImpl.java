package com.third.prj.user.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.user.mapper.UserMapper;
import com.third.prj.user.service.UserService;
import com.third.prj.user.service.UserVO;

@Repository("userDao")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper map;
	
	@Override
	public int userInsert(UserVO vo) {
		return map.userInsert(vo);
	}

	@Override
	public int idChk(UserVO vo) {
		int i = map.idChk(vo);
		return i;
	}

	@Override
	public List<UserVO> userList() {
		// TODO Auto-generated method stub
		return map.userList();
	}

	@Override
	public UserVO userSelect(UserVO vo) {
		// TODO Auto-generated method stub
		return map.userSelect(vo);
	}

	@Override
	public List<UserVO> userSearch(String key, String val) {
		// TODO Auto-generated method stub
		return map.userSearch(key, val);
	}
	
}
