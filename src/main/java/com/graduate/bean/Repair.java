package com.graduate.bean;

/**
 * 车辆维修Entity
 */
public class Repair{
	
	private String id;
	private String carid;		// 车id
	private String contents;		// 损坏情况
	private String price;		// 维修金额
	private String time;		// 维修时间
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
	
	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
	public String getCarname() {
		return carname;
	}

	public void setCarname(String carname) {
		this.carname = carname;
	}
	
}