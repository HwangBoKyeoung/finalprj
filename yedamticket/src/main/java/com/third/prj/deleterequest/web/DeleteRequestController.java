package com.third.prj.deleterequest.web;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.prj.deleterequest.service.DeleteRequestVO;
import com.third.prj.deleterequest.service.Impl.DeleteRequestServiceImpl;
import com.third.prj.performance.service.PerformanceVO;
import com.third.prj.performance.serviceImpl.PerformanceServiceImpl;

@Controller
public class DeleteRequestController {

	@Autowired
	private DeleteRequestServiceImpl delDao;
	
	@Autowired
	private PerformanceServiceImpl perDao;
	
	//삭제요청 페이지
		@RequestMapping("/pserDel.do")
		public String pserDel(DeleteRequestVO vo, Model model, PerformanceVO pvo, @RequestParam("PNo") int PNo) {
			vo.setPNo(PNo);
			System.out.println("----------------------"+PNo);
			System.out.println("----------------------"+vo.getPNo());
			vo = delDao.delSelect(vo);
			model.addAttribute("del", PNo);
			return "performance/perDeleteform";
		}
	
	//삭제요청리스트 추가
		@RequestMapping("/deleInsert.do")
		public String deleInsert(DeleteRequestVO vo, @RequestParam("PNo") int PNo) {
			System.out.println("ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ");
			System.out.println(PNo);
			System.out.println("***************"+vo.getPNo());
			delDao.delInsert(vo);
			System.out.println("@@@@@@@@@@@"+vo.getDelReqNo());
			return "redirect:conPage.do";
		}

	//삭제요청 리스트
		@RequestMapping("/deleteRe.do")
		public String deleteRe(Model model,DeleteRequestVO vo) {
			model.addAttribute("dels",delDao.delSelectList());
			return "manager/deleteRequest/deleteList";
		}
	
	//삭제 처리리스트
		@RequestMapping("/delUpdate.do")
		public String delUpdate(DeleteRequestVO vo) {
			delDao.delUpdate(vo);
			return "redirect:deleteRe.do";
		}
	//삭제요청 상세히 보기
		@RequestMapping("/delSelect.do")
		public String delSelect(Model model, DeleteRequestVO vo) {
			
			
			model.addAttribute("del", delDao.updatedel(vo));
			return "manager/deleteRequest/delSelect";
		}
}
