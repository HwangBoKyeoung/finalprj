package com.third.prj.notice.service;

import lombok.Data;

@Data
public class CriteriaVO {
	
	private int pageNum;
	private int amount;
	
	//검색에 필요한 키워드
	private String searchType; //작성자,제목
	private String searchName; //검색할 이름 
	
	public CriteriaVO() {
		this(1,10);
	}
	public CriteriaVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
