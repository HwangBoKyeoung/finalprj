package com.third.prj.search.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.third.prj.movie.service.MovieService;
import com.third.prj.movie.service.MovieVO;
import com.third.prj.search.service.SearchService;
import com.third.prj.search.service.SearchVO;

@Controller
public class SearchController {
	
	@Autowired 
	SearchService searchDao;
	
	@Autowired
	MovieService movieDao;
	
//	@RequestMapping("/searchAll.do")
//	public String searchAll(Model model, Map<String, Object>map, MovieVO vo) {
//		map.put("p_search", vo.getSearchName());
////		map.put("namess", vo.getName());
////		map.put("actorss", vo.getActor());
////		map.put("contentss", vo.getContent());
////		map.put("filecdss", vo.getFileCd());
//		String SearchName = vo.getSearchName();
////		List<MovieVO> list = movieDao.searchAll(SearchName);
//		model.addAttribute("searchName", movieDao.searchAll(SearchName));
//		movieDao.searchProcedure(map);
//		
//		
//		return "user/searchList";
//	}
//	
	
	@RequestMapping("/searchAll.do")
	public String searchAll(MovieVO vo, Model model) {
		System.out.println("안녕하세요.");
		String SearchName = vo.getSearchName();
		System.out.println(movieDao.popularSearch(vo));
		movieDao.popularSearch(vo);
		System.out.println("-------------------------"+SearchName);
		System.out.println("=========================="+vo);
		System.out.println("**************************"+movieDao.searchAll(SearchName));
		
		List<MovieVO> list = movieDao.searchAll(SearchName);
		model.addAttribute("searchName", list);

		
		return "user/searchList";
	}
	
	@RequestMapping("/searchList.do")
	@ResponseBody
	public List<SearchVO> searchList() {
		List<SearchVO> list = searchDao.popularKeywordCnt();
		return list;
	}
}
