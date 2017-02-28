package com.meeting.core.bean;

/**
 * 2016/9/13 00:42:39
 * @author 白云飞
 *
 */
public class User {
	private int id;
	private String name;
	private String cnname;
	private String password;
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
	public String getCnname() {
		return cnname;
	}
	public void setCnname(String cnname) {
		this.cnname = cnname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public User(int id, String name, String cnname, String password, int status) {
		super();
		this.id = id;
		this.name = name;
		this.cnname = cnname;
		this.password = password;
		this.status = status;
	}
	public User() {
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", cnname=" + cnname + ", password=" + password + ", status="
				+ status + "]";
	}
}
