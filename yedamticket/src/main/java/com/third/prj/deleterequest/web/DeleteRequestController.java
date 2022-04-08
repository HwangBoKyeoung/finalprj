package com.third.prj.deleterequest.web;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		@RequestMapping("/pserDel.do")
		public String pserDel(DeleteRequestVO vo, Model model, PerformanceVO pvo, @RequestParam("PNo") int PNo) {
			vo.setPNo(PNo);
			System.out.println("----------------------"+PNo);
			System.out.println("----------------------"+vo.getPNo());
			vo = delDao.delSelect(vo);
			model.addAttribute("del", PNo);
			return "companyMyPage/perDeleteform";
		}
	
	//삭제요청리스트 추가
		@RequestMapping("/deleInsert.do")
		public String deleInsert(DeleteRequestVO vo, @RequestParam("PNo") int PNo) {
			System.out.println(PNo);
			delDao.delInsert(vo);
			return "redirect:companyMovieList.do";
		}

	//삭제요청 리스트
		@RequestMapping("/deleteRe.do")
		public String deleteRe(Model model,CriteriaVO cri) {
			model.addAttribute("dels",delDao.delSelectList(cri));
			int total = delDao.countdelreqest(cri);
			model.addAttribute("pageVO", new PageVO(cri, total));			
			return "manager/deleteRequest/deleteList";
		}
	
	//삭제 처리리스트
		@RequestMapping("/delUpdate.do")
		public String delUpdate(DeleteRequestVO vo, Model model) {
			delDao.delUpdate(vo);
			model.addAttribute("CId", vo.getCId());
			return "redirect:deleteRe.do";
		}
		//삭제요청 상세히 보기
	      @RequestMapping("/delSelect.do")
	      public String delSelect(Model model, DeleteRequestVO vo) {
	         System.out.println("황보경입니다.ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ");
	         vo = delDao.delSelect(vo);
	         System.out.println("kkkkkkkkkkkkkkkkkkkk" + vo);
	         
	         if(vo.getPNo()!=0) {
	            vo = delDao.updatedel(vo);
	         } else if(vo.getMvNo()!=0) {
	            vo = delDao.mvUpdel(vo);
	         }
	         model.addAttribute("del", vo);

	         return "manager/deleteRequest/delSelect";
	      }
	      
	//삭제요청페이지
		@RequestMapping("/mvDel.do")
		public String mvDel(HttpServletRequest request, DeleteRequestVO vo, MovieVO mvo, Model model, @RequestParam("mvNo") int mvNo) {
			
			vo.setMvNo(mvNo);
			System.out.println("==============================mvo=="+mvo);
			vo= delDao.delSelect(vo);
			model.addAttribute("del", mvNo);
			model.addAttribute("CId", mvo.getCId());
			return "companyMyPage/cmoviedel";
		}
	//영화삭제요청 등록
		@RequestMapping("/mvdeleInsert.do")
		public String mvdeleInsert(DeleteRequestVO vo, @RequestParam("mvNo") int mvNo) {
			delDao.mvDelInsert(vo);
			return "redirect:companyMovieList.do";
			
		}
		
		
		
}
