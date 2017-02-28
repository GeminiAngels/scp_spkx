<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<%@include file="/inc/header.jsp"%>
	<meta charset="UTF-8">
	<title>e-Sciences+会议平台-修改密码</title>
	<link href="<%=path%>/res/asset/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=path%>/res/asset/css/bootstrap.css" rel="stylesheet">
    <link href="<%=path%>/res/asset/css/echartsHome.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=path%>/res/css/base.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/res/lib/zTree/css/zTreeStyle/zTreeStyle.css">
	<link rel="shortcut icon" href="<%=path%>/static/assets/ico/favicon.ico">
</head>
<body>
    <div class="navbar navbar-default navbar-fixed-top" role="navigation" id="head"></div>
	<div class="container-fluid" style="padding-top:10px;">
		<div class="row-fluid">
			<div class="col-md-12">
				<ol class="breadcrumb">
				  <li><a href="#">管理</a></li>
				  <li><a href="#">修改个人密码</a></li>
				</ol>
			</div>
		</div>
		<div class="row-fluid">
			<div class="col-md-12">
				<div class="alert alert-info" id="opt-info">请修改您的密码，并妥善保管</div>
				<form class="form-horizontal" id="form-user">
				  <div class="form-group">
				    <label for="name" class="col-sm-2 control-label">登录帐号</label>
				    <div class="col-sm-10">
				      <input type="hidden" id="id" value="${user.id}">
				      <input type="text" class="form-control" id="name" placeholder="建议英文缩写帐号" readonly="readonly" value="${user.name}">
				    </div>
				  </div>
				  <!-- <div class="form-group">
				    <label for="password" class="col-sm-2 control-label">原密码</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" id="password" placeholder="请输入原始密码">
				    </div>
				  </div> -->
				  <div class="form-group">
				    <label for="password_new" class="col-sm-2 control-label">新密码</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" id="password_new" placeholder="建议数字字母符号混搭">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="password_confirm" class="col-sm-2 control-label">确认密码</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" id="password_confirm" placeholder="请再次输入一次新密码">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-10 col-sm-offset-2">
				      <a type="button" class="btn btn-warning btn-lg" id="btn-pwd-commit" style="width:100%">确定修改密码</a>
				    </div>
				  </div>
				</form>
			</div>
		</div>
		<div class="row-fluid">
			
		</div>
	</div>
</body>
<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/interface/AuthorityService.js'></script>
<script type="text/javascript" src="<%=path%>/res/asset/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/res/asset/js/echartsHome.js"></script>
<script src="<%=path%>/res/asset/js/bootstrap.min.js"></script>
<script type="text/javascript">
	(function($){

		//修改帐号密码
		$('#btn-pwd-commit').click(function(e){
			if(!$('#password_new').val()){
				alert('新密码不能为空！');
				$('#password_new').focus();
			}
			if($('#password_new').val()!=$('#password_confirm').val()){
				alert('两次密码输入不一致，请重新输入');
				$('#password_confirm').focus();
				return;
			}
			updateUserPwd();
		});

	})(jQuery);


	function updateUserPwd(){
		var user = {id:$('#id').val(),cnname:'${user.cnname}',password:$('#password_new').val()}
		AuthorityService.updateUserPwd(user,{callback:function(msg){
			if(msg===true){
				$('#opt-info').removeClass('alert-default').addClass('alert-info').html('用户: '+user.cnname+' 密码修改成功，请重新登录！');
				$('#form-user')[0].reset();
			}
		},errorHandler:function(err,Exc){
			alert(err);
		}});
	}
</script>
</html>