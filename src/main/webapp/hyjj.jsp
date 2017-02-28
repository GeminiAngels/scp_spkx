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
	<h2 style="margin-bottom:30px;"><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/>会议简介</h2>
	<div class="hyjs" style="padding-bottom:50px;">
		<p class="jj"><img src="<%=path%>/static/spkx/images/pic02.png" alt=""/>食品对于人类健康的重要性不言而喻，中华民族自古就有“寓医于食”的传统，“饮食者，人之命脉也”则是明代医药学巨匠李时珍对膳食营养的健康作用所做的高度概括。世界卫生组织（WHO）近年对影响人类健康的众多因素的评估结果也表明：膳食营养因素的影响（13%）仅次于居首位的遗传因素（15%），远高于医疗因素（仅8%）的作用。不断快速发展的食品科学技术极大地促进了食品种类的多样化和营养的全面均衡，不仅带来了食品产业的繁荣，还促进了人类寿命的延长和生活品质的提高。随着新科技革命的蓬勃发展，尤其是在信息技术、生命科学和纳米技术等领域的快速发展，更是促进了食品科学技术的巨大变革，大力推进了先进科学技术在食品产业中的应用。随着中国工业化、城镇化、老龄化进程加快，肥胖、高血压、糖尿病和冠心病等慢性病患病率呈现持续、快速增长的趋势。如何为消费者提供更营养、更健康的食物，成为我国乃至全球关注的重大课题。全球一系列重大食品安全事件的发生，凸显出技术进步和社会发展对食品数量、质量与安全问题的严峻考验，这已关系到人类乃至下一代的健康和安全，保障食品安全已经成为了保护人类生命健康、提高生活质量、促进食品贸易、维护社会和谐发展的重大政策问题，因此食品科学任重而道远，仍将不断上下求索来应对所有的挑战。</p>
		<p class="jj">为进一步推动食品科学的发展，带动食品产业的技术创新，更好的保障人类身体健康和提高生活品质，北京食品科学研究院和中国食品杂志社《食品科学》杂志在成功召开前九届“食品科学国际年会”和两届“食品科学与人类健康国际研讨会”及十余次食品专题研讨会的基础上，藉《Food Science and Human Wellness》杂志创刊六周年之际，将与国际谷物科技学会（ICC）、吉林大学食品科学与工程学院、华美食品学会（CAFS）共同举办“第三届食品科学与人类健康国际研讨会”，会议继续得到美国国际谷物化学家学会（AACCI）及多位国际食品领域著名SCI期刊主编的大力支持。研讨会将就食品生物化学、食品微生物学、营养学、食品免疫学、食品功能成分与活性评价、食品安全与毒理学等食品科学及营养健康方面的重大理论研究展开深入探讨，交流和借鉴国外经验，为广大食品科研工作者和生产者提供新的思路，指明发展方向。</p>
		<p class="jj">本次会议诚挚邀请国内外各大专院校、科研院所、食品企业等单位从事食品科学研究的专家、学者、企业家进行深入交流、成果推广，并为食品企业、仪器商提供展览、展示及寻求科技合作的平台。会期2天，定于2017年8月5日至6日，地点：中国吉林长春。会前在长春组织“第七届食品与生物学科高水平SCI论文撰写与投稿技巧研修班”。</p>
		<p class="jj">审核通过的参会代表论文将优先在《食品科学》《Food Science and Human Wellness》《肉类研究》《乳业科学与技术》四本杂志正刊上发表，欢迎相关专家、学者、企业家参加此次国际研讨会，并踊跃投稿、展览展示。</p>
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