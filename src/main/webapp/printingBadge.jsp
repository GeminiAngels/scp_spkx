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
</head>

<body>
	<!-- 头部模块 -->
	<%@include file="/inc/headbar.jsp" %>
	<div id="contactWrap">
		<div class="overlay">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<h2 class="sectionTitle">打印胸卡</h2>
					</div>
					<div class="col-sm-8 col-sm-offset-2">
						<button type="button" style="width: 100px;margin-top: -60px" class="btn btn-info pull-right" id="btn-printOk">打印完成</button>
					</div>
				</div>
				<div class="row">
					<%--<div class="col-sm-8 col-sm-offset-2">
						<div class="alert alert-success"><i class="fa fa-check" style="border:1px solid;border-radius: 100%"></i> ${telphone}已经签到过！</div>
					</div>--%>
					<div class="col-sm-8 col-sm-offset-2">
						<iframe id="reportArea" name="reportArea" width="100%" height="300px" frameborder="0" scrolling="no"></iframe>

					</div>
				</div>
			</div>
		</div>

	</div> <!-- /contactWrap -->
	<div style="height: 300px">
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
        /**
         * 设置iframe宽度
         * @param {} iframeId
         */
        function iframeAutoHeight(iframeId){
            var ifm= document.getElementById(iframeId);
            var subWeb = document.frames ? document.frames[iframeId].document:ifm.contentDocument;
            if(ifm != null && subWeb != null) {
                ifm.height = subWeb.body.scrollHeight;
            }
        }
        /**
         * 初始化
         */
        $(document).ready(function() {
            var ids = ${register.id};
            var params = '?report=/ewm.raq';
            params += '&ids='+ids;
            url = '<%=path%>/report/reportJsp/report.jsp';
            url += params;
            url+='&timestamp='+Date.parse(new Date());
            $('#reportArea').attr('src',url);
        });
        $("#btn-printOk").click(function () {
            RegisterService.updateIsPrint( ${register.id}, function (data) {

            });
        });
	</script>
</body>
</html>