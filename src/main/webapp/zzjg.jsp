<%@page contentType="text/html;charset=utf-8" language="java"%>
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
	<link rel="shortcut icon" href="<%=path%>/static/assets/ico/favicon.ico">
	<title>第三届食品科学与人类健康国际研讨会_食品科学网</title>
	<link rel="stylesheet" type="text/css" href="<%=path%>/static/spkx/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/static/spkx/css/style.css" />

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
	<h2 style="margin-bottom:30px;"><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/>组织机构</h2>
	<div class="zzjgbox">
		<ul class="abdtbox">
			<li class="left">主办单位</li>
			<li class="right"><div class="ico"></div><p>北京食品科学研究院<br>
				中国食品杂志社《食品科学》杂志<br>
				中国食品杂志社《Food Science and Human Wellness》杂志<br>
				国际谷物科技学会（ICC）</p><div class="jx"></div></li>
			<div class="clear"></div>
		</ul>
		<ul class="abdtbox">
			<li class="left">共同主办</li>
			<li class="right"><div class="ico"></div>
				<p>吉林大学食品科学与工程学院<br>
					华美食品学会（CAFS）</p><div class="jx"></div></li>
			<div class="clear"></div>
		</ul>
		<ul class="abdtbox">
			<li class="left">支持协办</li>
			<li class="right"><div class="ico"></div>
				<p>美国国际谷物化学家学会（AACCI）<br>
					《Journal of Food Science》杂志（SCI收录）<br>
					《Journal of Agricultural and Food Chemistry》杂志（SCI收录）<br>
					《Food and Bioprocess Technology》杂志（SCI收录）<br>
					《Journal of Functional Foods》杂志（SCI收录）<br>
					《Food Chemistry》杂志（SCI收录）<br>
					《Journal of Food and Drug Analysis》杂志（SCI收录）</p><div class="jx"></div></li>
			<div class="clear"></div>
		</ul>
		<ul class="abdtbox">
			<li class="left">赞助单位</li>
			<li class="right"><div class="ico"></div><p>北京盈盛恒泰科技有限公司</p><div class="jx"></div></li>
			<div class="clear"></div>
		</ul>
	</div>
</div>
<%@include file="/inc/footer.jsp"%>
<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/interface/RegisterService.js'></script>
<c:if test="${not empty register}">
	<script type='text/javascript' src='<%=path%>/dwr/interface/OrderService.js'></script>
</c:if>
<script src="<%=path%>/static/spkx/js/biz.js"></script>
<script src="<%=path%>/static/js/jquery.countdown.js"></script>
<script type="text/javascript">
	$(function(){
		var hash = '${param["position"]}';
		if(hash){
			var target = $('#'+hash);
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
		//注册倒计时插件
		$('time').countDown({
			with_separators: false
		});
	});
</script>
</body>
</html>