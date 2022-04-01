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
import com.third.prj.moviehall.service.MovieHallService;
import com.third.prj.moviehall.service.MovieHallVO;
import com.third.prj.moviereply.service.MovieReplyService;
import com.third.prj.moviereply.service.MovieReplyVO;
import com.third.prj.moviereservation.service.MovieReservService;
import com.third.prj.moviereservation.service.MovieReservationVO;
import com.third.prj.movieschedule.service.MovieScheduleService;
import com.third.prj.movieschedule.service.MovieScheduleVO;

@Controller
public class MovieController {

	@Autowired
	private MovieService movieDao;

	@Autowired
	private MovieReplyService movieReplyDao;

	@Autowired
	private MovieHallService movieHallDao;

	@Autowired
	private MovieScheduleService movieScheduleDao;
	
	@Autowired
	private MovieReservService movieReservationDao;
	
	
	@RequestMapping("/movieList.do")
	public String movieList() {
		return "movie/movieList";
	}

	// 영화상세
	@RequestMapping("/movieDetail.do")
	public String movieDetail(Model model, MovieVO vo, MovieReplyVO rvo) {
		System.out.println("무비넘어" + vo.getMvNo());
		//rvo.setMvNo(vo.getMvNo());
		System.out.println("댓글에준 무비넘버" + rvo.getMvNo());

		model.addAttribute("replys", movieReplyDao.movieReplyList(rvo));
		vo = movieDao.movieDetail(vo);
		model.addAttribute("movie", vo);
		return "movie/movieDetail";
	}

	// 댓글 입력
	@PostMapping("/movieReplyInsert")
	@ResponseBody
	public String movieReplyInsert(Model model, MovieReplyVO vo) {
		System.out.println(vo.getUid());
		System.out.println(vo.getMvNo());
		System.out.println(vo.getContent());
		System.out.println("스타**************************" + vo.getStar());

		int n = movieReplyDao.movieReplyInsert(vo);
		System.out.println(n);
		//select key 사용 바꾸기
		if (n != 0) {
			//vo = movieReplyDao.selectReplyNo();
			//System.out.println(Integer.toString(vo.getMvReNo()));
			return Integer.toString(vo.getMvReNo());
		} else {
			return null;
		}
	}

	// 댓글삭제
	@RequestMapping("/movieReplyDelete")
	@ResponseBody
	public String movieReplyDelete(MovieReplyVO vo) {
		int n = movieReplyDao.movieReplyDelete(vo);
		if (n > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 영화 예약페이지로
	@RequestMapping("/movieBooking.do")
	public String movieBooking() {
		return "movie/movieBookingForm";
	}

	// 영화예약페이지에서 영화를 클릭하면 해당영화를 상영하는 영화관리스트호출
	@RequestMapping("/movieHallList.do")
	@ResponseBody
	public List<MovieHallVO> movieHallList(Model model, MovieHallVO vo) {
		System.out.println("docid" + vo.getDocId());
		return movieHallDao.movieHallList(vo);
	}

	@RequestMapping("/movieLocList.do")
	@ResponseBody
	public List<MovieHallVO> movieLocList(Model model, MovieHallVO vo) {
		System.out.println("loc" + vo.getLoc());
		return movieHallDao.movieLocList(vo);
	}

	@RequestMapping("/movieSchdtList.do")
	@ResponseBody
	public List<MovieScheduleVO> movieSchdtList(Model model, MovieScheduleVO vo) {
		return movieScheduleDao.movieSchdtList(vo);
	}
	//결제페이지로
	@RequestMapping("/movieReservation.do")
	public String movieReservation(Model model,	MovieReservationVO vo) {
		System.out.println("hall"+vo.getReservHall());
		System.out.println("loc"+vo.getReservLoc());
		 movieReservationDao.movieReservationInsert(vo);
		 model.addAttribute("re",vo);
		return "movie/movieReservationForm";
	}
}
