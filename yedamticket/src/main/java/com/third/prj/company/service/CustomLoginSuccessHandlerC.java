package com.third.prj.company.service;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandlerC implements AuthenticationSuccessHandler {

	@Override //만들때 add로 implements에 있는거 add해서만들기
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		String uri = request.getContextPath() + "/companyMyPage.do";
		if(savedRequest != null) {
			uri = savedRequest.getRedirectUrl();
			
//			세션에 저장된 객체를 다 사용한 뒤에는 지워주기 => 메모리 누수 방지
			requestCache.removeRequest(request, response);
			System.out.println("*******uri: "+uri);
		}
		
//		세션 Attribute 확인
		Enumeration<String> list = request.getSession().getAttributeNames();
		while(list.hasMoreElements()) {
			System.out.println("-------"+list.nextElement());
		}
		
		System.out.println("세션정보확인 : " + request.getSession().getAttributeNames().toString());
		
		response.sendRedirect(uri);
		
	}

}