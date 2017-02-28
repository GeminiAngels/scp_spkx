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
	<h2 style="margin-bottom:30px;"><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/>报名方式</h2>
	<div class="bmfs" style="padding-bottom:50px;">
		<h3>1、网上报名</h3>
		<p style="font-size:16px; line-height:36px;">1）手机微信扫描下方二维码报名</p>
		<div class="ewm"><img src="<%=path%>/static/spkx/images/ewm01.png"></div>
		<p style="font-size:16px; line-height:36px;">登录我刊网站<a href="http://www.chnfood.cn" target="_blank">www.chnfood.cn</a>，点击进入会议主页进行网上报名。</p>
		<h3>2、回执报名</h3>
		<p style="font-size:16px; line-height:36px;">填写附页的<span><a href="<%=path%>/static/spkx/down/第三届食品科学与人类健康国际研讨会参会回执.doc" target="_blank">参会回执</a></span>并发送E-mail至chnfood@163.com或传真至010-83155436均可。该回执电子版也可以从我刊网站<a href="http://www.chnfood.cn" target="_blank">www.chnfood.cn</a> 的会议主页上下载。</p>
		<p style="font-size:16px; line-height:36px;">两种报名方式采用其中一种即可，不需重复报名，推荐采用微信及网上报名方式。<br>
			会务组收到报名信息后，会尽快向参会代表电子邮箱发送电子版邀请函，同时邮寄纸质版邀请函，请务必准确填写电子邮箱、详细地址及邮编、电话号码。</p>
		<p style="font-size:16px; line-height:36px;">更多会议信息请关注食品科学微博和微信</p>
		<div class="ewm"><img src="<%=path%>/static/spkx/images/ewm02.png"><span style="font-size:16px; line-height:36px;">食品科学微信订阅号</span><img src="<%=path%>/static/spkx/images/ewm01.png"><span style="font-size:16px; line-height:36px;">食品科学微信服务号</span><img src="<%=path%>/static/spkx/images/ewm03.png"><span style="font-size:16px; line-height:36px;">食品科学微博</span></div>
	</div>
</div>
<%@include file="/inc/footer.jsp" %>
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