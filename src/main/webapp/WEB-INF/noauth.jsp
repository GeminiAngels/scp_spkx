<%@ page language="java"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE>
<html>
  <head>    
    <title>无权访问</title>
    <meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<link rel="shortcut icon" href="<%=path%>/static/assets/ico/favicon.ico">
	<link href="<%=path %>/res/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/res/asset/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		/* General */
		body {
			color: #666666;
			font-size: 13px;
			line-height: 23px;
			background: #fff;
			 font-family: '微软雅黑 Bold', '微软雅黑';
			-webkit-font-smoothing: antialiased;
		}
		h1,
		h2,
		h3,
		h4,
		h5,
		h6 {
			color: #666;
			font-family: 'Open Sans', sans-serif;
			font-weight: 600;
			margin: 2px 0px;
			padding: 0px;
		}
		h2 {
			font-size: 25px;
			line-height: 40px;
		}
		p {
			margin: 2px 0px;
			padding: 0px;
			margin-bottom:5px;
			line-height:28px;
		}
		a{
			text-decoration: none;
			color: #777;
		}
		a:hover,a:active,a:focus {
			outline: 0;
			text-decoration: none;
			color: #999;
		}
		:focus {
			outline:none;
		}
		/* Background color classes */
		.bg-white {
		  background-color: #ffffff !important;
		}
		.bg-grey {
		  background-color: #eeeeee !important;
		}
		/* UI X */
		.ui-295 {
			max-width:600px;
			margin:0 auto;
			margin-top:100px;
			background:#fff;
			text-align:center;
			box-shadow:0px 0px 10px rgba(0,0,0,0.2);
			border-radius:5px;
			padding:50px;
		}
		.ui-295  h2{
			font-size:50px;
			line-height:65px;
		}
		@media (max-width:600px){
			.ui-295{
				margin:50px 20px;
			}
			.ui-295 h2{
				font-size:35px;
				line-height:50px;
			}
		}
		.ui-295  h3{
			color:#888;
		}
		.ui-295  p{
			max-width:400px;
			margin:0 auto;
			margin-top:10px;
		}
		.ui-295  form{
			max-width:250px;
			margin:20px auto;
		}
		.ui-295  form input{
			color:#888;
		}
	</style>
	<!--[if lt IE 9]>
  <script src="<%=path %>/res/dist/js/ie9.js"></script>
<![endif]-->
  </head>
  <body class="bg-grey">
	<div class="ui-295">
			<!-- Heading -->
			<h2><strong>对不起<span class="lblue">，</span></strong> <strong>您无权访问该功能页面<span class="lblue">！</span></strong></h2>
			<!-- Heading -->
			<!-- Paragraph -->
			<p>您可以联系管理员，经授权后，方可访问</p>
			<br/><br/>
			<a class="btn btn-success pull-left" id="btn-back">返回</a> <a class="btn btn-danger pull-right" id="btn-close">关闭</a>
	</div>
    <script src="<%=path %>/res/asset/js/jquery.min.js"></script>
    <script type="text/javascript">
    	(function($){
    		$('#btn-back,#btn-close').click(function(event) {
    			goBack();
    		});
    	})(jQuery);
    	
    	/**
    	 * 返回前一页（或关闭本页面）
    	 * <li>如果没有前一页历史，则直接关闭当前页面</li>
    	 */
    	function goBack(){
    	    if ((navigator.userAgent.indexOf('MSIE') >= 0) && (navigator.userAgent.indexOf('Opera') < 0)){ // IE
    	        if(history.length > 0){
    	            window.history.go( -1 );
    	        }else{
    	            window.opener=null;window.close();
    	        }
    	    }else{ //非IE浏览器
    	        if (navigator.userAgent.indexOf('Firefox') >= 0 ||
    	            navigator.userAgent.indexOf('Opera') >= 0 ||
    	            navigator.userAgent.indexOf('Safari') >= 0 ||
    	            navigator.userAgent.indexOf('Chrome') >= 0 ||
    	            navigator.userAgent.indexOf('WebKit') >= 0){

    	            if(window.history.length > 1){
    	                window.history.go( -1 );
    	            }else{
    	                window.opener=null;window.close();
    	            }
    	        }else{ //未知的浏览器
    	            window.history.go( -1 );
    	        }
    	    }
    	}
    </script>
  </body>
</html>
