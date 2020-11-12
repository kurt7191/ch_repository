package com.ch.project.model;

import java.sql.Date;

import lombok.Data;

@Data
public class product {

	private int p_Num;
	private String P_Company;
	private String p_Name;
	private int p_Price;
	private int p_Quantity;
	private Date p_RegDate;
	private String p_Color;
	private String p_pcName;
	
	
}
