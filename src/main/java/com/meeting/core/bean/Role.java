package com.meeting.core.bean;

/**
 * 2016/9/13 00:28:43
 * @author 白云飞
 *
 */
public class Role {
	private int id;
	private String name;
	private String code;
	private int status;
	public Role() {
		super();
	}
	public Role(int id, String name, String code,int status) {
		super();
		this.id = id;
		this.name = name;
		this.code = code;
		this.status = status;
	}
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Role [id=" + id + ", name=" + name + ", code=" + code + ", status=" + status + "]";
	}
}
