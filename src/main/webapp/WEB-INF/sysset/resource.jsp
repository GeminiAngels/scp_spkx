<%@page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<%@include file="/inc/header.jsp"%>
	<meta charset="UTF-8">
	<title>e-Sciences+会议平台-资料管理</title>
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
				  <li><a href="#">资料管理</a></li>
				</ol>
			</div>
		</div>
		<div class="row-fluid">
			<div class="col-md-4">
				<div class="alert alert-info" id="opt-info">文件大小最好不超过20兆</div>
				<form class="form-horizontal" id="form-resource" method="post" action="<%=path%>/resource.do?method=upload" enctype="multipart/form-data">
					<input type="hidden" id="id">
					<div class="form-group">
						<label for="resource" class="col-sm-3 control-label">资料文件</label>
						<div class="col-sm-9">
							<input type="file" name="file"
								class="form-control" id="resource">
						</div>
					</div>
					<div class="form-group">
						<label for="category" class="col-sm-3 control-label">资料分类</label>
						<div class="col-sm-9">
							<select id="category" name="category">
								<option value="资料下载">资料下载</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="comments" class="col-sm-3 control-label">资料说明</label>
						<div class="col-sm-9">
							<input type="text"
								class="form-control" name="comments" id="comments" placeholder="对资料进行说明">
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
				<table class="table table-hover table-striped table-bordered">
					<thead style="background-color:#ccc">
						<tr>
							<th>编码</th>
							<th>资料类型</th>
							<th>资料文件</th>
							<th>上传时间</th>
							<th>审核状态</th>
							<th>备注</th>
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
	</div>
</body>
<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/interface/ResourceService.js'></script>
<script type="text/javascript" src="<%=path%>/res/asset/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/res/asset/js/echartsHome.js"></script>
<script src="<%=path%>/res/asset/js/bootstrap.min.js"></script>
<script type="text/javascript">

	(function($){
		loadResources();

		$('#icon-refresh').click(function(event) {
			loadResources();
		});

		$('#btn-commit').click(function(event) {
			saveResource();
		});

		$('#btn-add').click(function(e) {
			$('#form-resource')[0].reset();
			var info = $('#opt-info');
			info.html('表单已清空，您现在可以录入新的资料');
			info.removeClass('alert-info').addClass('alert-default');
		});

	})(jQuery);

	function loadResources(){
		ResourceService.getResources(function(data){
			var tbody = $('#data-content');
			tbody.empty();
			for(var i=0;i<data.length;i++){
				var item = data[i];
				var tr = $('<tr><td width="60">'+item.id*1+'</td>'
					+'<td width="80">'+item.category+'</td>'
					+'<td>'+item.filename+'.'+item.type+'</td>'
					+'<td>'+item.uploadtime+'</td>'
					+'<td><label class="toggle'
					+(item.status!=1?'  toggle-off':'')
					+'"><input type="checkbox" onclick="updateResourcestatus(this,'+item.id*1+')" class="visi-hidden"></label></td>'
					+'<td>'+item.comments+'</td>'
					+'<td align="center" width="100"><a class="cbtn o-download" onclick="downloadResource('+item.id*1+');" title="下载"></a> <a class="cbtn o-trash" onclick="deleteResource('+item.id*1+');" title="删除"></a></td></tr>');
				tbody.append(tr);
			}
		});
	}

	function updateResourcestatus(_self,fileid){
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
		ResourceService.updateResourcestatus(fileid,checked?0:1,function(msg){
		});
	}

	function deleteResource(fileid){
		ResourceService.deleteResource(fileid,function(msg){
			if(msg===true)
				loadResources();
		});
	}

	function downloadResource(fileid){
		window.location.href = '<%=path%>/resource.do?method=download&fileid='+fileid;
	}


	/**
	 * [保存表单数据]
	 * @return {[boolean/string]} [true/false/error]
	 */
	function saveResource(){
		$('#form-resource').submit();
	}


</script>
</html>