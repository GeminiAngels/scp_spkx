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
	<meta name="description" content="第三届食品科学与人类健康国际研讨会_食品科学网">
	<meta name="author" content="北京国科智地科技有限公司">
	<link rel="shortcut icon" href="<%=path%>/static/assets/ico/favicon.ico">

	<title>第三届食品科学与人类健康国际研讨会_食品科学网</title>
	
	<!-- Bootstrap core CSS -->
	<link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=path%>/static/spkx/css/style.css" />

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
	<div id="contactWrap">
		<div class="overlay">
			<div class="container">
				<div class="row">
						<div class="col-xs-12">
						<h2 class="sectionTitle">安全中心</h2>
					</div>
				</div>
				<div class="row">
					<form id="resetPwdForm" action="<%=path%>/auth.do?method=resetPwdOK" method="post">
					<input type="hidden" name="regid" value="${regid}" />
					<div class="col-sm-8 col-sm-offset-2">
						<div class="alert alert-warning" id="errorMsg">请重置您的服务密码，并妥善保管</div>
						<div class="inputContainer">
							<label>注册邮箱：</label>
							<input type="text" name="regemail" id="reg_email" value="${regemail}" class="form-control" disabled/>
							
						</div>
					</div>
					<div class="col-sm-8 col-sm-offset-2">
						<div class="inputContainer">
							<label>新密码：</label>
							<input type="password" name="regpwd" id="login_password" value="" class="form-control" autocomplete="off" placeholder="请输入新密码"/>
						</div>
					</div>
					<div class="col-sm-8 col-sm-offset-2">
						<div class="inputContainer">
							<label>确认密码：</label>
							<input type="password" name="reregpwd" id="login_repassword" value="" class="form-control" autocomplete="off" placeholder="请再次输入新密码"/>
						</div>
					</div>
					<div class="col-sm-8 col-sm-offset-2">
		        		<button id="btn-resetpwd" type="submit" class="btn btn-primary btn-lg">重置密码</button>
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
    <script src="<%=path%>/static/js/jquery-1.11.1.min.js"></script>
    <script src="<%=path%>/static/js/bootstrap.min.js"></script>
    <script src="<%=path%>/static/spkx/js/biz.js"></script>
	
<script type="text/javascript">
$(document).ready(function() {
	$('.btn-login').off('click').on('click',function(e){
		window.location.href = 'login.jsp?position=contactWrap';
	});

	$('#btn-resetpwd').off('click').on('click',function(e){
		if(!$('#login_password').val()){
			$('#errorMsg').html('请输入新密码！');
			return false;
		}
		if(!$('#login_repassword').val()){
			$('#errorMsg').html('请输入确认密码！');
			return false;
		}
		if($('#login_password').val()!=$('#login_repassword').val()){
			$('#errorMsg').html('两次密码输入不一致！');
			return false;
		} else {
			$('#resetPwdForm').submit();
		}
	});
});
</script>
</body>
</html>