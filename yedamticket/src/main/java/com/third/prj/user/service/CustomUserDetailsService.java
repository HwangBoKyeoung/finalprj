package com.third.prj.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;


public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	UserDAO dao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		단건조회 return
		UserVO vo = new UserVO();
		vo.setUid(username);
		UserVO userVO = dao.getUser(vo);
		
//		아이디가 없으면?
		if(userVO == null) {
			throw new UsernameNotFoundException("User not Found");
		}
		return userVO;
	}

}