package com.third.prj.user.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.third.prj.moviereservation.service.MovieReservVO;
import com.third.prj.performance.service.PerformanceVO;
import com.third.prj.point.service.PointCriteriaVO;
import com.third.prj.point.service.PointVO;
import com.third.prj.user.mapper.UserMapper;
import com.third.prj.user.service.CriteriaVO;
import com.third.prj.user.service.UserCriteriaVO;
import com.third.prj.user.service.UserPointViewVo;
import com.third.prj.user.service.UserService;
import com.third.prj.user.service.UserVO;

@Repository("userDao")
public class UserServiceImpl implements UserService {

	private PasswordEncoder passwordEncoder;

	@Inject
	private BCryptPasswordEncoder pwdEncoder;

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

	private String email;
	private String password;

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

	/*
	 * @Override public int userCharge(UserVO vo) { return mapper.userCharge(vo); }
	 */

	@Override
	public int userPointUpdate(int point, String id) {
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

	@Override
	public List<PointVO> pointBuyList2(PointCriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.pointBuyList2(cri);
	}

	@Override
	public int pointBuyTotal(PointCriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.pointBuyTotal(cri);
	}

	@Override
	public UserPointViewVo userPoint(UserPointViewVo vo) {
		// TODO Auto-generated method stub
		return mapper.userPoint(vo);
	}

	public int getTotal(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.getTotal(cri);
	}

	public int userCharge(Map<String, Object> map) {
		return mapper.userCharge(map);
	}

	@Override
	public List<UserVO> userList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String searchId(String name, String phone) {
		// TODO Auto-generated method stub
		return mapper.searchId(name, phone);
	}

	@Override
	public boolean findPw(UserVO vo) {
		// TODO Auto-generated method stub
		UserVO uv = mapper.selectByMemberId(vo.getUId());
		System.out.println("여기까지 왔을까?");
		System.out.println(uv);
		if (uv == null) {
			return false;
		}
		// 임시 비밀번호 생성
		String pw = "";
		for (int i = 0; i < 12; i++) {
			pw += (char) ((Math.random() * 26) + 97);
		}
		String pw2 = pwdEncoder.encode(pw);
		System.out.println(pw2);
		vo.setPwd(pw2);
		System.out.println("여기까지 왔을까2 ?");
		System.out.println(vo);
		// 비밀번호 변경
		mapper.updatePassword2(vo);
		// 비밀번호 변경 메일 발송
		sendEmail(vo, pw2, "findpw");
		return true;
	}

	@Override
	public void sendEmail(UserVO vo, String pw, String div) {
		// Mail Server 설정
		
		System.out.println("진짜왔니?");
		System.out.println(vo);
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; // 네이버 이용시 smtp.naver.com
		String hostSMTPid = email; // 보내는 사람 이메일 주소
		String hostSMTPpwd = password; // 보내는 사람 비밀번호

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = email;
		String fromName = "예담티켓";
		String subject = "";
		String msg = "";

		/* String setfrom = "gmswjrdl7@gmail.com"; */

		if (div.equals("findpw")) {
			subject = "임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana; padding: 200px 100px 200px 100px;'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getUId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += pw + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		//String mail = vo.getUId();mail
		
		try {
			HtmlEmail email = new HtmlEmail();
			System.out.println("1");
			email.setDebug(true);
			System.out.println("2");
			email.setCharset(charSet);
			System.out.println("3");
			email.setSSLOnConnect(true);
			System.out.println("4");
			email.setHostName("smtp.gmail.com");
			System.out.println("5");
			email.setSmtpPort(465); // 네이버 이용시 587		
			System.out.println("6");
			email.setAuthentication("qqoxmaos2@gmail.com", "dlwogus1@");
			System.out.println("7");
			email.setStartTLSEnabled(true);
			System.out.println("8");
			email.addTo("qqoxmaos2@gmail.com"); 
			System.out.println("9");
			email.addTo(fromEmail, fromName);
			System.out.println("10");
			email.setSubject(subject);
			System.out.println("11");
			email.setHtmlMsg(msg);
			System.out.println("12");
			email.send();
			email.setTLS(false);
			
			System.out.println("13");
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}

	}

}
