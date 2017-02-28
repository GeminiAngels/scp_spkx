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
	<meta name="description" content="3rd International Symposium of <i>Food Science and Human Wellness</i>">
	<link rel="shortcut icon" href="<%=path%>/static/assets/ico/favicon.ico">
	<title>3rd International Symposium of <i>Food Science and Human Wellness</i></title>
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
<%@include file="/inc/en_headbar.jsp" %>

<div id="contactWrap">
	<div class="overlay">
		<div class="container">
			<div class="row" style="text-align: center">
				<div class="col-sm-3 col-sm-offset-3">
					<br/>
					<a class="btn btn-info btn-lg" href="en_register.jsp?position=contactWrap">register</a><br/><br/>（Please register for the first time）
				</div>
				<div class="col-sm-3">
					<br/>
					<a class="btn btn-success btn-lg" href="en_login.jsp?position=contactWrap">Sign in</a><br/><br/>（Registered representatives please use the email and password login）
				</div>
			</div>
		</div>
	</div>
</div> <!-- /contactWrap -->
<%@include file="/inc/en_footer.jsp"%>

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

		$('.btn-login').off('click').on('click', function (e) {

			var menuBtn = $('.navbar-toggle');
			if (menuBtn.css('display') == 'block')
				$('.navbar-toggle').click();

			var target = $('#contactWrap');
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
		});

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