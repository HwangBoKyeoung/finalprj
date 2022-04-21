package com.third.prj.confirmrequest.mapper;

import java.util.List;

import com.third.prj.confirmrequest.service.ConfirmVO;
import com.third.prj.confirmrequest.service.CriteriaVO;

public interface ConfirmMapper {
	// 관리자
	// 영화 승인요청 리스트(관리자)
	List<ConfirmVO> movieConfirmList();// CriteriaVO cri

	ConfirmVO movieConfirmSelect(ConfirmVO vo);// 상세

	// 공연 승인요청 리스트(관리자)
	List<ConfirmVO> perforConfirmList();

	ConfirmVO perforConfirmSelect(ConfirmVO vo);// 상세

	// 굿즈 승인요청 리스트(관리자)
	List<ConfirmVO> goodsConfirmList();

	ConfirmVO goodsConfirmSelect(ConfirmVO vo);// 상세

	int movieConfirmUpdate(ConfirmVO vo);

	int perforConfirmUpdate(ConfirmVO vo);

	int goodsConfirmUpdate(ConfirmVO vo);

	// 기업
	// 승인요청 리스트 (기업)
	List<ConfirmVO> movieCompanyConfirmList();

	List<ConfirmVO> perforCompanyConfirmList();

	List<ConfirmVO> goodsCompanyConfirmList();

	ConfirmVO movieCompanyConfirmSelect(ConfirmVO vo);// 상세

	ConfirmVO perforCompanyConfirmSelect(ConfirmVO vo);// 상세

	ConfirmVO goodsCompanyConfirmSelect(ConfirmVO vo);// 상세

	// 굿즈 요청처리 페이징
	public List<ConfirmVO> getList(CriteriaVO cri);

	// 굿즈 요청처리 전체 게시글수
	public int getTotal(CriteriaVO cri);

	// 영화 요청처리 페이징
	public List<ConfirmVO> getListMovie(CriteriaVO cri);

	// 영화 요청처리 전체 게시글수
	public int getTotalMovie(CriteriaVO cri);

	// 공연 요청처리 페이징
	public List<ConfirmVO> getListPerformance(CriteriaVO cri);

	// 공연 요청처리 전체 게시글수
	public int getTotalPerformance(CriteriaVO cri);

	// 굿즈 관리자페이지 페이징(대기중 리스트 보이기)
	public List<ConfirmVO> getListAdminGoods(CriteriaVO cri);

	// 굿즈 관리자페이지 전체 게시글수(대기중 리스트 보이기)
	public int getTotalAdminGoods(CriteriaVO cri);

	// 영화 관리자페이지 페이징(대기중 리스트 보이기)
	public List<ConfirmVO> getListAdminMovie(CriteriaVO cri);

	// 영화 관리자페이지 전체 게시글수(대기중 리스트 보이기)
	public int getTotalAdminMovie(CriteriaVO cri);

	// 공연 관리자페이지 페이징(대기중 리스트 보이기)
	public List<ConfirmVO> getListAdminPerformance(CriteriaVO cri);

	// 공연 관리자페이지 전체 게시글수(대기중 리스트 보이기)
	public int getTotalAdminPerformance(CriteriaVO cri);
}
