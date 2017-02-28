package com.meeting.core.bean;

import java.util.Date;

/**
 * 文件表-比如论文
 * @author 白云飞
 *
 */
public class Thesis {
	private int id;
	private String registerid;
	private String registeremail;
	private Date uploadtime;
	private String filename;
	private String type;
	private int status;
	private String comments;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRegisterid() {
		return registerid;
	}
	public void setRegisterid(String registerid) {
		this.registerid = registerid;
	}
	public String getRegisteremail() {
		return registeremail;
	}
	public void setRegisteremail(String registeremail) {
		this.registeremail = registeremail;
	}
	public Date getUploadtime() {
		return uploadtime;
	}
	public void setUploadtime(Date uploadtime) {
		this.uploadtime = uploadtime;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Files [id=" + id + ", registerid=" + registerid + ", registeremail=" + registeremail + ", uploadtime="
				+ uploadtime + ", filename=" + filename + ", type=" + type + ", status=" + status + ", comments="
				+ comments + "]";
	}
}
