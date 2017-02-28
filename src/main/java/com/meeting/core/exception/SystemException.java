package com.meeting.core.exception;

/**
 * 2016/9/14 22:43:52
 * @author 白云飞
 *
 */
@SuppressWarnings("serial")
public class SystemException extends RuntimeException {

	public SystemException() {
		super();
	}

	public SystemException(String arg0, Throwable arg1) {
		super(arg0, arg1);
	}

	public SystemException(String arg0) {
		super(arg0);
	}

	public SystemException(Throwable arg0) {
		super(arg0);
	}
	
}
