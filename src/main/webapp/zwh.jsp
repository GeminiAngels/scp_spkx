<%@page contentType="text/html;charset=utf-8" language="java"%>
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
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<link rel="shortcut icon" href="<%=path%>/static/assets/ico/favicon.ico">
	<title>第三届食品科学与人类健康国际研讨会_食品科学网</title>
	<link rel="stylesheet" type="text/css" href="<%=path%>/static/spkx/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/static/spkx/css/style.css" />

	<link href="<%=path%>/static/css/font-awesome.min.css" rel="stylesheet">
	<!--    <script src="js/jquery.js" type="text/javascript"></script>-->
	<script src="<%=path%>/static/spkx/js/jquery.min.js" type="text/javascript"></script>
	<script src="<%=path%>/static/spkx/js/tab.js" type="text/javascript"></script>
	<script src="<%=path%>/static/spkx/js/bootstrap.min.js"></script>
</head>

<body>
<!-- 头部模块 -->
<%@include file="/inc/headbar.jsp" %>
<div class="main">
	<h2 style="margin-bottom:30px;"><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/>组织委员会</h2>
	<div class="zzjgbox">
		<ul class="abdtbox">
			<li class="left">荣誉主席</li>
			<li class="right">
				<div class="ico"></div>
				<span style="color:#999;">按姓氏拼音排序</span><br>
				Gerard Downey教授：美国国际谷物化学家学会（AACCI）前主席、爱尔兰都柏林大学教授<br>
				Robert G (Bob) Gilbert院士：澳大利亚科学院院士、昆士兰大学营养与食品科学系教授<br>
				陈  坚教授：国际食品科学院院士、江南大学校长<br>
				管华诗院士：中国工程院院士、山东省科协主席、中国海洋大学原校长<br>
				李  琳教授：东莞理工学院校长<br>
				李树君教授：亚洲农业工程学会主席、中国食品和包装机械工业协会理事长、中国农业机械化科学研究院院长<br>
				李  玉院士：中国工程院院士、吉林农业大学原校长<br>
				李元昆教授：国际微生物学会联盟主席、新加坡国立大学医学院<br>
				贾敬敦先生：科技部中国农村技术开发中心主任<br>
				潘迎捷教授：上海海洋大学原校长<br>
				庞国芳院士：中国工程院院士、中国检验检疫科学研究院首席科学家<br>
				饶平凡教授：国际食品科技联盟前主席、国际食品科学院院士、福州大学前副校长<br>
				孙宝国院士：中国工程院院士、北京工商大学校长<br>
				王进崑教授：国际营养与功能食品学会理事长、台湾国际生命科学学会荣誉理事长、台湾中山医学大学前校长<br>
				吴天一院士：中国工程院院士、青海高原医学科学研究院原院长<br>
				张改平院士：中国工程院院士、河南农业大学校长<br>
				周光宏教授：南京农业大学校长、中国畜产品加工研究会名誉会长<br>
				朱蓓薇院士：中国工程院院士、大连工业大学食品学院院长<br>
				朱明研究员：中国农业工程学会理事长、农业部规划设计研究院原院长、《农业工程学报》主编
				<div class="jx"></div>
			</li>
			<div class="clear"></div>
		</ul>
		<ul class="abdtbox">
			<li class="left">主 席</li>
			<li class="right">
				<div class="ico"></div>
				<span style="color:#999;">按主办协办单位排序</span><br>
				王守伟教授：北京食品科学研究院院长、中国食品杂志社社长、中国肉类食品综合研究中心主任<br>
				Hamit Köksel教授：国际谷物科技学会（ICC）主席、土耳其哈斯特帕大学<br>
				李元元院士：中国工程院院士、吉林大学校长<br>
				陈  岗教授：吉林大学副校长<br>
				Michaela Pichler博士：国际谷物科技学会（ICC）秘书长<br>
				潘忠礼教授：华美食品学会（CAFS）主席、美国农业部农业服务局西部研究中心资深研究员、加利福尼亚大学<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;戴维斯分校生物与农业工程系教授<br>
				Robert L. Cracknell教授：美国国际谷物化学家学会（AACCI）主席，澳大利亚谷物科学协会（AGSA）主席，<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;国际谷物科学技术学会（ICC）前主席<br>
				Amy Hope女士：美国国际谷物化学家学会（AACCI）秘书长<br>
				王凤成教授：国际谷物科技学会（ICC）前任主席、河南工业大学国际粮食研究中心主任、国家粮食局粮油食品<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工程技术研究中心主任、国家粮食加工装备工程技术研究中心主任<br>
				Thomas F. Hofmann教授：《Journal of Agricultural and Food Chemistry》杂志主编<br>
				孙大文院士：欧洲人文和自然科学院院士、爱尔兰皇家科学院院士、国际食品科学院院士、国际农业工程学会<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（CIGR）前主席、《Food and Bioprocess Technology》杂志总编、爱尔兰国立都柏林大学教授<br>
				刘瑞海教授：国际食品科学院院士、《Food Science and Human Wellness》杂志总编、《Journal of Food<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Science》杂志副主编、美国康乃尔大学农业与生命科学学院食品科学系教授<br>
				何其傥教授：国际食品科学院院士、《Journal of Agricultural and Food Chemistry》杂志副主编、美国罗格<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;斯大学食品科学系杰出教授<br>
				Fereidoon Shahidi 教授：国际食品科学院院士、英国皇家化学会会士、国际营养与功能食品学会主要创始人、<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;《Journal of Functional Foods》杂志主编、《Food Chemistry》杂志副主编、加拿大纽芬兰纪念大学教<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;授<br>
				孙璐西教授：国际食品科学院院士、《Journal of Food and Drug Analysis》杂志主编、台湾大学食品科技研<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;究所教授
				<div class="jx"></div>
			</li>
			<div class="clear"></div>
		</ul>
		<ul class="abdtbox">
			<li class="left">副主席</li>
			<li class="right">
				<div class="ico"></div>
				赵  燕女士：北京食品科学研究院副院长、中国食品杂志社执行社长、北京市食品酿造研究所所长<br>
				郭明若教授：吉林大学食品科学与工程学院院长<br>
				高福和研究员：吉林大学食品科学与工程学院党委书记<br>
				刘静波教授：吉林大学食品科学与工程学院副院长<br>
				陈振宇教授：香港中文大学生命科学学院食品及营养学部主任、《Journal of Agricultural and Food <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Chemistry》杂志副主编<br>
				熊幼翎教授：美国肯塔基大学农业学院动物和食品科学系科研部主任、《Journal of Food Science》杂志科学主<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编、《Food Bioscience》副主编、教育部长江学者特聘教授<br>
				潘敏雄教授：台湾大学食品科技研究所、《Journal of Food and Drug Analysis》杂志副主编<br>
				Louise Wicker教授：美国路易斯安那州立大学巴吞鲁日分校农业研究中心营养与食品科学学院主任、美国<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phi Tau Sigma食品科技荣誉学会前任主席、《Food Science and Human Wellness》杂志科学主编<br>
				Klaus W. Lange教授：国际运动与营养学会主席、德国雷根斯堡大学实验心理学系主任、《Food Science<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and Human Wellness》杂志科学主编<br>
				李士明教授：湖北黄冈师范学院生命科学学院、湖北省百人计划教授、楚天学者特聘教授、美国新泽西州罗格斯<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;大学食品科学系访问教授、《Food Science and Human Wellness》杂志科学主编
				<div class="jx"></div>
			</li>
			<div class="clear"></div>
		</ul>
		<ul class="abdtbox">
			<li class="left">委 员</li>
			<li class="right">
				<div class="ico"></div>
				孙勇副研究员：北京食品科学研究院副总工程师、中国食品杂志社副社长、《食品科学》杂志主编、《Food<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Science and Human Wellness》执行主编<br>
				李永军研究员：吉林大学食品科学与工程学院副院长<br>
				张铁华教授：吉林大学食品科学与工程学院副院长<br>
				王  昕教授: 吉林大学食品科学与工程学院副院长<br>
				梅士伟研究员：吉林大学食品科学与工程学院副书记兼副院长<br>
				IL KIM教授：韩国釜山国立大学化学工程（高分子科学与工程）系主任、韩国教育部“面向21世纪智力韩国计划<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（Brain Korea (BK) 21 PLUS）”高等化学工艺研究中心主任<br>
				陈宁研究员：武汉体育学院楚天学者特聘教授、《Food Science and Human Wellness》副主编<br>
				吴建平教授：加拿大阿尔伯塔大学农业、食品与营养科学系、《Food Science and Human Wellness》副主编<br>
				王惠民教授：台湾国立中兴大学、《Food Science and Human Wellness》副主编<br>
				沈清武教授：湖南农业大学食品科技学院、《Food Science and Human Wellness》副主编<br>
				Alexander M. Gosslau副教授：美国纽约城市大学生命科学系、美国罗格斯大学化学生物学系、《Food<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Science and Human Wellness》副主编<br>
				徐宝军副教授：北京师范大学-香港浸会大学联合国际学院、《Food Science and Human Wellness》副主编
				<div class="jx"></div>
			</li>
			<div class="clear"></div>
		</ul>
	</div>
	<a name="jwh" id="jwh"></a>
	<h2 style="margin-bottom:30px;"><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/>技术委员会</h2>
	<div class="zzjgbox">
		<ul class="abdtbox">
			<li class="left">名 单</li>
			<li class="right">
				<div class="ico"></div>
				<span style="color:#999;">按姓氏拼音排序</span><br>
				Byong H. Lee教授：加拿大麦吉尔大学食品科学与农业化学学系<br>
				Dominic W. S. Wong教授：美国农业部农业科学研究院西部地区研究中心<br>
				Michael Tilley教授：美国农业部谷物与动物健康研究中心<br>
				Okkyung Kim Chung教授：美国堪萨斯州立大学<br>
				Patricia Rayas-Duarte教授：美国俄克拉荷马州立大学<br>
				Perry Ng教授：美国密歇根州立大学<br>
				Takaharu Sakiyama教授：日本东京海洋大学食品科技系<br>
				Jan Willem van der Kamp教授：国际谷物科技学会（ICC）学术委员会主席、荷兰TNO<br>
				Roland Poms博士：国际谷物科技学会（ICC）前秘书长<br>
				Yacine Hemar教授：新西兰奥克兰大学<br>
				阿不都拉•阿巴斯教授：新疆大学生命科学与技术学院<br>
				毕  阳教授：甘肃农业大学副校长<br>
				蔡慧农教授：集美大学食品与生物工程学院<br>
				曹敏杰教授：集美大学副校长<br>
				陈  峰教授：国际食品科学院院士、北京大学工学院副院长、中组部“千人计划”引进教授、《Food ＆<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Function》杂志副主编<br>
				陈  峰教授：美国克莱姆森大学食品营养与包装科学系<br>
				陈建设教授：浙江工商大学食品与生物工程学院副院长<br>
				陈庆森教授：天津商业大学生物技术与食品科学学院副院长<br>
				陈  卫教授：江南大学食品学院院长<br>
				陈颖研究员：中国检验检疫科学研究院副院长兼总工程师<br>
				陈永胜教授：内蒙古民族大学校长<br>
				陈运中教授：湖北中医药大学副校长<br>
				储晓刚研究员：中国检验检疫科学研究院食品安全研究所所长<br>
				邓放明教授：湖南农业大学食品科学技术学院院长<br>
				邓泽元教授：南昌大学食品学院<br>
				董庆利教授：上海理工大学医疗器械与食品工程学院<br>
				董海洲教授：山东农业大学食品学院院长<br>
				堵国成教授：江南大学生物工程学院院长<br>
				杜  敏教授：美国华盛顿州立大学<br>
				杜平悳教授：台湾嘉南药理科技大学民生学院院长<br>
				杜先锋教授：安徽农业大学茶与食品科技学院副院长<br>
				方  继教授：国立中兴大学（台湾）食品暨应用生物科技学系主任<br>
				方亚鹏教授：湖北工业大学轻工学部食品与制药工程学院院长<br>
				扶  雄教授：华南理工大学轻工与食品学院院长<br>
				高丽萍教授：北京联合大学功能食品科学技术研究院副院长<br>
				郜海燕研究员：浙江省农业科学院食品加工研究所<br>
				葛长荣教授：云南农业大学副校长<br>
				郭  宏教授：北京食品科学研究院副院长、北京市食品研究所所长<br>
				郝利民教授：解放军总后勤部军需装备研究所<br>
				何东平教授：武汉轻工大学食品科学与工程学院<br>
				何  强教授：四川大学轻纺与食品学院副院长<br>
				侯冬岩教授：鞍山师范学院副校长<br>
				胡秋辉教授：南京财经大学食品科学与工程学院院长<br>
				胡小松教授：中国农业大学食品科学与营养工程学院院长<br>
				黄光伟教授：华美食品学会、美国加利福尼亚杏仁商会食品研究和技术副总监<br>
				黄庆荣教授：美国罗格斯大学<br>
				黄耀文教授：美国佐治亚大学<br>
				贾英民教授：北京工商大学副校长<br>
				江昌俊教授：安徽农业大学茶与食品科技学院院长<br>
				江连洲教授：东北农业大学食品学院院长<br>
				江正强教授：中国农业大学食品科学与营养工程学院副院长<br>
				姜绍通教授：合肥工业大学生物与食品工程学院<br>
				金昌海教授：扬州大学食品科学与工程学院副院长<br>
				金宗濂教授：北京联合大学应用文理学院<br>
				靳  烨教授：内蒙古农业大学食品科学与工程学院<br>
				金征宇教授：江南大学副校长<br>
				鞠兴荣教授：南京财经大学副校长<br>
				康文艺教授：河南大学药学院副院长<br>
				雷红涛教授：华南农业大学食品学院执行院长<br>
				李  东教授：北京市营养源研究所党委书记、所长<br>
				李冬生教授：湖北工业大学副校长<br>
				李洪军教授：西南大学研究生院常务副院长<br>
				李 华教授：西北农林科技大学副校长<br>
				李建科教授：陕西师范大学食品工程与营养科学学院<br>
				李绍平教授：澳门大学中药质量研究国家重点实验室副主任<br>
				李  勇教授：北京大学公共卫生学院营养与食品卫生学系主任<br>
				李忠海教授：中南林业科技大学食品科学与工程学院<br>
				励建荣教授：渤海大学副校长<br>
				连  宾教授：南京师范大学生命科学学院<br>
				林  洪教授：中国海洋大学食品科学与工程学院党委书记<br>
				林亲录教授：中南林业科技大学食品科学与工程学院院长<br>
				刘宝林教授：上海理工大学医疗器械与食品学院院长<br>
				刘成梅教授：南昌大学食品学院院长<br>
				刘景圣教授：吉林农业大学食品工程学院院长<br>
				刘静波教授：吉林大学食品科学与工程学院副院长<br>
				刘敬泽教授：河北师范大学副校长<br>
				刘  箐教授：上海理工大学医疗器械与食品学院、国家“千人计划”特聘教授<br>
				刘  文教授：中国标准化研究院食品与农业标准化研究所所长<br>
				刘新旗教授：北京工商大学食品学院、国家“千人计划”特聘教授<br>
				刘学波教授：西北农林科技大学食品科学与工程学院院长<br>
				陆启玉教授：河南工业大学粮油食品学院<br>
				卢向阳教授：湖南农业大学副校长<br>
				卢晓黎教授：四川大学轻纺与食品学院<br>
				陆兆新教授：南京农业大学食品学院<br>
				罗  杰教授：国家食品药品监督管理总局高级研修学院副院长<br>
				罗亚光教授：美国农业部农产品安全与质量资深研究员<br>
				罗云波教授：国际食品科学院院士、中国农业大学食品科学与营养工程学院<br>
				马海乐教授：江苏大学食品与生物工程学院院长<br>
				聂少平教授：南昌大学食品工程学院副院长<br>
				欧竑宇教授：上海交通大学生命科学技术学院<br>
				潘丽军教授：合肥工业大学生物与食品工程学院<br>
				潘思轶教授：华中农业大学食品科学技术学院<br>
				庞广昌教授：天津商业大学生物技术与食品科学学院、天津商业大学海洋食品与药物研究所执行所长<br>
				裴世春教授：齐齐哈尔大学食品与生物工程学院院长<br>
				蒲  彪教授：四川农业大学食品学院<br>
				齐  斌教授：常熟理工学院生物与食品工程学院党委书记<br>
				邱树毅教授：贵州大学酿酒与食品工程学院院长<br>
				单杨研究员：湖南省农业科学院副院长<br>
				石彦国教授：哈尔滨商业大学食品工程学院院长<br>
				孙桂菊教授：东南大学公共卫生学院营养与食品卫生系主任<br>
				孙庆杰教授：青岛农业大学食品科学与工程学院副院长<br>
				孙远明教授：华南农业大学食品学院<br>
				王大为教授：吉林农业大学食品科学与工程学院副院长<br>
				王  颉教授：河北农业大学食品科技学院院长<br>
				王强研究员：中国农业科学院农产品加工研究所副所长<br>
				王  硕教授：天津科技大学食品工程与生物技术学院<br>
				汪兴平教授：湖北民族学院副校长<br>
				王锡昌教授：上海海洋大学食品学院院长<br>
				王应宽研究员：农业部规划设计研究院信息中心主任、《国际农业与生物工程学报》（IJABE）主编<br>
				王  钊教授：清华大学医学院<br>
				汪少芸教授：福州大学生物科学与工程学院副院长<br>
				魏益民研究员：中国农业科学院农产品加工研究所<br>
				吴永宁研究员：国家食品安全风险评估中心首席专家<br>
				夏立秋教授：湖南师范大学生命科学学院<br>
				夏延斌教授：湖南农业大学食品科技学院<br>
				肖行副教授:美国马萨诸塞大学<br>
				谢明勇教授：南昌大学副校长<br>
				邢新会教授：清华大学化工系副主任、《Journal of Bioscience and Bioengineering》杂志主编、<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;《Biochemical Engineering Journal》杂志副主编<br>
				徐  虹教授：南京工业大学食品与轻工学院院长<br>
				徐明生教授：江西农业大学食品科学与工程学院院长<br>
				徐幸莲教授：南京农业大学食品科技学院院长、中国畜产品加工研究会会长<br>
				徐志民教授：美国路易斯安娜州立大学<br>
				薛长湖教授：中国海洋大学食品科学与工程学院院长<br>
				杨铭铎教授：黑龙江省科学技术协会副主席、哈尔滨商业大学<br>
				杨海燕教授：新疆农业大学食品与药学学院院长<br>
				杨兴斌教授：陕西师范大学食品工程与营养科学学院院长<br>
				叶兴乾教授：浙江大学生物系统工程与食品科学学院副院长<br>
				余龙江教授：华中科技大学生命科学与技术学院副院长<br>
				俞伟祖教授：中粮集团中粮营养健康研究院首席科学家、国家“千人计划”特聘教授<br>
				郁建平教授：贵州大学生命科学学院<br>
				袁其朋教授：北京化工大学生命科学与技术学院院长<br>
				岳田利教授：西北农林科技大学食品科学与工程学院<br>
				章超桦教授：广东海洋大学副校长<br>
				张芳荣教授：高雄医学大学<br>
				张  灏教授：江南大学食品学院<br>
				张和平教授：内蒙古农业大学食品科学与工程学院<br>
				张经华研究员：北京市理化分析测试中心主任<br>
				张坤生教授：天津商业大学生物技术与食品科学学院院长<br>
				张兰威教授：哈尔滨工业大学化工学院<br>
				张名位研究员：广东省农业科学院蚕业与农产品加工研究所所长<br>
				张文生教授：北京师范大学资源学院<br>
				张 岩研究员：河北省食品检验研究院副院长<br>
				张 征研究员：江苏省食品药品质量监督检验研究院副院长<br>
				张志强教授：香港中文大学食品及营养科学系主任<br>
				赵国华教授：西南大学食品科学学院院长<br>
				郑宝东教授：福建农林大学食品科学学院院长<br>
				郑  磊教授：合肥工业大学科学技术研究院院长<br>
				郑喜群教授：齐齐哈尔大学副校长<br>
				周  坚教授：武汉轻工大学副校长<br>
				邹小波教授：江苏大学食品与生物工程学院<br>
				朱文学教授：河南科技大学食品与生物工程学院
				<div class="jx"></div>
			</li>
			<div class="clear"></div>
		</ul>
	</div>
</div>

<%@include file="/inc/footer.jsp"%>
<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/interface/RegisterService.js'></script>
<c:if test="${not empty register}">
	<script type='text/javascript' src='<%=path%>/dwr/interface/OrderService.js'></script>
</c:if>
<script src="<%=path%>/static/spkx/js/biz.js"></script>
<script type="text/javascript">
	$(function(){
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
	});
</script>
</body>
</html>