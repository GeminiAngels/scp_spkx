<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="cn.beecloud.*" %>
<%@ page import="cn.beecloud.BCEumeration.*" %>
<%@ page import="cn.beecloud.BCPay" %>
<%@ page import="cn.beecloud.BCUtil" %>
<%@ page import="cn.beecloud.bean.BCException" %>
<%@ page import="cn.beecloud.bean.BCInternationlOrder" %>
<%@ page import="cn.beecloud.bean.BCOrder" %>
<%@ page import="cn.beecloud.bean.CreditCardInfo" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.Properties" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%
	String path = request.getContextPath();
	request.setCharacterEncoding("utf-8");
	String orderno = request.getParameter("orderno");
	String ordertitle = request.getParameter("ordertitle");
	int ordermoney = Integer.parseInt(request.getParameter("ordermoney"))*100;
	String registerid = request.getParameter("rid");
	System.out.println("rid : "+registerid);
	
	String appId = "704d3f1f-adf3-4d3b-976e-2791d68d40ed";
	String testSecret = null;
	String appSecret = "b43a628a-f1ce-4735-9ad3-5f82d139e6f0";
	String masterSecret = "96c7856e-af14-4b58-b62f-2707c23f392a";
	
    Logger log = Logger.getLogger("wxpay.jsp");

    //模拟商户的交易编号、标题、金额、附加数据
    Map<String, Object> optional = new HashMap<String, Object>();
    optional.put("rid", registerid);
    optional.put("register", session.getAttribute("register"));

    String type = request.getParameter("qd");
    //out.print(type);
    PAY_CHANNEL channel;
    try {
        channel = PAY_CHANNEL.valueOf(type);
    } catch (Exception e) {
        channel = null;
        log.error(e.getMessage(), e);
    }
    boolean success = false;

    BeeCloud.registerApp(appId, testSecret, appSecret, masterSecret);
    BCOrder bcOrder = new BCOrder(channel, ordermoney, orderno, "会议费微信订单");
    BCInternationlOrder internationalOrder = new BCInternationlOrder();
    bcOrder.setBillTimeout(360);
    bcOrder.setOptional(optional);

    //以下是WX_JSAPI（公众号内支付）用到的返回参数，需要在页面的js用到
    String jsapiAppid = "";
    String timeStamp = "";
    String nonceStr = "";
    String jsapipackage = "";
    String signType = "";
    String paySign = "";

    //以下是每个渠道的return url
    String returnUrl = "http://www.egeoscience.com.cn/scppay/payresult.jsp?ono="+orderno+"&rid="+registerid;
    //String returnUrl = "http://192.168.0.18/scp_pay/payresult.jsp?ono="+orderno+"&rid="+registerid;

    switch (channel) {

        case WX:
            break;
        case WX_APP:
            break;
        case WX_NATIVE:
            try {
                bcOrder.setNotifyUrl(returnUrl);
                //bcOrder.setNotifyUrl("https:///apidynamic.beecloud.cn/test");
                bcOrder = BCPay.startBCPay(bcOrder);
                //out.println(bcOrder.getObjectId());
                Thread.sleep(3000);
                success = true;
            } catch (BCException e) {
                log.error(e.getMessage(), e);
                out.println(e.getMessage());
            }
            break;

        case WX_JSAPI:
        case BC_WX_JSAPI:
            //微信 公众号id（读取配置文件conf.properties）及微信 redirec_uri
            //Properties prop = loadProperty();
            String wxJSAPIAppId = "wx7bc99f4587eb16ec";//prop.get("wxJSAPIAppId").toString();
            String wxJSAPISecret = "c44cca815657f7b2b5a6ec304ead0724";//prop.get("wxJSAPISecret").toString();
            String wxJSAPIRedirectUrl = "http://www.egeoscience.com.cn/scppay/wxpay.jsp?qd="+type+"&orderno="+orderno+"&ordermoney="+request.getParameter("ordermoney")+"&rid="+registerid;//"http://javademo.beecloud.cn/demo/pay_example/pay.jsp?paytype=" + channel;
            String encodedWSJSAPIRedirectUrl = URLEncoder.encode(wxJSAPIRedirectUrl);
            if (request.getParameter("code") == null || request.getParameter("code").toString().equals("")) {
                String redirectUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + wxJSAPIAppId + "&redirect_uri=" + encodedWSJSAPIRedirectUrl + "&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";
                log.info("wx jsapi redirct url:" + redirectUrl);
                response.sendRedirect(redirectUrl);
            } else {
                String code = request.getParameter("code");
				System.out.println("code:"+code);
                String result = sendGet("https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + wxJSAPIAppId + "&secret=" + wxJSAPISecret + "&code=" + code + "&grant_type=authorization_code");
                log.info("result:" + result);
				System.out.println("result:"+result);
				System.out.println("appid:"+wxJSAPIAppId);
                JSONObject resultObject = JSONObject.fromObject(result);
                if (resultObject.containsKey("errcode")) {
                    out.println("获取access_token出错！错误信息为：" + resultObject.get("errmsg").toString());
                } else {
                    String openId = resultObject.get("openid").toString();
                    System.out.println(openId);
                    bcOrder.setOpenId(openId);
                    try {
                        bcOrder = BCPay.startBCPay(bcOrder);
                        //out.println(bcOrder.getObjectId());
                        System.out.print(bcOrder.getObjectId());

                        Map<String, String> map = bcOrder.getWxJSAPIMap();
                        jsapiAppid = map.get("appId").toString();
                        timeStamp = map.get("timeStamp").toString();
                        nonceStr = map.get("nonceStr").toString();
                        jsapipackage = map.get("package").toString();
                        signType = map.get("signType").toString();
                        paySign = map.get("paySign").toString();
                    } catch (BCException e) {
                        log.error(e.getMessage(), e);
                        out.println(e.getMessage());
                    }
                }
            }

            break;
        case WX_SCAN:
        case BC_ALI_SCAN:
            try {
                bcOrder.setAuthCode("130145749397413855");
                bcOrder = BCPay.startBCOfflinePay(bcOrder);
                out.println(bcOrder.getObjectId());
                out.println(bcOrder.isResult());
            } catch (BCException e) {
                log.error(e.getMessage(), e);
                out.println(e.getMessage());
            }
            break;
        default:
            break;
    }
%>
<%!
    String sendGet(String url) throws Exception {
        String result = "";
        BufferedReader in = null;
        URL realUrl = new URL(url);
        // 打开和URL之间的连接
        HttpURLConnection conn = (HttpURLConnection) realUrl.openConnection();
        // 设置通用的请求属性
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setReadTimeout(5000);
        conn.setConnectTimeout(5000);
        conn.setRequestMethod("GET");
        in = new BufferedReader(
                new InputStreamReader(conn.getInputStream()));
        String line;
        while ((line = in.readLine()) != null) {
            result += line;
        }
        return result;
    }
%>
    <meta http-equiv="Content-Type" content="text/html; UTF-8">
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <title>微信支付</title>
    <!-- Bootstrap core CSS -->
	<link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom styles for this template -->
	<link href="<%=path%>/static/css/custom.css" rel="stylesheet">
	<link href="<%=path%>/static/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12" id="qrcode" align="center">
			</div>
		</div>
	</div>
</body>
<script src="<%=path%>/static/js/jquery-1.11.1.min.js"></script>
<script src="<%=path%>/static/js/qrcode.js"></script>
<script type="text/javascript">
    function makeqrcode() {
        var qr = qrcode(10, 'L');
        qr.addData(codeUrl);
        qr.make();
        var wording = document.createElement('p');
        wording.innerHTML = "打开微信扫一扫，完成支付";
        var code = document.createElement('DIV');
        code.innerHTML = qr.createImgTag();
        var element = document.getElementById("qrcode");
        element.appendChild(wording);
        element.appendChild(code);
        
        $('img').attr('width',300).attr('height',300);
        $('#qrcode').append('扫码支付完成？<button class="btn btn-success btn-ok">返回</button>');
        $('.btn-ok').off('click').on('click',function(){
        	window.location.href = '<%=returnUrl%>';
        })
    }
    var type = '<%=type%>';
    var codeUrl;
    var success = '<%=success%>';
    if (type == 'WX_NATIVE' || type == 'BC_NATIVE' || type == 'BC_ALI_QRCODE') {
        codeUrl = '<%=bcOrder.getCodeUrl()%>';
    }
    if (type == 'WX_NATIVE' || 'true' == success || type == 'BC_NATIVE' || type == 'BC_ALI_QRCODE') {
        makeqrcode();
    }

</script>

<script type="text/javascript">
    callpay();
    function jsApiCall() {
        var data = {
            //以下参数的值由BCPayByChannel方法返回来的数据填入即可
            "appId": "<%=jsapiAppid%>",
            "timeStamp": "<%=timeStamp%>",
            "nonceStr": "<%=nonceStr%>",
            "package": "<%=jsapipackage%>",
            "signType": "<%=signType%>",
            "paySign": "<%=paySign%>"
        };
        //alert(JSON.stringify(data));
        WeixinJSBridge.invoke(
                'getBrandWCPayRequest',
                data,
                function (res) {
                    //alert(res.err_msg);
                    //alert(JSON.stringify(res));
                    WeixinJSBridge.log(res.err_msg);
                    if(res.err_msg == 'get_brand_wcpay_request:ok'){
                    	window.location.href = '<%=returnUrl%>';
                    } else {
                    	window.location.href = 'WritingWorkshop201701.jsp?position=contactWrap';
                    }
                    /*
                    $('#qrcode').append('支付完成？<button class="btn btn-success btn-ok">确定</button> 遇到问题？<button class="btn btn-danger btn-cancel">取消</button>');
                    $('.btn-ok').off('click').on('click',function(){
                    	window.location.href = '<%=returnUrl%>';
                    });
                    $('.btn-cancel').off('click').on('click',function(){
                    	window.location.href = 'WritingWorkshop201701.jsp?position=contactWrap';
                    });
                    */
                }
        );
    }

    function callpay() {
        if (typeof WeixinJSBridge == "undefined") {
            if (document.addEventListener) {
                document.addEventListener('WeixinJSBridgeReady', jsApiCall, false);
            } else if (document.attachEvent) {
                document.attachEvent('WeixinJSBridgeReady', jsApiCall);
                document.attachEvent('onWeixinJSBridgeReady', jsApiCall);
            }
        } else {
            jsApiCall();
        }
    }

</script>
</html>