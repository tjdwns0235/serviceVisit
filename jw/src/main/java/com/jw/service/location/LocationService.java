package com.jw.service.location;

import java.util.List;

import com.google.gson.JsonParser;
import com.jw.domain.location.LocationDTO;

public interface LocationService {
	public List<LocationDTO> index();
	public List<LocationDTO> view(int lno);
	public int update();
}
