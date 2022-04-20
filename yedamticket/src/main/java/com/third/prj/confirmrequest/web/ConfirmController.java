package com.third.prj.confirmrequest.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.third.prj.confirmrequest.service.ConfirmVO;
import com.third.prj.confirmrequest.service.CriteriaVO;
import com.third.prj.confirmrequest.service.PageVO;
import com.third.prj.confirmrequest.serviceImpl.ConfirmServiceImpl;

@Controller
public class ConfirmController {
	@Autowired
	private ConfirmServiceImpl confDao;
	
	//관리자페이지
	//영화
	@RequestMapping("/movieConfirmList.do")
	public String movieConfirmList(Model model,ConfirmVO vo) {
		model.addAttribute("conf", confDao.movieConfirmList());
		
		return "manager/confirmRequest/managerMovieRequest";
	}
	//영화상세
	@RequestMapping("/movieConfirmSelect.do")
	public String movieConfirmSelect(ConfirmVO vo, Model model) {
		vo = confDao.movieConfirmSelect(vo);
		model.addAttribute("conS", vo);
		
		return "manager/confirmRequest/movieConfirmRequest";
	}
	//영화 업데이트
	@RequestMapping("movieConfirmUpdate.do")
	public String movieConfirmUpdate(ConfirmVO vo) {
		int u = confDao.movieConfirmUpdate(vo);
		
		if (u != 0) {
			return "redirect:movieConfirmList.do";
		}
		return "manager/manager/managerError";
	}
	//공연
	@RequestMapping("perforConfirmList.do")
	public String perforConfirmList(Model model, ConfirmVO vo) {
		model.addAttribute("conf", confDao.perforConfirmList());
		
		return "manager/confirmRequest/managerPerforRequest";
	}
	//공연상세
	@RequestMapping("perforConfirmSelect.do")
	public String perforConfirmSelect(ConfirmVO vo, Model model) {
		vo = confDao.perforConfirmSelect(vo);
		model.addAttribute("conS", vo);
		
		return "manager/confirmRequest/performanceConfirmRequest";
	}
	//공연 업데이트
	@RequestMapping("perforConfirmUpdate.do")
	public String perforConfirmUpdate(ConfirmVO vo) {
		int u = confDao.perforConfirmUpdate(vo);
		
		if(u != 0) {
			return "redirect:perforConfirmList.do";
		}
		return "manager/manager/managerError";
	}
	//굿즈
	@RequestMapping("goodsConfirmList.do")
	public String goodsConfirmList(ConfirmVO vo, Model model) {
		model.addAttribute("conf", confDao.goodsConfirmList());
		return "manager/confirmRequest/managerGoodsRequest";
	}
	//굿즈상세
	@RequestMapping("goodsConfirmSelect.do")
	public String goodsConfirmSelect(ConfirmVO vo, Model model) {
		vo = confDao.goodsConfirmSelect(vo);
		model.addAttribute("conS", vo);
		
		return "manager/confirmRequest/goodsConfirmRequest";
	}
	//굿즈 업데이트
	@RequestMapping("goodsConfirmUpdate.do")
	public String goodsConfirmUpdate(ConfirmVO vo) {
		int u = confDao.goodsConfirmUpdate(vo);
		if(u != 0) {
			return "redirect:goodsConfirmList.do";
		}
		return "manager/manager/managerError";
	}
	//기업페이지
	//영화
	@RequestMapping("movieCompanyConfirmList.do")
	public String movieCompanyConfirmList(ConfirmVO vo, Model model, CriteriaVO cri) {
		PageVO pageVO = new PageVO(cri, confDao.getTotal(cri));
		model.addAttribute("comC", confDao.movieCompanyConfirmList());
		model.addAttribute("pageVO", pageVO);
		return "companyConfirm/companyMovieConfirmReq";
	}
	//영화상세
	@RequestMapping("movieCompanyConfirmSelect.do")
	public String movieCompanyConfirmSelect(ConfirmVO vo, Model model) {
		vo = confDao.movieCompanyConfirmSelect(vo);
		model.addAttribute("comS", vo);
		
		return "companyConfirm/movieCompanyConfirmSelect";
	}
	//공연
	@RequestMapping("perforCompanyConfirmList.do")
	public String perforCompanyConfirmList(ConfirmVO vo, Model model) {
		model.addAttribute("comC", confDao.perforCompanyConfirmList());
		
		return "companyConfirm/companyPerforConfirmReq";
	}
	//공연상세
	@RequestMapping("perforCompanyConfirmSelect.do")
	public String perforCompanyConfirmSelect(ConfirmVO vo, Model model) {
		vo = confDao.perforCompanyConfirmSelect(vo);
		model.addAttribute("comS", vo);
		
		return "companyConfirm/perforCompanyConfirmSelect";
	}
	//굿즈
	@RequestMapping("goodsCompanyConfirmList.do")
	public String goodsCompanyConfirmList(ConfirmVO vo, Model model) {
		model.addAttribute("comC", confDao.goodsCompanyConfirmList());
		
		return "companyConfirm/companyGoodsConfirmReq";
	}
	//굿즈상세
	@RequestMapping("goodsCompanyConfirmSelect.do")
	public String goodsCompanyConfirmSelect(ConfirmVO vo, Model model) {
		vo = confDao.goodsCompanyConfirmSelect(vo);
		model.addAttribute("comS", vo);
		
		return "companyConfirm/goodsCompanyConfirmSelect";
		
	}
}
