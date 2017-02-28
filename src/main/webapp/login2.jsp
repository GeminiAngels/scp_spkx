<%@page contentType="text/html;charset=utf-8" language="java"%>
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
			<meta name="description" content="地理科研写作高级研修班">
			<meta name="author" content="北京国科智地科技有限公司">
			<link rel="shortcut icon" href="<%=path%>/static/assets/ico/favicon.ico">

			<title>地理科研写作高级研修班（第一期）</title>

			<!-- Bootstrap core CSS -->
			<link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">

			<!-- Custom styles for this template -->
			<link href="<%=path%>/static/css/custom.css" rel="stylesheet">
			<link href="<%=path%>/static/css/flexslider.css" rel="stylesheet">
			<link href="<%=path%>/static/css/font-awesome.min.css" rel="stylesheet">
			
			<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
			<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
			<![endif]-->
		</head>

		<body>
			<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#topWrap">
							<span class="fa-stack fa-lg">
								<i class="fa fa-circle fa-stack-2x"></i>
								<i class="fa fa-cloud fa-stack-1x fa-inverse"></i>
							</span>
							e-Sciences+<span class="title"> 会议平台</span>
						</a>
					</div>
					<div class="collapse navbar-collapse appiNav">
						<ul class="nav navbar-nav">
							<li><a href="WritingWorkshop201701.jsp?position=productWrap">会议简介</a></li>
							<li><a href="WritingWorkshop201701.jsp?position=yxnrWrap">研修内容</a></li>
							<li><a href="WritingWorkshop201701.jsp?position=zhuanjiaWrap">授课专家</a></li>
							<li><a href="WritingWorkshop201701.jsp?position=contactWrap">我要报名</a></li>
							<li style="margin-left: 20px;padding-top:23px;">
								<c:if test="${not empty register}">
									<button class="btn btn-default btn-showinfo">欢迎您，${register.nickname}</button> <button class="btn btn-default btn-logout">安全退出</button>
								</c:if>
								<c:if test="${empty register}">
									<button class="btn btn-default btn-login">登录/支付</button> <button class="btn btn-default btn-register">报名注册</button>
								</c:if>
							</li>
						</ul>
					</div><!--/.nav-collapse -->
				</div>
			</div>
	
			<div id="topWrap" class="jumbotron">
			<div class="container">
				<div class="col-md-12 jumboText">
					<h1 class="hidden-xs">地理科研写作高级研修班（第一期）</h1>
					<!--<h2 class="hidden-xs">专业期刊集群服务平台：挑战 • 机遇 • 路径</h2>-->
					<a class="btn btn-lg btn-success actionBtn" href="#contactWrap"><i class="fa fa-edit fa-4x pull-left"></i><span class="line1">填写您的个人信息</span><br/><span class="line2">现在登录</span></a>
				</div>
				<p>&nbsp;</p>
			</div>
			</div>

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
							<label class="screen-reader-text">Email：</label>
								<input type="text" name="email" id="email" value="" class="form-control" autocomplete="off" placeholder="请输入报名时预留的邮箱" />
							</div>
						</div>

						<div class="col-sm-8 col-sm-offset-2">
							<div class="inputContainer">
							<label class="screen-reader-text">密码：</label>
								<input type="password" name="password" id="password" value="" class="form-control" autocomplete="off" placeholder="请输入密码" />
							</div>
						</div>

						<div class="col-sm-8 col-sm-offset-2">
							<a href="loginWithoutPwd.jsp">已报名但未设置密码会员登录入口</a>
							<button name="submit" type="button" class="btn btn-primary btn-lg btn-loginsubmit">登录</button>
						</div>

						</form>
					</div>
			</div>
		</div>
	</div> <!-- /contactWrap -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-xs-12 text-center">
					<p><a target="_blank" href="http://www.esciences.com.cn/"> 北京国科智地科技有限公司 </a> 技术支持。
						<a style="text-transform: none" href="<%=path%>/auth.do?method=logout" target="_blank" title="后台管理">
							<span class="fa-stack fa-lg">
								<i class="fa fa-circle fa-stack-2x"></i>
								<i class="fa fa-list fa-stack-1x fa-inverse"></i>
							</span>
						</a>
					</p>
				</div>
			</div>
		</div>
	</footer>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
	<script type='text/javascript' src='<%=path%>/dwr/interface/RegisterService.js'></script>
    <script src="<%=path%>/static/js/jquery-1.11.1.min.js"></script>
    <script src="<%=path%>/static/js/bootstrap.min.js"></script>
    <script src="<%=path%>/static/js/flexslider.js"></script>
	
<script type="text/javascript">
$(document).ready(function() {

	$('.btn-login').off('click').on('click',function(e){

		var menuBtn = $('.navbar-toggle');
		if(menuBtn.css('display')=='block')
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

	$('.btn-register').off('click').on('click',function(e){
		window.location.href = 'WritingWorkshop201701.jsp?position=contactWrap';
	});

	$('.btn-loginsubmit').off('click').on('click',function(e){
		var register = {
			email:$('#email').val(),
			password:$('#password').val(),
		}
		RegisterService.login(register,function(msg){
			if(!msg){
				window.location.href = 'index.jsp';
			} else {
				alert(msg);
			}
		});
	});

	$('a[href*=#]:not([href=#])').click(function() {
		if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') || location.hostname == this.hostname) {
			var target = $(this.hash);
			target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
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
	
	$('#toTop').click(function() {
		$('html,body').animate({
			scrollTop: 0
		}, 1000);
	});
	
	var timer;
    $(window).bind('scroll',function () {
        clearTimeout(timer);
        timer = setTimeout( refresh , 50 );
    });
    var refresh = function () {
		if ($(window).scrollTop()>100) {
			$(".tagline").fadeTo( "slow", 0 );
		}
		else {
			$(".tagline").fadeTo( "slow", 1 );
		}
    };

    // Mobile Navigation
	$('.nav').find('a').on('click', function() {
		var menuBtn = $('.navbar-toggle');
		if(menuBtn.css('display')=='block')
			$('.navbar-toggle').click();
	});
		
});
</script>
  </body>
</html>