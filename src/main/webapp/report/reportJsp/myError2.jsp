<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.io.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>������Ϣ</title>
<style>
* { margin:0; padding:0;}
body { text-align:center; font:75% Verdana, Arial, Helvetica, sans-serif;}
h1 { font:125% Arial, Helvetica, sans-serif; text-align:left; font-weight:bolder; background:#333;  padding:3px; display:block; color:#99CC00}
.class1 { width:90%; background:#CCC; position:relative; margin:0 auto; padding:5px;}
span { position:absolute; right:10px; top:8px; cursor:pointer; color:yellow;}
p { text-align:left; line-height:20px; background:#333; padding:3px; margin-top:5px; color:#99CC00}
#class1content { height:400px;overflow:auto}
</style>
<script>
function $(element){
return element = document.getElementById(element);
}
function $D(){
var d=$('class1content');
var h=d.offsetHeight;
var maxh=400;
function dmove(){
h+=50; //���ò�չ�����ٶ�
if(h>=maxh){
d.style.height='400px';
clearInterval(iIntervalId);
}else{
d.style.display='block';
d.style.height=h+'px';
}
}
iIntervalId=setInterval(dmove,2);
}
function $D2(){
var d=$('class1content');
var h=d.offsetHeight;
var maxh=400;
function dmove(){
h-=50;//���ò��������ٶ�
if(h<=0){
d.style.display='none';
clearInterval(iIntervalId);
}else{
d.style.height=h+'px';
}
}
iIntervalId=setInterval(dmove,2);
}
function $use(){
var d=$('class1content');
var sb=$('stateBut');
if(d.style.display=='none'){
$D();
sb.innerHTML='����';
}else{
$D2();
sb.innerHTML='�鿴��ϸ��Ϣ';
}
}
</script>
</head>
<body >
<div class="class1">
<%
	Exception e = ( Exception ) request.getAttribute( "exception" );
	out.println( "<h1>��Ϣ��</h1><div style='color:red'>" + e.getMessage() + "</div>" );
	
%>
<span id="stateBut" onclick="$use()">�鿴��ϸ��Ϣ</span>
<p id="class1content" style="display:none">
<% //e.printStackTrace(new PrintWriter(out)); 
java.io.StringWriter jsOutput = new StringWriter(); 
PrintWriter jsContentWriter = new PrintWriter(jsOutput); 
e.printStackTrace(jsContentWriter);
java.util.StringTokenizer st = new java.util.StringTokenizer(jsOutput.toString(),"\t");
while (st.hasMoreTokens()) {
	out.println(st.nextToken()+"<br>&nbsp;&nbsp;&nbsp;&nbsp;");
}
%></p>
</div>
</body>
</html>