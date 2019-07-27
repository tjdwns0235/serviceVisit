package com.jw.persistence.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jw.domain.member.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberDTO login(MemberDTO mDto) {
		log.info("memberDAO 이동 ");
		return sqlSession.selectOne("member.login",mDto);
	}
	
	@Override
	public int idCheck(String id) {
		return sqlSession.selectOne("member.idCheck", id);
	}
}
