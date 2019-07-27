package com.jw.service.member;

import javax.servlet.http.HttpSession;

import com.jw.domain.member.MemberDTO;

public interface MemberService {
	public boolean login(MemberDTO mDto, HttpSession session);
	public void logout(HttpSession session);
	public int idCheck(String id);
}
