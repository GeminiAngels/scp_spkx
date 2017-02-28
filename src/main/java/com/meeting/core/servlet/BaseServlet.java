package com.meeting.core.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

/**
 * 2016/9/13 01:10:25
 * 实现MVC分发的统一Servlet
 * @author 白云飞
 *
 */
public class BaseServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@SuppressWarnings("unused")
	private final Logger logger = Logger.getLogger(this.getClass());
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String method = req.getParameter("method");
		if(method==null){
			return;
		}
		try {
			
			//约定优于配置1：通过method参数配合反射机制确定具体调用的子类方法
			Method meth = this.getClass().getMethod(method, HttpServletRequest.class,HttpServletResponse.class);
			String forward = (String)meth.invoke(this,req,resp);
			
			//约定优于配置2：通过redirect:前缀实现页面重定向，通过json:前缀实现json格式数据输出
			String redirect = "redirect:" , jsonmatch = "json:" , forwardctx = "ctx:";
			if(forward == null) {
				return;
			} else if(forward.startsWith(redirect)){
				resp.sendRedirect(forward.substring(redirect.length()));
			} else if(forward.startsWith(jsonmatch)) {
				resp.setContentType("application/json; charset=utf-8");
				PrintWriter out = null;
				try {
				    out = resp.getWriter();
				    out.write(forward.substring(jsonmatch.length()));
				} catch (IOException e) {
				    e.printStackTrace();
				} finally {
				    if (out != null) {
				        out.close();
				    }
				}
			} else if(forward.startsWith(forwardctx)) {
				req.getRequestDispatcher("/"+forward.substring(forwardctx.length())).forward(req, resp);
			} else {
				req.getRequestDispatcher("/WEB-INF/"+forward).forward(req, resp);
			}
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
}
