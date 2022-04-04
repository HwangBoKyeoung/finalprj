package com.third.prj.movie.service;


import com.third.prj.moviereservation.service.MovieReservVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MovieVO {
	
	private int mvNo;
	private String name;
	private String genre;
	private String startDate;
	private String director;
	private String rating;
	private String distibutor;
	private String country;
	private String runtime;
	private String content;
	private String cId;
	private String actor;
	private String fileCd;
	private String docId;
	
	private MovieReservVO movieReservVO;

}
