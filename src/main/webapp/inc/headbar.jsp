<%@ page language="java" pageEncoding="UTF-8" %>

<div class="topbox">
	<div class="lang">
		<c:if test="${not empty register}">
			<button class="btn btn-default btn-showinfo">欢迎您，${register.nickname}</button> <button class="btn btn-default btn-logout">安全退出</button>
		</c:if>
		<c:if test="${empty register}">
			<button class="btn btn-default btn-login">登录</button> <button class="btn btn-default btn-register">注册</button>
		</c:if>
		<button class="btn btn-danger btn-enindex">EN</button>
	</div>
	<div class="imbox"><img src="<%=path%>/static/spkx/images/top_txt.png"><div class="imbox_wz"><h1>第三届食品科学与人类健康国际研讨会</h1><p>2017年8月5~6日　中国　吉林　长春<p></div>
	</div>
	<div class="bm">
		<a href="info.jsp"><img src="<%=path%>/static/spkx/images/top_bm.png"></a>
	</div>
</div>
<div class="navbox">
	<div class="nav-spkx">
		<ul>
			<li><a href="index.jsp">会议首页</a></li>
			<li><a href="zzjg.jsp">组织机构</a></li>
			<li><a href="hyjj.jsp">会议简介</a></li>
			<li><a href="zwh.jsp">组委会</a></li>
			<li><a href="hynr.jsp">会议内容</a></li>
			<li><a href="hylw.jsp">会议论文</a></li>
			<li><a href="fyhk.jsp">费用及汇款</a></li>
			<li><a href="hwz.jsp">会务组</a></li>
			<li><a href="bmfs.jsp">报名方式</a></li>
			<li><a href="download.jsp">资料下载</a></li>
			<div class="clear"></div>
		</ul>
	</div>
</div>
<div class="navbox-wap">
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#topWrap">
					e-Sciences+<span class="title"> 会议平台</span>
				</a>
			</div>
			<div class="collapse navbar-collapse appiNav">
				<ul class="nav navbar-nav">
					<li style="text-align: center">
						<c:if test="${not empty register}">
							<button class="btn btn-default btn-showinfo">欢迎您，${register.nickname}</button> <button class="btn btn-default btn-logout">安全退出</button>
						</c:if>
						<c:if test="${empty register}">
							<button class="btn btn-success btn-login">登录</button> <button class="btn btn-warning btn-register">注册</button>
						</c:if>
						<button class="btn btn-danger btn-enindex">EN</button>
					</li>
					<li><a href="index.jsp">会议首页</a></li>
					<li><a href="zzjg.jsp">组织机构</a></li>
					<li><a href="hyjj.jsp">会议简介</a></li>
					<li><a href="zwh.jsp">组委会</a></li>
					<li><a href="hynr.jsp">会议内容</a></li>
					<li><a href="hylw.jsp">会议论文</a></li>
					<li><a href="fyhk.jsp">费用及汇款</a></li>
					<li><a href="hwz.jsp">会务组</a></li>
					<li><a href="bmfs.jsp">报名方式</a></li>
					<li><a href="download.jsp">资料下载</a></li>
					<div class="clear"></div>
				</ul>
			</div>
		</div>
	</div>
</div>
