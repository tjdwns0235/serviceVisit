package com.jw.persistence.member;

import com.jw.domain.member.MemberDTO;

public interface MemberDAO {
	public MemberDTO login(MemberDTO mDto);
	public int idCheck(String id);
}
