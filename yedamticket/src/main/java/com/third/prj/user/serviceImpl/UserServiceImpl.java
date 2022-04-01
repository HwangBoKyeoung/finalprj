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
	private UserMapper mapper;

	@Override
	public int userInsert(UserVO vo) {
		return mapper.userInsert(vo);
	}

	/*
	 * @Override public int userPointUpdate(UserVO vo) { return
	 * mapper.userPointUpdate(vo); }
	 */
	
	@Override
	public int idChk(UserVO vo) {
		return mapper.idChk(vo);
	}

	@Override
	public List<UserVO> userList() {
		return mapper.userList();
	}

	@Override
	public UserVO userSelect(UserVO vo) {
		return mapper.userSelect(vo);
	}

	@Override
	public List<UserVO> userSearch(String key, String val) {
		return mapper.userSearch(key, val);
	}

	@Override
	public UserVO getUser(UserVO vo) {
		return mapper.getUser(vo);
	}

	@Override
	public UserVO emailCheck(UserVO vo) {
		return mapper.emailCheck(vo);
	}

	@Override
	public int userPointUpdate(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
}

