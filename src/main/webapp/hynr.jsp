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
	<h2 style="margin-bottom:30px;"><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/>会议内容</h2>
	<div class="hynr" style="padding-bottom:60px;">
		<div class="left" style="width:580px; height:690px; margin:0 20px 0 0;">
			<h3>会议主题：食品科学与人类健康理论研究</h3>
			<h4 style="font-size:16px;">1） 食品生物化学专题</h4>
			<p class="nw">包括碳水化合物、蛋白质和酶、脂类、核酸、维生素、矿物质、植物化学物等生化与代谢研究，基因工程、细胞工程、酶工程、基因组学、蛋白质组学和代谢组学等与人类健康相关的基础研究。</p>
			<h4 style="font-size:16px;">2） 食品微生物学专题</h4>
			<p class="nw">包括食品微生物生理与遗传、微生物的相互作用、微生物毒素、致病微生物、预测微生物学和微生物风险评估等基础研究。</p>
			<h4 style="font-size:16px;">3） 食品营养与免疫学专题</h4>
			<p class="nw">包括分子营养学和临床营养学、生物活性物的成分及其功能评价、细胞因子、食物过敏、分子免疫学、免疫遗传学等基础研究。</p>
			<h4 style="font-size:16px;">4） 食品安全与毒理学专题</h4>
			<p class="nw">包括食品中风险化合物、重金属等安全检测和毒理学评价，食源性疾病理论研究等。</p>
			<h4 style="font-size:16px;">5） 蛋品加工及营养功能专题</h4>
			<p class="nw">包括蛋品功能成分研究开发、禽蛋制品加工新技术及质量安全等。</p>
		</div>
		<div class="right" style="height:590px;">
			<h3>会议形式</h3>
			<p class="nw">1）邀请国内外知名专家、教授发言<br>
				2）参会代表相关研究成果发言<br>
				3）论文粘贴<br>
				4）参展企业产品展示</p>
			<div class="line01"></div>
			<h3>会议语言</h3>
			<p class="nw">中文+英文+同声传译</p>
			<div class="line01"></div>
			<h3>会议地点</h3>
			<p class="nw">中国  吉林  长春<br>
				会场：长春（详细地点稍后通知）<br>
				住宿：长春（详细地点稍后通知）</p>
		</div>
		<div class="clear"></div>
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