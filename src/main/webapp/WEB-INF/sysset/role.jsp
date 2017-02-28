<%@page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<%@include file="/inc/header.jsp"%>
	<meta charset="UTF-8">
	<title>e-Sciences+会议平台-角色权限管理</title>
	<link href="<%=path%>/res/asset/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=path%>/res/asset/css/bootstrap.css" rel="stylesheet">
    <link href="<%=path%>/res/asset/css/echartsHome.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=path%>/res/css/base.css">
	<!-- <link rel="stylesheet" type="text/css" href="<%=path%>/res/css/bootstrap-combobox.css"> -->
	<!-- <link rel="stylesheet" href="<%=path%>/res/lib/zTree/css/ibos/ibos.css"> -->
	<!-- <link rel="stylesheet" href="<%=path%>/res/lib/Select2/select2.css"> -->
	<link rel="stylesheet" type="text/css" href="<%=path%>/res/lib/zTree/css/zTreeStyle/zTreeStyle.css"
	<link rel="shortcut icon" href="<%=path%>/static/assets/ico/favicon.ico">
</head>
<body>
    <div class="navbar navbar-default navbar-fixed-top" role="navigation" id="head"></div>
	<div class="container-fluid" style="padding-top:10px;">
		<div class="row-fluid">
			<div class="col-md-12">
				<ol class="breadcrumb">
				  <li><a href="#">管理</a></li>
				  <li><a href="#">角色权限管理</a></li>
				</ol>
			</div>
		</div>
		<div class="row-fluid">
			<div class="col-md-4">
				<div class="alert alert-info" id="opt-info">新增和修改都在下方表单进行</div>
				<form class="form-horizontal" id="form-role">
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">角色名称</label>
						<div class="col-sm-9">
							<input type="hidden" id="id"> <input type="text"
								class="form-control" id="name" placeholder="可按照组织机构的策略命名角色">
						</div>
					</div>
					<div class="form-group">
						<label for="code" class="col-sm-3 control-label">角色代码</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="code"
								placeholder="命名规则:ROLE_XXX">
						</div>
					</div>
					<div class="form-group">
						<label for="code" class="col-sm-3 control-label">模块权限</label>
						<div id="tree-front" class="col-sm-9">
							<ul class="ztree position-ztree" id="ztree-menu">
							</ul>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-9">
							<a type="reset" class="cbtn o-plus" id="btn-add" title="新增"></a>
							<a class="cbtn o-ok pull-right"
								id="btn-commit" title="提交"></a>
							<a class="cbtn o-form-design pull-right"
								id="btn-authorize-role" title="保存权限"></a>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-8">
				<table class="table table-hover table-striped table-bordered table-operate">
					<thead style="background-color:#ccc">
						<tr>
							<th>ID</th>
							<th>角色名称</th>
							<th>角色代码</th>
							<th>启停状态</th>
							<th>操作 <a id="icon-refresh" class="cbtn o-cancel" title="刷新"></a></th>
						</tr>
					</thead>
					<tbody id="data-content"></tbody>
					<tfoot>
						<tr>
							<td colspan="5">
							
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
<script src="<%=path%>/res/lib/zTree/js/jquery.ztree.core-3.5.js"></script>
<script src="<%=path%>/res/lib/zTree/js/jquery.ztree.excheck-3.5.js"></script>
<script src="<%=path%>/res/lib/zTree/js/jquery.ztree.exedit-3.5.js"></script>
<script type="text/javascript">
	(function($){
		//页面加载完毕后加载所有角色数据
		loadRoles();

		$('#icon-refresh').click(function(event) {
			loadRoles();
		});

		$('#btn-commit').click(function(event) {
			saveRole();
		});

		$('#btn-add').click(function(e) {
			$('#form-role')[0].reset();
			var info = $('#opt-info');
			info.html('表单已清空，您现在可以录入新的角色信息');
			info.removeClass('alert-info').addClass('alert-default');
		});

		$('#btn-authorize-role').click(function(event) {
			saveRoleFuncs();
		});
	})(jQuery);

	/**
	 * [加载所有角色数据]
	 * @return {[list]} [角色数据列表]
	 */
	function loadRoles(){
		AuthorityService.getAllRoles(function(roles){
			var tbody = $('#data-content');
			tbody.empty();
			$.each(roles, function(index, role) {
				var tr = $('<tr><td width="40">'+role.id*1+'</td>'
					+'<td>'+role.name+'</td>'
					+'<td>'+role.code+'</td>'
					+'<td><label class="toggle'
					+(role.status!=1?'  toggle-off':'')
					+'"><input type="checkbox" onclick="updateRoleStatus(this,'+role.id*1+')" class="visi-hidden"></label></td>'
					+'<td align="center" width="100"><a class="cbtn o-more" onclick="loadRole('+role.id*1+');" title="修改"></a> <a class="cbtn o-trash" onclick="delRole('+role.id*1+');" title="删除"></a></td></tr>');
				tbody.append(tr);
			});
		});
	}

	/**
	 * [根据角色ID加载单条数据]
	 * @param  {[int]} roleid [角色ID]
	 * @return {[boolean/string]}        [true/false/error]
	 */
	function loadRole(roleid){
		AuthorityService.getRole(roleid,function(role){
			$('#id').val(role.id*1);
			$('#name').val(role.name);
			$('#code').val(role.code);
			$('#opt-info').html('正在修改角色：'+role.name);
			loadRoleFuncs(role.id*1);
		});
	}

	/**
	 * [保存表单数据]
	 * @return {[boolean/string]} [true/false/error]
	 */
	function saveRole(){
		var role = {id:$('#id').val(),name:$('#name').val(),code:$('#code').val()};
		if(role.id){
			AuthorityService.updateRole(role,function(msg){
				if(msg===true)
					loadRoles();
			});
			saveRoleFuncs();
		} else {
			AuthorityService.addRole(role,function(msg){
				if(msg===true)
					loadRoles();
			});
		}
	}

	function delRole(roleid){
		AuthorityService.deleteRole(roleid,function(msg){
			if(msg===true)
				loadRoles();
		});
	}

	function updateRoleStatus(_self,roleid){
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
		AuthorityService.updateRoleStatus(roleid,checked?2:1,function(msg){
			// if(msg===true)
			// 	loadRoles();
		});
	}

	function saveRoleFuncs(){
		var roleid = $('#id').val();
		var tree=$.fn.zTree.getZTreeObj("ztree-menu").getCheckedNodes(true);
		if(roleid&&tree){
			var funcids = [];
			for(var i=0;i<tree.length;i++){
				funcids.push(tree[i].id);
			}
			AuthorityService.addRoleFuncs(roleid,funcids.join(','),function(issuc){
				if(issuc)
					alert('授权成功!');
			});
		}
	}

	function loadRoleFuncs(roleid){
		AuthorityService.getRoleFuncsTree(roleid,function(data){
			var setting = {
				check:{
	                enable:true,
	                chkStyle: "checkbox",
					chkboxType: { "Y" : "ps", "N" : "ps" }
	            },
	            data:    {
	                simpleData:{
	                    enable:true
	                },
	                key:{
	            		url:"javascript:;"
	            	}
	            },
	            view:{
	            	showLine : !1,
	    			selectedMulti : !1,
	    			showIcon : !1
	            }
			};
			var zTreeObj_b = $.fn.zTree.init($("#ztree-menu"), setting, data);
			var treeObj=$.fn.zTree.getZTreeObj("ztree-menu");
			var nodes = treeObj.getNodes();
			treeObj.expandNode(nodes[0], true, false, true);
		});
	}
</script>
</html>