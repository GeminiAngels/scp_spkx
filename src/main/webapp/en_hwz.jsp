<%@page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>3rd International Symposium of <i>Food Science and Human Wellness</i></title>
	<link rel="stylesheet" type="text/css" href="<%=path%>/static/spkx/css/style.css"/>
	<script src="<%=path%>/static/spkx/js/jquery.min.js" type="text/javascript"></script>
	<script src="<%=path%>/static/spkx/js/tab.js" type="text/javascript"></script>
	<script src="<%=path%>/static/spkx/js/bootstrap.min.js"></script>
</head>

<body>
<!-- 头部模块 -->
<%@include file="/inc/en_headbar.jsp" %>
<div class="main">
    <h2 style="margin-bottom:30px;"><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/>The Conference Secretary</h2>
    <div class="fyhk" style="padding-bottom:50px;">
        <h3>The Conference Secretary</h3>
        <p style="line-height:36px;">Ms. Zhang Rui-mei, Ms.Wu Nan<br>
Edititor, Conference and Training Department, <i>FOOD SCIENCE</i> Journal, China Food Publishing Co.,<br>
Address: No.4 Toutiao, Luchang Street, Xicheng District, Beijing, China<br>
Tel:+86 10 83155446-8030、8032, Fax: +86 10 83155436, E-mail: chnfood@163.com<br>
Website: http://www.chnfood.cn</p>
    </div>
  </div>
<%@include file="/inc/footer.jsp"%>
</body>
</html>
