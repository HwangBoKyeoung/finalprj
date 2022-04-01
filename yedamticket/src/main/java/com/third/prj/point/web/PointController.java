package com.third.prj.point.web;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PointController {

	@RequestMapping("/point_1.do")
	public String point_1() {
		return "point/point_1";
	}
	
	@RequestMapping(value = "/point_2.do", method = RequestMethod.POST)
	public String point_2(Model model, @RequestParam int point, @RequestParam String id) {
		model.addAttribute("point", point);
		model.addAttribute("id", id);
		return "point/point_2";
	}
	
	/*
	 * @RequestMapping(value = "/point_2.do", method = RequestMethod.POST) public
	 * String point_3(Model model, @RequestParam int point, @RequestParam String id)
	 * { model.addAttribute("point", point); model.addAttribute("id", id); return
	 * "point/point_3"; }
	 */
	
	
}
