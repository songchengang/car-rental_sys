package com.graduate.bean;

/**
 * 车辆保险Entity
 */
public class Safe{
	
	private String id;
	private String carid;		// 车id
	private String price;		// 保险费
	private String begintime;		// 保险开始时间
	private String endtime;
	private String company;
	private String number;			// 保险结束时间
	private String userid;		// 保险人
	private String username;		// 保险人
	private String carname;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getCarid() {
		return carid;
	}

	public void setCarid(String carid) {
		this.carid = carid;
	}
	
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getBegintime() {
		return begintime;
	}

	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}
	
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}


	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCarname() {
		return carname;
	}

	public void setCarname(String carname) {
		this.carname = carname;
	}
	
}