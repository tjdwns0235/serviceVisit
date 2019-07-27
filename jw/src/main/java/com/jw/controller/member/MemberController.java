package com.jw.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jw.domain.member.MemberDTO;
import com.jw.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value="member/*")
public class MemberController {
	
	@Autowired
	private MemberService Mservice;
	
	@ResponseBody
	@PostMapping("login")
	public String login(MemberDTO mDto,HttpSession session) {
		log.info("로그인 작동");
		
		boolean result = Mservice.login(mDto,session);
		String flag = "-1";
		if (result) {
			flag = "1";
		}
		
		return flag;
	}
	
	@ResponseBody
	@PostMapping("logout")
	public void logout(HttpSession session) {
		log.info("로그아웃 작동");
		
		Mservice.logout(session);
	}
	
	@GetMapping("create")
	public String create() {
		log.info("회원가입 페이지 출력");
		
		return "member/join";
	}
	
	@ResponseBody
	@PostMapping("idcheck")
	public int idCheck(String id) {
		return Mservice.idCheck(id);
	}
	
}
