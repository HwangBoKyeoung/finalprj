package com.third.prj.user.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.third.prj.moviereservation.service.MovieReservVO;
import com.third.prj.user.service.UserVO;

public interface UserMapper {

	List<UserVO> userList();

	UserVO userSelect(UserVO vo);

	int userInsert(UserVO vo);

	int userUpdate(UserVO vo);

//	 회원 탈퇴
	int userDelete(UserVO vo);

//	검색
	List<UserVO> userSearch(@Param("key") String key, @Param("val") String val);

//	아이디체크
	int idChk(UserVO vo);

//	security
	UserVO getUser(UserVO vo);

//	이메일체크
	int emailCheck(String email);

// 카카오 회원가입	
	int kakaoInsert(UserVO vo);
//영화 예매 내역	
	List<MovieReservVO> MvReservList(MovieReservVO vo);

}
