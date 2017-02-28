<%@page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
%>
<!doctype html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport"
	      content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
	<link rel="shortcut icon" href="<%=path%>/static/assets/ico/favicon.ico">
	<title>第三届食品科学与人类健康国际研讨会_食品科学网</title>
	<link rel="stylesheet" type="text/css" href="<%=path%>/static/spkx/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/static/spkx/css/style.css"/>

	<link href="<%=path%>/static/css/font-awesome.min.css" rel="stylesheet">
	<!--    <script src="js/jquery.js" type="text/javascript"></script>-->
	<script src="<%=path%>/static/spkx/js/jquery.min.js" type="text/javascript"></script>
	<script src="<%=path%>/static/spkx/js/tab.js" type="text/javascript"></script>
	<script src="<%=path%>/static/spkx/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		var app = {
				ctx : '<%=path%>',
				curl : window.location.href,
				maodian : '${position}'||'#header',
				user : {
					id : '${user.id}'/1,
					name : '${user.cnname}'
				},
				register : {
					id : '${register.id}'/1,
					bmflag : '${register.bmflag}'/1,
					username : '${register.username}',
					email : '${register.email}',
					nickname : '${register.nickname}',
					telphone : '${register.telphone}',
					sex : '${register.sex}',
					job : '${register.job}',
					company : '${register.company}',
					message : '${register.message}'
				},
				lunwen : {
					id : '${lunwen.id}'/1,
					filename:'${lunwen.filename}',
					comments:'${lunwen.comments}',
					type:'${lunwen.type}'
				},
				nofile : '${param.nofile}'
			}
	</script>
</head>

<body>
<!-- 头部模块 -->
<%@include file="/inc/headbar.jsp" %>

<div class="main">
	<h2 style="margin-bottom:30px;"><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/>费用及汇款</h2>
	<div class="fyhk" style="padding-bottom:50px;">
		<h3>会议费</h3>
		<p style="font-size:16px; line-height:36px;">国内：2000元/人（含会议费、餐费等）；普通在校研究生1400元（不含在职攻读学位人员）。<br>
			国外：500美元/人<br>
			会议期间安排住宿，费用自理。会议费不包含论文发表费。</p>
		<h3>汇款事项</h3>
		<p style="font-size:16px; line-height:36px;">请参会代表收到正式邀请函（纸质版或电子版均可）后，尽快将会议费汇至中国食品杂志社，以便大会日常筹备工作顺利进行。<br>
			<b style="font-weight:bold;">银行汇款：</b><br>
			户  名：中国食品杂志社  <br>
			开户行：工行阜外大街支行<br>
			帐  号：0200049209024922112<br>
			<b style="font-weight:bold;">邮局汇款：</b><br>
			邮寄地址：北京市西城区禄长街头条4号 <br>
			收 款 人：《食品科学》编辑部收 <br>
			邮    编：100050 <br>
		</p>
	</div>
</div>

<%@include file="/inc/footer.jsp"%>
<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
<script type="text/javascript" src="<%=path%>/dwr/util.js"></script>
<script type='text/javascript' src='<%=path%>/dwr/interface/RegisterService.js'></script>
<c:if test="${not empty register}">
	<script type='text/javascript' src='<%=path%>/dwr/interface/OrderService.js'></script>
</c:if>
<script src="<%=path%>/static/spkx/js/biz.js"></script>
<script type="text/javascript">

	$(function () {
		var hash = '${param["position"]}';
		if (hash) {
			var target = $('#' + hash);
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
		/*$("#btn-sendEmail").click(function () {
			if(app.register.id){
				var register = {
					id:app.register.id,
					usertype:$("#usertype").val(),
					zsyq:$("#zsyq").val()
				};
				var files = dwr.util.getValue("file");//这是dwr包提供的util.js文件里面的方法
				var fileName =  $("#file").val();
				if(!fileName){
					alert("请选择需要上传的缴费凭据!");return;
				}

				RegisterService.uploadFile(register,files, fileName,function(ret){
					if(ret) {
						alert("提交成功!");
						window.loaction.reload();
					}
				});
			}else{
				alert("请先登录后再提交!");
				window.location.href = 'login.jsp';
			}
		});*/

	});
</script>
</body>
</html>