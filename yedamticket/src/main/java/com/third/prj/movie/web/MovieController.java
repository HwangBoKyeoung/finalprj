package com.third.prj.movie.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.third.prj.movie.service.MovieService;
import com.third.prj.movie.service.MovieVO;
import com.third.prj.moviereply.service.MovieReplyService;
import com.third.prj.moviereply.service.MovieReplyVO;

@Controller
public class MovieController {
	@Autowired
	private MovieService movieDao;
	@Autowired
	private MovieReplyService movieReplyDao;
	@RequestMapping("/movieList.do")
	public String movieList() {
		return "movie/movieList";
	}
	@RequestMapping("/movieDetail.do")
	public String movieDetail(Model model,MovieVO vo,MovieReplyVO rvo) {
		System.out.println("무비넘어"+vo.getMvNo());
		rvo.setMvNo(vo.getMvNo());
		System.out.println("댓글에준 무비넘버"+rvo.getMvNo());
		
		model.addAttribute("replys",movieReplyDao.movieReplyList(rvo));
		vo=movieDao.movieDetail(vo);
		model.addAttribute("movie",vo);
		return "movie/movieDetail";
	}
	@PostMapping("/movieReplyInsert")
	 @ResponseBody
	public String movieReplyInsert(Model model,MovieReplyVO vo) {
		System.out.println(vo.getUid());
		System.out.println(vo.getMvNo());
		System.out.println(vo.getContent());
		System.out.println("스타**************************"+vo.getStar());
		int n=movieReplyDao.movieReplyInsert(vo);
		System.out.println(n);
		if(n != 0) {
			vo = movieReplyDao.selectReplyNo();
			System.out.println(Integer.toString(vo.getMvReNo()));
			return Integer.toString(vo.getMvReNo());
		}else {
			return null;
		}
		
	}
	@RequestMapping("/movieReplyDelete")
	 @ResponseBody
	public String movieReplyDelete(MovieReplyVO vo) {
		int n=movieReplyDao.movieReplyDelete(vo);
		if(n>0) {
			return "success";
			
		}else {
			return "fail";
		}
	}
}

