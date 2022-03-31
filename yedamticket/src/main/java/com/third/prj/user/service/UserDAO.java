package com.third.prj.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserVO getUser(UserVO user) {
		return mybatis.selectOne("UserDAO.getUser", user);
	}
}
