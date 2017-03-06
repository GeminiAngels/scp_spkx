<%--
<div class="topbox">
	<div class="lang"><a href="index.jsp"><img src="<%=path%>/static/spkx/images/ico_cn.png"></a></div>
	<div class="imbox"><img src="<%=path%>/static/spkx/images/top_txt_en.png"></div>
	<div class="bm"><a href="en_info.jsp"><img src="<%=path%>/static/spkx/images/top_bm_en.png"></a></div>
</div>
<div class="navbox">
	<div class="nav-spkx-en">
		<ul>
			<li><a href="en_index.jsp">Home</a></li>
			<li><a href="en_zzjg.jsp">Organizational unit</a></li>
			<li><a href="en_hyjj.jsp">Meeting Profile</a></li>
			<li><a href="en_zwh.jsp">Organizing Committee</a></li>
			<li><a href="en_hynr.jsp">Symposium Content</a></li>
			<li><a href="en_hylw.jsp">Papers </a></li>
			<li><a href="en_fyhk.jsp">Fees</a></li>
			<li><a href="en_hwz.jsp">The Conference Secretary</a></li>
			<div class="clear"></div>
		</ul>
	</div>
</div>
--%>



<div class="topbox">
	<div class="lang">
		<c:if test="${not empty register}">
			<button class="btn btn-default btn-showinfo-en">Welcome,${register.nickname}</button> <button class="btn btn-default btn-logout-en">Sign out</button>
		</c:if>
		<c:if test="${empty register}">
			<button class="btn btn-default btn-login-en">Sign in</button> <button class="btn btn-default btn-register-en">Register</button>
		</c:if>
		<button class="btn btn-danger btn-cnindex">CN</button>
	</div>
	<div class="imbox"><img src="<%=path%>/static/spkx/images/top_txt_en.png"><div class="imbox_wz"><h2>3rd International Symposium of <i>Food Science and Human Wellness</i></h2><p>August 5-6,2017 JiLin,Changcun,China<p></div>
	</div>
	<div class="bm">
		<a href="en_info.jsp"><img src="<%=path%>/static/spkx/images/top_bm_en.png"></a>
	</div>
</div>
<div class="navbox">
	<div class="nav-spkx-en">
		<ul>
			<li><a href="en_index.jsp">Home</a></li>
			<li><a href="en_zzjg.jsp">Organizational unit</a></li>
			<li><a href="en_hyjj.jsp">Meeting Profile</a></li>
			<li><a href="en_zwh.jsp">Organizing Committee</a></li>
			<li><a href="en_hynr.jsp">Symposium Content</a></li>
			<li><a href="en_hylw.jsp">Papers </a></li>
			<li><a href="en_fyhk.jsp">Fees</a></li>
			<li><a href="en_hwz.jsp">The Conference Secretary</a></li>
			<%--<li><a href="en_bmfs.jsp">Registration method</a></li>--%>
			<li><a href="en_download.jsp">Download</a></li>
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
				<a class="navbar-brand" href="#topWrap" style="font-size: 14px;">
					e-Sciences+<span class="title"> Conference platform</span>
				</a>
			</div>
			<div class="collapse navbar-collapse appiNav">
				<ul class="nav navbar-nav">
					<li style="text-align: center">
						<c:if test="${not empty register}">
							<button class="btn btn-default btn-showinfo">Welcome，${register.nickname}</button> <button class="btn btn-default btn-logout">Sign out</button>
						</c:if>
						<c:if test="${empty register}">
							<button class="btn btn-success btn-login">Sign in</button> <button class="btn btn-warning btn-register">Register</button>
						</c:if>
						<button class="btn btn-danger btn-cnindex">CN</button>
					</li>
					<li><a href="en_index.jsp">Home</a></li>
					<li><a href="en_zzjg.jsp">Organizational unit</a></li>
					<li><a href="en_hyjj.jsp">Meeting Profile</a></li>
					<li><a href="en_zwh.jsp">Organizing Committee</a></li>
					<li><a href="en_hynr.jsp">Symposium Content</a></li>
					<li><a href="en_hylw.jsp">Papers </a></li>
					<li><a href="en_fyhk.jsp">Fees</a></li>
					<li><a href="en_hwz.jsp">The Conference Secretary</a></li>
					<%--<li><a href="en_bmfs.jsp">Registration method</a></li>--%>
					<li><a href="en_download.jsp">Download</a></li>
					<div class="clear"></div>
				</ul>
			</div>
		</div>
	</div>
</div>
