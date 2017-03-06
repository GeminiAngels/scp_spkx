<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<%@include file="/inc/header.jsp" %>
	<meta charset="UTF-8">
	<title>e-Sciences+会议平台-会员管理</title>
	<link href="<%=path%>/res/asset/css/font-awesome.min.css" rel="stylesheet">
	<link href="<%=path%>/res/asset/css/bootstrap.css" rel="stylesheet">
	<link href="<%=path%>/res/asset/css/echartsHome.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=path%>/res/css/base.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/res/lib/zTree/css/zTreeStyle/zTreeStyle.css">
	<link rel="stylesheet" type="text/css" href="<%= path %>/res/css/bootstrap-datetimepicker.min.css">
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
						<input type="text" class="form-control" style="width:160px;" id="condition"
						       placeholder="手机号 / 邮箱 / 姓名">
						<button type="button" class="btn btn-default" id="btn-query">查询</button>
						<button type="button" class="btn btn-default" id="btn-print">批量打印胸卡</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="col-md-4">
			<div style="position:fixed;width: 30%">
				<div class="alert alert-info" id="opt-info">点击右侧表格需要修改的行进行编辑</div>
				<form class="form-horizontal" id="form-user">
					<input type="hidden" id="id">
					<div class="form-group">
						<label for="gjzt" class="col-sm-3 control-label">稿件状态</label>
						<div class="col-sm-9">
							<select id="gjzt" name="gjzt">
								<option value="收稿">收稿</option>
								<option value="初审">初审</option>
								<option value="待交稿件处理费">待交稿件处理费</option>
								<option value="已交稿件处理费">已交稿件处理费</option>
								<option value="送审">送审</option>
								<option value="外审">外审</option>
								<option value="终审">终审</option>
								<option value="终审退修">终审退修</option>
								<option value="复审">复审</option>
								<option value="复审退修">复审退修</option>
								<option value="待发录用通知">待发录用通知</option>
								<option value="发录用通知">发录用通知</option>
								<option value="登记版面费">登记版面费</option>
								<option value="已到款">已到款</option>
								<option value="编辑加工">编辑加工</option>
								<option value="排版">排版</option>
								<option value="校对">校对</option>
								<option value="定稿">定稿</option>
								<option value="组版">组版</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="invoice" class="col-sm-3 control-label">会议费</label>
						<div class="col-sm-9">
							<select id="invoice" name="invoice">
								<option value="1400元">1400元</option>
								<option value="2000元">2000元</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="zfflag" class="col-sm-3 control-label">缴费状态</label>
						<div class="col-sm-9">
							<select id="zfflag" name="zfflag">
								<option value=0>未缴纳会议费</option>
								<option value=1>已缴纳会议费</option>
								<option value=2>收到电子版汇款单</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="yqhfszt" class="col-sm-3 control-label">电子版邀请函发送状态</label>
						<div class="col-sm-9">
							<select id="yqhfszt" name="yqhfszt">
								<option value="未发送">未发送</option>
								<option value="已发送，请查收电子邮箱">已发送，请查收电子邮箱</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="zzyqhfszt" class="col-sm-3 control-label">纸质版邀请函发送状态</label>
						<div class="col-sm-9">
							<select id="zzyqhfszt" name="zzyqhfszt">
								<option value="未邮寄">未邮寄</option>
								<option value="纸质版邀请函已经邮寄">纸质版邀请函已经邮寄</option>
								<option value="会议签到现场领取">会议签到现场领取</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="registertime" class="col-sm-3 control-label">注册时间</label>
						<div class="col-sm-9">
							<div class="input-group date" id="input-registertime">
								<input class="form-control input-sm" id="registertime" type="text" value=""
								       name="sampleTime" data-bv-feedbackicons="false">
								<span class="input-group-addon"><span
										class="glyphicon glyphicon-calendar"></span></span>
							</div>
							<%--<input type="text" class="form-control" id="registertime" placeholder="建议英文缩写帐号">--%>
						</div>
					</div>
					<div class="form-group">
						<label for="hwzbz" class="col-sm-3 control-label">会务组备注</label>
						<div class="col-sm-9">
							<textarea type="text" class="form-control" id="hwzbz" placeholder="会务组备注"></textarea>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-9">
							<%--<a type="reset" class="cbtn o-plus" id="btn-user-add" title="新增（清空表单）"></a>--%>
							<a type="button" class="cbtn o-ok pull-right" id="btn-commit" title="提交"></a>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="col-md-8">
			<table class="table table-hover table-striped table-bordered">
				<thead style="background-color:#ccc">
				<tr>
					<th width="30"><input type="checkbox" class="input-control" id="table-checkbox-header" /></th>
					<th>编码</th>
					<th>姓名</th>
					<th>个人信息</th>
					<%--<th>电话</th>--%>
					<%--<th>邮箱</th>--%>
					<%--<th>注册时间</th>--%>
					<th>工作信息</th>
					<th>邀请函发送状态</th>
					<th>稿件/会议费/缴费状态</th>
					<th>会务组备注</th>
					<%--<th>发票抬头</th>--%>
					<%--<th>缴费凭据</th>--%>
					<%--<th>缴费</th>--%>
					<th>启停<a id="icon-refresh" class="cbtn o-cancel" title="重新加载表格数据"></a></th>
					<%--<th>操作 </th>--%>
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
<script type="text/javascript" src="<%=path%>/res/asset/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/res/js/jquery.maskedinput.js"></script>
<script type="text/javascript" src="<%= path %>/res/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%= path %>/res/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
	(function ($) {
		loadRegisters();
		$('#id').val('');
		// setInterval(function(){
		// 	loadRegisters();
		// },10*1000);

		$('#icon-refresh,#btn-query').click(function (event) {
			loadRegisters();
		});

		$("#input-registertime").datetimepicker({
			minView: 0,//日期时间选择器所能够提供的最精确的时间选择视图。
			format: 'yyyy-mm-dd hh:ii',
			weekStart: 1,//一周从哪一天开始。0（星期日）到6（星期六）
			startView: 2,//日期时间选择器打开之后首先显示的视图。0 or 'hour';1 or 'day' ;2 or 'month';3 or 'year';4 or 'decade'
			forceParse: false,
			language: 'zh-CN',
			autoclose: true
		});

	})(jQuery);

	//提交按钮
	$('#btn-commit').click(function (event) {
		saveRegister();
	});
	//更新用户信息
	function saveRegister() {
		var register = {
			id: $('#id').val(),
			gjzt: $('#gjzt').val() ? $('#gjzt').val() : '',
			zfflag: $('#zfflag').val() ? $('#zfflag').val() : '',
			invoice: $('#invoice').val() ? $('#invoice').val() : '',
			yqhfszt: $('#yqhfszt').val() ? $('#yqhfszt').val() : '',
			zzyqhfszt: $('#zzyqhfszt').val() ? $('#zzyqhfszt').val() : '',
			registertime: $('#registertime').val() ? $('#registertime').val() : '',
			hwzbz: $('#hwzbz').val() ? $('#hwzbz').val() : ''
		};
		if (register.id) {
			RegisterService.updateRegisterInfo(register, function (msg) {
				if (msg === true) {
					loadRegisters();
					alert("修改完成!");
				} else {
					alert("信息提交错误!");
				}


			});
		} else {
			alert("请点击需要修改的用户!");
		}
	}
	//加载表格所有数据
	function loadRegisters() {
		var condition = $('#condition').val();
		RegisterService.getRegisters(condition, function (data) {
			var tbody = $('#data-content');
			tbody.empty();
			for (var i = 0; i < data.length; i++) {
				var item = data[i];
				if (!item.yqhfszt) item.yqhfszt = '';
				if (!item.zzyqhfszt) item.zzyqhfszt = '';
				if (item.zfflag == 0) {
					item.zfflag = '未缴纳会议费';
				} else if (item.zfflag == 1) {
					item.zfflag = '已缴纳会议费';
				} else if (item.zfflag == 2) {
					item.zfflag = '收到电子版汇款单';
				} else {
					item.zfflag = '';
				}

				var tr = $('<tr dataId='+item.id+'>' +
					'<td width="30"><input class="input-control" type="checkbox" value="" /></td>'
					+   '<td width="60">' + item.id * 1 + '</td>'
					+ '<td>' + item.nickname + '</td>'
//					+'<td>'+item.sex+'</td>'
//					+'<td>'+item.telphone+'</td>'
//					+'<td>'+item.email+'</td>'
					+ '<td>电话:' + item.telphone + ' <br>邮箱:' + item.email + ' <br>性别:' + item.sex + ' <br>注册时间:' + (item.registertime ? item.registertime.substr(0, 16) : '') + '</td>'
//					+'<td>'+(item.registertime?item.registertime.substr(0,16):'')+'</td>'

					+ '<td>单位:' + item.company + ' <br>职务:' + item.job + '</td>'
					+ '<td>电子版:' + item.yqhfszt + ' <br>纸质版:' + item.zzyqhfszt + '</td>'
					+ '<td>稿件状态:' + (item.gjzt ? item.gjzt : "") + ' <br>会议费:' + (item.invoice ? item.invoice : "") + ' <br>缴费状态:' + item.zfflag + '</td>'
					+ '<td>' + (item.hwzbz ? item.hwzbz : "") + '</td>'
//					+'<td>'+item.fptt+'</td>'
//					+"<td >"+getfiles(item.tid,item.id,item.zfflag)+"</td>"
//					+"<td align='center' width='100' ><label  class='toggle"+(item.zfflag!=0?'':'  toggle-off') +"' title='已缴/未交'><input type='checkbox' onclick='confirmPayment(this,"+item.id*1+")' class='visi-hidden'></label></td>"
					+ '<td align="center" width="100"><label class="toggle'
					+ (item.status != 1 ? '' : '  toggle-off')
					+ '" title="启用/禁用"><input type="checkbox" onclick="updateRegisterStatus(this,' + item.id * 1 + ')" class="visi-hidden"></label></td></tr>');
				tbody.append(tr);
			}
			$("#data-content tr").bind("click", function () {
				var dataId = $(this).find("td").eq(1).text();
				getRegisterById(dataId);
			});
		});
	}
	//加载form表单数据 根据数据id
	function getRegisterById(dataId) {
		RegisterService.getRegisterById(dataId, function (register) {
			$('#id').val(register.id * 1);
			$('#gjzt').val(register.gjzt);
			$('#zfflag').val(register.zfflag);
			$('#invoice').val(register.invoice);
			$('#yqhfszt').val(register.yqhfszt);
			$('#zzyqhfszt').val(register.zzyqhfszt);
			$('#registertime').val(register.registertime ? (register.registertime).format('yyyy-MM-dd hh:mm') : '');
			$('#hwzbz').val(register.huzbz);
			$('#opt-info').html('当前编辑会员姓名：' + register.nickname);
		});
	}

	function getfiles(tid, id, zfflag) {
		if (tid) {
			return "<a  style='color:#F00' href='<%=path%>/auth.do?method=download&fileid=" + tid + "'>查看凭据</a>";
		} else {
			return "没有上传";
		}
	}
	//更改支付状态
	function confirmPayment(_self, registerid) {
		var that = $(_self);
		var checked = !that.parent().hasClass('toggle-off');
		if (checked) {
			that.prop('checked', 'checked');
			that.parent().removeClass('toggle');
			that.parent().addClass('toggle toggle-off');
		} else {
			that.removeProp('checked');
			that.parent().removeClass('toggle toggle-off');
			that.parent().addClass('toggle');
		}
		RegisterService.confirmPayment(registerid, checked ? 0 : 1, function (msg) {
//			loadRegisters();
		});
	}

	function updateRegisterStatus(_self, registerid) {
		var that = $(_self);
		var checked = !that.parent().hasClass('toggle-off');
		if (checked) {
			that.prop('checked', 'checked');
			that.parent().removeClass('toggle');
			that.parent().addClass('toggle toggle-off');
		} else {
			that.removeProp('checked');
			that.parent().removeClass('toggle toggle-off');
			that.parent().addClass('toggle');
		}
		RegisterService.updateRegisterStatus(registerid, checked ? 1 : 0, function (msg) {
		});
	}

	function deleteRegister(fileid) {
		RegisterService.deleteFile(fileid, function (msg) {
			if (msg === true)
				loadRegisters();
		});
	}
	/**
	 * 数据全选/全不选
	 */
	$('#table-checkbox-header').change(function() {
		$('td > input').prop('checked', this.checked);
	});
	/**
	 *打印二维码按钮
	 **/
	$("#btn-print").click(function () {
		var ids = [];
		$('td > input:checked').each(function(){
			if($(this).parent().parent().attr('dataId'))
				ids.push($(this).parent().parent().attr('dataId'));
			else
				$(this).parent().parent().remove();
		});
		window.ids = ids.join(",");
		openwindow('<%=path%>/report/reportJsp/ewm.jsp?time='+Math.random()*10000000000000000,"",1010,600);

	});
	// 对Date的扩展，将 Date 转化为指定格式的String
	// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
	// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
	// 例子：
	// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
	// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
	Date.prototype.format = function (fmt) { //author: meizz
		var o = {
			"M+": this.getMonth() + 1,                 //月份
			"d+": this.getDate(),                    //日
			"h+": this.getHours(),                   //小时
			"m+": this.getMinutes(),                 //分
			"s+": this.getSeconds(),                 //秒
			"q+": Math.floor((this.getMonth() + 3) / 3), //季度
			"S": this.getMilliseconds()             //毫秒
		};
		if (/(y+)/.test(fmt))
			fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
		for (var k in o)
			if (new RegExp("(" + k + ")").test(fmt))
				fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
		return fmt;
	};
	/**
	 * window.open打开新页面
	 * @param url 转向网页的地址
	 * @param name 网页名称，可为空
	 * @param iWidth 弹出窗口的宽度
	 * @param iHeight 弹出窗口的高度
	 */
	function openwindow(url, name, iWidth, iHeight) {
		//window.screen.height获得屏幕的高，
		//window.screen.width获得屏幕的宽
		var iTop = (window.screen.height - 30 - iHeight) / 2; //获得窗口的垂直位置;
		var iLeft = (window.screen.width - 10 - iWidth) / 2; //获得窗口的水平位置;
		window.open(url, name, 'height=' + iHeight + ',,innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',toolbar=no,menubar=no,scrollbars=yes,resizeable=no,location=no,status=no');
	}
</script>
</html>