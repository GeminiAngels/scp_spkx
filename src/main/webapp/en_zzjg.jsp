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
	<title>3rd International Symposium of <i>Food Science and Human Wellness</i></title>
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
<%@include file="/inc/en_headbar.jsp" %>

<div class="main">
	<h2 style="margin-bottom:30px;"><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/>Organizers</h2>
	<div class="zzjgbox">
		<ul class="abdtbox">
			<li class="left">Organizers</li>
			<li class="right"><div class="ico"></div><p>International Association for Cereal Science and Technology (ICC)<br>
				Beijing Academy of Food Sciences (BAFS), China<br>
				<i>FOOD SCIENCE</i> Editorial Department (FSED), China Food Publishing Co., China<br>
				<i>Food Science and Human Wellness</i> Editorial Department, China Food Publishing Co., China
			</p><div class="jx"></div></li>
			<div class="clear"></div>
		</ul>
		<ul class="abdtbox">
			<li class="left">Supporting Sponsors</li>
			<li class="right"><div class="ico"></div>
				<p>American Association of Cereal Chemists International</i> (AACC International)<br>
					<i>Journal of Food Science</i> (Indexed by SCI)<br>
					<i>Journal of Agricultural and Food Chemistry</i></i> (Indexed by SCI)<br>
					<i>Food and Bioprocess Technology</i> (Indexed by SCI)<br>
					<i>Journal of Food and Drug Analysis</i> (Indexed by SCI)<br>
					<i>Journal of Functional Foods</i> (Indexed by SCI)<br>
					<i>Food Chemistry</i> (Indexed by SCI)</p><div class="jx"></div></li>
			<div class="clear"></div>
		</ul>
		<ul class="abdtbox">
			<li class="left">Co-organizers</li>
			<li class="right"><div class="ico"></div>
				<p>College of Food Science and Engineering, Jilin University, China<br>
					The Chinese American Food Society (CAFS), USA</p><div class="jx"></div></li>
			<div class="clear"></div>
		</ul>
		<ul class="abdtbox">
			<li class="left">Financial Sponsors</li>
			<li class="right"><div class="ico"></div><p>Beijing Ensoul Tech. Co., Ltd., China</p><div class="jx"></div></li>
			<div class="clear"></div>
		</ul>
	</div>
</div>
<%@include file="/inc/en_footer.jsp"%>
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