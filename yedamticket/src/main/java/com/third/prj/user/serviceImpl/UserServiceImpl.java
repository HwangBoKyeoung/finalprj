package com.third.prj.user.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.third.prj.moviereservation.service.MovieReservVO;
import com.third.prj.performance.service.PerformanceVO;
import com.third.prj.performancereservation.service.PerformanceReservationVO;
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
	
	@Autowired
	private UserMapper mapper;

	@Autowired
	private SqlSession sqlSession;
	
//	@Inject
//	private BCryptPasswordEncoder pwdEncoder;

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
	
	@Override
	public UserVO loginChk(UserVO vo) {
		return sqlSession.selectOne("loginChk", vo);
	}

	@Override
	public UserVO loginChk(UserVO vo, HttpSession session) {
		return mapper.loginChk(vo);

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
		return mapper.getMTotal(cri);
	}

	@Override
	public List<PerformanceVO> pfRList(UserCriteriaVO cri) {
		return mapper.pfRList(cri);
	}

	@Override
	public int getFTotal(UserCriteriaVO cri) {
		return mapper.getFTotal(cri);
	}

	@Override
	public List<PointVO> pointBuyList2(PointCriteriaVO cri) {
		return mapper.pointBuyList2(cri);
	}

	@Override
	public int pointBuyTotal(PointCriteriaVO cri) {
		return mapper.pointBuyTotal(cri);
	}

	@Override
	public UserPointViewVo userPoint(UserPointViewVo vo) {
		return mapper.userPoint(vo);
	}

	public int getTotal(CriteriaVO cri) {
		return mapper.getTotal(cri);
	}

	public int userCharge(Map<String, Object> map) {
		return mapper.userCharge(map);
	}

	@Override
	public List<UserVO> userList() {
		return null;
	}

	@Override
	public int reservChk(UserVO userVO) {
		return mapper.reservChk(userVO);
	}

	@Override
	public List<PerformanceReservationVO> getprList(UserCriteriaVO cri) {
		return mapper.getprList(cri);
	}

	@Override
	public List<PerformanceReservationVO> prList(UserCriteriaVO cri) {
		return mapper.prList(cri);
	}

	@Override
	public UserVO getUser2(String Uid) {
		return mapper.getUser2(Uid);
	}

	@Override
	public int reservedBuy(Map<String, Object> map) {
		return mapper.reservedBuy(map);
	}

	@Override
	public int marketBuy(Map<String, Object> map) {
		return mapper.marketBuy(map);
	}

	@Override
	public String searchId(String name, String phone) {
		// TODO Auto-generated method stub
		return mapper.searchId(name, phone);
	}

	@Override
	public boolean findPw(UserVO vo) {
		// TODO Auto-generated method stub
		UserVO uv = mapper.selectByMemberId(vo.getUId(), vo.getEmail());
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

//		String pw2 = pwdEncoder.encode(pw);
//		System.out.println(pw2);
		
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(10);
		vo.setPwd(pwdEncoder.encode(pw));
		

//		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(10);
//		String pw2 = pwdEncoder.encode(pw);
//		System.out.println(pw2);
//		vo.setPwd(pw2);

		System.out.println("여기까지 왔을까2 ?");
		System.out.println(uv);
		// 비밀번호 변경
		mapper.updatePassword2(vo);
		
		System.out.println("여기까지 왔을까3 ?");
		System.out.println(vo);
		// 비밀번호 변경 메일 발송
		sendEmail(vo, pw, "findpw");
		
		return true;
	}

	@Override
	public void sendEmail(UserVO vo, String pw, String div) {
		// Mail Server 설정

		System.out.println("진짜왔니?");
		System.out.println(vo);
		/*
		 * String charSet = "utf-8"; String hostSMTP = "smtp.gmail.com"; // 네이버 이용시
		 * smtp.naver.com String hostSMTPid = email; // 보내는 사람 이메일 주소 String hostSMTPpwd
		 * = password; // 보내는 사람 비밀번호
		 */		
		
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "qqoxmaos2@gmail.com";
		String hostSMTPpwd = "dlwogus1@";
		
		

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "qqoxmaos2@gmail.com";
		String fromName = "예담티켓";
		String subject = "";
		String msg = "";


		if (div.equals("findpw")) {
			subject = "임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana; padding: 50px 50px 50px 50px;'>";
			msg += "<p>안녕하세요. 공연 및 영화 예매와 티켓양도거래를 위한 서비스를 제공하는 YD TICKET입니다.</p>";
			msg += "<p>저희 (주)예담티켓을 이용해 주셔서 진심으로 감사드립니다.</p>";
			msg += "<h3 style='color: #933880;'>";
			msg += vo.getUId() + "님의 임시 비밀번호는 : ";
			msg += pw + " 입니다</p></h3><br>";
			msg += "<p>로그인후 마이페이지에서 비밀번호 변경을 완료해 주세요.</p>";
			msg += "<a style='text-decoration:none;color:navy;font-size:20px;font-weight:bold;' href='localhost/prj/userLoginForm.do'><button style='width:300px;height:50px' onclick='location.href='localhost/prj/userLoginForm.do'>로그인페이지바로가기</button></a><br>";
			msg += "<p>본 메일은 발신전용이며, 문의에 대한 회신은 처리되지 않습니다.</p>";
			msg += "<p>(주)예담티켓과 관련하여 궁금하신 점이나 불편한 사항은 언제든지 문의바랍니다.</p>";
			msg += "<br>";
			msg += "<hr>";
			msg += "<br>";
			msg += "<p>&copy;YEDAMTICKET Corp.All rights reserved</p></div>";
	
		}

		String mail = vo.getEmail();
		System.out.println("여기까지 왔을까4 ?");
		System.out.println(vo.getEmail());

		try {
			HtmlEmail email = new HtmlEmail();
			System.out.println("1");
			email.setDebug(true);
			System.out.println("2");
			email.setCharset(charSet);
			System.out.println("3");
			/* email.setSSLOnConnect(true); */
			email.setSSL(true);
			System.out.println("4");
			email.setHostName(hostSMTP);
			System.out.println("5");
			email.setSmtpPort(465); // 네이버 이용시 587		
			System.out.println("6");
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			System.out.println("7");
			/* email.setStartTLSEnabled(true); */
			email.setTLS(true);
			System.out.println("8");
			System.out.println(email.addTo("gmswjrdl7@gmail.com"));
			email.addTo(mail, charSet);
			
			/*
			 * System.out.println("9"); email.addTo("예담티켓");
			 */
			System.out.println("9");
			/* email.setFrom("qqoxmaos2@gmail.com"); */
			email.setFrom(fromEmail, fromName, charSet);
			System.out.println("10");
			email.setSubject(subject);
			System.out.println("11");
			email.setHtmlMsg(msg);
			System.out.println("12");
			email.send();

			System.out.println("13");
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}

	}

	

	@Override
	public int updatePassword2(UserVO vo) {
		// TODO Auto-generated method stub
		return mapper.updatePassword2(vo);
	}

	@Override
	public UserVO selectByMemberId(String UId, String email) {
		// TODO Auto-generated method stub
		return mapper.selectByMemberId(UId, email);
	}

	@Override
	public int payPoint(UserVO vo) {
		// TODO Auto-generated method stub
		return mapper.payPoint(vo);
	}

	@Override
	public int pwdCheck(UserVO vo) {
		// TODO Auto-generated method stub
		return mapper.pwdCheck(vo);
	}

	@Override
	public int pwdUpdate(UserVO vo) {
		// TODO Auto-generated method stub
		return mapper.pwdUpdate(vo);
	}


}
