package com.meeting.core.filter;

import java.io.IOException;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 2016/9/14 22:40:32
 * @author 白云飞
 *
 */
public class AccessControlFilter implements Filter {
	private boolean isControl = true;

	public void init(FilterConfig filterConfig) throws ServletException {
		String control = filterConfig.getInitParameter("isControl");
		if ("false".equals(control)) {
			isControl = false;
		} else {
			isControl = true;
		}
	}

	@SuppressWarnings("unchecked")
	public void doFilter(ServletRequest servletRequest,
			ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) servletRequest;
		HttpServletResponse resp = (HttpServletResponse) servletResponse;
		HttpSession session = req.getSession(false);
		String path = req.getContextPath();
		if (isControl) {
			String url = getUrl(req);
			if(url.indexOf("//")>=0)
				url = url.replaceFirst("/", "");
			if("/".equalsIgnoreCase(url) || 
					url.indexOf("/chart.do?method=getCombo")>=0 || 
					url.indexOf("/auth.do?method=login")>=0 || 
					url.indexOf("/auth.do?method=logout")>=0 || 
					url.indexOf("/auth.do?method=noauth")>=0 || 
					url.indexOf("/auth.do?method=download")>=0 ||
					url.indexOf("/resource.do")>=0|| 
					url.indexOf("/auth.do?method=forgotPwd")>=0 || 
					url.indexOf("/auth.do?method=resetPwd")>=0 || 
					url.indexOf("/auth.do?method=resetPwdOK")>=0||
					url.indexOf("/auth.do?method=signinByTel")>=0
			){
				chain.doFilter(servletRequest, servletResponse);
				return;
			}
			if (session == null||session.getAttribute("user")==null) {
				resp.sendRedirect(path+"/auth.do?method=logout");
				return;
			}
			// 检查访问地址是否在管理员的权限集中
			Set<String> fiSet = (Set<String>) session
					.getAttribute("auths");
			if (fiSet == null || !fiSet.contains(url)) {
				resp.sendRedirect(path+"/auth.do?method=noauth");
				return;
			}
			chain.doFilter(servletRequest, servletResponse);
			return;
		} else {
			// 用于开发状态
			if (session == null) {
				session = req.getSession(true);
			}
			chain.doFilter(servletRequest, servletResponse);
		}
	}

	private String getUrl(HttpServletRequest req) {
		String url = req.getRequestURI();
		String param = req.getQueryString();
		String context = req.getContextPath();
		if (param!=null) {
			return url.substring(context.length(), url.length())+"?"+param;
		} else {
			return url.substring(context.length(),url.length());
		}
	}

	public void destroy() {
	}
}
