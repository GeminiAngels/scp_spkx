<%@page contentType="text/html;charset=utf-8" language="java" %>
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
	<meta name="description" content="第三届食品科学与人类健康国际研讨会_食品科学网">
	<meta name="author" content="北京国科智地科技有限公司">
	<link rel="shortcut icon" href="<%=path%>/static/assets/ico/favicon.ico">

	<title>第三届食品科学与人类健康国际研讨会_食品科学网</title>

	<!-- Bootstrap core CSS -->
	<link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=path%>/static/spkx/css/style.css"/>

	<!-- Custom styles for this template -->
	<link href="<%=path%>/static/css/font-awesome.min.css" rel="stylesheet">

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>

<body>
<!-- 头部模块 -->
<%@include file="/inc/headbar.jsp" %>

<div class="main_bg">
	<div class="main">
		<h2><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/><a href="#">报名&签到</a></h2>
		<div class="fyhk">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12">
						<p style="text-align:center;">
							<img src="<%=path%>/static/spkx/images/qrcode.png" width="280" height="280"/>
							<br/>会议签到二维码
						</p>
					</div>
				</div>
				<div class="row" style="text-align: center">
					<div class="col-sm-3 col-sm-offset-3">
						<br/>
						<a class="btn btn-info btn-lg" href="register.jsp?position=contactWrap">注　册</a><br/><br/>（首次报名请先注册）
					</div>
					<div class="col-sm-3">
						<br/>
						<a class="btn btn-success btn-lg" href="login.jsp?position=contactWrap">登　录</a><br/><br/>（已经注册代表请使用邮箱和密码登录）
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="/inc/footer.jsp"%>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/interface/RegisterService.js'></script>
<script src="<%=path%>/static/js/jquery-1.11.1.min.js"></script>
<script src="<%=path%>/static/js/bootstrap.min.js"></script>
<script src="<%=path%>/static/spkx/js/biz.js"></script>

<script type="text/javascript">
	$(document).ready(function () {

		$('a[href*=#]:not([href=#])').click(function () {
			if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {
				var target = $(this.hash);
				target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
				if ($(window).width() < 768) {
					if (target.length) {
						$('html,body').animate({
							scrollTop: target.offset().top - $('.navbar-header').outerHeight(true) + 1
						}, 1000);
						return false;
					}
				}
				else {
					if (target.length) {
						$('html,body').animate({
							scrollTop: target.offset().top - $('.navbar').outerHeight(true) + 1
						}, 1000);
						return false;
					}
				}

			}
		});

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

		$('#toTop').click(function () {
			$('html,body').animate({
				scrollTop: 0
			}, 1000);
		});

		var timer;
		$(window).bind('scroll', function () {
			clearTimeout(timer);
			timer = setTimeout(refresh, 50);
		});
		var refresh = function () {
			if ($(window).scrollTop() > 100) {
				$(".tagline").fadeTo("slow", 0);
			}
			else {
				$(".tagline").fadeTo("slow", 1);
			}
		};

		// Mobile Navigation
		$('.nav').find('a').on('click', function () {
			var menuBtn = $('.navbar-toggle');
			if (menuBtn.css('display') == 'block')
				$('.navbar-toggle').click();
		});

	});
</script>
</body>
</html>