package com.third.prj.search.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.third.prj.movie.service.MovieVO;
import com.third.prj.search.mapper.SearchMapper;
import com.third.prj.search.service.SearchService;
import com.third.prj.search.service.SearchVO;

@Repository("searchDao")
public class SearchServiceImpl implements SearchService {

	@Autowired SearchMapper mapper;
	
	@Override
	public List<SearchVO> popularKeywordCnt() {
		// TODO Auto-generated method stub
		return mapper.popularKeywordCnt();
	}

	
}
