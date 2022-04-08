package com.third.prj.movie.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.third.prj.movie.service.CriteriaVO;
import com.third.prj.movie.service.MovieService;
import com.third.prj.movie.service.MovieVO;
import com.third.prj.movie.service.PageVO;
import com.third.prj.moviehall.service.MovieHallService;
import com.third.prj.moviehall.service.MovieHallVO;
import com.third.prj.moviereply.service.MovieReplyService;
import com.third.prj.moviereply.service.MovieReplyVO;
import com.third.prj.moviereservation.service.MovieReservService;
import com.third.prj.moviereservation.service.MovieReservationVO;
import com.third.prj.movieschedule.service.MovieScheduleService;
import com.third.prj.movieschedule.service.MovieScheduleVO;
import com.third.prj.performanceimage.service.PerformanceImageService;
import com.third.prj.movievideo.service.MovieVideoService;
import com.third.prj.movievideo.service.MovieVideoVO;
import com.third.prj.user.service.UserService;

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
	
	@Autowired
	private MovieVideoService mvvDao;

	@RequestMapping("/movieList.do")
	public String movieList() {
		return "movie/movieList";
	}
	//select 해서 가져올때 필요(기업회원쪽 -> rjh(2022/04/05))
	@Autowired
	private PerformanceImageService periDao;
	@Autowired
	private MovieVideoService pervDao;

	// 영화상세
	@RequestMapping("/movieDetail.do")
	public String movieDetail(Model model, MovieVO vo, MovieReplyVO rvo) {
		System.out.println("무비넘어" + vo.getMvNo());
		rvo.setMvNo(vo.getMvNo());
		System.out.println("댓글에준 무비넘버" + rvo.getMvNo());

		model.addAttribute("replys", movieReplyDao.movieReplyList(rvo));
		vo = movieDao.movieDetail(vo);
		model.addAttribute("movie", vo);
		return "movie/movieDetail";
	}

	// 댓글 입력
	@PostMapping("/movieReplyInsert.do")
	@ResponseBody
	public List<MovieReplyVO> movieReplyInsert(Model model, MovieReplyVO vo) {
		System.out.println(vo.getUid());
		System.out.println(vo.getMvNo());
		System.out.println(vo.getContent());
		System.out.println("스타**************************" + vo.getStar());

		int n = movieReplyDao.movieReplyInsert(vo);
		System.out.println(n);
		//select key 사용 바꾸기
		if (n != 0) {
//			vo = movieReplyDao.selectReplyNo();
			
			System.out.println(Integer.toString(vo.getMvReNo()));
			return movieReplyDao.movieReplyList(vo);
		} else {
			return null;
		}
	}

	// 댓글삭제
	@RequestMapping("/movieReplyDelete.do")
	@ResponseBody
	public String movieReplyDelete(MovieReplyVO vo) {
		int n = movieReplyDao.movieReplyDelete(vo);
		System.out.println("삭제된건수"+n);
		if (n > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 영화 예약페이지로
	@RequestMapping("/movieBooking.do")
	public String movieBooking(Model model) {
		model.addAttribute("movies",movieDao.movieList());
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
	//기업회원페이지에서 리스트르 출력
	@RequestMapping("/companyMovieList.do")
	public String companyMovieList(CriteriaVO cri, Model model) {
		PageVO pageVO = new PageVO(cri, movieDao.getTotal(cri));
		model.addAttribute("mvs",movieDao.mvListPaging(cri));	
		model.addAttribute("pageVO", pageVO);
		return "companyMyPage/companyMovieList";
	}
	  
		//기업회원페이지에서 상세보기할때 사용할 예정(rjh(2022/04/05)
		@RequestMapping("/cMvSelect.do")
		public String cMvSelect(MovieVO vo, MovieVideoVO vvo, Model model) {
//			MovieVideoVO vvo = new MovieVideoVO();
			vo=movieDao.mvSelect(vo);
			System.out.println("============================"+vo.getMvNo());
			vvo.setMvNo(vo.getMvNo());
			vvo = mvvDao.mvvSelect(vvo);
			System.out.println("============================"+vvo);
			model.addAttribute("videos", vvo);
			
			model.addAttribute("mv", vo);	
			
			return "companyMyPage/cmovieUpdate";
		}
	
	//영화 수정 페이지(프로시저 ->rjh(2022/04/05)
	@RequestMapping("/mvUpdate.do")
	public String mvUpdate(Model model, Map<String, Object>map, MovieVO vo, MovieVideoVO vvo) {
		map.put("vm_vno", vo.getMvNo());
		map.put("mv_name", vo.getName());
		map.put("mv_genre", vo.getGenre());
		map.put("mv_director", vo.getDirector());
		map.put("mv_rating", vo.getRating());
		map.put("mv_country", vo.getCountry());
		map.put("mv_content", vo.getContent());
		map.put("mv_cid", vo.getCId());
		map.put("mv_actor", vo.getActor());
		map.put("mv_vname", vvo.getVname());
		map.put("mv_cd", vo.getFileCd());
		
		movieDao.procedureCall(map);
		System.out.println(vvo);
		
		return "redirect:/CMvList.do";
	}
	
	
	//영화(docId),지역,영화관이름,날짜,시간을 ajax로 넘겨서 예약된좌석이름(seat_name)을 가져옴
	@RequestMapping("/seatSearch.do")
	@ResponseBody
	public List<MovieReservationVO> seatSearch(MovieReservationVO vo) {
		return movieReservationDao.seatSearch(vo);
	}
  
	//결제페이지로
	@RequestMapping("/movieReservation.do")
	public String movieReservation(Model model,	MovieReservationVO vo) {
		/*
		 * System.out.println("hall"+vo.getReservHall());
		 * System.out.println("loc"+vo.getReservLoc());
		 */
		 movieReservationDao.movieReservationInsert(vo);
		 model.addAttribute("re",vo);
		return "movie/movieReservationForm";
	}

}
