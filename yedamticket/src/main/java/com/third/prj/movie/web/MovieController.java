package com.third.prj.movie.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.prj.movie.service.MovieService;
import com.third.prj.movie.service.MovieVO;

@Controller
public class MovieController {
	@Autowired
	private MovieService movieDao;
	@RequestMapping("/movieList.do")
	public String movieList() {
		return "movie/movieList";
	}
	@RequestMapping("/movieDetail.do")
	public String movieDetail(Model model,MovieVO vo) {
		System.out.println(vo.getName());
		System.out.println(vo.getStartDate());
		vo=movieDao.movieDetail(vo);
		model.addAttribute("movie",vo);
		return "movie/movieDetail";
	}
}
