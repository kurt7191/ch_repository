package model;

public class Contents {
	private String c_id;
	private String c_name;
	private int c_coin;
	private String information;
	private int people;	// 사용자수
	
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public int getC_coin() {
		return c_coin;
	}
	public void setC_coin(int c_coin) {
		this.c_coin = c_coin;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
}
