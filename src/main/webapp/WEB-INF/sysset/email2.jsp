<%--
  Created by IntelliJ IDEA.
  User: DAISEN
  Date: 2017/2/13
  Time: 22:19
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<%@include file="/inc/header.jsp" %>
	<meta charset="UTF-8">
	<title>e-Sciences+会议平台-邮件管理</title>
	<link href="<%=path%>/res/asset/css/font-awesome.min.css" rel="stylesheet">
	<link href="<%=path%>/res/asset/css/bootstrap.css" rel="stylesheet">
	<link href="<%=path%>/res/asset/css/echartsHome.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=path%>/res/css/base.css">
	<link rel="shortcut icon" href="<%=path%>/static/assets/ico/favicon.ico">
	<link rel="stylesheet" type="text/css" href="<%=path%>/res/lib/Select2/select2.css">

</head>
<body>
<div class="navbar navbar-default navbar-fixed-top" role="navigation" id="head"></div>
<div class="container-fluid" style="padding-top:10px;">
	<div class="row-fluid">
		<div class="col-md-12">
			<ol class="breadcrumb">
				<li><a href="#">管理</a></li>
				<li><a href="#">邮件管理</a></li>
			</ol>
		</div>
	</div>

	<div class="row-fluid pull-right" style="padding-bottom:5px">
		<div class="btn-group " role="group">
			<button class="btn btn-success btn-sm" id="btn-select">选择</button>
		</div>
		<div class="btn-group" role="group">
			<button class="btn btn-success btn-sm" id="btn-save">保存</button>
		</div>
		<div class="btn-group " role="group">
			<button class="btn btn-success btn-sm" id="btn-send">发送</button>
		</div>
	</div>
	<div class="row-fluid">
		<div class="col-md-12">
			<div class="alert alert-info" id="opt-info">新增和修改都在下方表单进行</div>
			<form class="form-horizontal" id="form-email">
				<input type="hidden" id="id">
				<%--<div class="form-group">
					<label for="parentid" class="col-sm-1 control-label">父级</label>
					<div class="col-sm-11">
						<input type="text"
						       class="form-control" id="parentid" placeholder="给模块起个名字吧">
					</div>
				</div>--%>
				<div class="form-group">
					<label for="title" class="col-sm-1 control-label">标题</label>
					<div class="col-sm-11">
						<input type="text"
						       class="form-control" id="title" placeholder="给邮件起个标题吧">
					</div>
				</div>
				<div class="form-group">
					<label for="content" class="col-sm-1 control-label">内容</label>
					<div class="col-sm-11">
						<textarea id="content" style="height:300px;"></textarea>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 发送邮件模态窗口 -->
<div class="modal fade" id="modal-sendEmail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
     data-backdrop="static">
	<div class="modal-dialog" style="width:70%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" id="btn-closeSort-encode">
					<span aria-hidden="true">&times;</span><span class="sr-only"></span>
				</button>
				<h4 class="modal-title" id="myModalLabel">发送邮件</h4>
			</div>
			<div class="modal-body">
				<form id="form-add" class="form-horizontal" onsubmit="return false;">
					<div class="form-group">
						<div class="group">
							<label class="col-sm-2 control-label">邮件地址:</label>
							<div class="col-sm-10">
								<select id="input-emailAddress" aria-expanded="false" aria-hidden="true" class="js-example-responsive" multiple="multiple" style="width:100%">
									<%--<optgroup label="系统设置">
										<option value="1">用户管理</option>
										<option value="2">角色管理</option>
										<option value="3">部门管理</option>
										<option value="4">菜单管理</option>
									</optgroup>
									<optgroup label="订单管理">
										<option value="5">订单查询</option>
										<option value="6">订单导入</option>
										<option value="7">订单删除</option>
										<option value="8">订单撤销</option>
									</optgroup>
									<optgroup label="基础数据">
										<option value="9">基础数据维护</option>
									</optgroup>--%>
								</select>
							</div>

							<%--<label class="col-sm-2 control-label">邮件地址:</label>
							<div class="col-sm-10">
								<input class="form-control" id="input-emailAddress" name="emailAddress" required type="text"/>
							</div>--%>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default pull-left" data-dismiss="modal" >
					<i class="glyphicon glyphicon-floppy-remove"></i> 取消
				</button>
				<button type="button" class="btn btn-default pull-right" id="btn-sendEmail" data-loading-text="保存中..."
				        autocomplete="off">
					<i class="glyphicon glyphicon-floppy-disk"></i> 确定
				</button>
			</div>
		</div>
	</div>
</div>

<!-- 选择邮件内容模态窗口 -->
<div class="modal fade" id="modal-selectEmail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
     data-backdrop="static">
	<div class="modal-dialog" style="width:70%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" >
					<span aria-hidden="true">&times;</span><span class="sr-only"></span>
				</button>
				<h4 class="modal-title" id="myModalLabel1">选择邮件</h4>
			</div>
			<div class="modal-body">
				<table class="table table-hover table-striped table-bordered">
					<thead style="background-color:#ccc">
					<tr>
						<th width="30"><input type="checkbox" class="input-control"id="table-checkbox-header" /></th>
						<th style="display:none">ID</th>
						<th style="width: 20%;">邮件标题</th>
						<th style="min-width: 60%;">邮件内容</th>
						<th style="display:none">邮件内容</th>
						<th style="width: 10%;">操作 </th>
					</tr>
					</thead>
					<tbody id="data-content">

					</tbody>
					<tfoot>
					<tr>
						<td colspan="11">

						</td>
					</tr>
					</tfoot>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default pull-left" data-dismiss="modal" >
					<i class="glyphicon glyphicon-floppy-remove"></i> 取消
				</button>
				<button type="button" class="btn btn-default pull-right" id="btn-selectEmail" data-loading-text="保存中..."
				        autocomplete="off">
					<i class="glyphicon glyphicon-floppy-disk"></i> 确定
				</button>
			</div>
		</div>
	</div>
</div>
</body>
<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/interface/EmailService.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/interface/RegisterService.js'></script>
<script type="text/javascript" src="<%=path%>/res/asset/js/jquery.min.js"></script>
<!-- 配置文件 -->
<script type="text/javascript" src="<%=path%>/res/lib/UEditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="<%=path%>/res/lib/UEditor/ueditor.all.js"></script>
<script type="text/javascript" src="<%=path%>/res/asset/js/echartsHome.js"></script>
<script src="<%=path%>/res/asset/js/bootstrap.min.js"></script>
<script src="<%=path%>/res/lib/Select2/select2.js"></script>
<script type="text/javascript">
	(function ($) {
		$('#id').val('');
		//页面加载完毕后加载所有模块数据
//		loadFuncs();

		/*$('#icon-refresh').click(function (event) {
			loadFuncs();
		});

		$('#btn-commit').click(function (event) {
			saveFunc();
		});*/

		/**
		 * 保存按钮点击事件
		 */
		$('#btn-save').click(function (e) {
			saveEmail();
		});
		/**
		 * 发送按钮点击事件
		 */
		$('#btn-send').click(function (e) {
			$('#modal-sendEmail').modal('show');
		});

		/**
		 * 发送邮件窗口确定按钮点击事件
		 */
		$('#btn-sendEmail').click(function (e) {
			sendEmail();
		});
		/**
		 * 选择邮件按钮点击事件
		 */
		$('#btn-select').click(function (e) {
			$('#modal-selectEmail').modal('show');
			loadEmails();
		});
		/**
		 * 选择邮件模态窗口中确定按钮点击事件
		 */
		$('#btn-selectEmail').click(function (e) {
			if($('td > input:checked:first').length){
				loadEmail();
			}else{
				alert("请选择数据!");
			}

		});

		$("#input-emailAddress").select2({
			language:'zh-CN',
			closeOnSelect: false,//选择结果后不关闭
			placeholder: "请选择"
		});
		RegisterService.getRegisters(function(data){
			$.each(data,function (i,n){
				$("#input-emailAddress").append('<option value="'+n.email+'">'+n.nickname+' '+n.email+'</option>');
			});

		});
	})(jQuery);
	//为内容输入框注册UEditor
	UE.getEditor("content");
	/*UE.getEditor("content",{
	 wordCount:false,
	 initialFrameHeight:100,
	 toolbars:[
	 ['kityformula', 'undo','redo','|','bold','italic','underline','strikethrough','|','inserttable','deletetable','insertparagraphbeforetable','edittable','edittd','|','spechars']
	 ]
	 });*/
	/**
	 * [加载所有email数据]
	 * @return {[list]} [模块数据列表]
	 */
	function loadEmails() {
		EmailService.getAllEmails(function (email) {
			var tbody = $('#data-content');
			tbody.empty();
			$.each(email, function (index, email) {
				console.log(email.contentHtml);  //TODO:debug
				var tr = $('<tr>'
					+ '<td width="30"><input class="input-control" type="checkbox" value="" /></td>'
					+ '<td style="display:none;">' + email.id * 1 + '</td>'
					+ '<td>' + email.title  + '</td>'
					+ '<td>' + email.content.substring(0,40) + '</td>'
					+ '<td style="display:none;">' + email.contentHtml + '</td>'
					+ '<td align="center" width="10%"> <a class="cbtn o-trash" onclick="deleteEmail(' + email.id * 1 + ');" title="删除"></a></td></tr>');
				tbody.append(tr);
			});
		});
	}

	/**
	 * [根据表格选中的内容加载单条数据到from中]
	 * @return {[boolean/string]}        [true/false/error]
	 */
	function loadEmail() {
		var emailid=$('td > input:checked:first').parent().parent().find("td").eq(1).text();

		EmailService.getEmail(emailid, function (email) {
//			$('#id').val(email.id * 1); //暂时不做修改功能
			$('#title').val(email.title);
//			$('#content').val(content);
//			$('#contentHtml').val(contentHtml);
			UE.getEditor("content").setContent(email.contentHtml);
//			$('#opt-info').html('当前编辑模块：' + func.name);
		});
		$('#modal-selectEmail').modal('hide');
	}
	/**
	 * [保存email数据]
	 * @return {[boolean/string]} [true/false/error]
	 */
	function saveEmail(){
		var email = {id:$('#id').val(),title:$('#title').val(),content:UE.getEditor('content').getPlainTxt(),contentHtml:UE.getEditor('content').getContent()};
		if(email.id){
			EmailService.updateEmail(email,function(msg){
				if(msg===true)
					loadFuncs();
			});
		} else {
			EmailService.addEmail(email,function(msg){
				if(msg===true)
					alert(msg);
			});
		}
	}
	/**
	 * [发送email邮件]
	 * @return {[boolean/string]} [true/false/error]
	 */
	function sendEmail(){
		var emailAddress = $('#input-emailAddress').val().join(';');;
		var title = $('#title').val();
		var content = UE.getEditor('content').getContent();
		EmailService.sendEmail(emailAddress,title,content,function(msg){
			if(msg===true){
				alert("发送成功!");
				$('#modal-sendEmail').modal('hide');
			}else{
				alert("发送失败");
			}
		});
	}
	/**
	 * [删除email邮件]
	 * @return {[boolean/string]} [true/false/error]
	 */
	function deleteEmail(eid){
		EmailService.deleteEmail(eid,function(msg){
			if(msg===true)
				loadEmails();
		});
	}
	/**
	 * 数据全选/全不选
	 */
	$('#table-checkbox-header').change(function() {
		$('td > input').prop('checked', this.checked);
	});
	//实现单击行选中复选框
//	$("tr").live("click",function(event){
//	      var event = event || window.event;
//	      event.stopImmediatePropagation();
//	      $(this).find("input[type='checkbox']").prop("checked","true");
//	});

</script>
</html>
