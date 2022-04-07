package com.third.prj.user.serviceImpl;

import java.util.List; 

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.movie.service.MovieVO;
import com.third.prj.moviereservation.service.MovieReservVO;
import com.third.prj.moviereservation.service.MovieReservationVO;
import com.third.prj.notice.service.CriteriaVO;
import com.third.prj.performance.service.PerformanceVO;
import com.third.prj.performancereservation.service.PerformanceReservationVO;
import com.third.prj.point.service.PointVO;
import com.third.prj.user.mapper.UserMapper;
import com.third.prj.user.service.UserCriteriaVO;
import com.third.prj.user.service.UserPointViewVo;
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
	public int userCharge(UserVO vo) {
		return mapper.userCharge(vo);
	}

	@Override
	public int userPointUpdate(int point, String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override

	public UserVO userSelectOne(UserVO vo) {
		// TODO Auto-generated method stub
		return mapper.userSelectOne(vo);
	}

	public UserVO loginChk(UserVO vo) {
		return sqlSession.selectOne("loginChk", vo);
	}

	@Override
	public UserVO loginChk(UserVO vo, HttpSession session) {
		return dao.loginChk(vo);

	}

	@Override
	public List<UserPointViewVo> pointBuyList(UserPointViewVo vo) {
		// TODO Auto-generated method stub
		return mapper.pointBuyList(vo);
	}

	@Override
	public List<MovieReservVO> mvRList(UserCriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.mvRList(cri);
	}

	@Override
	public int getMTotal(UserCriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.getMTotal(cri);
	}

	@Override
	public List<PerformanceVO> pfRList(UserCriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.pfRList(cri);
	}

	@Override
	public int getFTotal(UserCriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.getFTotal(cri);
	}






}
