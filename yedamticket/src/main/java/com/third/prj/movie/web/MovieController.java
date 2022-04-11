package com.third.prj.movie.web;

import java.io.File;
import java.util.List; 
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
import com.third.prj.performanceimage.service.PerformanceImageService;
import com.third.prj.performanceimage.service.PerformanceImageVO;
import com.third.prj.performancevideo.service.PerformanceVideoService;
import com.third.prj.performancevideo.service.PerformanceVideoVO;

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
	private String upLoadPath;
	 

	@RequestMapping("/movieList.do")
	public String movieList(Model model) {
		model.addAttribute("movies", movieDao.mList());
		return "movie/movieList";
	}
	//select 해서 가져올때 필요(기업회원쪽 -> rjh(2022/04/05))
	@Autowired
	private PerformanceImageService periDao;
	@Autowired
	private PerformanceVideoService pervDao;

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
	
	//영화 수정 페이지(프로시저 ->rjh(2022/04/05)
	@RequestMapping("/mvUpdate.do")
	public String mvUpdate(Model model,@RequestParam("iname") String iname,@RequestParam("vname")String vname,Map<String, Object>map, MovieVO vo) {
//		PerformanceVideoVO vvo = new PerformanceVideoVO();
//		PerformanceImageVO ivo = new PerformanceImageVO();
				
		map.put("vm_vno", vo.getMvNo());
		map.put("p_name", vo.getName());
		map.put("mv_genre", vo.getGenre());
		map.put("mv_director", vo.getDirector());
		map.put("mv_rating", vo.getRating());
		map.put("mv_country", vo.getCountry());
		map.put("mv_content", vo.getContent());
		map.put("mv_actor", vo.getActor());
		map.put("mv_iname", iname);
		map.put("mv_vname", vname);
		map.put("mv_cd", vo.getFileCd());
		
		movieDao.procedureCall(map);
		
		return "redirect:/movieDetail.do";
	}
  
	//기업회원페이지에서 상세보기할때 사용할 예정(rjh(2022/04/05)
	@RequestMapping("/mvSelect.do")
	public String mvSelect(MovieVO vo, Model model) {
		PerformanceVideoVO vvo = new PerformanceVideoVO();
		PerformanceImageVO ivo = new PerformanceImageVO();
		vo=movieDao.movieDetail(vo);
		vvo.setFileCd(vo.getFileCd());
		ivo.setFileCd(vo.getFileCd());
		
		model.addAttribute("images", ivo);
		model.addAttribute("videos", vvo);
		model.addAttribute("mv", vo);	
		
		return "movie/movieUpdate";
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
	
	@RequestMapping("/movieInsertForm.do")
	public String movieInsertForm() {
		return "movie/movieInsertForm";
	}
	
	@RequestMapping("/movieInsert.do")
	public String movieInsert(MovieVO vo, MultipartFile file, HttpServletRequest request) {
		
		String fileName = file.getOriginalFilename(); //원본파일명
		String id = UUID.randomUUID().toString(); //고유한 유니크 아이디 생성
		System.out.println("fileName : " + fileName);
		System.out.println("id : " + id);
		
		String load = "C/DEV/apache-tomcat-9.0.56/webapps/upload";
		
		String targetFile = id + fileName.substring(fileName.lastIndexOf(".")); //마지막으로 만나느 .을 출력, 업로드시 같은 이름의 파일을 덮어써 버리는 현상 방지
		System.out.println("targetFile : " + targetFile);
		
		//File target = new File(request.getSession().getServletContext().getRealPath("upload"),targetFile);
		//File target = new File(request.getServletContext().getRealPath("upload"),targetFile);
		File target = new File(upLoadPath,targetFile);
		
		System.out.println("---------------------------------------------------------");
		System.out.println(request.getSession().getServletContext().getRealPath(load));
		System.out.println("---------------------------------------------------------");
		System.out.println("target :" + target);
		
		try { 
			FileCopyUtils.copy(file.getBytes(), target);
			System.out.println("copy suss");
			
			vo.setFileCd(fileName);
			vo.setRenames(targetFile);
			movieDao.movieInsert(vo);
			System.out.println("insert suss");
			
		}catch(Exception e) {
			System.out.println("error");
			
			e.printStackTrace();
		}
		return "redirect:movieList.do";
	}
	
	@RequestMapping("/searchAll.do")
	public String searchAll(MovieVO vo, Model model) {
		
		String SearchName = vo.getSearchName();
		model.addAttribute("searchName", movieDao.searchAll(SearchName));
		
		return "user/searchList";
	}
	
	

}
