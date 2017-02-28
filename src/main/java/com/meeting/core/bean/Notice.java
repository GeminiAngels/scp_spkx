package com.meeting.core.bean;

/**
 * Created by 戴森 on 2017/2/21.
 */
public class Notice {
	private int id;
	private String title;
	private String content;
	private String contentHtml;
	private int status;

	public Notice(int id, String title, String content, String contentHtml, int status) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.contentHtml = contentHtml;
		this.status = status;
	}

	public Notice() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getContentHtml() {
		return contentHtml;
	}

	public void setContentHtml(String contentHtml) {
		this.contentHtml = contentHtml;
	}

	@Override
	public String toString() {
		return "Notice{" +
				"id=" + id +
				", title='" + title + '\'' +
				", content='" + content + '\'' +
				", contentHtml='" + contentHtml + '\'' +
				", status=" + status +
				'}';
	}
}
