package com.third.prj.confirmrequest.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.confirmrequest.mapper.ConfirmMapper;
import com.third.prj.confirmrequest.service.ConfirmService;
import com.third.prj.confirmrequest.service.ConfirmVO;
import com.third.prj.confirmrequest.service.CriteriaVO;

@Repository("confirmDao")
public class ConfirmServiceImpl implements ConfirmService {
	@Autowired
	private ConfirmMapper mapper;

	@Override
	public List<ConfirmVO> movieConfirmList(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.movieConfirmList(cri);
	}

	@Override
	public ConfirmVO movieConfirmSelect(ConfirmVO vo) {
		// TODO Auto-generated method stub
		return mapper.companyConfirmSelect(vo);
	}

	@Override
	public List<ConfirmVO> perforConfirmList(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.perforConfirmList(cri);
	}

	@Override
	public ConfirmVO perforConfirmSelect(ConfirmVO vo) {
		// TODO Auto-generated method stub
		return mapper.perforConfirmSelect(vo);
	}

	@Override
	public List<ConfirmVO> goodsConfirmList(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.goodsConfirmList(cri);
	}

	@Override
	public ConfirmVO goodsConfirmSelect(ConfirmVO vo) {
		// TODO Auto-generated method stub
		return mapper.goodsConfirmSelect(vo);
	}

	@Override
	public int movieConfirmUpdate(ConfirmVO vo) {
		// TODO Auto-generated method stub
		return mapper.movieConfirmUpdate(vo);
	}

	@Override
	public int perforConfirmUpdate(ConfirmVO vo) {
		// TODO Auto-generated method stub
		return mapper.perforConfirmUpdate(vo);
	}

	@Override
	public int goodsConfirmUpdate(ConfirmVO vo) {
		// TODO Auto-generated method stub
		return mapper.goodsConfirmUpdate(vo);
	}

	@Override
	public List<ConfirmVO> CompanyConfirmList(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.CompanyConfirmList(cri);
	}

	@Override
	public ConfirmVO companyConfirmSelect(ConfirmVO vo) {
		// TODO Auto-generated method stub
		return mapper.companyConfirmSelect(vo);
	}

	@Override
	public List<ConfirmVO> getList(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.getList(cri);
	}

	@Override
	public int getTotal(CriteriaVO cri) {
		// TODO Auto-generated method stub
		return mapper.getTotal(cri);
	}

}
