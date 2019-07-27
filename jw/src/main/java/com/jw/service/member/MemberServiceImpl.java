package com.jw.service.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jw.domain.member.MemberDTO;
import com.jw.persistence.member.MemberDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO mDao;
	
	@Override
	public boolean login(MemberDTO mDto,HttpSession session) {
		log.info("memberService 이동");
		boolean result = false;
		String name = "";
		
		mDto = mDao.login(mDto);
		if (mDto != null) {
			log.info("mDto>>>>"+mDto.getName());
			name = mDto.getName();
		}
		
		
		if (mDto != null) {
			log.info("유저확인");
			session.removeAttribute("name");
			session.removeAttribute("at");
			session.setAttribute("name", name);
			session.setAttribute("at", mDto.getAt());
			log.info("세션>>>>"+session.getAttribute("name"));
			result = true;
		}
		
		return result;
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public int idCheck(String id) {
		log.info("idCheck 작동");
		return mDao.idCheck(id);
	}

}
