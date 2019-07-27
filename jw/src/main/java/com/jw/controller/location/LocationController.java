package com.jw.controller.location;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonParser;
import com.jw.domain.location.LocationDTO;
import com.jw.domain.location.LocationDTOA;
import com.jw.service.location.LocationService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("location/*")
public class LocationController {
	
	@Autowired
	private LocationService lService;
	
	@GetMapping("view/{lno}")
	public ModelAndView view(@RequestParam  String title , @PathVariable int lno) {
		log.info("LocationController view이동 ");
		log.info("lno>>>>"+lno);
		ModelAndView mav = new ModelAndView();
		
		List<LocationDTO> list;
		list = lService.view(lno);
		
		log.info(list.toString());
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("title", title);
		
		mav.addObject("one",map);
		mav.setViewName("location/view");
		
		return mav;
	}
//	@Produces(MediaType.APPLICATION_JSON)
//	@Consumes(MediaType.APPLICATION_JSON)
	@PostMapping("update")
	public @ResponseBody void update(@RequestBody LocationDTOA lDtoa )  {
//		@RequestParam(value = "first_visit") List<String> first_visit,
//		  @RequestParam(value = "second_visit" )List<String> second_visit,
//		  @RequestParam(value = "lno") List<Integer> lno,
//		  @RequestParam(value = "rno") List<Integer> rno
			LocationDTO lDto = new LocationDTO();
		



			출처: https://justjava.tistory.com/7 [Just Java]
		
		System.out.println("dkdkdk");
		log.info("update 이동");
		
		lService.update();
		
	}
}
