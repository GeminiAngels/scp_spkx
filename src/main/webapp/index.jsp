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
</head>

<body>
<!-- 头部模块 -->
<%@include file="/inc/headbar.jsp" %>
<%--头部通知滚动条--%>
<div class="main alert alert-info">
	<marquee behavior="scroll"  width="100%" direction="left" scrollamount="3" onmouseover="this.stop()" onmouseout="this.start()">
		第三届食品科学与人类健康国际研讨会_食品科学网
	</marquee>
	<%--<marquee class="marquee"   scrollamount="1" direction="up" onmouseover="this.stop()" onmouseout="this.start()">&nbsp;
	</marquee>--%>
</div>
<div class="main">
	<h2><span><a href="#">查看更多+</a></span><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/><a href="#">组织机构</a></h2>
	<div class="zzjg row">
		<div class="col-sm-6 col-xs-12">
			<div class="left">
				<h3>主办单位</h3>
				<p>北京食品科学研究院</p>
				<p> 中国食品杂志社《食品科学》杂志</p>
				<p> 中国食品杂志社《Food Science and Human Wellness》杂志</p>
				<p> 国际谷物科技学会（ICC）</p>

				<h3>共同主办</h3>
				<p>吉林大学食品科学与工程学院
					<br> 华美食品学会（CAFS）
				</p>
				<h3>赞助单位</h3>
				<p>北京盈盛恒泰科技有限公司</p>
			</div>
		</div>
		<div class="col-sm-6 col-xs-12">
			<div class="right">
				<img src="<%=path%>/static/spkx/images/pic01.png" alt="" />
				<h3>支持协办</h3>
				<p>美国国际谷物化学家学会（AACCI）
					<br> 《Journal of Food Science》杂志（SCI收录）
					<br> 《Journal of Agricultural and Food Chemistry》杂志（SCI收录）
					<br> 《Food and Bioprocess Technology》杂志（SCI收录）
					<br> 《Journal of Functional Foods》杂志（SCI收录）
					<br> 《Food Chemistry》杂志（SCI收录）
					<br> 《Journal of Food and Drug Analysis》杂志（SCI收录）</p>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div>
<div class="main_bg">
	<div class="main">
		<h2><span><a href="#">查看更多+</a></span><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/><a href="#">会议介绍</a></h2>
		<div class="hyjs row"> <img src="<%=path%>/static/spkx/images/pic02.png" alt="" class="col-sm-5 col-xs-6" />
			<p class="col-sm-7 col-xs-12">食品对于人类健康的重要性不言而喻，中华民族自古就有“寓医于食”的传统，“饮食者，人之命脉也”则是明代医药学巨匠李时珍对膳食营养的健康作用所做的高度概括。世界卫生组织（WHO）近年对影响人类健康的众多因素的评估结果也表明：膳食营养因素的影响（13%）仅次于居首位的遗传因素（15%），远高于医疗因素（仅8%）的作用。不断快速发展的食品科学技术极大地促进了食品种类的多样化和营养的全面均衡，不仅带来了食品产业的繁荣，还促进了人类寿命的延长和生活品质的提高。随着新科技革命的蓬勃发展，尤其是在信息技术、生命科学和纳米技术等领域的快速发展，更是促进了食品科学技术的巨大变革，大力推进了先进科学技术在食品产业中的应用。随着中国工业化、城镇化、老龄化进程加快，肥胖、高血压、糖尿病和冠心病等慢性病患病率呈现持续、快速增长的趋势。如何为消费者提供更营养、更健康的食物，成为我国乃至全球关注的重大课题。全球一系列重大食品安全事件的发生，凸显出技术进步和社会发展对食品数量、质量与安全问题的严峻考验，这已关系到人类乃至下一代的健康和安全，保障食品安全已经成为了保护人类生命健康、提高生活质量、促进食品贸易、维护社会和谐发展的重大政策问题，因此食品科学任重而道远，仍将不断上下求索来应对所有的挑战。</p>
			<div class="clear"></div>
		</div>
	</div>
</div>
<div class="main">
	<h2><span><a href="#">查看更多+</a></span><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/><a href="#">组织委员会</a><b class="dc"><a href="#">技术委员会</a></b></h2>
	<div class="box_qh" id="qh01">
		<div class="qh_top">
			<ul id="tabs_head">
				<li class='menu_tab_li'><a href="#">荣誉主席</a></li>
				<li class='menu_tab_li'><a href="#">主 席</a></li>
				<li class='menu_tab_li'><a href="#">副主席</a></li>
				<li class='menu_tab_li'><a href="#">委 员</a></li>
			</ul>
		</div>
		<div class="liebbox" id="tabs_body">
			<ul>
				<!--tab模块1-->
				<li id="s_1">
					<div class="txt01">按姓氏拼音排序</div>
					<div class="txtbox col-sm-8 col-xs-12"> Gerard Downey教授：美国国际谷物化学家学会（AACCI）前主席、爱尔兰都柏林大学教授
						<br> Robert G (Bob) Gilbert院士：澳大利亚科学院院士、昆士兰大学营养与食品科学系教授
						<br> 陈 坚教授：国际食品科学院院士、江南大学校长
						<br> 管华诗院士：中国工程院院士、山东省科协主席、中国海洋大学原校长
						<br> 李 琳教授：东莞理工学院校长
						<br> 李树君教授：亚洲农业工程学会主席、中国食品和包装机械工业协会理事长、中国农业机械化科学研究院院长
						<br> 李 玉院士：中国工程院院士、吉林农业大学原校长
						<br> 李元昆教授：国际微生物学会联盟主席、新加坡国立大学医学院
						<br> 贾敬敦先生：科技部中国农村技术开发中心主任
						<br> 潘迎捷教授：上海海洋大学原校长
						<br> 庞国芳院士：中国工程院院士、中国检验检疫科学研究院首席科学家
						<br> 饶平凡教授：国际食品科技联盟前主席、国际食品科学院院士、福州大学前副校长
						<br> 孙宝国院士：中国工程院院士、北京工商大学校长
						<br> 王进崑教授：国际营养与功能食品学会理事长、台湾国际生命科学学会荣誉理事长、台湾中山医学大学前校长
						<br> 吴天一院士：中国工程院院士、青海高原医学科学研究院原院长
						<br> 张改平院士：中国工程院院士、河南农业大学校长
						<br> 周光宏教授：南京农业大学校长、中国畜产品加工研究会名誉会长
						<br> 朱蓓薇院士：中国工程院院士、大连工业大学食品学院院长
						<br> 朱明研究员：中国农业工程学会理事长、农业部规划设计研究院原院长、《农业工程学报》主编 </div>
				</li>
			</ul>
			<ul>
				<!--tab模块2-->
				<li id="s_2" style="display:none;">
					<div class="txt01">按主办协办单位排序</div>
					<div class="txtbox col-sm-8 col-xs-12"><strong>王守伟教授</strong>：北京食品科学研究院院长、中国食品杂志社社长、中国肉类食品综合研究中心主任
						<br>
						<strong>王凤成教授</strong>：国际谷物科技学会（ICC）主席、河南工业大学国际粮食研究中心主任、国家粮食局粮油食品工程技术研究中心主任、国家粮食加工装备工程技术研究中心主任
						<br>
						<strong>李元元院士</strong>：中国工程院院士、吉林大学校长
						<br>
						<strong>陈  岗教授</strong>：吉林大学副校长
						<br>
						<strong>Michaela Pichler博士</strong>：国际谷物科技学会（ICC）秘书长
						<br>
						<strong>潘忠礼教授</strong>：华美食品学会（CAFS）主席、美国农业部农业服务局西部研究中心资深研究员、加利福尼亚大学戴维斯分校生物与农业工程系教授
						<br>
						<strong>Robert L. Cracknell教授</strong>：美国国际谷物化学家学会（AACCI）主席，澳大利亚谷物科学协会（AGSA）主席，国际谷物科学技术学会（ICC）前主席
						<br>
						<strong>Amy Hope女士</strong>：美国国际谷物化学家学会（AACCI）秘书长
						<br>
						<strong>Thomas F. Hofmann教授</strong>：《Journal of Agricultural and Food Chemistry》杂志主编
						<br>
						<strong>孙大文院士</strong>：欧洲人文和自然科学院院士、爱尔兰皇家科学院院士、国际食品科学院院士、国际农业工程学会（CIGR）前主席、《Food and Bioprocess Technology》杂志总编、爱尔兰国立都柏林大学教授
						<br>
						<strong>刘瑞海教授</strong>：国际食品科学院院士、《Food Science and Human Wellness》杂志总编、《Journal of Food Science》杂志副主编、美国康乃尔大学农业与生命科学学院食品科学系教授
						<br>
						<strong>何其傥教授</strong>：国际食品科学院院士、《Journal of Agricultural and Food Chemistry》杂志副主编、美国罗格斯大学食品科学系杰出教授
						<br>
						<strong>Fereidoon Shahidi 教授</strong>：国际食品科学院院士、英国皇家化学会会士、国际营养与功能食品学会主要创始人、《Journal of Functional Foods》杂志主编、《Food Chemistry》杂志副主编、加拿大纽芬兰纪念大学教授
						<br>
						<strong>孙璐西教授</strong>：国际食品科学院院士、《Journal of Food and Drug Analysis》杂志主编、台湾大学食品科技研究所教授 </div>
				</li>
			</ul>
			<ul>
				<!--tab模块3-->
				<li id="s_3" style="display:none;">
					<div class="txt01">按主办协办单位排序</div>
					<div class="txtbox col-sm-8 col-xs-12">赵 燕女士：北京食品科学研究院副院长、中国食品杂志社执行社长、北京市食品酿造研究所所长
						<br> 郭明若教授：吉林大学食品科学与工程学院院长
						<br> 高福和研究员：吉林大学食品科学与工程学院党委书记
						<br> 刘静波教授：吉林大学食品科学与工程学院副院长
						<br> 陈振宇教授：香港中文大学生命科学学院食品及营养学部主任、《Journal of Agricultural and Food Chemistry》杂志副主编
						<br> 熊幼翎教授：美国肯塔基大学农业学院动物和食品科学系科研部主任、《Journal of Food Science》杂志科学主编、《Food Bioscience》副主编、教育部长江学者特聘教授
						<br> 潘敏雄教授：台湾大学食品科技研究所、《Journal of Food and Drug Analysis》杂志副主编
						<br> Louise Wicker教授：美国路易斯安那州立大学巴吞鲁日分校农业研究中心营养与食品科学学院主任、美国Phi Tau Sigma食品科技荣誉学会前任主席、《Food Science and Human Wellness》杂志科学主编
						<br> Klaus W. Lange教授：国际运动与营养学会主席、德国雷根斯堡大学实验心理学系主任、《Food Science and Human Wellness》杂志科学主编
						<br> 李士明教授：湖北黄冈师范学院生命科学学院、湖北省百人计划教授、楚天学者特聘教授、美国新泽西州罗格斯大学食品科学系访问教授、《Food Science and Human Wellness》杂志科学主编
					</div>
				</li>
			</ul>
			<ul>
				<!--tab模块4-->
				<li id="s_4" style="display:none;">
					<div class="txt01">按主办协办单位排序</div>
					<div class="txtbox col-sm-8 col-xs-12">孙勇副研究员：北京食品科学研究院副总工程师、中国食品杂志社副社长、《食品科学》杂志主编、《Food Science and Human Wellness》执行主编
						<br> 李永军研究员：吉林大学食品科学与工程学院副院长
						<br> 张铁华教授：吉林大学食品科学与工程学院副院长
						<br> 王 昕教授: 吉林大学食品科学与工程学院副院长
						<br> 梅士伟研究员：吉林大学食品科学与工程学院副书记兼副院长
						<br> IL KIM教授：韩国釜山国立大学化学工程（高分子科学与工程）系主任、韩国教育部“面向21世纪智力韩国计划（Brain Korea (BK) 21 PLUS）”高等化学工艺研究中心主任
						<br> 陈宁研究员：武汉体育学院楚天学者特聘教授、《Food Science and Human Wellness》副主编
						<br> 吴建平教授：加拿大阿尔伯塔大学农业、食品与营养科学系、《Food Science and Human Wellness》副主编
						<br> 王惠民教授：台湾国立中兴大学、《Food Science and Human Wellness》副主编
						<br> 沈清武教授：湖南农业大学食品科技学院、《Food Science and Human Wellness》副主编
						<br> Alexander M. Gosslau副教授：美国纽约城市大学生命科学系、美国罗格斯大学化学生物学系、《Food Science and Human Wellness》副主编
						<br> 徐宝军副教授：北京师范大学-香港浸会大学联合国际学院、《Food Science and Human Wellness》副主编</div>
				</li>
			</ul>
		</div>
		<div class="clear"></div>
		<script language="javascript">
			//                $("#qh01").tab(0, 'menu_tab_hover', 'mouseover');
			$('#tabs_head li').hover(function(){
				$(this).addClass('menu_tab_hover').siblings().removeClass('menu_tab_hover');
				var index = $(this).prevAll().length;
				$('#tabs_body ul li').css('display','none');
				$('#tabs_body ul li').eq(index).css('display','block');
			})
		</script>
	</div>
</div>
<div class="main_bg">
	<div class="main">
		<h2><span><a href="#">查看更多+</a></span><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/><a href="#">会议内容</a></h2>
		<div class="hynr">
			<div class="left col-sm-8 col-xs-12">
				<h3>会议主题：食品科学与人类健康理论研究</h3>
				<h4>1） 食品生物化学专题</h4>
				<p>包括碳水化合物、蛋白质和酶、脂类、核酸、维生素、矿物质、植物化学物等生化与代谢研究，基因工程、细胞工程、酶工程、基因组学、蛋白质组学和代谢组学等与人类健康相关的基础研究。</p>
				<h4>2） 食品微生物学专题</h4>
				<p>包括食品微生物生理与遗传、微生物的相互作用、微生物毒素、致病微生物、预测微生物学和微生物风险评估等基础研究。</p>
				<h4>3） 食品营养与免疫学专题</h4>
				<p>包括分子营养学和临床营养学、生物活性物的成分及其功能评价、细胞因子、食物过敏、分子免疫学、免疫遗传学等基础研究。</p>
				<h4>4） 食品安全与毒理学专题</h4>
				<p>包括食品中风险化合物、重金属等安全检测和毒理学评价，食源性疾病理论研究等。</p>
				<h4>5） 蛋品加工及营养功能专题</h4>
				<p>包括蛋品功能成分研究开发、禽蛋制品加工新技术及质量安全等。</p>
			</div>
			<div class="right col-sm-4 col-xs-12">
				<h3>会议形式</h3>
				<p>1）邀请国内外知名专家、教授发言
					<br> 2）参会代表相关研究成果发言
					<br> 3）论文粘贴
					<br> 4）参展企业产品展示
				</p>
				<div class="line01"></div>
				<h3>会议语言</h3>
				<p>中文+英文+同声传译</p>
				<div class="line01"></div>
				<h3>会议地点</h3>
				<p>中国 吉林 长春
					<br> 会场：吉林会展中心
					<br> 住宿：吉林某酒店
				</p>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>
<div class="main">
	<h2><span><a href="#">查看更多+</a></span><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/><a href="#">会议论文</a></h2>
	<div class="hylw row">
		<div class="col-sm-8 col-xs-12">
			<div class="left">
				<h4>论文范围及要求</h4>
				<p>与会议主题相关的学术论文，请严格按照杂志撰稿要求和投稿模板撰写。
					<br> 《食品科学》投稿：请登录食品科学网
					<a href="http://www.chnfood.cn" target="_blank">www.chnfood.cn</a>，从首页采编系统投稿；
					<br> 《Food Science and Human Wellness》投稿：请登录网站<a href="http://ees.elsevier.com/fshw/" target="_blank">http://ees.elsevier.com/fshw/</a>投稿；
					<br> 《肉类研究》投稿：请登录网站
					<a href="http://rlyj.cbpt.cnki.net" target="_blank">http://rlyj.cbpt.cnki.net</a>投稿；
					<br> 《乳业科学与技术》投稿：请登录网站
					<a href="http://rykj.cbpt.cnki.net" target="_blank">http://rykj.cbpt.cnki.net</a>投稿。</p>
				<h4>论文发表费</h4>
				<p>审核通过的稿件按书面录用通知缴纳版面费。</p>
			</div>
		</div>
		<div class="col-sm-4 col-xs-12">
			<div class="right">
				<img src="<%=path%>/static/spkx/images/pic03.png" alt=""/>
				<%--<h3>支持协办</h3>
				<p>美国国际谷物化学家学会（AACCI）
					<br> 《Journal of Food Science》杂志（SCI收录）
					<br> 《Journal of Agricultural and Food Chemistry》杂志（SCI收录）
					<br> 《Food and Bioprocess Technology》杂志（SCI收录）
					<br> 《Journal of Functional Foods》杂志（SCI收录）
					<br> 《Food Chemistry》杂志（SCI收录）
					<br> 《Journal of Food and Drug Analysis》杂志（SCI收录）</p>--%>
			</div>
		</div>
		<div class="col-sm-12 col-xs-12">
			<h4>补充说明</h4>
			<p>投递会议论文的代表，请先将论文通过四本杂志在线采编系统投递并获得稿件编号后，再及时进行会议注册，并将稿件标题、编号填入注册信息中。</p>
		</div>
	</div>

	<%--<div class="hylw">
		<h4>论文范围及要求</h4>
		<p>与会议主题相关的学术论文，请严格按照杂志撰稿要求和投稿模板撰写。
			<br> 《食品科学》投稿：请登录食品科学网
			<a href="http://www.chnfood.cn" target="_blank">www.chnfood.cn</a>，从首页采编系统投稿；
			<br> 《Food Science and Human Wellness》投稿：请登录网站<a href="http://ees.elsevier.com/fshw/" target="_blank">http://ees.elsevier.com/fshw/</a>投稿；
			<br> 《肉类研究》投稿：请登录网站
			<a href="http://rlyj.cbpt.cnki.net" target="_blank">http://rlyj.cbpt.cnki.net</a>投稿；
			<br> 《乳业科学与技术》投稿：请登录网站
			<a href="http://rykj.cbpt.cnki.net" target="_blank">http://rykj.cbpt.cnki.net</a>投稿。</p>
		<h4>论文发表费</h4>
		<p>审核通过的稿件按书面录用通知缴纳版面费。</p>
		<h4>补充说明</h4>
		<p>投递会议论文的代表，请先将论文通过四本杂志在线采编系统投递并获得稿件编号后，再及时进行会议注册，并将稿件标题、编号填入注册信息中。</p>
	</div>--%>
</div>
<div class="main_bg">
	<div class="main">
		<h2><span><a href="#">查看更多+</a></span><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/><a href="#">费用及汇款</a></h2>
		<div class="fyhk">
			<h3>会议费</h3>
			<p>国内：2000元/人（含会议费、餐费等）；普通在校研究生1400元（不含在职攻读学位人员）。
				<br> 国外：500美元/人
				<br> 会议期间安排住宿，费用自理。会议费不包含论文发表费。
			</p>
			<h3>汇款事项</h3>
			<p>请参会代表收到正式邀请函（纸质版或电子版均可）后，尽快将会议费汇至中国食品杂志社，以便大会日常筹备工作顺利进行。
				<br> 户 名：中国食品杂志社
				<br> 开户行：工行阜外大街支行
				<br> 帐 号：0200049209024922112
				<br> 如寄现金请直接汇至：北京市西城区禄长街头条4号《食品科学》编辑部收，邮编100050。
			</p>
		</div>
	</div>
</div>
<div class="main">
	<div class="hw_zs">
		<div class="col-sm-5 col-xs-12">
			<div class="left">
				<h3>会务组</h3>
				<p>秘书处： 张睿梅、吴楠
					<br> 电 话：010-83155446/47/48/49/50-8030、8032
					<br> 传 真：010-83155436
					<br> E-mail：chnfood@163.com </p>
			</div>
		</div>
		<div class="col-sm-7 col-xs-12">
			<div class="right">
				<h3>广告招商招展</h3>
				<p>会刊广告、会场广告、会场产品展示
					<br> 详情请拨打广告招商招展热线：010-83155438
					<br> 传真：010-83152138
					<br>
					<a href="down/第三届食品科学与人类健康国际研讨会招商招展回执.doc" target="_blank">招商招展回执</a></p>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div>
<div class="main_bg" style="margin:0;">
	<div class="main">
		<h2><span><a href="#">查看更多+</a></span><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/><a href="#">报名方式</a></h2>
		<div class="bmfs">
			<div class="time">
				<h4>会议注册截止时间 </h4> 论文征集截止日期： 2017 年7 月5 日
				<br>会议报名截止日期： 2017年 7月 25 日
			</div>
			<h3>1、网上报名</h3>
			<p>1）手机微信扫描下方二维码报名</p>
			<div class="ewm"><img src="<%=path%>/static/spkx/images/ewm01.png"></div>
			<p>登录我刊网站<a href="http://www.chnfood.cn" target="_blank">www.chnfood.cn</a>，点击进入会议主页进行网上报名。</p>
			<h3>2、回执报名</h3>
			<p>填写附页的<span><a href="down/第三届食品科学与人类健康国际研讨会参会回执.doc" target="_blank">参会回执</a></span>并发送E-mail至chnfood@163.com或传真至010-83155436均可。该回执电子版也可以从我刊网站<a href="http://www.chnfood.cn" target="_blank">www.chnfood.cn</a> 的会议主页上下载。</p>
			<p>两种报名方式采用其中一种即可，不需重复报名，推荐采用微信及网上报名方式。
				<br> 会务组收到报名信息后，会尽快向参会代表电子邮箱发送电子版邀请函，同时邮寄纸质版邀请函，请务必准确填写电子邮箱、详细地址及邮编、电话号码。
			</p>
			<p>更多会议信息请关注食品科学微博和微信</p>
			<div class="ewm"><span class="col-sm-6 col-xs-12" style="padding-top:0;"><img src="<%=path%>/static/spkx/images/ewm02.png"><span>食品科学订阅号</span></span><span class="col-sm-6 col-xs-12" style="padding-top:0;"><img src="<%=path%>/static/spkx/images/ewm01.png"><span>食品科学服务号</span></span></div>
		</div>
	</div>
</div>

<%@include file="/inc/footer.jsp"%>
<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/interface/RegisterService.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/interface/NoticeService.js'></script>
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
		//获取后台通知内容
		NoticeService.getAllEnabledNotice(function (notices) {
			$("marquee").html('');
			var trs='通知：';
			$.each(notices, function (index, n) {
				if(notices.length==1){
					trs+="<a href='tz.jsp?notice="+n.id+"'>"+n.title+"</a>";
				}else{
					trs+=(index+1)+".<a href='tz.jsp?notice="+n.id+"'>"+n.title+"</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				}
			});
			$("marquee").append(trs);
		});
		/*//获取后台通知内容
		NoticeService.getAllEnabledNotice(function (notices) {
			$("marquee").html('');
			var trs='';
			$.each(notices, function (index, n) {
				trs+= "<a href='tz.jsp?notice="+n.id+"'>"+n.title+"</a><br><br>";
			});
			$("marquee").append(trs);
		});*/
	});
</script>
</body>
</html>