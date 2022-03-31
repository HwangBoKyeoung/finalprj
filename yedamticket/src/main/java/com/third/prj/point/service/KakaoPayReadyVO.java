package com.third.prj.point.service;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayReadyVO {

	private String Tid;
	private String NextRedirectPcUrl;
	private Date createdAt;
}
