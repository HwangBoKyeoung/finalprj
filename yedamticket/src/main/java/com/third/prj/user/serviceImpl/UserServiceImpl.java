package com.third.prj.user.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.moviereservation.service.MovieReservVO;
import com.third.prj.performance.service.PerformanceVO;
import com.third.prj.performancereservation.service.PerformanceReservationVO;
import com.third.prj.user.mapper.UserMapper;
import com.third.prj.user.service.CriteriaVO;
import com.third.prj.user.service.UserService;
import com.third.prj.user.service.UserVO;

@Repository("userDao")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;

	@Autowired
	private UserService dao;
	
	@Autowired
	private SqlSession sqlSession;
	
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
	public List<UserVO> userList(CriteriaVO cri) {
		return mapper.userList(cri);
	}

	@Override
	public UserVO userSelect(UserVO vo) {
		return mapper.userSelect(vo);
	}


	@Override
	public UserVO getUser(UserVO vo) {
		return mapper.getUser(vo);
	}

	@Override
	public int emailCheck(String email) {
		return mapper.emailCheck(email);
	}

	@Override
	public int kakaoInsert(UserVO vo) {
		return mapper.kakaoInsert(vo);
	}

	@Override
	public int userUpdate(UserVO vo) {
		return mapper.userUpdate(vo);
	}

	@Override
	public int userDelete(UserVO vo) {
		return mapper.userDelete(vo);
	}

	@Override
	public List<MovieReservVO> MvReservList(MovieReservVO vo) {
		return mapper.MvReservList(vo);
	}

	@Override
	public List<PerformanceVO> pfReservList(PerformanceReservationVO vo) {
		return mapper.pfReservList(vo);
	}

	/*
	 * @Override public int userCharge(UserVO vo) { return mapper.userCharge(vo); }
	 */

	@Override
	public int userPointUpdate(int point, String id) {
		return 0;
	}

	@Override
	public UserVO loginChk(UserVO vo) {
		return sqlSession.selectOne("loginChk", vo);
	}

	@Override
	public UserVO loginChk(UserVO vo, HttpSession session) {
		return dao.loginChk(vo);
	}

	@Override
	public int getTotal(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.getTotal(cri);
	}
	
	public int userCharge(Map<String, Object> map) {
		return mapper.userCharge(map);
	}

	@Override
	public UserVO userSelectOne(UserVO vo) {
		// TODO Auto-generated method stub
		return mapper.userSelectOne(vo);
	}
}
