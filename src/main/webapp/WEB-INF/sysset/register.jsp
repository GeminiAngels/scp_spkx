<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<%@include file="/inc/header.jsp"%>
	<meta charset="UTF-8">
	<title>e-Sciences+会议平台-会员管理</title>
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
				  <li><a href="#">会员及缴费管理</a></li>
				</ol>
			</div>

			<div class="col-md-12">
				<div class="control-group alert alert-warning">
				    <div class="controls">
				        <div class="input-append">
				            <input type="text" class="form-control" style="width:160px;" id="condition" placeholder="手机号 / 邮箱 / 姓名"><button type="button" class="btn btn-default" id="btn-query">查询</button>
				        </div>
				    </div>
				</div>
			</div>
		</div>
		<div class="row-fluid">
			<div class="col-md-12">
				<table class="table table-hover table-striped table-bordered">
					<thead style="background-color:#ccc">
						<tr>
							<th>编码</th>
							<th>帐号</th>
							<th>姓名</th>
							<th>性别</th>
							<th>电话</th>
							<th>注册时间</th>
							<th>单位 | 职务</th>
							<%--<th>发票抬头</th>--%>
							<%--<th>缴费凭据</th>--%>
							<%--<th>缴费</th>--%>
							<th>启停 <a id="icon-refresh" class="cbtn o-cancel" title="重新加载表格数据"></a></th>
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
		</div>
		<div class="row-fluid">
			
		</div>
	</div>
</body>
<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/interface/RegisterService.js'></script>
<script type="text/javascript" src="<%=path%>/res/asset/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/res/asset/js/echartsHome.js"></script>
<script src="<%=path%>/res/asset/js/bootstrap.min.js"></script>
<script type="text/javascript">
	(function($){
		loadRegisters();

		// setInterval(function(){
		// 	loadRegisters();
		// },10*1000);

		$('#icon-refresh,#btn-query').click(function(event) {
			loadRegisters();
		});

	})(jQuery);

	function loadRegisters(){
		var condition = $('#condition').val();
		RegisterService.getRegisters(condition,function(data){
			var tbody = $('#data-content');
			tbody.empty();
			for(var i=0;i<data.length;i++){
				var item = data[i];
				console.log(item);
				var tr = $('<tr><td width="60">'+item.id*1+'</td>'
					+'<td>'+item.email+'</td>'
					+'<td>'+item.nickname+'</td>'
					+'<td>'+item.sex+'</td>'
					+'<td>'+item.telphone+'</td>'
					+'<td>'+(item.registertime?item.registertime.substr(0,16):'')+'</td>'
					+'<td>'+item.company+' | '+item.job+'</td>'
//					+'<td>'+item.fptt+'</td>'
//					+"<td >"+getfiles(item.tid,item.id,item.zfflag)+"</td>"
//					+"<td align='center' width='100' ><label  class='toggle"+(item.zfflag!=0?'':'  toggle-off') +"' title='已缴/未交'><input type='checkbox' onclick='confirmPayment(this,"+item.id*1+")' class='visi-hidden'></label></td>"
					+'<td align="center" width="100"><label class="toggle'
					+(item.status!=1?'':'  toggle-off')
					+'" title="启用/禁用"><input type="checkbox" onclick="updateRegisterStatus(this,'+item.id*1+')" class="visi-hidden"></label></td></tr>');
				tbody.append(tr);
			}
		});
	}
	function getfiles(tid,id,zfflag){
		if(tid){
			return "<a  style='color:#F00' href='<%=path%>/auth.do?method=download&fileid="+tid+"'>查看凭据</a>";
		}else{
			return "没有上传";
		}
	}
	//更改支付状态
	function confirmPayment(_self,registerid){
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
		RegisterService.confirmPayment(registerid,checked?0:1,function(msg){
//			loadRegisters();
		});
	}

	function updateRegisterStatus(_self,registerid){
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
		RegisterService.updateRegisterStatus(registerid,checked?1:0,function(msg){
		});
	}

	function deleteRegister(fileid){
		RegisterService.deleteFile(fileid,function(msg){
			if(msg===true)
				loadRegisters();
		});
	}
</script>
</html>