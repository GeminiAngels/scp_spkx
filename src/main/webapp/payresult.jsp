<%@page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
		<meta name="description" content="地理科研写作高级研修班">
		<meta name="author" content="北京国科智地科技有限公司">
		<link rel="shortcut icon" href="<%=path%>/static/assets/ico/favicon.ico">

		<title>地理科研写作高级研修班（第一期）</title>
		<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=path%>/dwr/interface/OrderService.js'></script>
    	<script src="<%=path%>/static/js/jquery-1.11.1.min.js"></script>
	
		<script type="text/javascript">
			$(document).ready(function() {
				var order = {
					orderregisterid : '${param["rid"]}',
					orderno : '${param["ono"]}'
				}

				if(order.orderno&&order.orderregisterid){
					OrderService.updateOrderStatus(order,function(ret){
						window.location.href = 'WritingWorkshop201701.jsp?position=contactWrap';
					});
				} else {
					alert('对不起，订单不存在！');
					window.location.href = 'WritingWorkshop201701.jsp?position=contactWrap';
				}

				//预留外部测试接口：将参数重定向给外部链接
				//window.location.href = 'http://[ip]:[port]/[appname]/[folder]?[params]';
			});
		</script>
	</head>

	<body>
 	</body>
</html>