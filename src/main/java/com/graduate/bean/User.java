package com.graduate.bean;

/**
 * 用户管理Entity
 */
public class User{
	
	private String id;
	private String name;		    // 姓名
	private String phone;		// 电话号
	private String gender;		// 性别
	private String yajin;			// 押金
	private String yjtype;		// 押金缴纳方式：微信钱包、支付宝、银行卡
	private String yjstate;		// 押金状态; 0-正常；1-冻结
	private String xinyong;		// 信用
	private String auth;			// 权限；0-管理员；1-员工；2-会员
	private String password;	// 密码
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getYajin() {
		return yajin;
	}

	public void setYajin(String yajin) {
		this.yajin = yajin;
	}
	
	public String getYjtype() {
		return yjtype;
	}

	public void setYjtype(String yjtype) {
		this.yjtype = yjtype;
	}

	public String getYjstate() {
		return yjstate;
	}

	public void setYjstate(String yjstate) {
		this.yjstate = yjstate;
	}
	
	public String getXinyong() {
		return xinyong;
	}

	public void setXinyong(String xinyong) {
		this.xinyong = xinyong;
	}
	
	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}