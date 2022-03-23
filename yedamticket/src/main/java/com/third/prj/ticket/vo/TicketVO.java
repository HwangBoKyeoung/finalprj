package com.third.prj.ticket.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TicketVO {
	private int tNo;
	private Date tkDt;
	private int price;
	private String stat;
	private int pReservNo;
	private int mvReservNo;
}
