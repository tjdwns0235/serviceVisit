package com.jw.domain.member;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
@AllArgsConstructor
public class MemberDTO {
	private String id;
	private String pw;
	private String name;
    private String at; 
    private String q1; 
    private String q2;
    private Date regdate;
}
