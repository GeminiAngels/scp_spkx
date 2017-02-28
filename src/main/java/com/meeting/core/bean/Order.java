package com.meeting.core.bean;

import java.math.BigDecimal;

/**
 * 订单实体类
 * 数据表：t_order
 * @author 白云飞
 *
 */
public class Order {
	private int id;
	private int orderregisterid;	//关联注册用户ID
	private String orderuname;		//关联注册用户姓名
	private String ordertype;		//订单类型
	private String orderno;			//订单号
	private String orderaccount;	//订单付款帐号
	private String ordertitle;		//订单标题
	private BigDecimal ordermoney;	//订单金额
	private int orderstatus;		//订单状态(0支付中,1支付成功,-1支付失败)
	private String orderbackmsg;	//订单支付回执消息
	private String orderremark;		//订单附加说明
	private String orderdate;		//订单时间
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOrderregisterid() {
		return orderregisterid;
	}
	public void setOrderregisterid(int orderregisterid) {
		this.orderregisterid = orderregisterid;
	}
	public String getOrderuname() {
		return orderuname;
	}
	public void setOrderuname(String orderuname) {
		this.orderuname = orderuname;
	}
	public String getOrdertype() {
		return ordertype;
	}
	public void setOrdertype(String ordertype) {
		this.ordertype = ordertype;
	}
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	public String getOrderaccount() {
		return orderaccount;
	}
	public void setOrderaccount(String orderaccount) {
		this.orderaccount = orderaccount;
	}
	public String getOrdertitle() {
		return ordertitle;
	}
	public void setOrdertitle(String ordertitle) {
		this.ordertitle = ordertitle;
	}
	public BigDecimal getOrdermoney() {
		return ordermoney;
	}
	public void setOrdermoney(BigDecimal ordermoney) {
		this.ordermoney = ordermoney;
	}
	public int getOrderstatus() {
		return orderstatus;
	}
	public void setOrderstatus(int orderstatus) {
		this.orderstatus = orderstatus;
	}
	public String getOrderbackmsg() {
		return orderbackmsg;
	}
	public void setOrderbackmsg(String orderbackmsg) {
		this.orderbackmsg = orderbackmsg;
	}
	public String getOrderremark() {
		return orderremark;
	}
	public void setOrderremark(String orderremark) {
		this.orderremark = orderremark;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public Order() {
		super();
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", orderregisterid=" + orderregisterid + ", orderuname=" + orderuname
				+ ", ordertype=" + ordertype + ", orderno=" + orderno + ", orderaccount=" + orderaccount
				+ ", ordertitle=" + ordertitle + ", ordermoney=" + ordermoney + ", orderstatus=" + orderstatus
				+ ", orderbackmsg=" + orderbackmsg + ", orderremark=" + orderremark + ", orderdate=" + orderdate + "]";
	}
}
