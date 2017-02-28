package com.meeting.core.bean;

/**
 * 2016/9/13 00:46:39
 * @author 白云飞
 *
 */
public class Func {

	private int id;
	private String name;
	private String url;
	private int parentid;
	private int status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getParentid() {
		return parentid;
	}
	public void setParentid(int parentid) {
		this.parentid = parentid;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Func() {
	}
	public Func(int id, String name, String url, int parentid, int status) {
		super();
		this.id = id;
		this.name = name;
		this.url = url;
		this.parentid = parentid;
		this.status = status;
	}
	@Override
	public String toString() {
		return "Func [id=" + id + ", name=" + name + ", url=" + url + ", parentid=" + parentid + ", status=" + status
				+ "]";
	}

}
