package com.meeting.core.bean;

/**
 * 2016/9/13 00:15:39
 * @author 白云飞
 *
 */
public class Condition {
	private String collieryid;
	private String coaltypeid;
	private String customerid;
	private String standard;
	private String day;
	private String week;
	private String month;
	private String ktype;
	private String datestart;
	private String dateend;
	public String getKtype() {
		return ktype;
	}
	public void setKtype(String ktype) {
		this.ktype = ktype;
	}
	public String getCollieryid() {
		return collieryid;
	}
	public void setCollieryid(String collieryid) {
		this.collieryid = collieryid;
	}
	public String getCoaltypeid() {
		return coaltypeid;
	}
	public void setCoaltypeid(String coaltypeid) {
		this.coaltypeid = coaltypeid;
	}
	public String getCustomerid() {
		return customerid;
	}
	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getDatestart() {
		return datestart;
	}
	public void setDatestart(String datestart) {
		this.datestart = datestart;
	}
	public String getDateend() {
		return dateend;
	}
	public void setDateend(String dateend) {
		this.dateend = dateend;
	}
	public Condition() {
		super();
	}
	public Condition(String collieryid, String coaltypeid, String customerid, String standard, String day, String week,
			String month, String ktype, String datestart, String dateend) {
		super();
		this.collieryid = collieryid;
		this.coaltypeid = coaltypeid;
		this.customerid = customerid;
		this.standard = standard;
		this.day = day;
		this.week = week;
		this.month = month;
		this.ktype = ktype;
		this.datestart = datestart;
		this.dateend = dateend;
	}
	@Override
	public String toString() {
		return "Condition [collieryid=" + collieryid + ", coaltypeid=" + coaltypeid + ", customerid=" + customerid
				+ ", standard=" + standard + ", day=" + day + ", week=" + week + ", month=" + month + ", ktype=" + ktype
				+ ", datestart=" + datestart + ", dateend=" + dateend + "]";
	}
	
}
