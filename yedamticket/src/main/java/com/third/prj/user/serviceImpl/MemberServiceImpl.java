package com.third.prj.user.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.user.mapper.MemberMapper;
import com.third.prj.user.service.MemberService;
import com.third.prj.user.service.MemberVO;

@Repository("memberDao")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public MemberVO selectMember(MemberVO vo) {
		return mapper.selectMember(vo);
	}

	@Override
	public MemberVO selectIdMember(MemberVO vo) {
		return mapper.selectIdMember(vo);
	}
	
}
