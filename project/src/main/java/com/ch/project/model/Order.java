package com.ch.project.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Order {

	private int orNumber;
	private Date or_date;
	private int or_totalCost;
	private String or_deliveryState;
	private String or_deliveryLocation;
	private String or_buyType;
	private String or_color;
	private int or_count;

	
}
