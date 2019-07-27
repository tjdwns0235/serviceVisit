package com.jw.persistence.location;

import java.util.List;

import com.jw.domain.location.LocationDTO;
import com.jw.domain.location.LocationDTOA;

public interface LocationDAO {
	public List<LocationDTO> index();
	public List<LocationDTO> view(int lno);
	public int update(LocationDTOA lDtoa);
	
}
