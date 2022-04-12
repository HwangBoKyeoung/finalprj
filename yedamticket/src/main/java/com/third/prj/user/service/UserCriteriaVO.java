package com.third.prj.user.service;

import lombok.Data;

@Data
public class UserCriteriaVO {
	private int pageNum;
	private int amount;
	
	//검색에 필요한 키워드
	private String searchType; //작성자,제목
	private String searchName; //검색할 이름
	private String UId;
	
	
	
	public UserCriteriaVO() {
		this(1,10);
	}
	
	public UserCriteriaVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
