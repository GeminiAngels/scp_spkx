<%@page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<%@include file="/inc/header.jsp"%>
	<meta charset="UTF-8">
	<title>e-Sciences+会议平台-后台模块管理</title>
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
				  <li><a href="#">后台模块管理</a></li>
				</ol>
			</div>
		</div>
		<div class="row-fluid">
			<div class="col-md-4">
				<div class="alert alert-info" id="opt-info">新增和修改都在下方表单进行</div>
				<form class="form-horizontal" id="form-func">
					<input type="hidden" id="id">
					<div class="form-group">
						<label for="parentid" class="col-sm-3 control-label">父级</label>
						<div class="col-sm-9">
							<input type="text"
								class="form-control" id="parentid" placeholder="给模块起个名字吧">
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">名称</label>
						<div class="col-sm-9">
							<input type="text"
								class="form-control" id="name" placeholder="给模块起个名字吧">
						</div>
					</div>
					<div class="form-group">
						<label for="url" class="col-sm-3 control-label">链接</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="url"
								placeholder="访问模块的相对链接地址">
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
							<th>父级</th>
							<th>名称</th>
							<th>URL</th>
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
<script type='text/javascript' src='<%=path%>/dwr/interface/AuthorityService.js'></script>
<script type="text/javascript" src="<%=path%>/res/asset/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/res/asset/js/echartsHome.js"></script>
<script src="<%=path%>/res/asset/js/bootstrap.min.js"></script>
<script type="text/javascript">
	(function($){
		//页面加载完毕后加载所有模块数据
		loadFuncs();

		$('#icon-refresh').click(function(event) {
			loadFuncs();
		});

		$('#btn-commit').click(function(event) {
			saveFunc();
		});

		$('#btn-add').click(function(e) {
			$('#form-func')[0].reset();
			var info = $('#opt-info');
			info.html('表单已清空，您现在可以录入新的模块信息');
			info.removeClass('alert-info').addClass('alert-default');
		});
	})(jQuery);

	/**
	 * [加载所有模块数据]
	 * @return {[list]} [模块数据列表]
	 */
	function loadFuncs(){
		AuthorityService.getAllFuncs(function(funcs){
			var tbody = $('#data-content');
			tbody.empty();
			$.each(funcs, function(index, func) {
				var tr = $('<tr><td width="40">'+func.id*1+'</td>'
					+'<td>'+func.parentid*1+'</td>'
					+'<td>'+func.name+'</td>'
					+'<td>'+func.url+'</td>'
					+'<td><label class="toggle'
					+(func.status!=1?'  toggle-off':'')
					+'"><input type="checkbox" onclick="updateFuncStatus(this,'+func.id*1+')" class="visi-hidden"></label></td>'
					+'<td align="center" width="100"><a class="cbtn o-edit" onclick="loadFunc('+func.id*1+');" title="修改"></a> <a class="cbtn o-trash" onclick="delFunc('+func.id*1+');" title="删除"></a></td></tr>');
				tbody.append(tr);
			});
		});
	}

	/**
	 * [根据模块ID加载单条数据]
	 * @param  {[int]} funcid [模块ID]
	 * @return {[boolean/string]}        [true/false/error]
	 */
	function loadFunc(funcid){
		AuthorityService.getFunc(funcid,function(func){
			$('#id').val(func.id*1);
			$('#parentid').val(func.parentid*1);
			$('#name').val(func.name);
			$('#url').val(func.url);
			$('#opt-info').html('当前编辑模块：'+func.name);
		});
	}

	/**
	 * [保存表单数据]
	 * @return {[boolean/string]} [true/false/error]
	 */
	function saveFunc(){
		var func = {id:$('#id').val(),parentid:$('#parentid').val(),name:$('#name').val(),url:$('#url').val()};
		if(func.id){
			AuthorityService.updateFunc(func,function(msg){
				if(msg===true)
					loadFuncs();
			});
		} else {
			AuthorityService.addFunc(func,function(msg){
				if(msg===true)
					loadFuncs();
			});
		}
	}

	function delFunc(funcid){
		AuthorityService.deleteFunc(funcid,function(msg){
			if(msg===true)
				loadFuncs();
		});
	}

	function updateFuncStatus(_self,funcid){
		var that = $(_self);
		var checked = !that.parent().hasClass('toggle-off');
		if(checked){
			that.prop('checked','checked');
			that.parent().removeClass('toggle')
			that.parent().addClass('toggle toggle-off');
		} else {
			that.removeProp('checked');
			that.parent().removeClass('toggle toggle-off')
			that.parent().addClass('toggle');
		}
		AuthorityService.updateFuncStatus(funcid,checked?2:1,function(msg){
			// if(msg===true)
			// 	loadFuncs();
		});
	}
</script>
</html>