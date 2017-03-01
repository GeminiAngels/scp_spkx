<%@page contentType="text/html;charset=utf-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
	<meta name="description" content="第三届食品科学与人类健康国际研讨会">
	<meta name="author" content="北京国科智地科技有限公司">
	<link rel="shortcut icon" href="<%=path%>/static/assets/ico/favicon.ico">

	<title>第三届食品科学与人类健康国际研讨会</title>

	<!-- Bootstrap core CSS -->
	<link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=path%>/res/css/bootstrap-datetimepicker.min.css">

	<link rel="stylesheet" type="text/css" href="<%=path%>/static/spkx/css/style.css" />

	<!-- Custom styles for this template -->
	<link href="<%=path%>/static/css/font-awesome.min.css" rel="stylesheet">

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>

<body>
<!-- 头部模块 -->
<%@include file="/inc/headbar.jsp" %>

<div id="contactWrap">
	<form id="registerForm">
		<div class="overlay">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<h2 class="sectionTitle">
							${not empty register?'个人中心':'用户注册'}
						</h2>
					</div>
				</div>
				<div class="row">
					<!-- <c:if test="${register.zfflag ne '1'}"> -->
					<div class="col-sm-4 col-sm-offset-2">
						<div class="inputContainer">
							<label>姓名：</label>
							<input type="text" name="nickname" id="nickname" class="form-control" autocomplete="off" value="${register.nickname}" ${not empty register?'disabled="disabled"':''}>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="inputContainer">
							<label class="screen-reader-text">性别：</label>
							<div class="form-control" style="line-height:20px;">
								<label class="radio-inline">
									<input type="radio" name="sex" id="sex1" value="男" ${register.sex eq '男' or empty regisgter?'checked':''} ${not empty register?'disabled="disabled"':''}> 男
								</label>
								<label class="radio-inline">
									<input type="radio" name="sex" id="sex2" value="女" ${register.sex eq '女'?'checked':''} ${not empty register?'disabled="disabled"':''}> 女
								</label>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-sm-offset-2 register-adv" style="${empty register?'':'display:none'}">
						<div class="inputContainer">
							<label class="screen-reader-text">会员密码：</label>
							<input type="password" name="password" id="password" value="" class="form-control" autocomplete="off"  />
						</div>
					</div>
					<div class="col-sm-4 register-adv" style="${empty register?'':'display:none'}">
						<div class="inputContainer">
							<label class="screen-reader-text">确认密码：</label>
							<input type="password" name="repassword" id="repassword" value="" class="form-control" autocomplete="off"  />
						</div>
					</div>
					<div class="col-sm-4 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">职务：</label>
							<input type="text" name="job" id="job" class="form-control" autocomplete="off" value="${register.job}" ${not empty register?'disabled="disabled"':''}>
							<!-- <select id="job" name="job" class="form-control" value="${register.job}" ${not empty register?'disabled="disabled"':''}>
								<c:if test="${empty register}">
								<option value="无">无</option>
								<option value="初级">初级</option>
								<option value="中级" selected="selected">中级</option>
								<option value="副高">副高</option>
								<option value="正高">正高</option>
								</c:if>
								<c:if test="${not empty register}">
								<option value="${register.job}" selected="selected">${register.job}</option>
								</c:if>
							</select> -->
						</div>
					</div>
					<div class="col-sm-4">
						<div class="inputContainer">
							<label class="screen-reader-text">职称：</label>
							<select id="title" name="title" class="form-control" value="${register.title}" ${not empty register?'disabled="disabled"':''}>
								<c:if test="${empty register}">
									<option value="">请选择职称</option>
									<option value="教授">教授</option>
									<option value="副教授">副教授</option>
									<option value="讲师">讲师</option>
									<option value="助理讲师">助理讲师</option>
									<option value="研究员">研究员</option>
									<option value="副研究员">副研究员</option>
									<option value="助理研究员">助理研究员</option>
									<option value="研究实习员">研究实习员</option>
									<option value="教授级高级工程师">教授级高级工程师</option>
									<option value="高级工程师">高级工程师</option>
									<option value="工程师">工程师</option>
									<option value="助理工程师">助理工程师</option>
									<option value="高级教师">高级教师</option>
									<option value="高级农艺师">高级农艺师</option>
									<option value="农艺师">农艺师</option>
									<option value="助理农艺师">助理农艺师</option>
									<option value="其他">其他</option>
									<option value="其他（研究生等）">其他（研究生等）</option>
								</c:if>
								<c:if test="${not empty register}">
									<option value="${register.title}" selected="selected">${register.title}</option>
								</c:if>
							</select>
						</div>
					</div>
					<div class="col-sm-8 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">单位：</label>
							<input type="text" name="company" id="company" value="${register.company}" class="form-control" autocomplete="off" ${not empty register?'disabled="disabled"':''}/>
						</div>
					</div>
					<div class="col-sm-4 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">办公电话：</label>
							<input type="text" name="officephone" id="officephone" class="form-control" autocomplete="off" ${not empty register?'disabled="disabled"':''} value="${register.officephone}"/>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="inputContainer">
							<label class="screen-reader-text">手机：</label>
							<input type="text" name="telphone" id="telphone" value="${register.telphone}" class="form-control" autocomplete="off" ${not empty register?'disabled="disabled"':''}/>
						</div>
					</div>
					<div class="col-sm-8 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">Email：</label>
							<input type="text" name="email" id="email" class="form-control" autocomplete="off" ${not empty register?'disabled="disabled"':''} value="${register.email}"/>
							<p style="color:red">请尽量不要选择QQ邮箱，否则可能无法收到会务组发出的邮件</p>
						</div>
					</div>
					<div class="col-sm-4 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">联系地址：</label>
							<input type="text" name="address" id="address" value="${register.address}" class="form-control" autocomplete="off" ${not empty register?'disabled="disabled"':''}/>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="inputContainer">
							<label class="screen-reader-text">邮编：</label>
							<input type="text" name="postcode" id="postcode" value="${register.postcode}" class="form-control" autocomplete="off" ${not empty register?'disabled="disabled"':''}/>
						</div>
					</div>
					<div class="col-sm-4 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">论文张贴否：</label>
							<div class="form-control" style="line-height:20px;border:none">
								<label class="radio-inline">
									<input type="radio" name="sfztlw" id="sfztlw1" value="是" ${register.sfztlw eq '是'?'checked':''} ${not empty register?'disabled="disabled"':''}> 是
								</label>
								<label class="radio-inline">
									<input type="radio" name="sfztlw" id="sfztlw2" value="否" ${empty register or register.sfztlw eq '否'?'checked':''}  ${not empty register?'disabled="disabled"':''}> 否
								</label>
							</div>
						</div>
					</div>
					<div id="lw_area" class="col-sm-4" style="${register.sfztlw eq '是'?'':'display:none'}">
						<c:if test="${not empty thesis}">
							<div class="inputContainer">
								<label class="screen-reader-text">我的论文：</label>
								<a class="form-control" style="line-height: 23px;" href="<%=path%>/auth.do?method=download&fileid=${thesis.id}">${thesis.filename}.${thesis.type}</a>
							</div>
						</c:if>
						<c:if test="${empty thesis}">
							<div class="inputContainer">
								<label class="screen-reader-text">论文上传：</label>
								<input type="file" name="thesis" id="thesis" class="form-control" ${not empty register?'disabled="disabled"':''}/>
							</div>
						</c:if>
					</div>
					<div class="col-sm-8 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">申请会上发言否：</label>
							<div class="form-control" style="line-height:20px;border:none">
								<label class="radio-inline">
									<input type="radio" name="sfsqhyfy" id="sfsqhyfy1" value="是" ${register.sfsqhyfy eq '是'?'checked':''} ${not empty register?'disabled="disabled"':''}> 是
								</label>
								<label class="radio-inline">
									<input type="radio" name="sfsqhyfy" id="sfsqhyfy2" value="否" ${empty register or register.sfsqhyfy eq '否'?'checked':''}  ${not empty register?'disabled="disabled"':''}> 否
								</label>
							</div>
						</div>
					</div>
					<div id="fy_area" class="alert alert-warning col-sm-8 col-sm-offset-2" style="${register.sfsqhyfy eq '是'?'':'display:none'}">
						<div class="inputContainer">
							<label class="screen-reader-text">发言题目：</label>
							<input type="text" name="fytm" id="fytm" value="${register.fytm}" class="form-control" autocomplete="off" ${not empty register?'disabled="disabled"':''}/>
						</div>
						<div class="inputContainer">
							<label class="screen-reader-text">发言内容摘要（1000字以内）：</label>
							<textarea name="fynrzy" id="fynrzy" class="form-control" autocomplete="off" ${not empty register?'disabled="disabled"':''}>${register.fynrzy}</textarea>
						</div>
					</div>
					<div class="col-sm-8 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">发表论文否：</label>
							<div class="form-control" style="line-height:20px;border:none">
								<label class="radio-inline">
									<input type="radio" name="sffblw" id="sffblw1" value="是" ${register.sffblw eq '是'?'checked':''} ${not empty register?'disabled="disabled"':''}> 是
								</label>
								<label class="radio-inline">
									<input type="radio" name="sffblw" id="sffblw2" value="否" ${empty register or register.sffblw eq '否'?'checked':''}  ${not empty register?'disabled="disabled"':''}> 否
								</label>
							</div>
						</div>
					</div>
					<div id="gj_area" class="alert alert-warning col-sm-8 col-sm-offset-2" style="${register.sffblw eq '是'?'':'display:none'}">
						<div class="inputContainer">
							<label class="screen-reader-text">投稿期刊：</label>
							<!-- <input type="text" name="journalname" id="journalname" value="${register.journalname}" class="form-control" autocomplete="off" ${not empty register?'disabled="disabled"':''}/> -->
							<select id="journalname" name="journalname" class="form-control" value="${register.journalname}" ${not empty register?'disabled="disabled"':''}>
								<c:if test="${empty register}">
									<option value="">请选择投稿期刊</option>
									<option value="《食品科学》">《食品科学》</option>
									<option value="《肉类研究》">《肉类研究》</option>
									<option value="《乳业科学与技术》">《乳业科学与技术》</option>
									<option value="《Food Science and Human Wellness》">《Food Science and Human Wellness》</option>
								</c:if>
								<c:if test="${not empty register}">
									<option value="${register.journalname}" selected="selected">${register.journalname}</option>
								</c:if>
							</select>
						</div>
						<div class="inputContainer">
							<label class="screen-reader-text">稿件编号：</label>
							<input type="text" name="gjbh" id="gjbh" value="${register.gjbh}" class="form-control" autocomplete="off" ${not empty register?'disabled="disabled"':''}/>
						</div>

						<div class="inputContainer">
							<label class="screen-reader-text">论文题目：</label>
							<input type="text" name="gjtm" id="gjtm" value="${register.gjtm}" class="form-control" autocomplete="off" ${not empty register?'disabled="disabled"':''}/>
						</div>
					</div>
					<div class="col-sm-4 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">住宿要求：</label>
							<div class="form-control" style="line-height:20px;border:none">
								<label class="radio-inline">
									<input type="radio" name="zsyq" id="zsyq1" value="不住宿" ${empty register or register.zsyq eq '不住宿'?'checked':''} ${not empty register?'disabled="disabled"':''}> 不住宿
								</label>
								<label class="radio-inline">
									<input type="radio" name="zsyq" id="zsyq2" value="标间" ${register.zsyq eq '标间'?'checked':''} ${not empty register?'disabled="disabled"':''}> 标间
								</label>
								<label class="radio-inline">
									<input type="radio" name="zsyq" id="zsyq3" value="单床合住" ${register.zsyq eq '单床合住'?'checked':''} ${not empty register?'disabled="disabled"':''}> 单床合住
								</label>
							</div>
						</div>
					</div>
					<div id="zssj_area" class="col-sm-4" style="display:none;">
						<label class="screen-reader-text">住宿时间：</label>
						<table style="width:100%">
							<tr>
								<td class="date">
									<input type="text" name="zskssj" id="zskssj" value="${fn:substring(register.zskssj,0,10)}" class="form-control" style="width:130px;" autocomplete="off" ${not empty register?'disabled="disabled"':''}/>
								</td>
								<td width="20" style="padding:2px 4px">到</td>
								<td align="right">
									<input type="text" name="zsjssj" id="zsjssj" value="${fn:substring(register.zsjssj,0,10)}" class="form-control" style="width:130px;" autocomplete="off" ${not empty register?'disabled="disabled"':''}/>
								</td>
							</tr>
						</table>
					</div>
					<div class="col-sm-8 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text"><i>备注：</i></label>
							<textarea name="message" id="message" class="form-control" autocomplete="off" ${not empty register?'disabled="disabled"':''}>${register.message}</textarea>
						</div>
					</div>
					<!-- <div class="col-sm-4 col-sm-offset-2" id="register-pay">
						<div class="inputContainer">
						<label class="screen-reader-text">是否需要发票：</label>
						<div class="form-control" style="line-height:20px;border:none">
							<label class="radio-inline">
							  <input type="radio" name="invoice" id="invoice1" value="不需要" ${not empty register and register.invoice eq '不需要'?'checked="checked"':''}> 不需要
							</label>
							<label class="radio-inline">
							  <input type="radio" name="invoice" id="invoice2" value="需要" ${empty register || register.invoice ne '不需要'?'checked="checked"':''}> 需要
							</label>
						</div>
						</div>
					</div>
					<div class="col-sm-4 check-group" ${not empty register and register.invoice eq '不需要'?'style="display:none"':''}>
						<div class="inputContainer">
						<label class="screen-reader-text">开票内容：</label>
						<div class="form-control" style="line-height:20px;">
							<label class="radio-inline">
							  <input type="checkbox" name="invoice_chk" value="会议费" ${fn:indexOf(register.invoice,"会议费") >= 0?'checked="checked"':''}> 会议费
							</label>
							<label class="radio-inline">
							  <input type="checkbox" name="invoice_chk" value="实习费" ${fn:indexOf(register.invoice,"实习费") >= 0?'checked="checked"':''}> 实习费
							</label>
						</div>
						</div>
					</div>
					<div class="col-sm-8 col-sm-offset-2">
						<div class="inputContainer check-group" ${not empty register and register.invoice eq '不需要'?'style="display:none"':''}>
						<label class="screen-reader-text">发票抬头（单位名称）：</label>
							<input type="text" name="fptt" id="fptt" value="${register.fptt}" class="form-control" autocomplete="off" placeholder="需要发票请填写发票抬头" />
						</div>
						<div class="inputContainer">
						<label id="invoice_msg" class="screen-reader-text" style="color:red;">
						<c:if test="${not empty register and register.invoice eq '不需要'}">说明：请与客服联系线下付款！
						</c:if>
						<c:if test="${empty register or register.invoice ne '不需要'}">说明：会议费发票由北京国科智地科技有限公司开具，实习费由当地旅行社开具。
						</c:if>
						</label>
						</div>
					</div> -->

					<!-- <c:if test="${not empty register}">
					<div class="col-sm-8 col-sm-offset-2 register-pay" ${register.invoice eq '不需要'?'style="display:none"':''}>
						<div class="inputContainer">
						<label class="screen-reader-text">缴费标准：</label>
						<div class="form-control" style="line-height:20px;border:none">
							<label class="radio-inline">
							  <input type="radio" name="ordermoney" id="ordermoney1" value="1800"> 学生 1800 元
							</label>
							<label class="radio-inline">
							  <input type="radio" name="ordermoney" id="ordermoney2" value="2000" checked="checked"> 老师 2000 元
							</label>
						</div>
						</div>
					</div>

					<div class="col-sm-8 col-sm-offset-2 register-pay" ${ register.invoice eq '不需要'?'style="display:none"':''}>
						<div class="inputContainer">
						<label class="screen-reader-text">支付方式：</label><span style="font-weight:bold;color:red;">银联支付售后开通</span>
						<div class="form-control" style="line-height:20px;border:none;height:80px;">
							<label class="radio-inline">
							  <input type="radio" name="ordertype" id="ordertype1" value="1" checked="checked"><img id="zftb_zfb" src="<%=path%>/static/assets/img/ali.png" style="width:100px;"/>
							</label>
							<label class="radio-inline">
							  <input type="radio" name="ordertype" id="ordertype2" value="2"><img id="zftb_wx" src="<%=path%>/static/assets/img/wechats.png" style="width:100px;"/>
							</label>
							<p class="pc_hide"></p>
							<label class="radio-inline">
							  <input type="radio" name="ordertype" id="ordertype3" value="3"><img id="zftb_yl" src="<%=path%>/static/assets/img/unionpay.png" style="width:100px;"/>
							</label>
						</div>
						</div>
					</div>
					</c:if> -->

					<div class="col-sm-8 col-sm-offset-2">
						<c:if test="${empty register}">
							<button id="registerBtn" name="submit" type="button" class="btn btn-primary btn-lg">提交报名</button>
						</c:if>
						<!-- <c:if test="${not empty register}">
						<button id="payBtn" name="submit" type="button" class="btn btn-primary btn-lg" ${register.zfflag eq '1'?'disabled="disabled"':''}>${register.invoice eq '不需要'?'确定':'生成订单并支付'}</button>
						</c:if> -->
					</div>
					<!-- </c:if> -->
					<!-- <c:if test="${register.zfflag eq '1'}">
						<h3 style="padding-left:10px;">个人信息</h3>
						<table id="user_table" class="table table-bordered table-stripted table-hover">
							<tr>
								<th>学员姓名</th>
								<td style="min-width: 100px;">${register.nickname}</td>
								<th>性　　别</th>
								<td>${register.sex}</td>
							</tr>
							<tr>
								<th>学　　历</th>
								<td>${register.degree}</td>
								<th>职　　称</th>
								<td>${register.job}</td>
							</tr>
							<tr>
								<th>　 Email</th>
								<td>${register.email}</td>
								<th>联系电话</th>
								<td>${register.telphone}</td>
							</tr>
							<tr>
								<th>单　　位</th>
								<td>${register.company}</td>
								<th>邮　　编</th>
								<td>${register.postcode}</td>
							</tr>
							<tr>
								<th>地　　址</th>
								<td colspan="3">${register.address}</td>
							</tr>
							<tr>
								<th>住宿要求</th>
								<td>${register.zsyq}</td>
								<th>实习情况</th>
								<td>${register.sxxl}</td>
							</tr>
							<tr>
								<th>发票抬头</th>
								<td><c:if test="${register.invoice ne '不需要'}">${register.fptt}</c:if>&nbsp;</td>
								<th>开票内容</th>
								<td>${register.invoice}</td>
							</tr>
						</table>
						<h3 style="padding-left:10px;">我的订单</h3>
						<div class="alert alert-info">提示：如“待支付”订单长时间未完成支付，请移除订单重新支付；如订单信息与实际付款信息不符，请<a href="javascript:;" class="btn-newpay"> 点击重新支付</a></div>
						<table id="pay_listtable" class="table table-bordered table-stripted table-hover">
							<tr>
								<th class="pc_show">会员名</th>
								<th class="pc_show">支付方式</th>
								<th class="pc_show">订单时间</th>
								<th class="pc_hide" style="min-width: 120px;">订单信息</th>
								<th style="min-width: 80px;">金额(元)</th>
								<th class="pc_show">支付帐号</th>
								<th>支付状态</th>
								<th style="min-width: 60px;">操作</th>
							</tr>
							<c:forEach items="${orderList}" var="order">
							<tr>
								<td class="pc_show">
									${order.orderuname}
								</td>
								<td class="pc_show">
									<c:if test="${order.ordertype eq '1'}">支付宝</c:if>
									<c:if test="${order.ordertype eq '2'}">微信支付</c:if>
									<c:if test="${order.ordertype eq '3'}">银联支付</c:if>
								</td>
								<td class="pc_show">
									${fn:substring(order.orderdate,5,16)}
								</td>
								<td class="pc_hide" style="text-align: left">
									<b>姓名</b>：${order.orderuname}
									<div></div>
									<b>方式</b>：<c:if test="${order.ordertype eq '1'}">支付宝</c:if>
									<c:if test="${order.ordertype eq '2'}">微信支付</c:if>
									<c:if test="${order.ordertype eq '3'}">银联支付</c:if>
									<div></div>
									<b>时间</b>：${fn:substring(order.orderdate,5,16)}
								</td>
								<td>${order.ordermoney}</td>
								<td class="pc_show">${order.orderaccount}</td>
								<td>
									<c:if test="${order.orderstatus eq '0'}"><i class="label label-info">待支付</i></c:if>
									<c:if test="${order.orderstatus eq '1'}"><span class="label label-success">支付成功<span></c:if>
									<c:if test="${order.orderstatus eq '-1'}">><span class="label label-warning">发生异常</span></c:if>
								</td>
								<td>
									<c:if test="${order.orderstatus ne '1'}">
									<a class="btn btn-sm btn-default btn-deleteorder" data-id="${order.id}" data-orderregisterid="${order.orderregisterid}">移除</a>
									</c:if>
									<a class="btn btn-sm btn-default btn-reback disabled">退款</a>
								</td>
							</tr>
							</c:forEach>
							<c:if test="${empty orderList or fn:length(orderList) eq '0'}">
								<tr><td style="text-align:center" colspan="7">没有任何订单，您可以<a href="javascript:;" class="btn-newpay"> 发起重新支付</a></td></tr>
							</c:if>
						</table>
					</c:if> -->
				</div>
			</div>
		</div>
	</form>
</div> <!-- /contactWrap -->
<%@include file="/inc/footer.jsp"%>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/util.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/interface/RegisterService.js'></script>
<c:if test="${not empty register}">
	<script type='text/javascript' src='<%=path%>/dwr/interface/OrderService.js'></script>
</c:if>
<script src="<%=path%>/static/js/jquery-1.11.1.min.js"></script>
<script src="<%=path%>/static/js/bootstrap.min.js"></script>
<!-- bootstrap日期控件 -->
<script src="<%=path%>/res/js/bootstrap-datetimepicker.min.js"></script>
<!-- 格式化输入 -->
<script src="<%=path%>/res/js/jquery.inputmask.bundle.js"></script>
<script src="<%=path%>/res/js/common.js"></script>
<script src="<%=path%>/static/spkx/js/biz.js"></script>

<script type="text/javascript">
	function not_pc(){
		var os = new Array("Android","iPhone","Windows Phone","iPod","BlackBerry","MeeGo","SymbianOS");  // 其他类型的移动操作系统类型，自行添加
		var info = navigator.userAgent;
		var len = os.length;
		for (var i = 0; i<len; i++) {
			if (info.indexOf(os[i]) >= 0){
				return true;
			}
		}
		return false;
	}

	$(document).ready(function() {
		if(not_pc()){
			$('.pc_show').hide();
			$('#zftb_zfb').attr('src','<%=path%>/static/assets/img/aliwap.png');
			$('#zftb_wx').attr('src','<%=path%>/static/assets/img/wechatgzh.png');
			$('#zftb_yl').attr('src','<%=path%>/static/assets/img/icon-unwap.png');
		} else {
			$('.pc_hide').hide();
		}

		$('.btn-newpay').off('click').on('click',function(e){
			var register = {
				id : '${register.id}',
				zfflag : '0'
			}
			RegisterService.updateRegisterPaystatus(register,function(ret){
				if(ret)
					window.location.reload();
			});
		});

		$('.btn-deleteorder').off('click').on('click',function(e){
			var order = {id:$(this).data('id'),orderregisterid:$(this).data('orderregisterid')};
			OrderService.deleteOrder(order,function(ret){
				if(ret){
					window.location.reload();
				}
			});
		});

		$('#isAutoLogin').on('change',function(e){
			if($(this).prop('checked')){
				$('.register-adv').show();
			} else {
				$('.register-adv').hide();
			}
		});

		$('#payBtn').off('click').on('click',function(e){
			var that = this;
			var invoice = getInvoiceValue();
			var fptt = $('#fptt').val();
			var rid = '${register.id}';

			if($('input[name="invoice"]:checked').val() == '需要'){
				if(!$('input[name="invoice_chk"]:checked').val()){
					alert('请选择开票内容！');
					return;
				}
				if(!fptt){
					$('#fptt').focus().attr('placeholder','请填写发票抬头！');
					return;
				}
			}

			//先更新会员发票信息，再生成支付订单
			$(that).addClass('disabled');
			RegisterService.updateRegisterInvoice(invoice,fptt,rid,function(success){
				//如果不需要发票则不生成订单
				if(success){
					if(invoice=='不需要'){
						$(that).removeClass('disabled');
						return;
					}
					var order = {
						orderregisterid:'${register.id}',
						orderuname:'${register.nickname}',
						ordertype:$('input[name="ordertype"]:checked').val(),
						ordertitle:'会议费订单',
						orderno:'',//由后台生成
						orderstatus:0,
						ordermoney:$('input[name="ordermoney"]:checked').val(),
						orderrebackmsg:'',
						orderremark:'',
						orderaccount:''
					}

					OrderService.addOrderAndPay(order,function(ret){
						$(that).removeClass('disabled');
						if(ret.success){
							var payPage = "";
							if(order.ordertype == 1)
								payPage = "alipay.jsp?qd="+(!not_pc()?"ALI_WEB":'ALI_WAP');
							else if(order.ordertype == 2)
								payPage = "wxpay.jsp?qd="+(!not_pc()?"WX_NATIVE":'WX_JSAPI');
							else if(order.ordertype == 3)
								payPage = "ylpay.jsp?qd="+(!not_pc()?"UN_WEB":'UN_WAP');
							// window.open(payPage+'?orderno='+ret.order.orderno+'&ordermoney='+ret.order.ordermoney + '&ordertitle='+order.ordertitle);
							// window.location.reload();
							window.location.href = payPage+'&orderno='+ret.order.orderno+'&ordermoney='+order.ordermoney + '&rid='+order.orderregisterid;
						} else {
							alert('订单生成失败，请稍后重试');
							window.location.href = 'index.jsp';
						}
					});
				}
			});
		});

		function getInvoiceValue(){
			var v = $('input[name="invoice"]:checked').val();
			if(v == '需要'){
				v = [];
				$('input[name="invoice_chk"]:checked').each(function(index, chk) {
					v.push($(chk).val());
				});
				v = v.join('、');
			}
			return v||'不需要';
		}

		$('#registerBtn').off('click').on('click',function(e){
			var that = this;
			var register = {
				username:'',
				nickname:$('#nickname').val(),
				password:$('#password').val()||'123',
				sex:$('input[name="sex"]:checked').val(),
				job:$('#job').val(),
				title:$('#title').val(),
				company:$('#company').val(),
				officephone:$('#officephone').val(),
				telphone:$('#telphone').val(),
				email:$('#email').val(),
				address:$('#address').val(),
				postcode:$('#postcode').val(),
				sfztlw:$('input[name="sfztlw"]:checked').val(),
				sfsqhyfy:$('input[name="sfsqhyfy"]:checked').val(),
				sffblw:$('input[name="sffblw"]:checked').val(),
				gjbh:$('#gjbh').val(),
				journalname:$('#journalname').val(),//稿件期刊
				gjtm:$('#gjtm').val(),//论文题目
				zsyq:$('input[name="zsyq"]:checked').val(),
				zskssj:$('input[name="zsyq"]:checked').val() === '不住宿'?'':$('#zskssj').val(),
				zsjssj:$('input[name="zsyq"]:checked').val() === '不住宿'?'':$('#zsjssj').val(),

				gzqk:'',
				fax:'',
				degree:'',
				invoice:'',
				sfcjsx:'',
				sxxl:'',
				fptt:'',
				gjzt:'',
				fytm:$('#fytm').val(),
				fynrzy:$('#fynrzy').val(),
				sfzs:$('input[name="zsyq"]:checked').val() === '不住宿'?'否':'是',
				yqhfszt:'',
				// invoice:getInvoiceValue(),
				// sfcjsx:$('input[name="sfcjsx"]:checked').val(),
				// sxxl:$('input[name="sfcjsx"]:checked').val() == '参加'?$('#sxxl').val():'',
				// fptt:$('#fptt').val(),

				message:$('#message').val()
			};
			if(!register.nickname){
				$('#nickname').focus().attr('placeholder','该项不能为空！');
				return;
			}

			//密码校验
			if(!register.password){
				$('#password').focus().attr('placeholder','密码不能为空！');
				return;
			}
			if(register.password != $('#repassword').val()){
				alert('两次输入密码不一致！');
				$('#repassword').focus();
				return;
			}

			if(!register.title){
				$('#title').focus().attr('placeholder','该项不能为空！');
				return;
			}
			if(!register.job){
				$('#job').focus().attr('placeholder','该项不能为空！');
				return;
			}
			if(!register.email){
				$('#email').focus().attr('placeholder','该项不能为空！');
				return;
			}
			if(!register.telphone){
				$('#telphone').focus().attr('placeholder','该项不能为空！');
				return;
			}
			if(!register.company){
				$('#company').focus().attr('placeholder','该项不能为空！');
				return;
			}
			if(!register.postcode){
				$('#postcode').focus().attr('placeholder','该项不能为空！');
				return;
			}
			if(!register.address){
				$('#address').focus().attr('placeholder','该项不能为空！');
				return;
			}

			if($('input[name="invoice"]:checked').val() == '需要'){
				if(!$('input[name="invoice_chk"]:checked').val()){
					alert('请选择开票内容！');
					return;
				}
				if(!register.fptt){
					$('#fptt').focus().attr('placeholder','请填写发票抬头！');
					return;
				}
			}

			// $(that).addClass('disabled');
			RegisterService.hasRegisterByTel(register,function(has){
				if(!has){
					// alert(has);
					//注册：参数说明register为注册信息,isSendMail表示是否发送邮件
					var isSendMail = true;
					var file = register.sfztlw == '是'?dwr.util.getValue("thesis"):null;
					var fileName = register.sfztlw == '是'?$("#thesis").val():null;
					debugger;
					RegisterService.register(register,isSendMail,file,fileName,function(msg){
						if(msg){
							alert('报名成功，请查收邮件回执!');
							$(that).removeClass('disabled');
							$('#registerForm')[0].reset();
							// if($('#isAutoLogin').prop('checked')){
							window.location.reload();
							// }
						}
					});
				} else {
					alert('该手机或邮箱报名者已经存在，请不要重复报名！');
					$('#telphone').focus();
					$(that).removeClass('disabled');
				}
			});
		});
		$('input[name="invoice"]').change(function(event) {
			if($('input[name="invoice"]:checked').val()=='不需要'){
				$('.check-group').hide();
				$('.register-pay').hide();
				// $('#payBtn').prop('disabled',true);
				$('#payBtn').html('确定');
				$('#invoice_msg').html('说明：请与客服联系线下付款！');
			} else {
				$('.check-group').show();
				$('.register-pay').show();
				// $('#payBtn').prop('disabled',false);
				$('#payBtn').html('生成订单并支付');
				$('#invoice_msg').html('说明：会议费发票由北京国科智地科技有限公司开具，实习费由当地旅行社开具。');
			}
		});

		$('input[name="sfcjsx"]').change(function(event) {
			if($('input[name="sfcjsx"]:checked').val()=='不参加')
				$('.select-sxxl').hide();
			else
				$('.select-sxxl').show();
		});

		$('.btn-register').off('click').on('click',function(e){
			var target = $('#contactWrap');
			if ($(window).width() < 768) {
				if (target.length) {
					$('html,body').animate({
						scrollTop: target.offset().top - $('.navbar-header').outerHeight(true) + 1
					}, 1000);
					return false;
				}
			}
			else {
				if (target.length) {
					$('html,body').animate({
						scrollTop: target.offset().top - $('.navbar').outerHeight(true) + 1
					}, 1000);
					return false;
				}
			}
		});

		$('.btn-login').off('click').on('click',function(e){
			// window.location.href = 'login.jsp';
			// 由于很多人已经在没有设置密码时期报名，暂时改为直接用手机号无需密码登录
			window.location.href = 'loginWithoutPwd.jsp';
		});

		$('.btn-logout').off('click').on('click',function(e){
			RegisterService.logout(function(){
				// window.location.reload();
				window.location.href = 'loginWithoutPwd.jsp';
			});
		});

		$('a[href*=#]:not([href=#])').click(function() {
			if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') || location.hostname == this.hostname) {
				var target = $(this.hash);
				target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
				if ($(window).width() < 768) {
					if (target.length) {
						$('html,body').animate({
							scrollTop: target.offset().top - $('.navbar-header').outerHeight(true) + 1
						}, 1000);
						return false;
					}
				}
				else {
					if (target.length) {
						$('html,body').animate({
							scrollTop: target.offset().top - $('.navbar').outerHeight(true) + 1
						}, 1000);
						return false;
					}
				}

			}
		});

		var hash = '${param["position"]}';
		if(hash){
			var target = $('#'+hash);
			if ($(window).width() < 768) {
				if (target.length) {
					$('html,body').animate({
						scrollTop: target.offset().top - $('.navbar-header').outerHeight(true) + 1
					}, 1000);
				}
			}
			else {
				if (target.length) {
					$('html,body').animate({
						scrollTop: target.offset().top - $('.navbar').outerHeight(true) + 1
					}, 1000);
				}
			}
		}

		$('#toTop').click(function() {
			$('html,body').animate({
				scrollTop: 0
			}, 1000);
		});

		var timer;
		$(window).bind('scroll',function () {
			clearTimeout(timer);
			timer = setTimeout( refresh , 50 );
		});
		var refresh = function () {
			if ($(window).scrollTop()>100) {
				$(".tagline").fadeTo( "slow", 0 );
			}
			else {
				$(".tagline").fadeTo( "slow", 1 );
			}
		};

		// Mobile Navigation
		$('.nav').find('a').on('click', function() {
			var menuBtn = $('.navbar-toggle');
			if(menuBtn.css('display')=='block')
				$('.navbar-toggle').click();
		});

		$('input[name="sfztlw"]').change(function(e){
			$('#lw_area').toggle();
		});

		$('input[name="sfsqhyfy"]').change(function(e){
			$('#fy_area').toggle();
		});

		$('input[name="sffblw"]').change(function(e){
			$('#gj_area').toggle();
		});

		$('input[name="zsyq"]').change(function(e){
			if($('input[name="zsyq"]:checked').val()=='不住宿')
				$('#zssj_area').hide();
			else
				$('#zssj_area').show();
		});
		$('#zskssj,#zsjssj').datetimepicker({
			minView: "month", //选择日期后，不会再跳转去选择时分秒
			format: 'yyyy-mm-dd',
			language: 'zh-CN',
			autoclose:true ,//选择日期后自动关闭
			width:'100%'
		});
		$('#zskssj,#zsjssj').val(new Date().format('yyyy-MM-dd'));
		$('#zskssj,#zsjssj').inputmask("2099-99-99");
		$("#telphone").inputmask('19999999999');
		$("#postcode").inputmask('999999');
	});
</script>
</body>
</html>