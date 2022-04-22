package com.third.prj.deleterequest.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.deleterequest.mapper.DeleteRequestMapper;
import com.third.prj.deleterequest.service.CriteriaVO;
import com.third.prj.deleterequest.service.DeleteRequestService;
import com.third.prj.deleterequest.service.DeleteRequestVO;
import com.third.prj.movie.service.MovieVO;
import com.third.prj.performance.service.PerformanceVO;

@Repository("delDao")
public class DeleteRequestServiceImpl implements DeleteRequestService{

	@Autowired
	private DeleteRequestMapper mapper;
	@Override
	public List<DeleteRequestVO> deleteRequestList(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.deleteRequestList(cri);
	}

	@Override
	public DeleteRequestVO deleteRequestSelect(DeleteRequestVO vo) {
		// TODO Auto-generated method stub
		return mapper.deleteRequestSelect(vo);
	}

	@Override
	public int deletePerforInsert(DeleteRequestVO vo) {
		// TODO Auto-generated method stub
		return mapper.deletePerforInsert(vo);
	}

	@Override
	public int deleteRequestUpdate(DeleteRequestVO vo) {
		// TODO Auto-generated method stub
		return mapper.deleteRequestUpdate(vo);
	}


	@Override
	public DeleteRequestVO deleteRequestPerforSelect(DeleteRequestVO vo) {
		// TODO Auto-generated method stub
		return mapper.deleteRequestPerforSelect(vo);
	}

	@Override
	public int deleteMovieInsert(DeleteRequestVO vo) {
		// TODO Auto-generated method stub
		return mapper.deleteMovieInsert(vo);
	}

	@Override
	public DeleteRequestVO deleteRequestMovieSelect(DeleteRequestVO vo) {
		// TODO Auto-generated method stub
		return mapper.deleteRequestMovieSelect(vo);
	}

	@Override
	public int getTotal(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.getTotal(cri);
	}

	@Override
	public List<DeleteRequestVO> companyMyDeletePerforList(CriteriaVO cri,PerformanceVO vo) {
		// TODO Auto-generated method stub
		return mapper.companyMyDeletePerforList(cri,vo);
	}

	@Override
	public List<DeleteRequestVO> companyMyDeleteMovieList(CriteriaVO cri,MovieVO vo) {
		// TODO Auto-generated method stub
		return mapper.companyMyDeleteMovieList(cri,vo);
	}

	//기업회원마이페이지 - 영화 목록
	@Override
	public List<DeleteRequestVO> companyPerforSelectList(CriteriaVO cri,PerformanceVO vo) {
		// TODO Auto-generated method stub
		return mapper.companyPerforSelectList(cri,vo);
	}

	@Override
	public int getTotalPerfor(CriteriaVO cri,PerformanceVO vo) {
		// TODO Auto-generated method stub
		return mapper.getTotalPerfor(cri,vo);
	}

	@Override
	public int getTotalDeletePerfor(CriteriaVO cri,PerformanceVO vo) {
		// TODO Auto-generated method stub
		return mapper.getTotalDeletePerfor(cri,vo);
	}

	@Override
	public int getTotalDeleteMovie(CriteriaVO cri,MovieVO vo) {
		// TODO Auto-generated method stub
		return mapper.getTotalDeleteMovie(cri,vo);
	}

	@Override
	public List<DeleteRequestVO> companyMovieSelectList(CriteriaVO cri,MovieVO vo) {
		// TODO Auto-generated method stub
		return mapper.companyMovieSelectList(cri,vo);
	}

	@Override
	public int getTotalMovie(CriteriaVO cri,MovieVO vo) {
		// TODO Auto-generated method stub
		return mapper.getTotalMovie(cri,vo);
	}

	@Override
	public List<DeleteRequestVO> managerPerforDelList(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.managerPerforDelList(cri);
	}

	@Override
	public int getTotalPDel(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.getTotalPDel(cri);
	}

	@Override
	public List<DeleteRequestVO> managerMovieDelList(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.managerMovieDelList(cri);
	}

	@Override
	public int getTotaMDel(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.getTotaMDel(cri);
	}

}
