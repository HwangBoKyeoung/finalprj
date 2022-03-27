package com.third.prj.movie.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MovieController {
	
	@RequestMapping("/movieList.do")
	public String movieList() {
		return "movie/movieList";
	}
	@RequestMapping("/movieDetail.do")
	public String movieDetail() {
		return "movie/movieDetail";
	}
}
