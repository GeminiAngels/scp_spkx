<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@include file="/inc/header.jsp"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="e-Sciences+会议平台">
<meta name="author" content="北京国科智地科技有限公司">
<title>e-Sciences+会议平台-报名统计</title>

<link rel="shortcut icon" href="<%=path%>/static/assets/ico/favicon.ico">

<link href="<%=path%>/res/asset/css/font-awesome.min.css"
	rel="stylesheet">
<link href="<%=path%>/res/asset/css/bootstrap.css" rel="stylesheet">
<link href="<%=path%>/res/asset/css/carousel.css" rel="stylesheet">
<link href="<%=path%>/res/asset/css/echartsHome.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=path%>/res/css/base.css">
<style type="text/css">
body {
	background-color: #fff;
}
.affix {
	width: 160px;
}

.affix li {
	list-style-type: none;
	height: 35px;
	line-height: 35px;
	vertical-align: middle;
}

ul.slides li {
	width: 33.3%;
	overflow: hidden;
	float: left;
	border: 0px solid #ccc;
	margin: 15px 0;
	list-style-type: none;
	position: relative;
}

ul.slides li a {
	padding: 5px;
	display: block;
}

ul.slides li a strong {
	font-size: 15px;
	color: #1e90ff;
}

ul.slides li a:hover {
	background-color: #eee;
	text-decoration: none;
}

ul.slides li img {
	width: 60%;
}

ul.slides li span {
	color: #666;
	width: 36%;
	vertical-align: top;
	display: inline-block;
	*zoom: 1;
}

.col-md-10 h3 {
	clear: both;
	margin: 10px 0;
	padding-bottom: 10px;
	border-bottom: 1px solid #ccc;
}

.col-md-10 h3 a {
	display: inline-block;
	*zoom: 1;
	padding-top: 63px;
}

#chartsTypeNav ul li {
	transition: background-color 0.3s;
	-moz-transition: background-color 0.3s;
	-webkit-transition: background-color 0.3s;
	-o-transition: background-color 0.3s;
	padding-left: 10px;
}
</style>
</head>

<body scroll="no">
	<!-- Fixed navbar -->
	<div class="navbar navbar-default navbar-fixed-top" role="navigation"
		id="head"></div>
	<iframe id="reportFrame" src="<%=path%>/report/reportJsp/report.jsp?report=scmp_register" style="width:100%;padding-top: 10px;" frameborder="0"  scrolling="auto"></iframe>
	<!-- /container -->

	<script src="<%=path%>/res/asset/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=path%>/res/asset/js/echartsHome.js"></script>
	<script src="<%=path%>/res/asset/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#reportFrame').attr('height',$(window).height()-$('#head').height()-16);
		});
	</script>
</body>
</html>