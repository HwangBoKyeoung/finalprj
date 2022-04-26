package com.third.prj.user.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

import com.third.prj.moviereservation.service.MovieReservVO;
import com.third.prj.performance.service.PerformanceVO;
import com.third.prj.performancereservation.service.PerformanceReservationVO;
import com.third.prj.point.service.PointCriteriaVO;
import com.third.prj.point.service.PointVO;

public interface UserService {
	List<UserVO> userList();

//	로그인
	UserVO userSelect(UserVO userVO);

//	유저 검색
	UserVO userSelectOne(UserVO userVO);
//	회원가입

	List<UserVO> userList(CriteriaVO cri);

	int userInsert(UserVO userVO);

//	회원정보 수정
	int userUpdate(UserVO userVO);

//	 회원 탈퇴
	int userDelete(UserVO userVO);

	int userPointUpdate(@Param("point") int point, @Param("id") String id);

//	아이디체크
	int idChk(UserVO userVO);

//	security
	UserVO getUser(UserVO userVO);

//	이메일체크
	int emailCheck(String email);

//  카카오 회원가입	
	int kakaoInsert(UserVO userVO);

	// 포인트 충전
	int userCharge(Map<String, Object> map);

	// 로그인 체크용 메서드
	public UserVO loginChk(UserVO userVO);

	public UserVO loginChk(UserVO userVO, HttpSession session);

	// 유저포인트리스트
	List<UserPointViewVo> pointBuyList(UserPointViewVo userVO);

	// 영화 예매 내역 리스트
	public List<MovieReservVO> mvRList(UserCriteriaVO cri);

	// 전체 게시글수
	public int getMTotal(UserCriteriaVO cri);

	// 공연 예매 내역 리스트
	public List<PerformanceVO> pfRList(UserCriteriaVO cri);

	// 공연 예매 리스트 페이징
	public int getFTotal(UserCriteriaVO cri);

	// 포인트 충전내역 리스트
	public List<PointVO> pointBuyList2(PointCriteriaVO cri);

	// 포인트 충전내역 페이징
	public int pointBuyTotal(PointCriteriaVO cri);

	// 유저 포인트 확인
	UserPointViewVo userPoint(UserPointViewVo vo);

	// 페이징(관리자 - 회원리스트페이지)
	int getTotal(CriteriaVO cri);

	// 로그인 시 예약중인 공연 있는지 확인
	int reservChk(UserVO userVO);

	// 양수 내역 리스트화
	public List<PerformanceReservationVO> getprList(UserCriteriaVO cri);

	// 양수 내역 리스트
	public List<PerformanceReservationVO> prList(UserCriteriaVO cri);

	// 유저정보 불러오기
	public UserVO getUser2(String Uid);

	// 개인 양수
	int reservedBuy(Map<String, Object> map);

	// 자유시장 구매
	int marketBuy(Map<String, Object> map);

	// 아이디 찾기
	String searchId(@Param("name") String name, @Param("phone") String phone);

	// 비밀번호 찾기
	boolean findPw(UserVO vo);

	// 이메일발송
	void sendEmail(UserVO vo, String pw, String div);

	// 마이페이지 회원정보
	UserVO selectByMemberId(@Param("UId") String UId, @Param("email") String email);

	// 비밀번호 찾기
	int updatePassword2(UserVO vo);

	// 결제하면 포인트 변경
	int payPoint(UserVO vo);

	// 비밀번호체크
	int pwdCheck(UserVO vo);

	// 비밀번호변경
	int pwdUpdate(UserVO vo);
	
	// 비밀번호체크2
	public String pwdCheck2(String UId);


}
