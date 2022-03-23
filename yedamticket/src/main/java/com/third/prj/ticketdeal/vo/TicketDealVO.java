package com.third.prj.ticketdeal.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TicketDealVO {
	private int dealNo;
	private int tNo;
	private String uNo;
	private Date dealDt;
	private String dealAgreeCd;
	private String dealStatCd;
	private String dealGb;
	
}
