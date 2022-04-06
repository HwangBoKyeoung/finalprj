package com.third.prj.user.serviceImpl;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.moviereservation.service.MovieReservVO;
import com.third.prj.performance.service.PerformanceVO;
import com.third.prj.performancereservation.service.PerformanceReservationVO;
import com.third.prj.user.mapper.UserMapper;
import com.third.prj.user.service.UserService;
import com.third.prj.user.service.UserVO;

@Repository("userDao")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;

	@Override
	public int userInsert(UserVO vo) {
		return mapper.userInsert(vo);
	}

	/*
	 * @Override public int userPointUpdate(UserVO vo) { return
	 * mapper.userPointUpdate(vo); }
	 */
	
	@Override
	public int idChk(UserVO vo) {
		return mapper.idChk(vo);
	}

	@Override
	public List<UserVO> userList() {
		return mapper.userList();
	}

	@Override
	public UserVO userSelect(UserVO vo) {
		return mapper.userSelect(vo);
	}

	@Override
	public List<UserVO> userSearch(String key, String val) {
		return mapper.userSearch(key, val);
	}

	@Override
	public UserVO getUser(UserVO vo) {
		return mapper.getUser(vo);
	}

	@Override
	public int emailCheck(String email) {
		// TODO Auto-generated method stub
		return mapper.emailCheck(email);
	}

	@Override
	public int kakaoInsert(UserVO vo) {
		// TODO Auto-generated method stub
		return mapper.kakaoInsert(vo);
	}

	@Override
	public int userUpdate(UserVO vo) {
		// TODO Auto-generated method stub
		return mapper.userUpdate(vo);
	}

	@Override
	public int userDelete(UserVO vo) {
		// TODO Auto-generated method stub
		return mapper.userDelete(vo);
	}

	@Override
	public List<MovieReservVO> MvReservList(MovieReservVO vo) {
		// TODO Auto-generated method stub
		return mapper.MvReservList(vo);
	}

	@Override
	public List<PerformanceVO> pfReservList(PerformanceReservationVO vo) {
		// TODO Auto-generated method stub
		return mapper.pfReservList(vo);
	}

	@Override
	public int userCharge(UserVO vo) {
		return mapper.userCharge(vo);
	}

	@Override
	public int userPointUpdate(int point, String id) {
		// TODO Auto-generated method stub
		return 0;
	}
}
