package com.third.prj.manager.mapper;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.third.prj.company.service.CompanyVO;
import com.third.prj.manager.service.CriteriaVO;
import com.third.prj.manager.service.ManagerVO;

public interface ManagerMapper {

	List<ManagerVO> managerSelectList(CriteriaVO cri);
	ManagerVO managerSelect(ManagerVO vo);
	int managerInsert(ManagerVO vo);
	int managerUpdate(ManagerVO vo);
	int managerDelete(ManagerVO vo);
	
 // 관리자아이디중복체크
	int idCheck(String MId);
	
	int idCheck2(ManagerVO vo);
	//리스트 처리 + 검색
	int getTotal(CriteriaVO cri);
		
	//로그인
	ManagerVO manaLogin(ManagerVO vo);
	ManagerVO manaLogin(ManagerVO vo, HttpSession session);
	
//  company 아이디 체크
	int midChk(ManagerVO vo);
}
