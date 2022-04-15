package com.third.prj.goods.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GoodsVO {
	
	private int gNo;
	private String name;
	private String seller;
	private int price;
	private String content;
	private String sellNo;
	private String fileCd;
	private String goodsCd;
	private String fileRe;
	private String CId;
	private String confirm; //관리자 승인여부
	private String refuseRs; //거부사유
	
	//검색
	private String searchKeyword;
		
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
		
	public String getSearchKeyword() {
			return searchKeyword;
	}
}
