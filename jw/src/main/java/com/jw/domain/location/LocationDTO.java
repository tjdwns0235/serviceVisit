package com.jw.domain.location;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class LocationDTO {
	private String title;
	private int lno;
	private String location;
	private Date regdate;
	private int rno;
	private String refuse;
	private String first_visit;
	private String second_visit;
	private List<LocationDTO> list;
}
