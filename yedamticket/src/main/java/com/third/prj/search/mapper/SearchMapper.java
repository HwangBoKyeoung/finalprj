package com.third.prj.search.mapper;

import java.util.List;

import com.third.prj.search.service.SearchVO;

public interface SearchMapper {
	
	//인기검색어순위
	List<SearchVO> popularKeywordCnt();
	
}
