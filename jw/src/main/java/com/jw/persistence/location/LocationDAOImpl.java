package com.jw.persistence.location;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jw.domain.location.LocationDTO;
import com.jw.domain.location.LocationDTOA;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class LocationDAOImpl implements LocationDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<LocationDTO> index() {
		log.info("LocationDAOImpl 이동 ");
		List<LocationDTO> list;
		LocationDTO lDto = new LocationDTO();
		
		list = sqlSession.selectList("location.index");
		
		log.info(list.toString());
		log.info(lDto.toString());
		return list;
	}

	@Override
	public List<LocationDTO> view(int lno) {
		log.info("LocationDAOImpl view이동");
		log.info(">>>>"+lno);
		List<LocationDTO> list;
		list = sqlSession.selectList("location.view",lno);
		System.out.println(list.toString());
		
		return list;
	}

	@Override
	public int update(LocationDTOA lDtoa) {
		return sqlSession.update("location.update", lDtoa);
	}

	
	
	
	
}
