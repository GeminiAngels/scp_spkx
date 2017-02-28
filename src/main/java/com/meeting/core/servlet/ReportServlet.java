package com.meeting.core.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

/**
 * 2016/9/13 01:40:53
 * @author 白云飞
 *
 */
public class ReportServlet extends BaseServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@SuppressWarnings("unused")
	private final Logger logger = Logger.getLogger(this.getClass());
	
	/**
	 * charts
	 * @param req
	 * @param resp
	 * @return
	 */
	public String chart(HttpServletRequest req , HttpServletResponse resp){
		return "index.jsp";
	}
	
	public String report(HttpServletRequest req , HttpServletResponse resp){
		return "report.jsp";
	}
	
}
