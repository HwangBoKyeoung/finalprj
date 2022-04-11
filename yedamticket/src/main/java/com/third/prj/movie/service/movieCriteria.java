package com.third.prj.movie.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class movieCriteria {
	private int pageNum;
	private int amount;
	
	public movieCriteria() {
		this(1,10);
	}
	
	public movieCriteria(int pageNum,int amount) {
		this.pageNum=pageNum;
		this.amount=amount;
	}
}
