package com.third.prj.confirmrequest.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.prj.confirmrequest.service.ConfirmVO;
import com.third.prj.confirmrequest.serviceImpl.ConfirmServiceImpl;

@Controller
public class ConfirmController {
	@Autowired
	private ConfirmServiceImpl confDao;
	
	//관리자페이지
	
	//영화
	@RequestMapping("/movieConfirmList.do")
	public String movieConfirmList(Model model,ConfirmVO vo) {
		model.addAttribute("conf", confDao.movieConfirmList());
		
		return "confirmRequest/managerMovieRequest";
	}
	//영화상세
	
	//공연
	
	//공연상세
	
	//굿즈
	
	//굿즈상세
	
	
	//기업페이지
	
	//영화
	
	//영화상세
	
	//공연
	
	//공연상세
	
	//굿즈
	
	//굿즈상세
	
}
