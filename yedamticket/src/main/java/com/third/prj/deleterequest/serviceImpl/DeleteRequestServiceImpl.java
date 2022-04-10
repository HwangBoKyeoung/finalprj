package com.third.prj.deleterequest.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.deleterequest.mapper.DeleteRequestMapper;
import com.third.prj.deleterequest.service.CriteriaVO;
import com.third.prj.deleterequest.service.DeleteRequestService;
import com.third.prj.deleterequest.service.DeleteRequestVO;

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
	public List<DeleteRequestVO> companyMyDeletePerforList(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.companyMyDeletePerforList(cri);
	}

	@Override
	public List<DeleteRequestVO> companyMyDeleteMovieList(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.companyMyDeleteMovieList(cri);
	}

}
