<%@page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<%@include file="/inc/header.jsp"%>
	<meta charset="UTF-8">
	<title>e-Sciences+会议平台-通知管理</title>
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
				<li><a href="#">通知管理</a></li>
			</ol>
		</div>
	</div>
	<div class="row-fluid">
		<div class="col-md-12">
			<div class="alert alert-info" id="opt-info">新增和修改都在下方表单进行</div>
			<form class="form-horizontal" id="form-notice">
				<input type="hidden" id="id">

				<div class="form-group">
					<label for="title" class="col-sm-1 control-label">标题</label>
					<div class="col-sm-11">
						<input type="text"
						       class="form-control" id="title" placeholder="给通知起个名字吧">
					</div>
				</div>
				<div class="form-group">
					<label for="content" class="col-sm-1 control-label">内容</label>
					<div class="col-sm-11">
						<textarea id="content" style="height: 200px"
						          placeholder="通知的内容"></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-1 col-sm-11">
						<a type="reset" class="cbtn o-plus" id="btn-add" title="新增"></a>
						<a class="cbtn o-ok pull-right"
						   id="btn-commit" title="提交"></a>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-12">
			<table class="table table-hover table-striped table-bordered table-operate">
				<thead style="background-color:#ccc">
				<tr>
					<th>ID</th>
					<th>标题</th>
					<%--<th>内容</th>--%>
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
<script type='text/javascript' src='<%=path%>/dwr/interface/NoticeService.js'></script>
<script type="text/javascript" src="<%=path%>/res/asset/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/res/asset/js/echartsHome.js"></script>
<script src="<%=path%>/res/asset/js/bootstrap.min.js"></script>
<!-- 配置文件 -->
<script type="text/javascript" src="<%=path%>/res/lib/UEditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="<%=path%>/res/lib/UEditor/ueditor.all.js"></script>
<script type="text/javascript">
	(function($){
		//页面加载完毕后加载所有模块数据
		loadNotices();

		$('#icon-refresh').click(function(event) {
			loadNotices();
		});

		$('#btn-commit').click(function(event) {
			saveNotice();
		});

		$('#btn-add').click(function(e) {
			$('#form-notice')[0].reset();
			$('#id').val('');
			UE.getEditor("content").setContent('');
			var info = $('#opt-info');
			info.html('表单已清空，您现在可以录入新的通知');
			info.removeClass('alert-info').addClass('alert-default');
		});
		UE.getEditor("content", {
			wordCount: false,
			initialFrameHeight: 200,
			toolbars: [
				['kityformula', 'undo', 'redo', '|', 'bold', 'italic', 'underline', 'strikethrough', '|', 'inserttable', 'deletetable', 'insertparagraphbeforetable', 'edittable', 'edittd', '|', 'spechars']
			]
		});

	})(jQuery);

	/**
	 * [加载所有数据]
	 * @return {[list]}
	 */
	function loadNotices(){
		NoticeService.getAllNotice(function(notices){
			var tbody = $('#data-content');
			tbody.empty();
			$.each(notices, function(index, notice) {
				var tr = $('<tr><td width="40">'+notice.id*1+'</td>'
					+'<td>'+notice.title+'</td>'
//					+'<td>'+notice.content+'</td>'
					+'<td width="100"><label class="toggle'
					+(notice.status!=1?'  toggle-off':'')
					+'"><input type="checkbox" onclick="updateNoticeStatus(this,'+notice.id*1+')" class="visi-hidden"></label></td>'
					+'<td align="center" width="100"><a class="cbtn o-edit" onclick="loadNotice('+notice.id*1+');" title="修改"></a> <a class="cbtn o-trash" onclick="delNotice('+notice.id*1+');" title="删除"></a></td></tr>');
				tbody.append(tr);
			});
		});
	}

	/**
	 * [根据模块ID加载单条数据]
	 * @param  {[int]} id
	 * @return {[boolean/string]}        [true/false/error]
	 */
	function loadNotice(id){
		NoticeService.getNotice(id,function(notice){
			$('#id').val(notice.id*1);
			$('#title').val(notice.title);
//			$('#content').val(notice.content);
			UE.getEditor("content").setContent(notice.contentHtml?notice.contentHtml:'');
			$('#opt-info').html('当前编辑通知：'+notice.title);
		});
	}

	/**
	 * [保存表单数据]
	 * @return {[boolean/string]} [true/false/error]
	 */
	function saveNotice(){

		var notice = {id:$('#id').val(),title:$('#title').val(),
			content: UE.getEditor('content').getPlainTxt(),
			contentHtml: UE.getEditor('content').getContent()
		};
		if(notice.id){
			NoticeService.updateNotice(notice,function(msg){
				if(msg===true)
					loadNotices();
			});
		} else {
			NoticeService.addNotice(notice,function(msg){
				if(msg===true)
					loadNotices();
			});
		}
	}

	function delNotice(id){
		NoticeService.deleteNotice(id,function(msg){
			if(msg===true)
				loadNotices();
		});
	}
	//更新状态
	function updateNoticeStatus(_self,noticeid){
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
		NoticeService.updateNoticeStatus(noticeid,checked?2:1,function(msg){
			// if(msg===true)
			// 	loadFuncs();
		});
	}
</script>
</html>