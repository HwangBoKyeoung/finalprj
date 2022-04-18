package com.third.prj.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private MemberService memberDao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		단건조회 return
		System.out.println("*****************************"+username);
		
		MemberVO vo = new MemberVO();
		vo.setUsername(username);
//		vo.setRole("user");
		
		System.out.println("00000000000000000000000000000"+vo);
		
		MemberVO memberVO = memberDao.selectIdMember(vo);
		System.out.println("00000000000000000000000000001"+memberVO);
		
//		아이디 없을 때!!
		if(memberVO == null) {
			throw new UsernameNotFoundException("User not Found");
		}
		
		return memberVO;
	}
	
}
