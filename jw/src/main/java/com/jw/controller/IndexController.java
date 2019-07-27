package com.jw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jw.domain.location.LocationDTO;
import com.jw.service.location.LocationService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class IndexController {
	
	@Autowired
	private LocationService Lservice;
	
	@GetMapping("/")
	public ModelAndView index() {
		log.info("index로 이동");
		ModelAndView mav = new ModelAndView();
		
		List<LocationDTO> list;
		list = Lservice.index();
		
		mav.setViewName("index");
		mav.addObject("title",list);
		
		return mav;
	}
}
