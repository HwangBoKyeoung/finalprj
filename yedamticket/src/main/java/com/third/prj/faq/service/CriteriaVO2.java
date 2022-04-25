package com.third.prj.faq.service;

import lombok.Data;

@Data
public class CriteriaVO2 {
	
	private int pageNum;
	private int amount;
	
	//검색에 필요한 키워드
	private String searchType; //작성자,제목
	private String searchName; //검색할 이름
	
	public CriteriaVO2() {
		this(1,6);
	}
	
	public CriteriaVO2(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
