package com.third.prj.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private UserService userDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		단건조회 return
		System.out.println("*****************************"+username);
		
		UserVO vo = new UserVO();
		vo.setUId(username);
		System.out.println("00000000000000000000000000000"+vo);
		UserVO userVO = userDao.getUser(vo);
		
//		System.out.println("00000000000000000000000000001"+vo.getPwd());
//		System.out.println("00000000000000000000000000002"+userVO.getPwd());
//		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(10);
//		boolean pwdChk = pwdEncoder.matches(userVO.getPwd().en, userVO.getPwd());
//		아이디가 없으면?
		if(userVO == null) {
			throw new UsernameNotFoundException("User not Found");
		}
		return userVO;
	}
	
	

}