package com.meeting.core.bean;

/**
 * Created by 戴森 on 2017/2/22.
 */
public class Mailset {
	private int id;
	private String serverhost;//邮件服务host
	private String senderaddr;//邮件发送者邮箱
	private String sendernick;//邮件发送者昵称
	private String senderuname;//邮件发送者邮箱用户名
	private String senderpwd;//邮件发送者邮箱密钥
	private String mailsubject;//邮件主题
	private int isactive;//状态(0禁用,1启用)

	public Mailset() {
	}

	public Mailset(int id, String serverhost, String senderaddr, String sendernick, String senderuname, String senderpwd, String mailsubject, int isactive) {
		this.id = id;
		this.serverhost = serverhost;
		this.senderaddr = senderaddr;
		this.sendernick = sendernick;
		this.senderuname = senderuname;
		this.senderpwd = senderpwd;
		this.mailsubject = mailsubject;
		this.isactive = isactive;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getServerhost() {
		return serverhost;
	}

	public void setServerhost(String serverhost) {
		this.serverhost = serverhost;
	}

	public String getSenderaddr() {
		return senderaddr;
	}

	public void setSenderaddr(String senderaddr) {
		this.senderaddr = senderaddr;
	}

	public String getSendernick() {
		return sendernick;
	}

	public void setSendernick(String sendernick) {
		this.sendernick = sendernick;
	}

	public String getSenderuname() {
		return senderuname;
	}

	public void setSenderuname(String senderuname) {
		this.senderuname = senderuname;
	}

	public String getSenderpwd() {
		return senderpwd;
	}

	public void setSenderpwd(String senderpwd) {
		this.senderpwd = senderpwd;
	}

	public String getMailsubject() {
		return mailsubject;
	}

	public void setMailsubject(String mailsubject) {
		this.mailsubject = mailsubject;
	}

	public int getIsactive() {
		return isactive;
	}

	public void setIsactive(int isactive) {
		this.isactive = isactive;
	}

	@Override
	public String toString() {
		return "Mailset{" +
				"id=" + id +
				", serverhost='" + serverhost + '\'' +
				", senderaddr='" + senderaddr + '\'' +
				", sendernick='" + sendernick + '\'' +
				", senderuname='" + senderuname + '\'' +
				", senderpwd='" + senderpwd + '\'' +
				", mailsubject='" + mailsubject + '\'' +
				", isactive=" + isactive +
				'}';
	}
}
