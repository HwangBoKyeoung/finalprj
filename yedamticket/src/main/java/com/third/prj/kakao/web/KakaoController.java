package com.third.prj.kakao.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.third.prj.kakao.util.kakao_restapi;
import com.third.prj.user.service.UserService;
import com.third.prj.user.service.UserVO;
@Controller
public class KakaoController {
	
	@Autowired
	UserService userDao;

	@RequestMapping(value="/kakaoLogin.do", produces="application/json", method=RequestMethod.GET)
	public String kakaoLogin( @RequestParam("code") String code , RedirectAttributes ra, HttpSession session, HttpServletResponse response , 
			HttpServletRequest req ,Model model)throws IOException{

		kakao_restapi kr = new kakao_restapi();
		 // JsonNode트리형태로 토큰받아온다
        JsonNode jsonToken = kakao_restapi.getKakaoAccessToken(code);
        // 여러 json객체 중 access_token을 가져온다
        JsonNode accessToken = jsonToken.get("access_token");

        System.out.println("access_token : " + accessToken);


        //////////////////////
        //access_token을 통해 사용자 정보 요청
        JsonNode userInfo = kakao_restapi.getKakaoUserInfo(accessToken);

        // Get id
        String id = userInfo.path("id").asText();
        String name = null;
        String email = null;

        // 유저정보 카카오에서 가져오기 Get properties
        JsonNode properties = userInfo.path("properties");
        JsonNode kakao_account = userInfo.path("kakao_account");

        name = properties.path("nickname").asText();
        email = kakao_account.path("email").asText();
        
        
        System.out.println("id : " + id);
        System.out.println("name : " + name);
        System.out.println("email : " + email);
        
        UserVO vo = new UserVO();
        
        //받아온 이메일이 DB에 있으면 바로 로그인 없으면 DB에 저장
         if(userDao.emailCheck(email) != 1) { 
            vo.setUId(id);
            vo.setEmail(email);
            vo.setLoginCd("kakao");
            userDao.kakaoInsert(vo);
         }
         
        String msg = "";
        String url = "";

        if(name.isEmpty()) {
        	msg = "로그인 실패";
        }
        else {


        	msg = "로그인 성공";
        	session.setAttribute("name", name);
        	session.setAttribute("sessionId",id);
        }

        session.setAttribute("accessToken",	accessToken);

        url = "home.do";

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);




		return "user/alert";

	}




	//로그아웃
	@RequestMapping(value = "/kakaoLogout.do", produces = "application/json")
    public String Logout(HttpSession session) {
        //kakao restapi 객체 선언
//        kakao_restapi kr = new kakao_restapi();
//        //노드에 로그아웃한 결과값음 담아줌 매개변수는 세션에 잇는 token을 가져와 문자열로 변환
//        JsonNode node = kr.Logout(session.getAttribute("accessToken").toString());
        //결과 값 출력
        session.invalidate();
//        System.out.println("로그인 후 반환되는 아이디 : " + node.get("id"));
        return "redirect:/";
    }   
}