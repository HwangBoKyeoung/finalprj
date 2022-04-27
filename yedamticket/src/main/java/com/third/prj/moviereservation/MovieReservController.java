package com.third.prj.moviereservation;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.prj.moviereservation.service.MovieReservService;

@Controller
public class MovieReservController {
	
	@Autowired
	private MovieReservService movieDao;
	
	@RequestMapping("cancelreservmovie.do")
	public String cancelreservmovie(Map<String, Object> map, HttpSession session, HttpServletRequest request) {
		String UId = (String) session.getAttribute("sessionId");
		System.out.println(UId);
		int PReservNo2 =  Integer.parseInt(request.getParameter("MVPReservNo2"));
		int mvPrice =  Integer.parseInt(request.getParameter("MVprice"));
		
		map.put("p1", UId);
		map.put("p2", PReservNo2);
		map.put("p3", mvPrice);
		int i = movieDao.cancelreservMovie(map);
		if(i != 0) {
			return "redirect:userPage.do";
		}else {
			return "user/errorPage";
		}
		
	}
}
