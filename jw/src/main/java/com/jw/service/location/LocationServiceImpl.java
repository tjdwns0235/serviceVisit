package com.jw.service.location;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import com.jw.domain.location.LocationDTO;
import com.jw.domain.location.LocationDTOA;
import com.jw.persistence.location.LocationDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class LocationServiceImpl implements LocationService {
	
	@Autowired
	private LocationDAO lDao;

	@Override
	public List<LocationDTO> index() {
		log.info("locationService index이동 ");
		
		 return lDao.index();
	}

	@Override
	public List<LocationDTO> view(int lno) {
		log.info("locationService view이동 ");
		log.info(">>>>>"+lno);
		return lDao.view(lno);
	}

	@Override
	public int update() {
		log.info("update 왔당");
		return 0;
//		JsonArray jsonArray = (JsonArray) jsonParser.parse();
//		return lDao.update(lDtoa);
	}


}
