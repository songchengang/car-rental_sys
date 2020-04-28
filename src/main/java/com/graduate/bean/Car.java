package com.graduate.bean;

/**
 * 车辆Entity
 */
public class Car{
	
	private String id;
	private String brand;		// 品牌
	private String cartype;		// 车型
	private String number;		// 车牌号
	private String price;		// 价格
	private String contents;		// 简介
	private String seat;		// 座位数
	private String safe;		// 保险费
	private String oil;		// 油量：满/不满
	private String state;		// 租用状态：0未租；1已租
	private String brandq;
	private String cartypeq;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	public String getCartype() {
		return cartype;
	}

	public void setCartype(String cartype) {
		this.cartype = cartype;
	}
	
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
	
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}
	
	public String getSafe() {
		return safe;
	}

	public void setSafe(String safe) {
		this.safe = safe;
	}
	
	public String getOil() {
		return oil;
	}

	public void setOil(String oil) {
		this.oil = oil;
	}
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getBrandq() {
		return brandq;
	}

	public void setBrandq(String brandq) {
		this.brandq = brandq;
	}

	public String getCartypeq() {
		return cartypeq;
	}

	public void setCartypeq(String cartypeq) {
		this.cartypeq = cartypeq;
	}
	
}