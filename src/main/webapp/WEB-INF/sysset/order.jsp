<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<%@include file="/inc/header.jsp"%>
	<meta charset="UTF-8">
	<title>e-Sciences+会议平台-订单管理</title>
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
				  <li><a href="#">订单管理</a></li>
				</ol>
			</div>
		</div>
		<div class="row-fluid">
			<div class="col-md-12">
				<table class="table table-hover table-striped table-bordered">
					<thead style="background-color:#ccc">
						<tr>
							<th style="width: 60px;">序号</th>
							<th style="width: 100px;">会员信息</th>
							<th style="min-width: 100px;">支付类型</th>
							<th style="width: 60px;">订单号</th>
							<th style="width: 100px;">订单时间</th>
							<th style="width: 80px;">订单描述</th>
							<th style="width: 80px;">订单金额</th>
							<!-- <th>对方帐号</th> -->
							<th style="width: 60px;">订单状态</th>
							<th>发票信息</th>
							<th>操作 <a id="icon-refresh" class="cbtn o-cancel" title="重新加载表格数据"></a></th>
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
<script type='text/javascript' src='<%=path%>/dwr/interface/OrderService.js'></script>
<script type="text/javascript" src="<%=path%>/res/asset/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/res/asset/js/echartsHome.js"></script>
<script src="<%=path%>/res/asset/js/bootstrap.min.js"></script>
<script type="text/javascript">
	(function($){
		loadOrders();

		$('#icon-refresh').click(function(event) {
			loadOrders();
		});

	})(jQuery);

	function loadOrders(){
		OrderService.getOrders(function(data){
			var tbody = $('#data-content');
			tbody.empty();
			for(var i=0;i<data.length;i++){
				var item = data[i];
				var orderstatus , ordertype;
				if(item.orderstatus == 1){
					orderstatus = '<span class="label label-success">支付成功</span>';
				} else if(item.orderstatus == -1) {
					orderstatus = '<span class="label label-warning">支付异常</span>';
				} else {
					orderstatus = '<span class="label label-info">等待支付</span>';
				}

				if(item.ordertype == 1){
					ordertype = '支付宝';
				} else if(item.ordertype == 2){
					ordertype = '微信支付';
				} else if(item.ordertype == 3){
					ordertype = '银联支付';
				} else {
					ordertype = '其他支付';
				}
				var tr = $('<tr><td data-id="'+item.id*1+'">'+(i+1)+'</td>'
					+'<td style="min-width: 100px;white-space:nowrap;"><b>姓名：</b>'+item.orderuname+'<br/><b>电话：</b>'+item.telphone+'<br/><b>邮箱：</b>'+item.email+'</td>'
					+'<td>'+ordertype+'</td>'
					+'<td>'+item.orderno+'</td>'
					+'<td>'+item.orderdate.substr(0,16)+'</td>'
					+'<td>'+item.ordertitle+'</td>'
					+'<td>'+item.ordermoney+'</td>'
					// +'<td>'+item.orderaccount+'</td>'
					+'<td>'+orderstatus+'</td>'
					+'<td><b>发票抬头：</b>'+item.fptt+'<br/><b>邮寄地址：</b>'+item.address+'</td>'
					// +'<td>'+(item.bmflag==1?'<span class="label label-danger">已报名</span>':'<span class="label">未报名</span>')+'</td>'
					+'<td align="center" width="150">'
					+('<button class="btn btn-small btn-default" onclick="deleteOrder(\''+item.id+'\')">移除</button>')
					//+(item.orderstatus!=1?('<button class="btn btn-small btn-default" onclick="deleteOrder(\''+item.id+'\')">移除</button>'):'')
					+' <button class="btn btn-small btn-default disabled">退款</button>'
					+'</td></tr>');
				tbody.append(tr);
			}
		});
	}

	function deleteOrder(oid){
		var order = {id:oid};
		OrderService.deleteOrder(order,function(msg){
			if(msg===true)
				loadOrders();
		});
	}
</script>
</html>