package com.third.prj.user.mapper;

import com.third.prj.user.service.MemberVO;

public interface MemberMapper {
	MemberVO selectMember(MemberVO vo);
	MemberVO selectIdMember(MemberVO vo);
}
