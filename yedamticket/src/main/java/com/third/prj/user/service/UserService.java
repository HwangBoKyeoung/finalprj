package com.third.prj.user.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.third.prj.moviereservation.service.MovieReservVO;
import com.third.prj.performance.service.PerformanceVO;
import com.third.prj.performancereservation.service.PerformanceReservationVO;

public interface UserService {

	List<UserVO> userList();

	UserVO userSelect(UserVO vo);

	int userInsert(UserVO vo);

	int userUpdate(UserVO vo);

//	 회원 탈퇴
	int userDelete(UserVO vo);

	int userPointUpdate(int point, String id);

//	검색
	List<UserVO> userSearch(String key, String val);

//	아이디체크
	int idChk(UserVO vo);

//	security
	UserVO getUser(UserVO vo);

//	이메일체크
	int emailCheck(String email);

//  카카오 회원가입	
	int kakaoInsert(UserVO vo);
	
//  영화 예매 내역	
	List<MovieReservVO> MvReservList(MovieReservVO vo);
	
//  공연 예매 내역
	List<PerformanceVO> pfReservList(PerformanceReservationVO vo);

	// 포인트 충전
	int userCharge(UserVO vo);
  
}
