package com.meeting.core.bean;

import java.util.Date;

/**
 * 文件表-比如论文
 * @author 白云飞
 *
 */
public class Resources {
	private int id;
	private Date uploadtime;
	private String filename;
	private String type;
	private int status;
	private String category;
	private String comments;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "Resources [id=" + id + ", uploadtime=" + uploadtime + ", filename=" + filename + ", type=" + type
				+ ", status=" + status + ", category=" + category + ", comments=" + comments + "]";
	}
}
