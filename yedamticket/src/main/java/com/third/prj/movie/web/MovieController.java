package com.third.prj.movie.web;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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

import com.third.prj.movievideo.service.MovieVideoService;
import com.third.prj.movievideo.service.MovieVideoVO;

import com.third.prj.point.service.PointService;
import com.third.prj.point.service.PointVO;

import com.third.prj.user.service.UserService;
import com.third.prj.user.service.UserVO;

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

	@Autowired
	private MovieVideoService mvvDao;

	@Autowired
	private UserService userDao;

	@Autowired
	private PointService pointDao;

	// select 해서 가져올때 필요(기업회원쪽 -> rjh(2022/04/05))
//	@Autowired
//	private PerformanceImageService periDao;

//	@Autowired
//	private MovieVideoService pervDao;

	@RequestMapping("/movieList.do")
	public String movieList(Model model) {
		model.addAttribute("movies", movieDao.mList());
		model.addAttribute("movie", movieDao.movieList());
		return "movie/movieList";
	}

	// 영화상세
	@RequestMapping("/movieDetail.do")
	public String movieDetail(Model model, MovieVO vo, MovieReplyVO rvo) {
		System.out.println("*****************************docid************************************" + rvo.getDocId());
		model.addAttribute("replys", movieReplyDao.movieReplyList(rvo));
		vo = movieDao.movieDetail(vo);
		model.addAttribute("movie", vo);
		return "movie/movieDetail";
	}

	// 댓글 입력
	@PostMapping("/movieReplyInsert.do")
	@ResponseBody
	public String movieReplyInsert(Model model, MovieReplyVO vo) {

		int n = movieReplyDao.movieReplyInsert(vo);
		// select key 사용 바꾸기
		if (n != 0) {

			return "success";
		} else {
			return "fail";
		}
	}

	// 댓글삭제
	@RequestMapping("/movieReplyDelete.do")
	@ResponseBody
	public String movieReplyDelete(MovieReplyVO vo) {
		int n = movieReplyDao.movieReplyDelete(vo);
		System.out.println("삭제된건수" + n);
		if (n > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 영화 예약페이지로
	@RequestMapping("/movieBooking.do")
	public String movieBooking(Model model) {
		model.addAttribute("movies", movieDao.movieList());
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

	// 기업회원페이지에서 상세보기할때 사용할 예정(rjh(2022/04/05)
	@RequestMapping("/companyMovieUpdateForm.do")
	public String companyMovieUpdateForm(MovieVO vo, MovieVideoVO vvo, Model model) {
//			MovieVideoVO vvo = new MovieVideoVO();
		vo = movieDao.mvSelect(vo);
		System.out.println("============================" + vo.getMvNo());
		vvo.setMvNo(vo.getMvNo());
		vvo = mvvDao.mvvSelect(vvo);
		System.out.println("============================" + vvo);
		model.addAttribute("videos", vvo);

		model.addAttribute("mv", vo);

		return "companyMyPage/companyMovieUpdateForm";
	}

	// 영화 수정 페이지(프로시저 ->rjh(2022/04/05)
	@RequestMapping("/companyMovieUpdate.do")
	public String companyMovieUpdate(Model model, Map<String, Object> map, MovieVO vo, MovieVideoVO vvo,
			MultipartFile file) {

		String fileName = file.getOriginalFilename();
		String id = UUID.randomUUID().toString();
		String load = upLoadPath;
		try {
			String targetFile = id + fileName.substring(fileName.lastIndexOf("."));
			File target = new File(load, targetFile);
			FileCopyUtils.copy(file.getBytes(), target);
			vo.setFileCd("PF_VIDEO");
			vvo.setVName(fileName);
			vvo.setVRenames(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

		map.put("vm_vno", vo.getMvNo());
		map.put("mv_name", vo.getName());
		map.put("mv_genre", vo.getGenre());
		map.put("mv_director", vo.getDirector());
		map.put("mv_rating", vo.getRating());
		map.put("mv_country", vo.getCountry());
		map.put("mv_content", vo.getContent());
		map.put("mv_cid", vo.getCId());
		map.put("mv_actor", vo.getActor());
		map.put("mv_vname", vvo.getVName());
		map.put("mv_vrname", vvo.getVRenames());
		map.put("mv_cd", vo.getFileCd());

		movieDao.procedureCall(map);

		return "redirect:companyMovieList.do";
	}

	// 영화(docId),지역,영화관이름,날짜,시간을 ajax로 넘겨서 예약된좌석이름(seat_name)을 가져옴
	@RequestMapping("/seatSearch.do")
	@ResponseBody
	public List<MovieReservationVO> seatSearch(MovieReservationVO vo) {
		return movieReservationDao.seatSearch(vo);
	}

	// 결제페이지로
	@RequestMapping("/movieReservation.do")
	public String movieReservation(Model model, MovieReservationVO vo, UserVO uvo) {

		MovieVO detailvo = new MovieVO();
		detailvo.setDocId(vo.getDocId());

		model.addAttribute("re", vo);

		model.addAttribute("user", userDao.userSelectOne(uvo));
		model.addAttribute("movie", movieDao.mDetail(detailvo));

		return "movie/movieReservationForm";
	}

	// 결제페이지에서 결제(유저의 point을 영화표값으로 차감)하고 메인으로
	@RequestMapping("/moviePay.do")
	@ResponseBody
	public String moviePay(MovieReservationVO vo,PointVO pointVO,MovieVO movieVO,UserVO usersVO) {
		movieReservationDao.movieReservationInsert(vo);
		vo=movieReservationDao.movieReservationSelect(vo);
		System.out.println("reservno==============================="+vo.getMvReservNo());
		System.out.println("u_id==================================="+vo.getUId());

		pointVO.setPayNo(vo.getMvReservNo());
		pointVO.setUId(vo.getUId());
		userDao.payPoint(usersVO);
		movieDao.audienceInsert(movieVO);
		int n=pointDao.payInsert(pointVO);
		if(n != 0) {
			return "success";
		}else {
			return "fail";
		}

	}

	@RequestMapping("/movieInsertForm.do")
	public String movieInsertForm() {
		return "movie/movieInsertForm";
	}

	@RequestMapping("/movieInsert.do")
	public String movieInsert(MovieVO vo, MovieVideoVO vvo, MultipartFile file,MultipartFile fileV, HttpServletRequest request) {
		
		String fileNameV = fileV.getOriginalFilename();//비디오 
		String idV = UUID.randomUUID().toString();
		
		String fileName = file.getOriginalFilename(); // 원본파일명
		String id = UUID.randomUUID().toString(); // 고유한 유니크 아이디 생성
		
		System.out.println("fileName : " + fileName);
		System.out.println("id : " + id);

		String load = "C/DEV/apache-tomcat-9.0.56/webapps/upload";
		
		String targetFileV = idV +fileNameV.substring(fileNameV.lastIndexOf("."));
		String targetFile = id + fileName.substring(fileName.lastIndexOf(".")); // 마지막으로 만나느 .을 출력, 업로드시 같은 이름의 파일을 덮어써
																				// 버리는 현상 방지
		System.out.println("targetFile : " + targetFile);

		// File target = new
		// File(request.getSession().getServletContext().getRealPath("upload"),targetFile);
		// File target = new
		// File(request.getServletContext().getRealPath("upload"),targetFile);
		File targetV = new File(upLoadPath,targetFileV);
		File target = new File(upLoadPath, targetFile);

		System.out.println("---------------------------------------------------------");
		System.out.println(request.getSession().getServletContext().getRealPath(load));
		System.out.println("---------------------------------------------------------");
		System.out.println("target :" + target);

		try {
			FileCopyUtils.copy(fileV.getBytes(), targetV);
			FileCopyUtils.copy(file.getBytes(), target);
			System.out.println("copy suss");
			
			vvo.setVName(fileNameV);
			vvo.setVRenames(targetFileV);
			
			vo.setFileCd(fileName);
			vo.setRenames(targetFile);
			mvvDao.movieVideoInsert(vvo);
			movieDao.movieInsert(vo);
			System.out.println("==================================================");
			System.out.println("insert success");
			System.out.println("==================================================");

		} catch (Exception e) {
			System.out.println("error");

			e.printStackTrace();
		}
		return "redirect:movieList.do";
		
	}
	
	/*
	 * @RequestMapping("/searchAll.do") public String searchAll(MovieVO vo, Model
	 * model) {
	 * 
	 * String SearchName = vo.getSearchName(); model.addAttribute("searchName",
	 * movieDao.searchAll(SearchName));
	 * 
	 * return "user/searchList"; }
	 */
	
	

	/*
	 * @RequestMapping("/ajaxFileCd.do")
	 * 
	 * @ResponseBody public List<MovieVO> ajaxFileCd(MovieVO vo) { List<MovieVO>
	 * list = movieDao.searchAll(vo.getSearchName()); return list; }
	 */
}
