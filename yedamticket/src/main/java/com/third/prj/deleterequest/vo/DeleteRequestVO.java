package com.third.prj.deleterequest.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DeleteRequestVO {
	private int delReqNo;
	private Date delDt;
	private String cId;
	private String deleteCd;
	private String content;
	private int mvNo;
	private int pNo;
}
