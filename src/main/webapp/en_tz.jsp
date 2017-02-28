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
	<title>3rd International Symposium of <i>Food Science and Human Wellness</i></title>
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
<%@include file="/inc/en_headbar.jsp" %>

<div class="main">
	<%--<h2><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/><a href="#">通知</a>
	</h2>--%>
	<div class="tz">
		<h3 id="title"></h3>

		<div id="content">

		</div>
	</div>
</div>

<%@include file="/inc/en_footer.jsp"%>
<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
<script type="text/javascript" src="<%=path%>/dwr/util.js"></script>
<script type='text/javascript' src='<%=path%>/dwr/interface/NoticeService.js'></script>
<c:if test="${not empty register}">
	<script type='text/javascript' src='<%=path%>/dwr/interface/OrderService.js'></script>
</c:if>
<script src="<%=path%>/static/spkx/js/biz.js"></script>
<script type="text/javascript">
	$(function () {
		var noticeId = '${param["notice"]}';
		//获取后台通知内容
		NoticeService.getNotice(noticeId,function (notice) {
			$("#title").append(notice.title?notice.title:'');
			$("#content").append(notice.contentHtml?notice.contentHtml:'');
		});
		var target = $('.main');
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