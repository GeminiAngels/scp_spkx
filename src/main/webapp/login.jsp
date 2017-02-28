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
	<script src="<%=path%>/static/js/jquery-1.11.1.min.js"></script>
	<script src="<%=path%>/static/js/bootstrap.min.js"></script>
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>

<body>
<!-- 头部模块 -->
<%@include file="/inc/headbar.jsp" %>

<div id="contactWrap">
	<div class="overlay">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<h2 class="sectionTitle">用户登录</h2>
				</div>
			</div>
			<div class="row">
				<form id="loginForm">
					<div class="col-sm-8 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">邮箱：</label>
							<input type="text" name="email" id="email" value="" class="form-control" autocomplete="off"
							       placeholder="请输入注册时填写的邮箱"/>
						</div>
					</div>

					<div class="col-sm-8 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">密码：</label>
							<input type="password" name="password" id="password" value="" class="form-control"
							       autocomplete="off" placeholder="请输入密码" />
						</div>
					</div>

					<div class="col-sm-8 col-sm-offset-2">
						<a href="loginWithoutPwd.jsp">已报名但未设置密码会员登录入口</a>
						<a class="pull-right" href="forgotPwd.jsp">忘记密码？</a>
						<button name="submit" type="button" class="btn btn-primary btn-lg btn-loginsubmit">登录</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div> <!-- /contactWrap -->
<%@include file="/inc/footer.jsp"%>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/interface/RegisterService.js'></script>


<script src="<%=path%>/res/js/jquery.inputmask.bundle.js"></script>
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

		$('.btn-loginsubmit').off('click').on('click', function (e) {
			if (!isEmail($('#email').val())) {
				alert("邮件格式不正确!");
				return;
			}
			var register = {
				email: $('#email').val(),
				password: $('#password').val()
			};
			RegisterService.login(register, function (msg) {
				if (!msg) {
					window.location.href = 'index.jsp?position=register-pay';
				} else {
					alert(msg);
				}
			});
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

	function isEmail(strEmail) {
		if (strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1)
			return true;
		else {
			return false;
		}
	}

	$('#password').keydown(function(e){
		var curKey = e.which;
		if(curKey == 13){
			$("button[name=submit]").click();
			return false;
		}
	});
</script>
</body>
</html>