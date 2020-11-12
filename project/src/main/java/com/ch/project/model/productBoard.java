package com.ch.project.model;

import java.sql.Date;

import lombok.Data;

@Data
public class productBoard {

	private int pbLike;
	private String pbIp;
	private Date pbRegdate;
	private char pbDel;

	
}
