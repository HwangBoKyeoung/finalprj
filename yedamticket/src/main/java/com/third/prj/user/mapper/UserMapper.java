package com.third.prj.user.mapper;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

import com.third.prj.moviereservation.service.MovieReservVO;
import com.third.prj.performance.service.PerformanceVO;
import com.third.prj.point.service.PointCriteriaVO;
import com.third.prj.point.service.PointVO;
import com.third.prj.user.service.UserCriteriaVO;
import com.third.prj.user.service.UserPointViewVo;
import com.third.prj.user.service.UserVO;

public interface UserMapper {

	List<UserVO> userList();
//	로그인
	UserVO userSelect(UserVO vo);
//	유저 검색
	UserVO userSelectOne(UserVO vo);
//	회원가입
	int userInsert(UserVO vo);
//	회원정보 수정
	int userUpdate(UserVO vo);

//	 회원 탈퇴
	int userDelete(UserVO vo);

	int userPointUpdate(@Param("point")int point, @Param("id") String id);

//	검색
	List<UserVO> userSearch(@Param("key") String key, @Param("val") String val);

//	아이디체크
	int idChk(UserVO vo);

//	security
	UserVO getUser(UserVO vo);

//	이메일체크
	int emailCheck(String email);

//  카카오 회원가입	
	int kakaoInsert(UserVO vo);
	

	// 포인트 충전
	int userCharge(UserVO vo);
	
	// 로그인 체크용 메서드
	public UserVO loginChk(UserVO vo);
	public UserVO loginChk(UserVO vo, HttpSession session);
	
	//유저포인트리스트
	List<UserPointViewVo> pointBuyList(UserPointViewVo vo);
	
	//영화 예매 내역 리스트
	public List<MovieReservVO> mvRList(UserCriteriaVO cri);
	
	// 전체 게시글수
	public int getMTotal(UserCriteriaVO cri);
	
	//공연 예매 내역 리스트
	public List<PerformanceVO> pfRList(UserCriteriaVO cri);
	
	//공연 예매 리스트 페이징
	public int getFTotal(UserCriteriaVO cri);
	
	//포인트 충전내역 리스트
	public List<PointVO> pointBuyList2(PointCriteriaVO cri);
		
	//포인트 충전내역 페이징
	public int pointBuyTotal(PointCriteriaVO cri);
	

	
	
}