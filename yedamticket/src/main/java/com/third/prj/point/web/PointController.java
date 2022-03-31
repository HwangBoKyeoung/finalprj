package com.third.prj.point.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.third.prj.point.service.KakaoPay;

import lombok.Setter;

@Controller
public class PointController {

	@Setter(onMethod_ = @Autowired)
	private KakaoPay kakaopay;

	@RequestMapping("/point_1.do")
	public String point_1() {
		return "point/point_1";
	}
	
	@RequestMapping("/kakaoPay.do")
	public String kakaoPay() {
		return "point/kakaoPay";
	}
	
	@GetMapping("/kakaoPay.do")
	public void kakaoPayGet() {

	};

	@PostMapping("/kakaoPay.do")
	public String kakaoPay1() {
		System.out.println("KakaoPay POST");
		return "redirect:" + kakaopay.kakaoPayReady();
		
	}
	
	@GetMapping("/kakaoPaySuccess")
	public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
		System.out.println("kakaopaysuccess get > " + pg_token);
		
	}
}
