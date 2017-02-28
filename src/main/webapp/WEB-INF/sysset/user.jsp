<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<%@include file="/inc/header.jsp"%>
	<meta charset="UTF-8">
	<title>e-Sciences+会议平台-管理人员设置</title>
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
				  <li><a href="#">管理人员设置</a></li>
				</ol>
			</div>
		</div>
		<div class="row-fluid">
			<div class="col-md-4">
				<div class="alert alert-info" id="opt-info">新增和修改都在下方表单进行</div>
				<form class="form-horizontal" id="form-user">
				  <div class="form-group">
				    <label for="name" class="col-sm-3 control-label">登录帐号</label>
				    <div class="col-sm-9">
				      <input type="hidden" id="id">
				      <input type="text" class="form-control" id="name" placeholder="建议英文缩写帐号">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="cnname" class="col-sm-3 control-label">姓　　名</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="cnname" placeholder="中文名称">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="password" class="col-sm-3 control-label">密　　码</label>
				    <div class="col-sm-9">
				      <input type="password" class="form-control" id="password" placeholder="建议数字字母符号混搭">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="password" class="col-sm-3 control-label">角　　色</label>
				    <div class="col-sm-9">
				      <div id="tree-front" class="col-sm-9">
						<ul class="ztree position-ztree" id="ztree-menu">
						</ul>
					  </div>
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-3 col-sm-9">
				      <a type="reset" class="cbtn o-plus" id="btn-user-add" title="新增（清空表单）"></a>
				      <a type="button" class="cbtn o-ok pull-right" id="btn-user-commit" title="提交"></a>
				      <a class="cbtn o-form-design pull-right"
								id="btn-authorize-role" title="保存角色"></a>
				    </div>
				  </div>
				</form>
			</div>
			<div class="col-md-8">
				<table class="table table-hover table-striped table-bordered">
					<thead style="background-color:#ccc">
						<tr>
							<th>ID</th>
							<th>帐号</th>
							<th>姓名</th>
							<th>密码</th>
							<th>启停</th>
							<th>操作 <a id="icon-refresh" class="cbtn o-cancel" title="重新加载表格数据"></a></th>
						</tr>
					</thead>
					<tbody id="data-content">
						
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6">
							
							</td>
						</tr>
					</tfoot>
				</table>
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
<script src="<%=path%>/res/lib/zTree/js/jquery.ztree.core-3.5.js"></script>
<script src="<%=path%>/res/lib/zTree/js/jquery.ztree.excheck-3.5.js"></script>
<script src="<%=path%>/res/lib/zTree/js/jquery.ztree.exedit-3.5.js"></script>
<script type="text/javascript">
	(function($){
		loadUsers();

		$('#icon-refresh').click(function(event) {
			loadUsers();
		});

		$('#btn-user-add').click(function(e) {
			$('#form-user')[0].reset();
			var info = $('#opt-info');
			info.removeClass('alert-info').addClass('alert-default').html('表单已清空，您现在可以录入新的用户信息');
			$('#password').removeAttr('disabled').attr('placeholder','建议数字字母符号混搭');
		});
		//添加用户
		$('#btn-user-commit').click(function(e){
			if($('#id').val()){
				updateUser();
			} else {
				addUser();
			}
		});
		$('#btn-authorize-role').click(function(event) {
			saveUserRoles();
		});

	})(jQuery);

	function loadUsers(){
		AuthorityService.getUsers(function(data){
			var tbody = $('#data-content');
			tbody.empty();
			for(var i=0;i<data.length;i++){
				var user = data[i];
				var tr = $('<tr><td width="40">'+user.id*1+'</td>'
					+'<td>'+user.name+'</td>'
					+'<td>'+user.cnname+'</td>'
					+'<td><i>已加密</i></td>'
					+'<td><label class="toggle'
					+(user.status!=1?'  toggle-off':'')
					+'"><input type="checkbox" onclick="updateUserStatus(this,'+user.id*1+')" class="visi-hidden"></label></td>'
					+'<td align="center" width="100"><a class="cbtn o-edit" onclick="loadUser('+user.id*1+');" title="修改"></a> <a class="cbtn o-trash" onclick="delUser('+user.id*1+');" title="删除"></a></td></tr>');
				tbody.append(tr);
			}
		});
	}

	function loadUser(userid){
		$('#password').attr('disabled',true).attr('placeholder','用户密码只能本人修改').val('');
		AuthorityService.getUser(userid,function(user){
			$('#id').val(user.id*1);
			$('#name').val(user.name);
			$('#cnname').val(user.cnname);
			$('#opt-info').html('正在修改用户：'+user.cnname);
			loadUserRoles(userid);
		});
	}

	function delUser(userid){
		AuthorityService.deleteUser(userid,function(msg){
			if(msg===true)
				loadUsers();
		});
	}

	function addUser(){
		var user = {name:$('#name').val(),cnname:$('#cnname').val(),password:$('#password').val()}
		AuthorityService.addUser(user,function(msg){
			if(msg===true){
				$('#opt-info').removeClass('alert-default').addClass('alert-info').html('用户:'+user.cnname+' 保存成功!');
				loadUsers();
			}
		});
	}

	function updateUser(){
		var user = {id:$('#id').val(),name:$('#name').val(),cnname:$('#cnname').val()}
		AuthorityService.updateUser(user,{callback:function(msg){
			if(msg===true){
				$('#opt-info').removeClass('alert-default').addClass('alert-info').html('用户:'+user.cnname+' 保存成功!');
				loadUsers();
			}
		},errorHandler:function(err,Exc){
			alert(err);
		}});
	}

	function updateUserStatus(_self,userid){
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
		AuthorityService.updateUserStatus(userid,checked?2:1,function(msg){
			// if(msg===true)
			// 	loadRoles();
		});
	}

	function saveUserRoles(){
		var userid = $('#id').val();
		var nodes=$.fn.zTree.getZTreeObj("ztree-menu").getCheckedNodes(true);
		if(userid&&nodes){
			var roleids = [];
			for(var i=0;i<nodes.length;i++){
				roleids.push(nodes[i].id);
			}
			AuthorityService.addUserRoles(userid,roleids.join(','),function(issuc){
				if(issuc){
					$('#opt-info').removeClass('alert-default').addClass('alert-info').html('用户:'+$('#cnname').val()+' 授权成功!');
				}
			});
		}
	}

	function loadUserRoles(userid){
		AuthorityService.getCheckedUserRoles(userid,function(data){
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