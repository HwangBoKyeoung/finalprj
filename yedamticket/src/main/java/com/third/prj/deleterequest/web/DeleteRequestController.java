package com.third.prj.deleterequest.web;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.prj.deleterequest.service.CriteriaVO;
import com.third.prj.deleterequest.service.DeleteRequestVO;
import com.third.prj.deleterequest.service.PageVO;
import com.third.prj.deleterequest.serviceImpl.DeleteRequestServiceImpl;
import com.third.prj.movie.service.MovieVO;
import com.third.prj.performance.service.PerformanceVO;

@Controller
public class DeleteRequestController {

	@Autowired
	private DeleteRequestServiceImpl delDao;
	
	
	//삭제요청 페이지
		@RequestMapping("/companyPerforDel.do")
		public String companyPerforDel(DeleteRequestVO vo, Model model, PerformanceVO pvo, @RequestParam("PNo") int PNo) {
			vo.setPNo(PNo);
			System.out.println("----------------------"+PNo);
			System.out.println("----------------------"+vo.getPNo());
			vo = delDao.deleteRequestPerforSelect(vo);
			model.addAttribute("del", PNo);
			model.addAttribute("CId", pvo.getCId());
			return "companyMyPage/companyPerforDel";
		}
	
	//삭제요청리스트 추가
		@RequestMapping("/deletePerforInsert.do")
		public String deletePerforInsert(DeleteRequestVO vo, @RequestParam("PNo") int PNo) {
			System.out.println(PNo);
			delDao.deletePerforInsert(vo);
			return "redirect:companyPerforList.do";
		}

	//삭제요청 리스트
		@RequestMapping("/deleteRequestList.do")
		public String deleteRequestList(Model model,CriteriaVO cri) {
			PageVO pageVO = new PageVO(cri, delDao.getTotal(cri));
			model.addAttribute("dels",delDao.deleteRequestList(cri));
			model.addAttribute("pageVO", pageVO);			
			return "manager/deleteRequest/deleteRequestList";
		}
	
	//삭제 처리리스트
		@RequestMapping("/deleteRequestUpdate.do")
		public String deleteRequestUpdate(DeleteRequestVO vo, Model model) {
			delDao.deleteRequestUpdate(vo);
			model.addAttribute("CId", vo.getCId());
			return "redirect:homeM.do";
		}
		//삭제요청 상세히 보기
	      @RequestMapping("/deleteRequestSelect.do")
	      public String deleteRequestSelect(Model model, DeleteRequestVO vo) {
	         vo = delDao.deleteRequestSelect(vo);
	         
	         if(vo.getPNo()!=0) {
	            vo = delDao.deleteRequestPerforSelect(vo);
	         } else if(vo.getMvNo()!=0) {
	            vo = delDao.deleteRequestMovieSelect(vo);
	         }
	         model.addAttribute("del", vo);

	         return "manager/deleteRequest/deleteRequestSelect";
	      }
	      
	//삭제요청페이지
		@RequestMapping("/companyMoviedel.do")
		public String companyMoviedel(HttpServletRequest request, DeleteRequestVO vo, MovieVO mvo, Model model, @RequestParam("mvNo") int mvNo) {
			
			vo.setMvNo(mvNo);
			System.out.println("==============================mvo=="+mvo);
			vo= delDao.deleteRequestSelect(vo);
			model.addAttribute("del", mvNo);
			model.addAttribute("CId", mvo.getCId());
			return "companyMyPage/companyMoviedel";
		}
	//영화삭제요청 등록
		@RequestMapping("/deleteMovieInsert.do")
		public String deleteMovieInsert(DeleteRequestVO vo, @RequestParam("mvNo") int mvNo) {
			delDao.deleteMovieInsert(vo);
			return "redirect:companyMovieList.do";
			
		}
		//기업회원 마이페이지- 삭제 신청현황(공연)
		@RequestMapping("/companyMyDeletePerforList.do")
		public String companyMyDeletePerforList(Model model,CriteriaVO cri) {
			PageVO pageVO = new PageVO(cri, delDao.getTotalDeletePerfor(cri));
			model.addAttribute("pers",delDao.companyMyDeletePerforList(cri));
			System.out.println("================"+delDao.companyMyDeletePerforList(cri));
			model.addAttribute("pageVO", pageVO);
			return "companyMyPage/companyMyDeletePerfortList";
		}
		
		//기업원 마이페이지- 삭제 신청현황(영화)
		@RequestMapping("/companyMyDeleteMovieList.do")
		public String companyMyDeleteMovieList(Model model,CriteriaVO cri) {
			PageVO pageVO = new PageVO(cri, delDao.getTotalDeleteMovie(cri));
			model.addAttribute("dels",delDao.companyMyDeleteMovieList(cri));
			model.addAttribute("pageVO", pageVO);
			return "companyMyPage/companyMyDeleteMovieList";
		}
		
		//모두조회
		@RequestMapping("/companyPerforList.do")
		public String conPage(Model model,CriteriaVO cri) {
			PageVO pageVO = new PageVO(cri, delDao.getTotalPerfor(cri));
			model.addAttribute("pers", delDao.companyPerforSelectList(cri));
			model.addAttribute("pageVO", pageVO);
			return "companyMyPage/companyMyPerforList";
		}
		//기업회원페이지에서 리스트르 출력
		@RequestMapping("/companyMovieList.do")
		public String companyMovieList(CriteriaVO cri, Model model) {
			PageVO pageVO = new PageVO(cri, delDao.getTotalMovie(cri));
			model.addAttribute("dels",delDao.companyMovieSelectList(cri));	
			model.addAttribute("pageVO", pageVO);
			return "companyMyPage/companyMovieList";
		}
		
		//관리자페이지- 공연 삭제요청 리스트
		@RequestMapping("/managerPerforDeleteList.do")
		public String managerConcertDeleteList(Model model, CriteriaVO cri) {
			PageVO pageVO = new PageVO(cri, delDao.getTotalDeletePerfor(cri));
			model.addAttribute("pers",delDao.companyMyDeletePerforList(cri));
			System.out.println("================"+delDao.companyMyDeletePerforList(cri));
			model.addAttribute("pageVO", pageVO);
			return "manager/manager/managerPerforDeleteList";
		}
		//관리자 페이지 영화삭제요청 리스트
		@RequestMapping("/managerMovieDeleteList.do")
		public String managerMovieDelete(Model model, CriteriaVO cri) {
			PageVO pageVO = new PageVO(cri, delDao.getTotalDeleteMovie(cri));
			model.addAttribute("dels",delDao.companyMyDeleteMovieList(cri));
			model.addAttribute("pageVO", pageVO);
			return "manager/manager/managerMovieDeleteList";
		}
		
}
