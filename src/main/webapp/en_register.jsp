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
	<meta name="description" content="3rd International Symposium of <i>Food Science and Human Wellness</i>">
	<link rel="shortcut icon" href="<%=path%>/static/assets/ico/favicon.ico">

	<title>3rd International Symposium of <i>Food Science and Human Wellness</i></title>

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
<%@include file="/inc/en_headbar.jsp" %>

<div id="contactWrap">
	<form id="registerForm">
		<div class="overlay">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<h2 class="sectionTitle">
							${not empty register?'Personal Center':'User registration'}
						</h2>
					</div>
				</div>
				<div class="row">
					<!-- <c:if test="${register.zfflag ne '1'}"> -->
					<input type="text" name="id" id="id" class="hide"  value="${register.id}">
					<div class="col-sm-4 col-sm-offset-2">
						<div class="inputContainer">
							<label>Name:</label>
							<input type="text" name="nickname" id="nickname" class="form-control" autocomplete="off" value="${register.nickname}" >
						</div>
					</div>
					<div class="col-sm-4">
						<div class="inputContainer">
							<label class="screen-reader-text">Gender:</label>
							<div class="form-control" style="line-height:20px;">
								<label class="radio-inline">
									<input type="radio" name="sex" id="sex1" value="男" ${register.sex eq '男' or empty regisgter?'checked':''}> men
								</label>
								<label class="radio-inline">
									<input type="radio" name="sex" id="sex2" value="女" ${register.sex eq '女'?'checked':''} > women
								</label>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-sm-offset-2 register-adv" style="${empty register?'':'display:none'}">
						<div class="inputContainer">
							<label class="screen-reader-text">Password:</label>
							<input type="password" name="password" id="password" value="" class="form-control" autocomplete="off"  />
						</div>
					</div>
					<div class="col-sm-4 register-adv" style="${empty register?'':'display:none'}">
						<div class="inputContainer">
							<label class="screen-reader-text">Repassword:</label>
							<input type="password" name="repassword" id="repassword" value="" class="form-control" autocomplete="off"  />
						</div>
					</div>
					<div class="col-sm-4 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">Job:</label>
							<input type="text" name="job" id="job" class="form-control" autocomplete="off" value="${register.job}">
							<!-- <select id="job" name="job" class="form-control" value="${register.job}" >
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
							<label class="screen-reader-text">Title:</label>
							<select id="title" name="title" class="form-control"  >
								<option value="教授" ${register.title eq "教授"?'selected="selected"':''}>professor</option>
								<option value="副教授" ${register.title eq "副教授"?'selected="selected"':''}>associate professor</option>
								<option value="讲师" ${register.title eq "讲师"?'selected="selected"':''}>lecturer</option>
								<option value="助理讲师" ${register.title eq "助理讲师"?'selected="selected"':''}>assistant lecturer</option>
								<option value="研究员" ${register.title eq "研究员"?'selected="selected"':''}>Researcher</option>
								<option value="副研究员" ${register.title eq "副研究员"?'selected="selected"':''}>Associate Research Fellow</option>
								<option value="助理研究员" ${register.title eq "助理研究员"?'selected="selected"':''}>Assistant Research Fellow</option>
								<option value="研究实习员" ${register.title eq "研究实习员"?'selected="selected"':''}>Research Intern</option>
								<option value="教授级高级工程师" ${register.title eq "教授级高级工程师"?'selected="selected"':''}>professor of engineering</option>
								<option value="高级工程师" ${register.title eq "高级工程师"?'selected="selected"':''}>Senior Engineer</option>
								<option value="工程师" ${register.title eq "工程师"?'selected="selected"':''}>Engineer</option>
								<option value="助理工程师" ${register.title eq "助理工程师"?'selected="selected"':''}>Assistant Engineer</option>
								<option value="高级教师" ${register.title eq "高级教师"?'selected="selected"':''}>Senior teacher</option>
								<option value="高级农艺师" ${register.title eq "高级农艺师"?'selected="selected"':''}>Senior Agronomist</option>
								<option value="农艺师" ${register.title eq "农艺师"?'selected="selected"':''}>Agronomist</option>
								<option value="助理农艺师" ${register.title eq "助理农艺师"?'selected="selected"':''}>Assistant agronomist</option>
								<option value="其他" ${register.title eq "其他"?'selected="selected"':''}>Other</option>
								<option value="其他（研究生等）" ${register.title eq "其他（研究生等）"?'selected="selected"':''}>Others (graduate students, etc.)</option>
							</select>
						</div>
					</div>
					<div class="col-sm-8 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">company：</label>
							<input type="text" name="company" id="company" value="${register.company}" class="form-control" autocomplete="off" />
						</div>
					</div>
					<div class="col-sm-4 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">officephone:</label>
							<input type="text" name="officephone" id="officephone" class="form-control" autocomplete="off" value="${register.officephone}"/>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="inputContainer">
							<label class="screen-reader-text">Telphone:</label>
							<input type="text" name="telphone" id="telphone" value="${register.telphone}" class="form-control" autocomplete="off" ${not empty register?'disabled="disabled"':''}/>
						</div>
					</div>
					<div class="col-sm-8 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">Email:</label>
							<input type="text" name="email" id="email" class="form-control" autocomplete="off" ${not empty register?'disabled="disabled"':''} value="${register.email}"/>
						</div>
					</div>
					<div class="col-sm-4 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">Address:</label>
							<input type="text" name="address" id="address" value="${register.address}" class="form-control" autocomplete="off" />
						</div>
					</div>
					<div class="col-sm-4">
						<div class="inputContainer">
							<label class="screen-reader-text">Postcode:</label>
							<input type="text" name="postcode" id="postcode" value="${register.postcode}" class="form-control" autocomplete="off"/>
						</div>
					</div>
					<div class="col-sm-4 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">Paper posting:</label>
							<div class="form-control" style="line-height:20px;border:none">
								<label class="radio-inline">
									<input type="radio" name="sfztlw" id="sfztlw1" value="是" ${register.sfztlw eq '是'?'checked':''} > YES
								</label>
								<label class="radio-inline">
									<input type="radio" name="sfztlw" id="sfztlw2" value="否" ${empty register or register.sfztlw eq '否'?'checked':''}  > NO
								</label>
							</div>
						</div>
					</div>
					<div id="lw_area" class="col-sm-4" style="${register.sfztlw eq '是'?'':'display:none'}">
						<label class="screen-reader-text">My paper：</label>
						<input type="file" name="thesis" id="thesis" class="form-control" value="${thesis.filename}.${thesis.type}" ${not empty thesis?'style="display: none"':'style="display: inline"'} />
							<%--<a id="fileName" class="form-control " href="<%=path%>/auth.do?method=download&fileid=${thesis.id}" ${not empty thesis?'style="display: inline"':'style="display: none"'}>${thesis.filename}.${thesis.type}</a><span class="input-group-addon" >重新上传</span>--%>
						<div class="" id="fileName" ${not empty thesis?'style="display: inline"':'style="display: none"'}>
							<a  class="form-control "  href="<%=path%>/auth.do?method=download&fileid=${thesis.id}" >${thesis.filename}.${thesis.type}</a>
							<span class="btn btn-default" style=" width: 25% ;float: right ;margin-top: -46px" id="btn-clear" >Re upload</span>
						</div>


							<%--<c:if test="${not empty thesis}">
								<div class="inputContainer">
									<label class="screen-reader-text">我的论文：</label>
									<a class="form-control" style="line-height: 23px;" href="<%=path%>/auth.do?method=download&fileid=${thesis.id}">${thesis.filename}.${thesis.type}</a>
									<span class="btn btn-default" style=" width: 25% ;float: right ;margin-top: -46px" id="btn-clear" >重新上传</span>
								</div>
							</c:if>
							<c:if test="${empty thesis}">
								<div class="inputContainer">
									<label class="screen-reader-text">论文上传：</label>
									<input type="file" name="thesis" id="thesis" class="form-control" />
								</div>
							</c:if>--%>
					</div>
					<div class="col-sm-8 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">Speaking at the application:</label>
							<div class="form-control" style="line-height:20px;border:none">
								<label class="radio-inline">
									<input type="radio" name="sfsqhyfy" id="sfsqhyfy1" value="是" ${register.sfsqhyfy eq '是'?'checked':''} > YES
								</label>
								<label class="radio-inline">
									<input type="radio" name="sfsqhyfy" id="sfsqhyfy2" value="否" ${empty register or register.sfsqhyfy eq '否'?'checked':''}  > NO
								</label>
							</div>
						</div>
					</div>
					<div id="fy_area" class="alert alert-warning col-sm-8 col-sm-offset-2" style="${register.sfsqhyfy eq '是'?'':'display:none'}">
						<div class="inputContainer">
							<label class="screen-reader-text">Speaking topic:</label>
							<input type="text" name="fytm" id="fytm" value="${register.fytm}" class="form-control" autocomplete="off" />
						</div>
						<div class="inputContainer">
							<label class="screen-reader-text">Speech summary（Less than 1000 words）:</label>
							<textarea name="fynrzy" id="fynrzy" class="form-control" autocomplete="off" >${register.fynrzy}</textarea>
						</div>
					</div>
					<div class="col-sm-8 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">publish one’s thesis:</label>
							<div class="form-control" style="line-height:20px;border:none">
								<label class="radio-inline">
									<input type="radio" name="sffblw" id="sffblw1" value="是" ${register.sffblw eq '是'?'checked':''} > YES
								</label>
								<label class="radio-inline">
									<input type="radio" name="sffblw" id="sffblw2" value="否" ${empty register or register.sffblw eq '否'?'checked':''}  > NO
								</label>
							</div>
						</div>
					</div>
					<div id="gj_area" class="alert alert-warning col-sm-8 col-sm-offset-2" style="${register.sffblw eq '是'?'':'display:none'}">
						<div class="inputContainer">
							<label class="screen-reader-text">Manuscript number:</label>
							<input type="text" name="gjbh" id="gjbh" value="${register.gjbh}" class="form-control" autocomplete="off" />
						</div>
						<div class="inputContainer">
							<label class="screen-reader-text">Contributing journals:</label>
							<!-- <input type="text" name="journalname" id="journalname" value="${register.journalname}" class="form-control" autocomplete="off" ${not empty register?'disabled="disabled"':''}/> -->
							<select id="journalname" name="journalname" class="form-control" value="${register.journalname}" >
								<option value="">请选择投稿期刊</option>
								<option value="《食品科学》" ${not empty register and register.journalname eq '《食品科学》'?'selected="selected"':''}>《食品科学》</option>
								<option value="《肉类研究》" ${not empty register and register.journalname eq '《肉类研究》'?'selected="selected"':''}>《肉类研究》</option>
								<option value="《乳业科学与技术》" ${not empty register and register.journalname eq '《乳业科学与技术》'?'selected="selected"':''}>《乳业科学与技术》</option>
								<option value="《Food Science and Human Wellness》" ${not empty register and register.journalname eq '《Food Science and Human Wellness》'?'selected="selected"':''}>《Food Science and Human Wellness》</option>
							</select>
						</div>


						<div class="inputContainer">
							<label class="screen-reader-text">Thesis topic:</label>
							<input type="text" name="gjtm" id="gjtm" value="${register.gjtm}" class="form-control" autocomplete="off" />
						</div>
					</div>
					<div class="col-sm-4 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">Accommodation requirements:</label>
							<div class="form-control" style="line-height:20px;border:none">
								<label class="radio-inline">
									<input type="radio" name="zsyq" id="zsyq1" value="不住宿" ${empty register or register.zsyq eq '不住宿'?'checked':''} > No
								</label>
								<label class="radio-inline">
									<input type="radio" name="zsyq" id="zsyq2" value="标间" ${register.zsyq eq '标间'?'checked':''} > Standard room
								</label>
								<label class="radio-inline">
									<input type="radio" name="zsyq" id="zsyq3" value="单床合住" ${register.zsyq eq '单床合住'?'checked':''} > Single bed room
								</label>
							</div>
						</div>
					</div>
					<div id="zssj_area" class="col-sm-4" style="${empty register or register.zsyq eq '不住宿'?'display:none':''}">
						<label class="screen-reader-text">Accommodation time:</label>
						<table style="width:100%">
							<tr>
								<td class="date">
									<input type="text" name="zskssj" id="zskssj" value="${fn:substring(register.zskssj,0,10)}" class="form-control" style="width:130px;" autocomplete="off" />
								</td>
								<td width="20" style="padding:2px 4px">to</td>
								<td align="right">
									<input type="text" name="zsjssj" id="zsjssj" value="${fn:substring(register.zsjssj,0,10)}" class="form-control" style="width:130px;" autocomplete="off" />
								</td>
							</tr>
						</table>
					</div>
					<div class="col-sm-8 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text"><i>Remarks:</i></label>
							<textarea name="message" id="message" class="form-control" autocomplete="off" >${register.message}</textarea>
						</div>
					</div>
					<c:if test="${not empty register}">
						<div class="col-sm-4 col-sm-offset-2">
							<div class="inputContainer">
								<label class="screen-reader-text">Payment status:</label>
								<input type="text" name="zfflag" id="zfflag" class="form-control" autocomplete="off" value="<c:if test="${register.zfflag eq 0}">Unpaid conference fee</c:if><c:if test="${register.zfflag eq 1}">Conference fee paid</c:if><c:if test="${register.zfflag eq 2}">Electronic remittance form</c:if>" disabled="disabled" >
							</div>
						</div>
						<div class="col-sm-4">
							<div class="inputContainer">
								<label class="screen-reader-text">Registration time:</label>
								<input type="text" name="yqhfszt" id="registertime" class="form-control" autocomplete="off" value="<fmt:formatDate value="${register.registertime}" type="both"/>" disabled="disabled" >
							</div>
						</div>

						<div class="col-sm-4 col-sm-offset-2">
							<div class="inputContainer">
								<label class="screen-reader-text">Invitation to send electronic version:</label>
								<input type="text" name="yqhfszt" id="yqhfszt" class="form-control" autocomplete="off" value="${register.yqhfszt}" disabled="disabled" >
							</div>

						</div>
						<div class="col-sm-4">
							<div class="inputContainer">
								<label class="screen-reader-text">Paper version invitation send status:</label>
								<input type="text" name="zfflag" id="zzyqhfszt" class="form-control" autocomplete="off" value="${register.zzyqhfszt}" disabled="disabled" >
							</div>
						</div>
					</c:if>
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
							<%--<c:if test="${empty register}">
								<button id="registerBtn" name="submit" type="button" class="btn btn-primary btn-lg">提交报名</button>
							</c:if>--%>

						<c:choose>
							<c:when  test="${empty register}">
								<button id="registerBtn" name="submit" type="button" class="btn btn-primary btn-lg">Submit application</button>
							</c:when >
							<c:otherwise>
								<button id="editBtn" name="submit" type="button" class="btn btn-primary btn-lg">Determine modification</button>
							</c:otherwise>
						</c:choose>

						<!-- <c:if test="${not empty register}">
						<button id="payBtn" name="submit" type="button" class="btn btn-primary btn-lg" ${register.zfflag eq '1'?'disabled="disabled"':''}>${register.invoice eq '不需要'?'确定':'生成订单并支付'}</button>
						</c:if> -->
					</div>
					<c:if test="${not empty register}">
						<div class="col-sm-4 col-sm-offset-4" style="padding-top: 20px">
								<%--<h3 style="text-align: center">二维码</h3>--%>
							<div id="qrcode">
							</div>

						</div>
					</c:if>

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
<%@include file="/inc/en_footer.jsp"%>

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
<script src="<%=path%>/res/js/qrcode.js"></script>

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
		if(document.getElementById("qrcode")){
			//生成二维码
			var qrcode = new QRCode(document.getElementById("qrcode"), {
				width : 300,//设置宽高
				height : 300
			});
			qrcode.makeCode("http://hy.chnfood.cn/2017spkx/auth.do?method=signin&telphone=${register.telphone}");

		}

		//重新上传论文按钮
		$("#btn-clear").click(function () {
			$("#fileName").attr('style','display: none');
			$("#thesis").attr('style','display: inline');

			var file = $("#file")
			file.after(file.clone().val(""));
			file.remove();
			file.val('');
		});

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
					alert('Please select a billing content！');
					return;
				}
				if(!fptt){
					$('#fptt').focus().attr('placeholder','Please fill in the invoice！');
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
							alert('Order generation failed, please try again later');
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
		//注册按钮
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
				$('#nickname').focus().attr('placeholder','This item cannot be empty！');
				return;
			}

			//密码校验
			if(!register.password){
				$('#password').focus().attr('placeholder','Password cannot be empty！');
				return;
			}
			if(register.password != $('#repassword').val()){
				alert('两次输入密码不一致！');
				$('#repassword').focus();
				return;
			}

			if(!register.title){
				$('#title').focus().attr('placeholder','This item cannot be empty！');
				return;
			}
			if(!register.job){
				$('#job').focus().attr('placeholder','This item cannot be empty！');
				return;
			}
			if(!register.email){
				$('#email').focus().attr('placeholder','This item cannot be empty！');
				return;
			}
			if(!register.telphone){
				$('#telphone').focus().attr('placeholder','This item cannot be empty！');
				return;
			}
			if(!register.company){
				$('#company').focus().attr('placeholder','This item cannot be empty！');
				return;
			}
			if(!register.postcode){
				$('#postcode').focus().attr('placeholder','This item cannot be empty！');
				return;
			}
			if(!register.address){
				$('#address').focus().attr('placeholder','This item cannot be empty！');
				return;
			}

			if($('input[name="invoice"]:checked').val() == '需要'){
				if(!$('input[name="invoice_chk"]:checked').val()){
					alert('Please select a billing content！');
					return;
				}
				if(!register.fptt){
					$('#fptt').focus().attr('placeholder','Please fill in the invoice！');
					return;
				}
			}
			$(that).addClass('disabled');
			RegisterService.hasRegisterByTel(register,function(has){
				if(!has){
					// alert(has);
					//注册：参数说明register为注册信息,isSendMail表示是否发送邮件
					var isSendMail = true;
					var file = register.sfztlw == '是'?dwr.util.getValue("thesis"):null;
					var fileName = register.sfztlw == '是'?$("#thesis").val():null;
					RegisterService.register(register,isSendMail,file,fileName,function(msg){
						if(msg){
							alert('Successful registration, please check the receipt of mail!');
							$(that).removeClass('disabled');
							$('#registerForm')[0].reset();
							// if($('#isAutoLogin').prop('checked')){
							window.location.reload();
							// }
						}
					});
				} else {
					alert('The phone has already registered, please do not repeat the registration！');
					$('#telphone').focus();
					$(that).removeClass('disabled');
				}
			});
		});
		//修改按钮
		$('#editBtn').off('click').on('click', function (e) {
			var that = this;
			var register = {
				id: $('#id').val(),
				nickname:$('#nickname').val(),
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
console.log(register);  //TODO:debug
			/*if (!register.email) {
			 $('#email').focus().attr('placeholder', '该项不能为空！');
			 return;
			 }else {
			 if(!isEmail(register.email)){
			 alert("Email格式不正确");
			 $('#email').focus();
			 return;
			 }
			 }
			 if (!register.telphone) {
			 $('#telphone').focus().attr('placeholder', '该项不能为空！');
			 return;
			 }*/

			/*//密码校验
			 if (!register.password) {
			 $('#password').focus().attr('placeholder', '密码不能为空！');
			 return;
			 }*/
			if ((register.password) &&register.password != $('#repassword').val()) {
				alert('两次输入密码不一致！');
				$('#repassword').focus();
				return;
			}
			if (!register.nickname) {
				$('#nickname').focus().attr('placeholder', 'This item cannot be empty！');
				return;
			}
			/*if (!register.title) {
			 $('#title').focus().attr('placeholder', '该项不能为空！');
			 return;
			 }
			 if (!register.job) {
			 $('#job').focus().attr('placeholder', '该项不能为空！');
			 return;
			 }


			 if (!register.company) {
			 $('#company').focus().attr('placeholder', '该项不能为空！');
			 return;
			 }
			 if (!register.postcode) {
			 $('#postcode').focus().attr('placeholder', '该项不能为空！');
			 return;
			 }
			 if (!register.address) {
			 $('#address').focus().attr('placeholder', '该项不能为空！');
			 return;
			 }

			 if ($('input[name="invoice"]:checked').val() == '需要') {
			 if (!$('input[name="invoice_chk"]:checked').val()) {
			 alert('请选择开票内容！');
			 return;
			 }
			 if (!register.fptt) {
			 $('#fptt').focus().attr('placeholder', '请填写发票抬头！');
			 return;
			 }
			 }*/

			// $(that).addClass('disabled');
			$("#editBtn").prop('disabled', true);
			//注册：参数说明register为注册信息,isSendMail表示是否发送邮件
			var isSendMail = false;
			var files=null;
			var fileName =  $("#thesis").val();
			if(fileName){
				files = dwr.util.getValue("thesis");//这是dwr包提供的util.js文件里面的方法
			}

			RegisterService.register(register, isSendMail,files,fileName, function (msg) {
				if (msg) {
					alert('Modify success!');
					$(that).removeClass('disabled');
//							$('#registerForm')[0].reset();
					$("#editBtn").prop('disabled', false);
					// if($('#isAutoLogin').prop('checked')){
					window.location.reload();
					// }
				}
			});
		});
		$('input[name="invoice"]').change(function(event) {
			if($('input[name="invoice"]:checked').val()=='不需要'){
				$('.check-group').hide();
				$('.register-pay').hide();
				// $('#payBtn').prop('disabled',true);
				$('#payBtn').html('确定');
				$('#invoice_msg').html('Note: please contact customer service line payment！');
			} else {
				$('.check-group').show();
				$('.register-pay').show();
				// $('#payBtn').prop('disabled',false);
				$('#payBtn').html('生成订单并支付');
				$('#invoice_msg').html('Description: the meeting fee invoice by Beijing to Kezhi Technology Co. Ltd. issued by the local travel agency issued fee.');
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

		<c:choose>
			<c:when  test="${not empty register}">
				$('#zskssj').val('${fn:substring(register.zskssj,0,10)}');
				$('#zsjssj').val('${fn:substring(register.zsjssj,0,10)}');
			</c:when >
			<c:otherwise>
				$('#zskssj,#zsjssj').val(new Date().format('yyyy-MM-dd'));
			</c:otherwise>
		</c:choose>

		$('#zskssj,#zsjssj').inputmask("2099-99-99");
		$("#telphone").inputmask('19999999999');
		$("#postcode").inputmask('999999');
	});
</script>
</body>
</html>