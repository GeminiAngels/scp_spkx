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
	<meta name="viewport"
	      content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
	<link rel="shortcut icon" href="<%=path%>/static/assets/ico/favicon.ico">
	<title>第三届食品科学与人类健康国际研讨会_食品科学网</title>
	<link rel="stylesheet" type="text/css" href="<%=path%>/static/spkx/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/static/spkx/css/style.css"/>

	<link href="<%=path%>/static/css/font-awesome.min.css" rel="stylesheet">
	<!--    <script src="js/jquery.js" type="text/javascript"></script>-->
	<script src="<%=path%>/static/spkx/js/jquery.min.js" type="text/javascript"></script>
	<script src="<%=path%>/static/spkx/js/tab.js" type="text/javascript"></script>
	<script src="<%=path%>/static/spkx/js/bootstrap.min.js"></script>
</head>

<body>
<!-- 头部模块 -->
<%@include file="/inc/headbar.jsp" %>
<div class="main">
	<h2 style="margin-bottom:30px;"><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/>会议论文</h2>
	<div class="hylw" style="padding-bottom:50px;">
		<h4 style="font-size:16px; line-height:36px;">论文范围及要求</h4>
		<p style="font-size:16px; line-height:36px;">与会议主题相关的学术论文，请严格按照杂志撰稿要求和投稿模板撰写。<br>
			《食品科学》投稿：请登录食品科学网<a href="http://www.chnfood.cn" target="_blank">www.chnfood.cn</a>，从首页采编系统投稿；<br>
			《Food Science and Human Wellness》投稿：请登录网站<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://ees.elsevier.com/fshw/" target="_blank">http://ees.elsevier.com/fshw/</a>投稿；<br>
			《肉类研究》投稿：请登录网站<a href="http://rlyj.cbpt.cnki.net" target="_blank">http://rlyj.cbpt.cnki.net</a>投稿； <br>
			《乳业科学与技术》投稿：请登录网站<a href="http://rykj.cbpt.cnki.net" target="_blank">http://rykj.cbpt.cnki.net</a>投稿。</p>
		<h4 style="font-size:16px; line-height:36px;">论文发表费</h4>
		<p style="font-size:16px; line-height:36px;">审核通过的稿件按书面录用通知缴纳版面费。</p>
		<h4 style="font-size:16px; line-height:36px;">补充说明</h4>
		<p style="font-size:16px; line-height:36px;">投递会议论文的代表，请先将论文通过四本杂志在线采编系统投递并获得稿件编号后，再及时进行会议注册，并将稿件标题、编号填入注册信息中。</p>
	</div>
</div>
<%@include file="/inc/footer.jsp"%>
<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/interface/RegisterService.js'></script>
<c:if test="${not empty register}">
	<script type='text/javascript' src='<%=path%>/dwr/interface/OrderService.js'></script>
</c:if>
<script src="<%=path%>/static/spkx/js/biz.js"></script>
<script type="text/javascript">
	$(function () {
		var hash = '${param["position"]}';
		if (hash) {
			var target = $('#' + hash);
			if ($(window).width() < 768) {
				if (target.length) {
					$('html,body').animate({
						scrollTop: target.offset().top - $('.navbar-header').outerHeight(true) + 1
					}, 1000);
				}
			}
			else {
				if (target.length) {
					$('html,body').animate({
						scrollTop: target.offset().top - $('.navbar').outerHeight(true) + 1
					}, 1000);
				}
			}
		}
	});
</script>
</body>
</html>