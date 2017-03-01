package com.meeting.core.bean;

import java.util.Date;

/**
 * 2016/9/13 01:36:34
 * @author 白云飞
 *
 */
public class Register {
	private int id;				//编号
	private String username;	//用户名
	private String password;	//密码
	private String registertime;//注册时间
	private String nickname;	//姓名
	private String sex;			//性别
	private String gzqk;		//工作情况
	private String company;		//工作单位
	private String title;		//职称
	private String job;			//职务
	private String address;		//单位地址
	private String postcode;	//邮编
	private String officephone;	//办公电话
	private String fax;			//传真
	private String telphone;	//手机
	private String email;		//邮箱
	private String sffblw;		//是否发表论文
	private String journalname;	//投稿期刊
	private String gjbh;		//稿件编号
	private String gjtm;		//稿件题目
	private String gjzt;		//稿件状态
	private String sfztlw;		//是否张贴论文
	private String sfsqhyfy;	//是否申请会议发言
	private String fytm;		//发言题目
	private String fynrzy;		//发言内容摘要
	private String sfzs;		//是否住宿
	private String zsyq;		//住宿标准
	private String zskssj;		//住宿开始时间
	private String zsjssj;		//住宿结束时间
	private String invoice;		//是否需要发票
	private String zfflag;		//缴费状态
	private String fptt;		//发票抬头（单位名称）
	private String yqhfszt;		//电子邀请函发送状态
	private String message;		//备注
	
	
	private String degree;		//学历-作废
	private String sfcjsx;		//是否参加实习-作废
	private String sxxl;		//实习线路-作废
	private String usertype;	//代表性质

	private String zzyqhfszt;	//纸质版邀请函发送状态
	private String hwzbz;	//会务组备注

	
	public Register() {
		super();
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRegistertime() {
		return registertime;
	}
	public void setRegistertime(String registertime) {
		this.registertime = registertime;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getGzqk() {
		return gzqk;
	}
	public void setGzqk(String gzqk) {
		this.gzqk = gzqk;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getOfficephone() {
		return officephone;
	}
	public void setOfficephone(String officephone) {
		this.officephone = officephone;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSffblw() {
		return sffblw;
	}
	public void setSffblw(String sffblw) {
		this.sffblw = sffblw;
	}
	public String getJournalname() {
		return journalname;
	}
	public void setJournalname(String journalname) {
		this.journalname = journalname;
	}
	public String getGjbh() {
		return gjbh;
	}
	public void setGjbh(String gjbh) {
		this.gjbh = gjbh;
	}
	public String getGjtm() {
		return gjtm;
	}
	public void setGjtm(String gjtm) {
		this.gjtm = gjtm;
	}
	public String getGjzt() {
		return gjzt;
	}
	public void setGjzt(String gjzt) {
		this.gjzt = gjzt;
	}
	public String getSfztlw() {
		return sfztlw;
	}
	public void setSfztlw(String sfztlw) {
		this.sfztlw = sfztlw;
	}
	public String getSfsqhyfy() {
		return sfsqhyfy;
	}
	public void setSfsqhyfy(String sfsqhyfy) {
		this.sfsqhyfy = sfsqhyfy;
	}
	public String getFytm() {
		return fytm;
	}
	public void setFytm(String fytm) {
		this.fytm = fytm;
	}
	public String getFynrzy() {
		return fynrzy;
	}

	public void setFynrzy(String fynrzy) {
		this.fynrzy = fynrzy;
	}
	public String getSfzs() {
		return sfzs;
	}
	public void setSfzs(String sfzs) {
		this.sfzs = sfzs;
	}
	public String getZsyq() {
		return zsyq;
	}
	public void setZsyq(String zsyq) {
		this.zsyq = zsyq;
	}
	public String getZskssj() {
		return zskssj;
	}
	public void setZskssj(String zskssj) {
		this.zskssj = zskssj;
	}
	public String getZsjssj() {
		return zsjssj;
	}
	public void setZsjssj(String zsjssj) {
		this.zsjssj = zsjssj;
	}
	public String getInvoice() {
		return invoice;
	}
	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}
	public String getZfflag() {
		return zfflag;
	}
	public void setZfflag(String zfflag) {
		this.zfflag = zfflag;
	}
	public String getFptt() {
		return fptt;
	}
	public void setFptt(String fptt) {
		this.fptt = fptt;
	}
	public String getYqhfszt() {
		return yqhfszt;
	}
	public void setYqhfszt(String yqhfszt) {
		this.yqhfszt = yqhfszt;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getSfcjsx() {
		return sfcjsx;
	}
	public void setSfcjsx(String sfcjsx) {
		this.sfcjsx = sfcjsx;
	}
	public String getSxxl() {
		return sxxl;
	}
	public void setSxxl(String sxxl) {
		this.sxxl = sxxl;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String getZzyqhfszt() {
		return zzyqhfszt;
	}

	public void setZzyqhfszt(String zzyqhfszt) {
		this.zzyqhfszt = zzyqhfszt;
	}

	public String getHwzbz() {
		return hwzbz;
	}

	public void setHwzbz(String hwzbz) {
		this.hwzbz = hwzbz;
	}

	@Override
	public String toString() {
		return "Register [id=" + id + ", username=" + username + ", password=" + password + ", registertime="
				+ registertime + ", nickname=" + nickname + ", sex=" + sex + ", gzqk=" + gzqk + ", company=" + company
				+ ", title=" + title + ", job=" + job + ", address=" + address + ", postcode=" + postcode
				+ ", officephone=" + officephone + ", fax=" + fax + ", telphone=" + telphone + ", email=" + email
				+ ", sffblw=" + sffblw + ", journalname=" + journalname + ", gjbh=" + gjbh + ", gjtm=" + gjtm
				+ ", gjzt=" + gjzt + ", sfztlw=" + sfztlw + ", sfsqhyfy=" + sfsqhyfy + ", fytm=" + fytm + ", fynrzy="
				+ fynrzy + ", sfzs=" + sfzs + ", zsyq=" + zsyq + ", zskssj=" + zskssj + ", zsjssj=" + zsjssj
				+ ", invoice=" + invoice + ", zfflag=" + zfflag + ", fptt=" + fptt + ", yqhfszt=" + yqhfszt
				+ ", message=" + message + ", degree=" + degree + ", sfcjsx=" + sfcjsx + ", sxxl=" + sxxl + "usertype="+usertype+"]";
	}
	
}
