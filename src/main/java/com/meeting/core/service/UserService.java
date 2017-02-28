package com.meeting.core.service;

import org.apache.log4j.Logger;

import com.meeting.core.db.DBUtil;

/**
 * 2016/9/14 22:25:23
 * @author 白云飞
 *
 */
public class UserService {
	@SuppressWarnings("unused")
	private final Logger logger = Logger.getLogger(this.getClass());
	@SuppressWarnings("unused")
	private DBUtil db;
	public UserService() {
		db = new DBUtil();
	}
}
