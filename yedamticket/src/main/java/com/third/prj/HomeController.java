package com.third.prj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.third.prj.movie.service.MovieService;

@Controller
public class HomeController {
	@Autowired
	private MovieService movieDao;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		model.addAttribute("movies", movieDao.mList());
		return "home/home";
	}
	
	@RequestMapping("/home.do")
	public String home1(Model model) {
		
		model.addAttribute("movies",movieDao.mList());
		return "home/home";
	
	}
	
	@RequestMapping("/homeM.do")
	public String homeM() {
		return "manager/home/homeM";
	}
	
	@RequestMapping("/membership.do")
	public String membership() {
		return "membership/membership";
	}
}