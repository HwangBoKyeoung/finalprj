package com.third.prj.deleterequest.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.deleterequest.mapper.DeleteRequestMapper;
import com.third.prj.deleterequest.service.DeleteRequestService;
import com.third.prj.deleterequest.service.DeleteRequestVO;
import com.third.prj.performance.service.PerformanceVO;

@Repository("delDao")
public class DeleteRequestServiceImpl implements DeleteRequestService{

	@Autowired
	private DeleteRequestMapper mapper;
	@Override
	public List<DeleteRequestVO> delSelectList() {
		// TODO Auto-generated method stub
		return mapper.delSelectList();
	}

	@Override
	public DeleteRequestVO delSelect(DeleteRequestVO vo) {
		// TODO Auto-generated method stub
		return mapper.delSelect(vo);
	}

	@Override
	public int delInsert(DeleteRequestVO vo) {
		// TODO Auto-generated method stub
		return mapper.delInsert(vo);
	}

	@Override
	public int delUpdate(DeleteRequestVO vo) {
		// TODO Auto-generated method stub
		return mapper.delUpdate(vo);
	}

	@Override
	public int delDelete(DeleteRequestVO vo) {
		// TODO Auto-generated method stub
		return mapper.delDelete(vo);
	}

	@Override
	public List<DeleteRequestVO> delSearch(String key, String val) {
		// TODO Auto-generated method stub
		return mapper.delSearch(key, val);
	}

	@Override
	public DeleteRequestVO updatedel(DeleteRequestVO vo) {
		// TODO Auto-generated method stub
		return mapper.updatedel(vo);
	}

}
