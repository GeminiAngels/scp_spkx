<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>
<%
	String path = request.getContextPath();
	String report = request.getParameter( "report" );
	StringBuffer param=new StringBuffer();

	//保证报表名称的完整性
	int iTmp = 0;
	if( (iTmp = report.lastIndexOf(".raq")) <= 0 ){
		report = report + ".raq";
		iTmp = 0;
	}
	
	Enumeration paramNames = request.getParameterNames();
	if(paramNames!=null){
		while(paramNames.hasMoreElements()){
			String paramName = (String) paramNames.nextElement();
			String paramValue=request.getParameter(paramName);
			if(paramValue!=null){
				//把参数拼成name=value;name2=value2;.....的形式
				param.append(paramName).append("=").append(paramValue).append(";");
			}
		}
	}
%>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="shortcut icon" href="<%=path%>/static/assets/ico/favicon.ico">

	<title>E-science 会议平台-报名统计表</title>
</head>
<body scroll="no" style="margin: 0">
<div id="paramsArea" style="width:100%">
<jsp:include page="toolbar.jsp" flush="false" />
</div>
<div id="reportArea" align="center" style="width:100%;">
	<report:html name="report1" reportFileName="<%=report%>"
		funcBarLocation=""
		needPageMark="yes"
		needDirectPrint="yes"
		generateParamForm="no"
		needLinkStyle="yes"
		params="<%=param.toString()%>"
		width="-1"
		saveAsName="报名表"
		exceptionPage="/report/reportJsp/myError2.jsp"
	/>
</div>
<script src="<%=path%>/static/js/jquery-1.11.1.min.js"></script>
<script language="javascript">
	$(function(){
		$('#reportArea').height(function(){
			return $(this).parent().height()-$('#paramsArea').height();
		});

		//设置分页显示值
		$('#t_page_span').html(report1_getTotalPage());
		$('#c_page_span').html(report1_getCurrPage());

		// 这三行代码处理快逸免费字样
		var divs = $('#reportArea').find('div');
		if(divs.length>0)divs[divs.length-1].innerHTML = '';
		var tds = $('#reportArea').find('td').attr('onmouseover','');

		var noToolBar = '${noToolBar}';
		if(noToolBar)
			$('#paramsArea').css('display','none');
		if(window.parent){
			if(window.parent.callbackToReport)window.parent.callbackToReport();
		}
	});

	var reportParamsId = document.all.reportParamsId.value;
	var cachedId = document.all.report1_cachedId.value;
</script>
</body>
</html>
