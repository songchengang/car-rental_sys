package com.graduate.bean;

/**
 * 订单管理Entity
 */
public class Orders{
	
	private String id;
	private String carid;		// 车id
	private String rentime;	// 租用时间
	private String returntime;		// 归还时间
	private String safe;		// 是否购买保险服务：0是；1否
	private String price;		// 支付费用
	private String evaluate;		// 评价
	private String qxstate;		// 租用状态：0已租用；1已取消；2已归还
	private String createtime;		// 订单时间
	private String createid;		// 租赁人id
	private String createname;		// 租赁人
	private String buytype;			// 付款方式
	private String carname;		//sql中定义的车型号-牌照
	private String begintime;
	private String endtime;
	private String hour;
	
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
	
	public String getRentime() {
		return rentime;
	}

	public void setRentime(String rentime) {
		this.rentime = rentime;
	}

	public String getReturntime() {
		return returntime;
	}

	public void setReturntime(String returntime) {
		this.returntime = returntime;
	}
	
	public String getSafe() {
		return safe;
	}

	public void setSafe(String safe) {
		this.safe = safe;
	}
	
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(String evaluate) {
		this.evaluate = evaluate;
	}
	
	public String getQxstate() {
		return qxstate;
	}

	public void setQxstate(String qxstate) {
		this.qxstate = qxstate;
	}
	
	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	
	public String getCreateid() {
		return createid;
	}

	public void setCreateid(String createid) {
		this.createid = createid;
	}
	
	public String getCreatename() {
		return createname;
	}

	public void setCreatename(String createname) {
		this.createname = createname;
	}

	public String getBuytype() {
		return buytype;
	}

	public void setBuytype(String buytype) {
		this.buytype = buytype;
	}

	public String getCarname() {
		return carname;
	}

	public void setCarname(String carname) {
		this.carname = carname;
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

	public String getHour() {
		return hour;
	}

	public void setHour(String hour) {
		this.hour = hour;
	}

}