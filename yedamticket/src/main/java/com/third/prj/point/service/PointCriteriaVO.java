package com.third.prj.point.service;

import lombok.Data;

@Data
public class PointCriteriaVO {
	private int pageNum;
	private int amount;
	
	//검색에 필요한 키워드
	private String searchType; //작성자,제목
	private String searchName; //검색할 이름
	private String UId;
	
	
	
	public PointCriteriaVO() {
		this(1,10);
	}
	
	public PointCriteriaVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
