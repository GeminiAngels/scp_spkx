<%@page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<%@include file="/inc/header.jsp"%>
	<meta charset="UTF-8">
	<title>e-Sciences+会议平台-邮箱设置</title>
	<link href="<%=path%>/res/asset/css/font-awesome.min.css" rel="stylesheet">
	<link href="<%=path%>/res/asset/css/bootstrap.css" rel="stylesheet">
	<link href="<%=path%>/res/asset/css/echartsHome.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=path%>/res/css/base.css">
	<link rel="shortcut icon" href="<%=path%>/static/assets/ico/favicon.ico">
</head>
<body>
<div class="navbar navbar-default navbar-fixed-top" role="navigation" id="head"></div>
<div class="container-fluid" style="padding-top:10px;">
	<div class="row-fluid">
		<div class="col-md-12">
			<ol class="breadcrumb">
				<li><a href="#">管理</a></li>
				<li><a href="#">邮箱设置</a></li>
			</ol>
		</div>
	</div>
	<div class="row-fluid">
		<div class="col-md-4">
			<div class="alert alert-info" id="opt-info">新增和修改都在下方表单进行</div>
			<form class="form-horizontal" id="form-mailSet">
				<input type="hidden" id="id">

				<div class="form-group">
					<label for="serverhost" class="col-sm-3 control-label">邮件服务host</label>
					<div class="col-sm-9">
						<input type="text"
						       class="form-control" id="serverhost" placeholder="邮件服务host">
					</div>
				</div>
				<div class="form-group">
					<label for="senderaddr" class="col-sm-3 control-label">发送者邮箱</label>
					<div class="col-sm-9">
						<input type="text"
						       class="form-control" id="senderaddr" placeholder="发送者邮箱地址">
					</div>
				</div>
				<div class="form-group">
					<label for="senderuname" class="col-sm-3 control-label">公共邮箱</label>
					<div class="col-sm-9">
						<input type="text"
						       class="form-control" id="senderuname" placeholder="公共邮箱">
					</div>
				</div>
				<div class="form-group">
					<label for="sendernick" class="col-sm-3 control-label">别名</label>
					<div class="col-sm-9">
						<input type="text"
						       class="form-control" id="sendernick" placeholder="别名">
					</div>
				</div>
				<div class="form-group">
					<label for="senderpwd" class="col-sm-3 control-label">密钥</label>
					<div class="col-sm-9">
						<input type="text"
						       class="form-control" id="senderpwd" placeholder="密钥">
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-9">
						<a type="reset" class="cbtn o-plus" id="btn-add" title="新增"></a>
						<a class="cbtn o-ok pull-right"
						   id="btn-commit" title="提交"></a>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-8">
			<table class="table table-hover table-striped table-bordered table-operate">
				<thead style="background-color:#ccc">
				<tr>
					<th>ID</th>
					<th>邮件服务host</th>
					<th>发送方邮箱</th>
					<th>基本信息</th>
					<th>启停状态</th>
					<th>操作 <a id="icon-refresh" class="cbtn o-cancel" title="刷新"></a></th>
				</tr>
				</thead>
				<tbody id="data-content"></tbody>
				<tfoot>
				<tr>
					<td colspan="6">

					</td>
				</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>
</body>
<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/interface/MailsetService.js'></script>
<script type="text/javascript" src="<%=path%>/res/asset/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/res/asset/js/echartsHome.js"></script>
<script src="<%=path%>/res/asset/js/bootstrap.min.js"></script>
<script type="text/javascript">
	(function($){
		//页面加载完毕后加载所有模块数据
		loadMailSets();

		$('#icon-refresh').click(function(event) {
			loadMailSets();
		});

		$('#btn-commit').click(function(event) {
			saveMailSet();
		});

		$('#btn-add').click(function(e) {
			$('#form-mailSet')[0].reset();
			$('#id').val('');
			var info = $('#opt-info');
			info.html('表单已清空，您现在可以录入内容');
			info.removeClass('alert-info').addClass('alert-default');
		});
	})(jQuery);

	/**
	 * [加载所有数据]
	 * @return {[list]}
	 */
	function loadMailSets(){
		MailsetService.getAllMailset(function(notices){
			var tbody = $('#data-content');
			tbody.empty();
			$.each(notices, function(index, mailSet) {
				var tr = $('<tr><td width="40">'+mailSet.id*1+'</td>'
					+'<td>'+mailSet.serverhost+'</td>'
					+'<td>'+mailSet.senderaddr+'</td>'
					+'<td>公共邮箱:'+mailSet.senderuname+'<br>'
					+'别&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:'+mailSet.sendernick+'<br>'
					+'密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;钥:'+mailSet.senderpwd+'</td>'
					+'<td width="100"><label class="toggle'
					+(mailSet.isactive==0?'  toggle-off':'')
					+'"><input type="checkbox" onclick="updateMailSetStatus(this,'+mailSet.id*1+')" class="visi-hidden"></label></td>'
					+'<td align="center" width="100"><a class="cbtn o-edit" onclick="loadMailSet('+mailSet.id*1+');" title="修改"></a> <a class="cbtn o-trash" onclick="delMailSet('+mailSet.id*1+');" title="删除"></a></td></tr>');
				tbody.append(tr);
			});
		});
	}

	/**
	 * [根据模块ID加载单条数据]
	 * @param  {[int]} id
	 * @return {[boolean/string]}        [true/false/error]
	 */
	function loadMailSet(id){
		MailsetService.getMailset(id,function(mailSet){
			$('#id').val(mailSet.id*1);
			$('#serverhost').val(mailSet.serverhost);
			$('#senderaddr').val(mailSet.senderaddr);
			$('#sendernick').val(mailSet.sendernick);
			$('#senderuname').val(mailSet.senderuname);
			$('#senderpwd').val(mailSet.senderpwd);
			$('#opt-info').html('当前编辑内容：'+mailSet.senderaddr);
		});
	}

	/**
	 * [保存表单数据]
	 * @return {[boolean/string]} [true/false/error]
	 */
	function saveMailSet(){
		var mailSet = {id:$('#id').val(),serverhost:$('#serverhost').val(),senderaddr:$('#senderaddr').val()
			,sendernick:$('#sendernick').val(),senderuname:$('#senderuname').val(),senderpwd:$('#senderpwd').val()};
		if(mailSet.id){
			MailsetService.updateMailset(mailSet,function(msg){
				if(msg===true)
					loadMailSets();
			});
		} else {
			MailsetService.addMailset(mailSet,function(msg){
				if(msg===true)
					loadMailSets();
			});
		}
	}

	function delMailSet(id){
		MailsetService.deleteMailset(id,function(msg){
			if(msg===true)
				loadMailSets();
		});
	}
	//更新状态
	function updateMailSetStatus(_self,mailSetid){
		var that = $(_self);
		var checked = !that.parent().hasClass('toggle-off');
		if(checked){
			that.prop('checked','checked');
			that.parent().removeClass('toggle');
			that.parent().addClass('toggle toggle-off');
		} else {
			that.removeProp('checked');
			that.parent().removeClass('toggle toggle-off');
			that.parent().addClass('toggle');
		}
		MailsetService.updateMailsetStatus(mailSetid,checked?0:1,function(msg){
			// if(msg===true)
			// 	loadFuncs();
		});
	}
</script>
</html>