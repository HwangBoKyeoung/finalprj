package com.third.prj.confirmrequest.service;

import java.util.List;

public interface ConfirmService {
	//관리자
		//영화 승인요청 리스트(관리자)
		List<ConfirmVO> movieConfirmList(CriteriaVO cri);
		
		ConfirmVO movieConfirmSelect(ConfirmVO vo);//상세
		
		//공연 승인요청 리스트(관리자)
		List<ConfirmVO> perforConfirmList(CriteriaVO cri);
		
		ConfirmVO perforConfirmSelect(ConfirmVO vo);//상세
		
		//굿즈 승인요청 리스트(관리자)
		List<ConfirmVO> goodsConfirmList(CriteriaVO cri);
		
		ConfirmVO goodsConfirmSelect(ConfirmVO vo);//상세
		
		int movieConfirmUpdate(ConfirmVO vo);
		int perforConfirmUpdate(ConfirmVO vo);
		int goodsConfirmUpdate(ConfirmVO vo);
		
		//기업
		//승인요청 리스트 (기업)
		List<ConfirmVO> CompanyConfirmList(CriteriaVO cri);
		
		ConfirmVO companyConfirmSelect(ConfirmVO vo);//상세
		
		// 페이징
		public List<ConfirmVO> getList(CriteriaVO cri);
		// 전체 게시글수
		public int getTotal(CriteriaVO cri);
}