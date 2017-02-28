package com.meeting.core.bean;


public class Email {
	private int id;
	private String title;
	private String content;
	private String contentHtml;
	private int status;
	private String type;

	public Email() {
	}

	public Email(int id, String title, String content, String contentHtml, int status, String type) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.contentHtml = contentHtml;
		this.status = status;
		this.type = type;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getContentHtml() {
		return contentHtml;
	}

	public void setContentHtml(String contentHtml) {
		this.contentHtml = contentHtml;
	}

	@Override
	public String toString() {
		return "Email{" +
				"id=" + id +
				", title='" + title + '\'' +
				", content='" + content + '\'' +
				", contentHtml='" + contentHtml + '\'' +
				", status=" + status +
				", type=" + type +
				'}';
	}
}
