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
	<title>3rd International Symposium of <i>Food Science and Human Wellness</i></title>
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
<%@include file="/inc/en_headbar.jsp" %>
<div class="main">
	<h2><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/><a
			href="#">Symposium Content</a></h2>
	<div class="hynr">
		<div class="left col-sm-9 col-xs-12">
			<h3 style="line-height:30px;">Symposium Theme: Theoretical research on food sciences and human wellness</h3>
			<h4>1) Food biochemistry</h4>
			<p>Include carbohydrates, proteins and enzymes, lipids, nucleic acids, vitamins, minerals, phytochemicals, genomics, genetic/cell/enzymatic engineering, proteomics and metabonomics, etc.</p>
			<h4>2) Food microbiology</h4>
			<p>Include physiology, genetics and behavior of microorganisms, microbial interaction, microbial toxin, food pathogens, biocontrol, predictive microbiology and microbial risk assessment, etc.</p>
			<h4>3)  Food nutriology and immunology</h4>
			<p>Include food nutrition in the molecular level and in clinical studies, bioactive compounds/ingredients and their functional evaluations, cytokines, food allergies, molecular immunology, immunobiology and immunogenetics, etc.</p>
			<h4>4) Food safety and toxicology</h4>
			<p>Include foodborne diseases, hazard analysis and toxicological evaluations, etc.</p>
			<h4>5) Egg processing and nutritional functions</h4>
			<p>Include the research and development of egg functional components, egg products processing new technology and quality safety, etc.</p>
		</div>
		<div class="right col-sm-3 col-xs-12">
			<h3>Conference Styles</h3>
			<p>Delivering academic presentations by
				well-known experts and scholars at home and
				abroad. </p>
			<p>Poster or oral presentation of research
				accomplishments by representative participants.</p>
			<p>Exhibition of instruments and equipment from
				participate enterprises</p>
			<div class="line01"></div>
			<h3>Language</h3>
			<p><i>Chinese + English + simultaneous interpretation</i></p>
		</div>
		<div class="clear"></div>
	</div>
</div>


<%@include file="/inc/en_footer.jsp"%>
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