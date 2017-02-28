<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta charset="utf-8">
    <title>e-Sciences+会议平台-后台登录</title>
    <meta name="keywords" content="">
    <meta name="Description" content="">
    <link rel="shortcut icon" href="<%=path%>/static/assets/ico/favicon.ico">
	<link rel="stylesheet" href="<%=path%>/res/css/login.css">
	<style type="text/css">
		.alert {
		  padding: 15px;
		  margin-bottom: 20px;
		  border: 1px solid transparent;
		  border-radius: 4px;
		}
		.alert h4 {
		  margin-top: 0;
		  color: inherit;
		}
		.alert .alert-link {
		  font-weight: bold;
		}
		.alert > p,
		.alert > ul {
		  margin-bottom: 0;
		}
		.alert > p + p {
		  margin-top: 5px;
		}
		.alert-dismissable {
		  padding-right: 35px;
		}
		.alert-dismissable .close {
		  position: relative;
		  top: -2px;
		  right: -21px;
		  color: inherit;
		}
		.alert-info {
		  color: #31708f;
		  background-color: #d9edf7;
		  border-color: #bce8f1;
		}
	</style>
</head>
<body style="background-color:#d3d3d3;">
<div class="ct-frontpage-wrapper login-page" style="margin-top:60px;">
  <div class="container">
    <div class="login-content">
      <form action="<%=path%>/auth.do?method=login" method="post" accept-charset="utf-8" id="loginForm">
            <h3 class="text-center">帐号登录</h3>
      <ul class="unstyled">
        <li class="clearfix">
          <label class="ct-login-form-label" for="username" style="display: block;">请输入您邮箱名称</label>
          <input type="text" tabindex="1" class="text" name="username" id="username" autocomplete="off" value="${user.name}">
        </li>
        <li class="clearfix">
          <label class="ct-login-form-label" for="password" style="display: block;">请输入您的密码</label>
          <input type="password" tabindex="2" class="text" name="password" id="password" value="">
        </li>
        <li class="clearfix">
          <a href="http://www.esciences.com.cn/scmp/conference.html" target="_blank" class="pull-right" style="color:#333;line-height: 18px;">系统简介</a>
          <label for="longstay" class="checkbox" style="color:#333"><input type="checkbox" id="longstay" name="longstay" value="1"> 记住密码</label>
        </li>
        <li class="clearfix">
        	<div style="display:none" id="login-msg" class="alert alert-warning alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  <strong>提示!</strong> ${errormsg} 
			</div>
          	<input id="loginbtn" type="submit" class="btn btn-block btn-warning btn-large" value="登录">
        </li>
      </ul>
      </form>
    </div>
  </div>
</div>
</body>
<script type="text/javascript" src="<%=path%>/res/asset/js/jquery.min.js"></script>
<script src="<%=path%>/res/asset/js/bootstrap.min.js"></script>
<script type="text/javascript">
	(function($){
		if($('#username').val()){
			$('#username').siblings('label').css('display','none');
		}
		$('#username').focus(function(){
			$(this).siblings('label').css('display','none');
		});
		$('#username').blur(function(){
			if(!$(this).val())
				$(this).siblings('label').css('display','block');
		});
		$('#password').focus(function(){
			$(this).siblings('label').css('display','none');
		});
		$('#password').blur(function(){
			if(!$(this).val())
				$(this).siblings('label').css('display','block');
		});
		var errormsg = '${errormsg}';
		if(errormsg){
			$('#login-msg').css('display','block');
		}
	})(jQuery);
</script>
</html>