<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<%@include file="/inc/header.jsp"%>
	<meta charset="UTF-8">
	<title>e-Sciences+会议平台-回执订单核对</title>
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
				  <li><a href="#">回执订单核对</a></li>
				</ol>
			</div>
		</div>
		<div class="row-fluid example">
            <div class="col-md-12">
            	<div class="col-md-6">
    				<div class="row">
    					<div class="form-group">
	                        <div class="group">
	                            <div class="col-md-4">
	                                <select class="form-control" id="paytype_sel">
	                                    <option value="" selected="selected">选择支付方式</option>
										<option value="ALI_WEB">支付宝PC端</option>
										<option value="ALI_WAP">支付宝移动端</option>
										<option value="WX_NATIVE">微信扫描支付</option>
										<option value="WX_JSAPI">微信公众号支付</option>
										<option value="UN_WEB">银联PC端</option>
										<option value="UN_WAP">银联移动端</option>
	                                </select>
	                            </div>
	                        </div>
	                        <div class="group">
	                            <div class="col-md-4">
	                                <select class="form-control" id="paystatus_sel">
	                                    <option value="" selected="selected">选择支付状态</option>
	                                    <option value="true">已支付</option>
	                                    <option value="false">待支付</option>
	                                </select>
	                            </div>
	                        </div>
	                        <div class="group">
	                            <div class="col-md-4">
	                                <select class="form-control" id="refund_sel">
				                    	<option value="" selected="selected">选择退款状态</option>
				                    	<option value="true">已退款</option>
	                                    <option value="false">未退款</option>
				                    </select>
	                            </div>
	                        </div>

	                    </div>
    				</div>
        		</div>
        		<div class="col-md-6">
        			<div class="form-group">
                        <div class="group">
                        	<button class="btn btn-success btn-query">查询</button>
                        </div>
                    </div>
        		</div>
            </div><!--/span-->
        </div><!--/row-->
		<div class="row-fluid">
			<div class="col-md-12">
				<table class="table table-hover table-striped table-bordered">
					<thead style="background-color:#ccc">
						<tr>
				            <th width="60">序号</th>
				            <th style="min-width:80px;">支付类型</th>
				            <th>订单信息</th>
				            <th>总金额（元）</th>
				            <th>支付状态</th>
				            <!-- <th>操作情况</th> -->
				            <th>退款情况</th>
				            <th width="400" style="min-width: 400px;">会员信息</th>
				        </tr>
					</thead>
					<tbody id="data-content">
						
					</tbody>
					<tfoot>
						<tr>
							<td colspan="14">
								<!-- 分页 -->
								<div>
									<input type="hidden" id="totalPage-input" />
									<ul class="pagination">
									</ul>
								</div>
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

	var paytypes = {ALI_WEB:'<%=path%>/static/assets/img/ali.png',ALI_WAP:'<%=path%>/static/assets/img/aliwap.png',WX_NATIVE:'<%=path%>/static/assets/img/wechats.png',WX_JSAPI:'<%=path%>/static/assets/img/wechatgzh.png',UN_WEB:'<%=path%>/static/assets/img/unionpay.png',UN_WAP:'<%=path%>/static/assets/img/icon-unwap.png'};
	(function($){
		loadOrders(1,20);

		$('#icon-refresh,.btn-query').click(function(event) {
			loadOrders(1,20);
		});

	})(jQuery);

	function loadOrders(pagenum,limit){
		OrderService.getBCOrders($('#paytype_sel').val(),$('#paystatus_sel').val(),$('#refund_sel').val(),pagenum,limit,function(ret){
			var data = ret.data;
			var totalPage = Math.ceil(ret.count/limit);
			var tbody = $('#data-content');
			tbody.empty();
			for(var i=0;i<data.length;i++){
				var item = data[i];
				var order_status = '<span class="label label-info">待支付</span>';
				var order_revertstatus = "未撤销";
				var order_refundstatus = "未退款";
				var detail = eval('('+item.messageDetail+')');
				var reginfo = eval('('+item.optionalString+')')||'';
				var orderaccount = '';
				if(item.result){
					order_status = '<span class="label label-success">已支付</span>';
					orderaccount = detail['buyer_email']||'';//item.messageDetail;
				}
				if(item.revertResult){
					order_revertstatus = "已撤销";
				}
				if(item.refundResult){
					order_refundstatus = "已退款";
				}

				if(reginfo&&reginfo.register){
					var r = reginfo.register;
					reginfo = '<a href="javascript:;" data-oid="oid_'+item.objectId+'" onclick="showOptinfo(this)">'+r.nickname+'</a><span id="oid_'+item.objectId+'" style="">';
					reginfo += '<br/><b>电话：</b>'+r.telphone;
					reginfo += '<br/><b>邮箱：</b>'+r.email;
					reginfo += '<br/><b>地址：</b>'+r.address;
					reginfo += '<br/><b>发票抬头：</b>'+r.fptt;
					reginfo += '<br/><b>付款帐号：</b>'+orderaccount;
					reginfo += '</span>';
				} else {
					reginfo = '<a href="javascript:;" data-oid="oid_'+item.objectId+'" onclick="showOptinfo(this)">查看</a><span id="oid_'+item.objectId+'" style="display:none">';
					reginfo += '<br/><b>付款帐号：</b>'+orderaccount;
					reginfo += '<br/><b>附加信息：</b>'+item.optionalString;
					reginfo += '</span>';
				}

				var tr = $('<tr><td data-id="'+item.objectId*1+'">'+(i+1)+'</td>'
					+'<td width="100"><img src="'+paytypes[item.channel]+'" width="100"/></td>'
					+'<td width="300"><b>订单标题：</b>'+item.title+'<br/><b>系统单号：</b>'+item.billNo+'<br/><b>渠道单号：</b>'+item.channelTradeNo+'<br/><b>创建时间：</b>'+item.dateTime+'</td>'
					+'<td style="width: 100px;">'+item.totalFee/100+'</td>'
					+'<td style="width: 80px;">'+order_status+'</td>'
					// +'<td>'+order_revertstatus+'</td>'
					+'<td style="width: 80px;">'+order_refundstatus+'</td>'
					+'<td style="min-width: 400px;">'+reginfo+'</td></tr>');
				tbody.append(tr);
			}

			var html = [];
			html.push('<li class="prev '+(pagenum == 1?'disabled':'')+'"><a href="javascript:void(0);" id="page-first" onclick="'+(pagenum != 1?('loadOrders(1,20)'):'')+'">首页</a></li>');
			html.push('<li class="prev '+(pagenum == 1?'disabled':'')+'"><a href="javascript:void(0);" id="page-up" onclick="'+(pagenum != 1?('loadOrders('+(pagenum-1)+',20)'):'')+'">上一页</a></li>');
			html.push('<li class="next '+(pagenum == totalPage?'disabled':'')+'"><a href="javascript:void(0);" id="page-down" onclick="'+(pagenum != totalPage?('loadOrders('+(pagenum+1)+',20)'):'')+'">下一页</a></li>');
			html.push('<li class="'+(pagenum == totalPage?'disabled':'')+'"><a href="javascript:void(0);" id="page-last" onclick="'+(pagenum != totalPage?('loadOrders('+totalPage+',20)'):'')+'">末页</a></li>');
			html.push('<li class="disabled"><a>每页'+limit+'条记录 共<span id="page-totalPage">'+totalPage+'</span>页&nbsp;&nbsp;第<span id="page-currentPage">'+pagenum+'</span>页&nbsp;&nbsp;共<span id="page-totalRows">'+ret.count+'</span>条记录</a></li>');

			$('.pagination').html(html.join(''));
		});
	}

	function deleteOrder(oid){
		var order = {id:oid};
		OrderService.deleteOrder(order,function(msg){
			if(msg===true)
				loadOrders();
		});
	}

	function showOptinfo(obj){
		$('#'+$(obj).data('oid')).toggle();
	}
</script>
</html>