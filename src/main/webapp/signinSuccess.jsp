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
	<meta name="description" content="第三届食品科学与人类健康国际研讨会_食品科学网">
	<meta name="author" content="北京国科智地科技有限公司">
	<link rel="shortcut icon" href="<%=path%>/static/assets/ico/favicon.ico">

	<title>第三届食品科学与人类健康国际研讨会_食品科学网</title>
	
	<!-- Bootstrap core CSS -->
	<link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=path%>/static/spkx/css/style.css" />

	<!-- Custom styles for this template -->
	<link href="<%=path%>/static/css/font-awesome.min.css" rel="stylesheet">
	
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
	<style>
		input{
			disabled:"disabled"
		}
	</style>
</head>

<body>
	<!-- 头部模块 -->
	<%@include file="/inc/headbar.jsp" %>
	<div id="contactWrap">
		<div class="overlay">
			<div class="container">
				<div class="row">
						<div class="col-xs-12">
						<%--<h2 class="sectionTitle">已经签到过!</h2>--%>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2">
						<div class="alert alert-success"><i class="fa fa-check" style="border:1px solid;border-radius: 100%"></i> 用户【${reg.nickname}】已经签到，胸卡打印完毕！</div>
					</div>

					<div class="col-sm-4 col-sm-offset-2">
						<div class="inputContainer">
							<label>姓名：</label>
							<input type="text" disabled=disabled" name="nickname" id="nickname" class="form-control" autocomplete="off" value="${reg.nickname}" >
						</div>
					</div>
					<div class="col-sm-4">
						<div class="inputContainer">
							<label class="screen-reader-text">性别：</label>
							<div class="form-control" style="line-height:20px;">
								<label class="radio-inline">
									<input type="radio"  disabled=disabled" name="sex" id="sex1" value="男" ${reg.sex eq '男' or empty regisgter?'checked':''} > 男
								</label>
								<label class="radio-inline">
									<input type="radio" disabled=disabled" name="sex" id="sex2" value="女" ${reg.sex eq '女'?'checked':''} > 女
								</label>
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">职务：</label>
							<input type="text" disabled=disabled" name="job" id="job" class="form-control" autocomplete="off" value="${reg.job}" >
							<!-- <select id="job" name="job" class="form-control" value="${reg.job}" >
								<c:if test="${empty reg}">
								<option value="无">无</option>
								<option value="初级">初级</option>
								<option value="中级" selected="selected">中级</option>
								<option value="副高">副高</option>
								<option value="正高">正高</option>
								</c:if>
								<c:if test="${not empty reg}">
								<option value="${reg.job}" selected="selected">${reg.job}</option>
								</c:if>
							</select> -->
						</div>
					</div>
					<div class="col-sm-4">
						<div class="inputContainer">
							<label class="screen-reader-text">职称：</label>
							<select id="title" disabled=disabled" name="title" class="form-control" >
								<option value="">请选择职称</option>
								<option value="教授" ${not empty reg and reg.title eq '教授'?'selected="selected"':''}>教授</option>
								<option value="副教授" ${not empty reg and reg.title eq '副教授'?'selected="selected"':''}>副教授</option>
								<option value="讲师" ${not empty reg and reg.title eq '讲师'?'selected="selected"':''}>讲师</option>
								<option value="助理讲师" ${not empty reg and reg.title eq '助理讲师'?'selected="selected"':''}>助理讲师</option>
								<option value="研究员" ${not empty reg and reg.title eq '研究员'?'selected="selected"':''}>研究员</option>
								<option value="副研究员" ${not empty reg and reg.title eq '副研究员'?'selected="selected"':''}>副研究员</option>
								<option value="助理研究员" ${not empty reg and reg.title eq '助理研究员'?'selected="selected"':''}>助理研究员</option>
								<option value="研究实习员" ${not empty reg and reg.title eq '研究实习员'?'selected="selected"':''}>研究实习员</option>
								<option value="教授级高级工程师" ${not empty reg and reg.title eq '教授级高级工程师'?'selected="selected"':''}>教授级高级工程师</option>
								<option value="高级工程师" ${not empty reg and reg.title eq '高级工程师'?'selected="selected"':''}>高级工程师</option>
								<option value="工程师" ${not empty reg and reg.title eq '工程师'?'selected="selected"':''}>工程师</option>
								<option value="助理工程师" ${not empty reg and reg.title eq '助理工程师'?'selected="selected"':''}>助理工程师</option>
								<option value="高级教师" ${not empty reg and reg.title eq '高级教师'?'selected="selected"':''}>高级教师</option>
								<option value="高级农艺师" ${not empty reg and reg.title eq '高级农艺师'?'selected="selected"':''}>高级农艺师</option>
								<option value="农艺师" ${not empty reg and reg.title eq '农艺师'?'selected="selected"':''}>农艺师</option>
								<option value="助理农艺师" ${not empty reg and reg.title eq '助理农艺师'?'selected="selected"':''}>助理农艺师</option>
								<option value="其他" ${not empty reg and reg.title eq '其他'?'selected="selected"':''}>其他</option>
								<option value="其他（研究生等）" ${not empty reg and reg.title eq '其他（研究生等）'?'selected="selected"':''}>其他（研究生等）</option>

							</select>
						</div>
					</div>
					<div class="col-sm-8 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">单位：</label>
							<input type="text" name="company" disabled=disabled" id="company" value="${reg.company}" class="form-control" autocomplete="off" />
						</div>
					</div>
					<div class="col-sm-4 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">办公电话：</label>
							<input type="text" name="officephone" disabled=disabled" id="officephone" class="form-control" autocomplete="off" value="${reg.officephone}"/>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="inputContainer">
							<label class="screen-reader-text">手机：</label>
							<input type="text" name="telphone" id="telphone" value="${reg.telphone}" class="form-control" autocomplete="off" ${not empty reg?'disabled="disabled"':''}/>
						</div>
					</div>
					<div class="col-sm-8 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">Email：</label>
							<input  disabled=disabled" type="text" name="email" id="email" class="form-control" autocomplete="off" ${not empty reg?'disabled="disabled"':''} value="${reg.email}"/>
							<p style="color:red ;${not empty reg?'display:none':''} " >请尽量不要选择QQ邮箱，否则可能无法收到会务组发出的邮件</p>
						</div>
					</div>
					<div class="col-sm-4 col-sm-offset-2">
						<div class="inputContainer">
							<label class="screen-reader-text">联系地址：</label>
							<input  disabled=disabled" type="text" name="address" id="address" value="${reg.address}" class="form-control" autocomplete="off" />
						</div>
					</div>
					<div class="col-sm-4">
						<div class="inputContainer">
							<label class="screen-reader-text">邮编：</label>
							<input disabled=disabled" type="text" name="postcode" id="postcode" value="${reg.postcode}" class="form-control" autocomplete="off"/>
						</div>
					</div>
				</div>

	<%@include file="/inc/footer.jsp"%>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
	<script type='text/javascript' src='<%=path%>/dwr/interface/RegisterService.js'></script>
    <script src="<%=path%>/static/js/jquery-1.11.1.min.js"></script>
    <script src="<%=path%>/static/js/bootstrap.min.js"></script>
    <script src="<%=path%>/static/spkx/js/biz.js"></script>
	<script type="application/javascript">
		<%--alert(${register.id});--%>
       /* /!**
         * 设置iframe宽度
         * @param {} iframeId
         *!/
        function iframeAutoHeight(iframeId){
            var ifm= document.getElementById(iframeId);
            var subWeb = document.frames ? document.frames[iframeId].document:ifm.contentDocument;
            if(ifm != null && subWeb != null) {
                ifm.height = subWeb.body.scrollHeight;
            }
        }
        /!**
         * 初始化
         *!/
        $(document).ready(function() {
            var ids = ${reg.id};
            var params = '?report=/ewm.raq';
            params += '&ids='+ids;
            url = '<%=path%>/report/reportJsp/report.jsp';
            url += params;
            url+='&timestamp='+Date.parse(new Date());
            $('#reportArea').attr('src',url);
        });*/
	</script>
</body>
</html>