<%--
  Created by IntelliJ IDEA.
  User: DAISEN
  Date: 2017/3/3
  Time: 2:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath(); %>
<html>
<head>
	<title>Title</title>
</head>
<body>
<script type="application/javascript">
	/**
	 * 设置iframe宽度
	 * @param {} iframeId
	 */
	function iframeAutoHeight(iframeId){
		var ifm= document.getElementById(iframeId);
		var subWeb = document.frames ? document.frames[iframeId].document:ifm.contentDocument;
		if(ifm != null && subWeb != null) {
			ifm.height = subWeb.body.scrollHeight;
		}
	}
</script>
<iframe id="reportArea" name="reportArea" width="100%" frameborder="0" scrolling="no"  src=""
        onload="iframeAutoHeight(this.id)"></iframe>

</body>
<script type="text/javascript" src="<%=path%>/res/asset/js/jquery.min.js"></script>

<script type="application/javascript">
	/**
	 * 初始化
	 */
	$(document).ready(function() {
		var ids = opener.ids;
		var params = '?report=/ewm.raq';
		params += '&ids='+ids;
		url = '<%=path%>/report/reportJsp/report.jsp';
		url += params;
		url+='&timestamp='+Date.parse(new Date());
		$('#reportArea').attr('src',url);
	});






</script>
</html>
