<%@page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="cn.beecloud.BCEumeration.PAY_CHANNEL"%>
<%@page import="cn.beecloud.BeeCloud"%>
<%@page import="cn.beecloud.BCPay"%>
<%@page import="cn.beecloud.bean.BCOrder"%>
<%@page import="cn.beecloud.bean.BCException"%>
<%@ page import="java.util.*" %>

<%
	request.setCharacterEncoding("utf-8");
	String orderno = request.getParameter("orderno");
	String ordertitle = request.getParameter("ordertitle");
	int ordermoney = Integer.parseInt(request.getParameter("ordermoney"))*100;
	String registerid = request.getParameter("rid");
	String qd = request.getParameter("qd");
	
	String appId = "704d3f1f-adf3-4d3b-976e-2791d68d40ed";
	String testSecret = null;
	String appSecret = "b43a628a-f1ce-4735-9ad3-5f82d139e6f0";
	String masterSecret = "96c7856e-af14-4b58-b62f-2707c23f392a";
	//LIVE模式使用方法
	BeeCloud.registerApp(appId, testSecret, appSecret, masterSecret);  
	//LIVE模式中的testSecret可为null  
	//默认开启LIVE模式
	
	//测试模式使用方法
	//BeeCloud.registerApp(appId, testSecret, null, null);   
	//测试模式中的appSecret、masterSecret可为null  
	//设置sandbox属性为true，开启测试模式  
	//BeeCloud.setSandbox(true);
	
	
	Map<String, Object> optional = new HashMap<String, Object>();
    optional.put("rid", registerid);
    optional.put("register", session.getAttribute("register"));

	//支付宝收银台收款代码示例：
	
	BCOrder bcOrder = new BCOrder("ALI_WAP".equals(qd)?PAY_CHANNEL.ALI_WAP:PAY_CHANNEL.ALI_WEB, ordermoney, orderno, "会议费支付宝订单");//设定订单信息
	bcOrder.setBillTimeout(360);//设置订单超时时间
	bcOrder.setReturnUrl("http://www.egeoscience.com.cn/scppay/payresult.jsp?ono="+orderno+"&rid="+registerid);//设置return url
	//bcOrder.setReturnUrl("http://192.168.0.18/scp_pay/payresult.jsp?ono="+orderno+"&rid="+registerid);//设置return url
	bcOrder.setOptional(optional);
	try {
	    bcOrder = BCPay.startBCPay(bcOrder);
	    //out.println(bcOrder.getObjectId());
	    out.println(bcOrder.getHtml()); // 输出支付宝收银台到页面
	} catch (BCException e) {
	    //log.error(e.getMessage(), e);
	    out.println(e.getMessage());
	}
%>