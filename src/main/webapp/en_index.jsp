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
	<title>3rd International Symposium of <i>Food Science and Human Wellness</i></title>
	<link rel="stylesheet" type="text/css" href="<%=path%>/static/spkx/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/static/spkx/css/style.css"/>
	<%--<link rel="stylesheet" type="text/css" href="<%=path%>/static/spkx/css/style_en.css"/>--%>
	<link href="<%=path%>/static/css/font-awesome.min.css" rel="stylesheet">
	<script src="<%=path%>/static/spkx/js/jquery.min.js" type="text/javascript"></script>
	<script src="<%=path%>/static/spkx/js/tab.js" type="text/javascript"></script>
	<script src="<%=path%>/static/spkx/js/bootstrap.min.js"></script>
	<script src="<%=path%>/static/spkx/js/biz.js"></script>
</head>

<body>
<!-- 头部模块 -->
<%@include file="/inc/en_headbar.jsp" %>
<%--头部通知滚动条--%>
<div class="main alert alert-info">
	<marquee behavior="scroll"  width="100%" direction="left" scrollamount="3" onmouseover="this.stop()" onmouseout="this.start()">
		3rd International Symposium of <i>Food Science and Human Wellness</i>
	</marquee>
	<%--<marquee class="marquee"   scrollamount="1" direction="up" onmouseover="this.stop()" onmouseout="this.start()">&nbsp;
	</marquee>--%>
</div>
<div class="main">
	<h2><span><a href="#">MORE+</a></span><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/><a href="#">Organizational Unit</a></h2>
	<div class="zzjg row">
		<div class="col-sm-6 col-xs-12">
			<div class="left">
				<h3>Organizers</h3>
				<p>International Association for Cereal Science and Technology (ICC)<br>
					Beijing Academy of Food Sciences (BAFS), China<br>
					<i>FOOD SCIENCE</i> Editorial Department (FSED), China Food Publishing Co., China<br>
					<i>Food Science and Human Wellness</i> Editorial Department, China Food Publishing Co., China
				</p>
				<h3>Co-organizers</h3>
				<p>College of Food Science and Engineering, Jilin University, China<br>
					The Chinese American Food Society (CAFS), USA</p>
				<h3>Financial Sponsors</h3>
				<p>Beijing Ensoul Tech. Co., Ltd., China</p>
			</div>
		</div>
		<div class="col-sm-6 col-xs-12">
			<div class="right">
				<img src="<%=path%>/static/spkx/images/pic01.png" alt="" />
				<h3>Supporting Sponsors</h3>
				<p>American Association of Cereal Chemists International</i> (AACC International)<br>
					<i>Journal of Food Science</i> (Indexed by SCI)<br>
					<i>Journal of Agricultural and Food Chemistry</i></i> (Indexed by SCI)<br>
					<i>Food and Bioprocess Technology</i> (Indexed by SCI)<br>
					<i>Journal of Food and Drug Analysis</i> (Indexed by SCI)<br>
					<i>Journal of Functional Foods</i> (Indexed by SCI)<br>
					<i>Food Chemistry</i> (Indexed by SCI)</p>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div>
<div class="main_bg">
	<div class="main">
		<h2><span><a href="#">MORE+</a></span><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/><a href="#">Meeting Profile</a></h2>
		<div class="hyjs row"> <img src="<%=path%>/static/spkx/images/pic02.png" alt="" class="col-sm-5 col-xs-6" />
			<p class="col-sm-7 col-xs-12">It is self-evident that food is much important to human wellness. In China, it has been the traditional
				lifestyle to utilize the medicinal properties of food in daily diets to regulate body’s nutrition level
				and to ensure health since ancient times. Li Shi-Zhen, the most distinguished medicinal scientist in
				Ming Dynasty, had highly generalized the health role of diets as people’s lifeblood. An assessment
				report about the factors affecting human wellness by World Health Organization (WHO) recently also
				showed that dietary nutrition factor (13%) was listed after the 1st ranking -genetic factor (15%), and
				considerably higher than medical treatment factor (only 8%). The rapid development of food Science and
				Technology has greatly promoted the diversification of the types of food and much healthier balance of
				nutrients, which not only develops the food industry into prosperity, but also prolongs human life and
				improves the quality of life. In recent years, along with the fast development of the new scientific and
				technological revolution, especially in the fields of information, life science and nanotechnology, an
				enormous food Science and Technology revolution broke out, which vigorously promotes the application of
				advanced Science and Technology in the food industry. With the accelerated process of industrialization,
				urbanization and aging in China, the incidence of chronic diseases shows a sustained and rapid growth
				trend. These include obesity, high blood pressure, diabetes, coronary heart disease and etc. How to
				provide consumers with more nutritious and healthier food, has become an important subject of our
				country and even the whole world. However, a series of major food safety events occur globally,
				highlighting the severe challenge of the technological progress and social development to food quantity,
				food quality and food safety, which have been related to the health and security of human beings and our
				next generation as well. To ensure food safety has become an important policy issue about protecting
				human life and health, improving life quality, boosting food trade and keeping social stabilization and
				harmony. Therefore, there is still a long way to go in the development of food science, so that we need
				to continue to deal with all the challenges.</p>
			<div class="clear"></div>
		</div>
	</div>
</div>
<div class="main">
	<h2><span><a href="#">MORE+</a></span><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/><a href="#">Organizing Committee</a><b class="dc"><a href="#">Scientific Committee
		Members</a></b></h2>
	<div class="box_qh" id="qh01">
		<div class="qh_top">
			<ul id="tabs_head">
				<li class='menu_tab_li'><a href="#">Honorary Chairman</a></li>
				<li class='menu_tab_li'><a href="#">Chairmen</a></li>
				<li class='menu_tab_li'><a href="#">Vice-Chairmen</a></li>
				<li class='menu_tab_li'><a href="#">Committee Members</a></li>
			</ul>
		</div>
		<div class="liebbox" id="tabs_body">
			<ul>
				<!--tab模块1-->
				<li id="s_1">
					<%--<div class="txt01">按姓氏拼音排序</div>--%>
					<div class="txtbox col-sm-8 col-xs-12">
						<b>Prof. Gerard Downey</b><br>
						Former President, American Association of Cereal Chemists International (AACC International),
						USA<br>
						Dublin University, Ireland<br>
						<b>Prof. Robert G (Bob) Gilbert</b><br>
						Academician, Australian Academy of Science (AAS), Australia<br>
						College of Nutrition and Food Science, The University of Queensland, Australia<br>
						<b>Prof. Chen Jian</b><br>
						Academician, International Union of Food Science and Technology (IUFoST)<br>
						President, Jiangnan University, China<br>
						<b>Prof. Guan Hua-shi</b><br>
						Academician, Chinese Academy of Engineering, China<br>
						President, Shandong Association for Science & Technology, China<br>
						Former President, Ocean University of China, China<br>
						<b>Prof. Li Lin</b><br>
						President, Dongguan Polytechnic University, China<br>
						<b>Prof. Li Shu-jun</b><br>
						President, Asian Association for Agricultural Engineering(AAAE), China<br>
						Director General, China Food And Packaging Machinery Industry Association (CFPMA), China<br>
						President, Chinese Academy of Agricultural Mechanization Sciences, China<br>
						<b>Prof. Li Yu</b><br>
						Academician, Chinese Academy of Engineering, China<br>
						Former President, Jilin Agricultural University, China<br>
						<b>Prof. Lee Yuan Kun</b><br>
						President, International Union of Microbiological Societies (IUMS)<br>
						Yong Loo Lin School of Medicine, National University of Singapore, Singapore<br>
						<b>Prof. Jia Jing-dun</b><br>
						Director, Department of Rural Science and Technology, Ministry of Science and Technology of
						People’s Republic of China, China<br>
						<b>Prof. Pan Ying-jie</b><br>
						Former President, Shanghai Ocean University, China<br>
						<b>Prof. Pang Guo-fang</b><br>
						Academician, Chinese Academy of Engineering, China<br>
						Chief Scientist, Chinese Academy of Inspection and Quarantine, China<br>
						<b>Prof. Rao Ping-fan </b><br>
						Former President, International Union of Food Science and Technology (IUFoST)<br>
						Academician of International Academy of Food Science and Technology (IAFoST)<br>
						Former Vice President, Fuzhou University, China<br>
						<b>Prof. Sun Bao-guo</b><br>
						Academician, Chinese Academy of Engineering, China<br>
						President, Beijing Technology and Business University, China<br>
						<b>Prof. Chin-Kun Wang</b><br>
						President, The International Society for Nutraceuticals and Functional Foods<br>
						Director, International Life Science Institute, Taiwan, China<br>
						Former President, Chung Shan Medical University, Taiwan, China<br>
						<b>Prof. Wu Tian-yi</b><br>
						Academician, Chinese Academy of Engineering, China<br>
						Former President, Institute of Qinghai Plateau Research, China<br>
						<b>Prof. Zhang Gai-ping</b><br>
						Academician, Chinese Academy of Engineering, China<br>
						President, Henan Agricultural University, China<br>
						<b>Prof. Zhou Guang-hong</b><br>
						President, Nanjing Agricultural University, China<br>
						Honorary Chairman, Chinese Association of Animal Products Processing, China<br>
						<b>Prof. Zhu Pei-wei</b><br>
						Academician, Chinese Academy of Engineering, China<br>
						Dean, College of Food, Dalian Polytechnic University, China<br>
						<b>Researcher Zhu Ming</b><br>
						Chairman, Chinese Society of Agricultural Engineering, China<br>
						Former President, Chinese Academy of Agricultural Engineering, China<br>
						Editor-in-Chief, <i>Transactions of the Chinese Society of Agricultural Engineering</i>, China
					</div>
				</li>
			</ul>
			<ul>
				<!--tab模块2-->
				<li id="s_2" style="display:none;">
					<%--<div class="txt01">按主办协办单位排序</div>--%>
					<div class="txtbox col-sm-8 col-xs-12">
						<b>Prof. Wang Shou-wei</b><br>
						President, Beijing Academy of Food Science (BAFS), China<br>
						President, China Food Publishing Co., China<br>
						Director, China Meat Research Center, China<br>
						<b>Prof. Hamit Köksel</b><br>
						President, International Association for Cereal Science and Technology (ICC), Austria <br>
						Hacettepe University, Turkey <br>
						<b>Prof. Lee Yuan-yuan</b><br>
						Academician, Chinese Academy of Engineering, China<br>
						President, Jilin University, China<br>
						<b>Prof. Chen Gang</b><br>
						Vice President, Jilin University, China<br>
						<b>Dr. Michaela Pichler</b><br>
						Secretary General, International Association for Cereal Science and Technology (ICC),
						Austria<br>
						<b>Prof. Pan Zhong-li</b><br>
						President, the Chinese American Food Society (CAFS), USA<br>
						Senior Research Fellow, Western Research Center, Department of Agriculture Service, US
						Department of Agriculture, USA<br>
						Department of Biological and Agricultural Engineering, University of California, Davis, USA<br>
						<b>Prof. Robert L. Cracknell</b><br>
						President, American Association of Cereal Chemists International (AACC International), USA<br>
						President, Australasian Grain Science Association (AGSA), Australia<br>
						Former President, International Association for Cereal Science and Technology (ICC), Austria<br>
						<b>Ms. Amy Hope</b><br>
						Secretary General, American Association of Cereal Chemists International (AACC International),
						USA<br>
						<b>Prof. Wang Feng-cheng</b><br>
						Former President, International Association for Cereal Science and Technology (ICC), Austria<br>
						Director, International Grains Institute, Henan University of Technology, China<br>
						Director, the Research Center for Cereal, Oil, and Food of the State Grain Administration of
						China, China<br>
						Director, National Grain Processing Equipment Engineering Technology Research Center, China<br>
						<b>Prof. Thomas F. Hofmann</b><br>
						Editor-in-Chief, <i>Journal of Agricultural and Food Chemistry</i>, USA<br>
						<b>Prof. Da-Wen Sun</b><br>
						Academician, Academia Europaea (The Academy of Europe), UK<br>
						Academician, Royal Irish Academy, Irish <br>
						Academician, International Academy of Food Science and Technology (IAFoST)<br>
						Former President, International Commission of Agricultural Engineering (CIGR)<br>
						Editor-in-Chief, <i>Food and Bioprocess Technology</i><br>
						National University of Ireland, Dublin, Ireland<br>
						<b>Prof. Rui-hai Liu</b><br>
						Academician, International Academy of Food Science and Technology (IAFoST)<br>
						Editor-in-Chief, <i>Food Science and Human Wellness</i>, China<br>
						Associate Editor, <i>Journal of Food Science</i>, USA<br>
						Department of Food Science and Technology, College of Agriculture and Life Sciences, Cornell
						University, USA<br>
						<b>Prof. Ho Chi-Tang</b><br>
						Academician, International Academy of Food Science and Technology (IAFoST)<br>
						Associate Editor, <i>Journal of Agricultural and Food Chemistry</i><br>
						Distinguished Professor, Department of Food Science, Rutgers University, USA<br>
						<b>Prof. Fereidoon Shahidi</b><br>
						Academician, International Academy of Food Science and Technology (IAFoST)<br>
						Academician, Royal Society of Chemistry, UK<br>
						Principal Founder and Executive Board Member, International Society for Nutraceuticals and
						Functional Foods(ISNFF) <br>
						Editor-in-Chief, <i>Journal of Functional Foods</i><br>
						Editor, <i>Food Chemistry</i><br>
						Memorial University of Newfoundland, Canada<br>
						<b>Prof. Lucy Sun</b><br>
						Academician, International Academy of Food Science and Technology (IAFoST)<br>
						Editor-in-Chief, <i>Journal of Food and Drug Analysis</i><br>
						Institute of Food Science and Technology, National Taiwan University, Taiwan, China </div>
				</li>
			</ul>
			<ul>
				<!--tab模块3-->
				<li id="s_3" style="display:none;">
					<%--<div class="txt01">按主办协办单位排序</div>--%>
					<div class="txtbox col-sm-8 col-xs-12">
						<b>Ms. Zhao Yan</b><br>
						Vice President, Beijing Academy of Food Science (BAFS), China<br>
						Executive President, China Food Publishing Co., China<br>
						Director, Beijing Institute of Food Brewing, China<br>
						<b>Prof. Guo Ming-ruo</b><br>
						Dean, College of Food Science and Engineering, Jilin University, China<br>
						<b>Researcher Gao Fu-he</b><br>
						Secretary of the Party Committee, College of Food Science and Engineering, Jilin University,
						China<br>
						<b>Prof. Liu Jing-bo</b><br>
						Vice Dean, College of Food Science and Engineering, Jilin University, China<br>
						<b>Prof. Zhen-Yu Chen</b><br>
						Director, Food & Nutritional Sciences Programme, School of Life Sciences, Chinese University of
						Hong Kong, China<br>
						Associate Editor, <i>Journal of Agricultural and Food Chemistry</i>, USA<br>
						<b>Prof. Youling L. Xiong</b><br>
						Research Coordinator, Department of Animal and Food Sciences, College of Agriculture, University
						of Kentucky, USA<br>
						Scientific Editor, <i>Journal of Food Science</i>, USA<br>
						Associate Editor, <i>Food Bioscience</i>, USA<br>
						Chinese Changjiang Scholars, China<br>
						<b>Prof. Min-Hsiung Pan</b><br>
						Institute of Food Science and Technology, National Taiwan University, Taiwan, China<br>
						Associate Editor, <i>Journal of Food and Drug Analysis</i><br>
						<b>Prof. Louise Wicker</b><br>
						Director, School of Nutrition and Food Sciences, Louisiana State University AgCenter, USA<br>
						Former President, Phi Tau Sigma the Honorary Society of Food Science and Technology, USA<br>
						Scientific Editor, <i>Food Science and Human Wellness</i>, China<br>
						<b>Prof. Klaus W. Lange</b><br>
						President, International Movement and Nutrition Society, Germany<br>
						Director, Institute of Experimental Psychology, University of Regensburg, Germany <br>
						Scientific Editor, <i>Food Science and Human Wellness</i>, China<br>
						<b>Prof. Li Shi-ming</b><br>
						College of Life Sciences, Huanggang Normal University, China<br>
						Professor of Hundred-Talent Program ( Hubei Province), China<br>
						Chutian Scholar Distigushied Professor, China<br>
						Department of Food Science, Rutgers University of New Jersey, USA<br>
						Scientific Editor, <i>Food Science and Human Wellness</i>, China
					</div>
				</li>
			</ul>
			<ul>
				<!--tab模块4-->
				<li id="s_4" style="display:none;">
					<%--<div class="txt01">按主办协办单位排序</div>--%>
					<div class="txtbox col-sm-8 col-xs-12">
						<b>Associate Researcher Sun Yong</b><br>
						Vice-President, China Food Publishing Co., China<br>
						Chief Editor, <i>FOOD SCIENCE, China</i><br>
						Managing Editor, <i>Food Science and Human Wellness</i>, China<br>
						<b>Researcher Lee Yong-jun</b><br>
						Vice Dean, College of Food Science and Engineering, Jilin University, China<br>
						<b>Prof. Zhang Tie-hua</b><br>
						Vice Dean, College of Food Science and Engineering, Jilin University, China<br>
						<b>Prof. Wang Xin</b><br>
						Vice Dean, College of Food Science and Engineering, Jilin University, China<br>
						<b>Researcher Mei Shi-wei </b><br>
						Vice Dean and Deputy Secretary of the Party Committee, College of Food Science and Engineering,
						Jilin University, China<br>
						<b>Prof. IL KIM</b><br>
						Director, Department of Chemical Engineering, Polymer Science and Engineering, Pusan National
						University, Republic of Korea<br>
						Director, Brain Korea (BK) 21 PLUS Center for Advanced Chemical Technology, Republic of
						Korea<br>
						<b>Researcher Chen Ning </b><br>
						Chutian Scholar Distinguished professor, Wuhan Sports University, China<br>
						Associate Editor-in-Chief, <i>Food Science and Human Wellness</i>, China<br>
						<b>Prof. Wu Jian-ping </b><br>
						Department of Agricultural, Food & Nutritional Science, University of Alberta, Canada <br>
						Associate Editor-in-Chief, <i>Food Science and Human Wellness</i>, China<br>
						<b>Prof. Hui-min Wang </b><br>
						National Chung Hsing University, Taiwan, China<br>
						Associate Editor-in-Chief,<i>Food Science and Human Wellness</i>, China<br>
						<b>Prof. Shen Qing-wu</b><br>
						College of Food Science and Technology, Hunan Agricultural University, China<br>
						Associate Editor-in-Chief, <i>Food Science and Human Wellness</i>, China<br>
						<b>Associate Prof. Alexander M. Gosslau</b><br>
						Department of Science (Biology), City University of New York, USA<br>
						Department of Chemical Biology of Rutgers University, USA <br>
						Associate Editor-in-Chief, <i>Food Science and Human Wellness</i>, China<br>
						<b>Associate Prof. Xu Bao-jun</b><br>
						Beijing Normal University - Hong Kong Baptist University United International College, China<br>
						Associate Editor-in-Chief, <i>Food Science and Human Wellness</i>, China</div>
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
		<h2><span><a href="#">MORE+</a></span><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/><a href="#">Symposium Content</a></h2>
		<div class="hynr">
			<div class="left col-sm-8 col-xs-12">
				<h3>Symposium Theme: Theoretical research on food sciences and human wellness</h3>
				<h4>1) Food biochemistry</h4>
				<p>Include carbohydrates, proteins and enzymes, lipids, nucleic acids, vitamins, minerals,
					phytochemicals, genomics, genetic/cell/enzymatic engineering, proteomics and metabonomics, etc.</p>
				<h4>2) Food microbiology</h4>
				<p>Include physiology, genetics and behavior of microorganisms, microbial interaction, microbial toxin,
					food pathogens, biocontrol, predictive microbiology and microbial risk assessment, etc.</p>
				<h4>3) Food nutriology and immunology</h4>
				<p>Include food nutrition in the molecular level and in clinical studies, bioactive
					compounds/ingredients and their functional evaluations, cytokines, food allergies, molecular
					immunology, immunobiology and immunogenetics, etc.</p>
				<h4>4) Food safety and toxicology</h4>
				<p>Include foodborne diseases, hazard analysis and toxicological evaluations, etc.</p>
				<h4>5) Egg processing and nutritional functions</h4>
				<p>Include the research and development of egg functional components, egg products processing new
					technology and quality safety, etc.</p>
			</div>
			<div class="right col-sm-4 col-xs-12">
				<h3>Conference Styles</h3>
				<p>Delivering academic presentations by
					well-known experts and scholars at home and
					abroad. </p>
				<p>Poster or oral presentation of research
					accomplishments by representative participants.</p>
				<p>Exhibition of instruments and equipment from
					participate enterprises</p>
				<div class="line01"></div>
				<h3>Language</h3>
				<p><i>Chinese + English + simultaneous interpretation</i></p>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>
<div class="main">
	<h2><span><a href="#">MORE+</a></span><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/><a href="#">Papers</a></h2>
	<div class="hylw row" >
		<div class="col-sm-8 col-xs-12">
			<div class="left">
				<p>Papers shall be submitted in the attachment in “.doc” format only. Original research papers which <br>
					have not been published or accepted for publication elsewhere will be published in <i>FOOD SCIENCE</i>, <br>
					<i>Food Science and Human Wellness</i>, <i>Meat Research</i>, or <i>Journal of Dairy Science and
						Technology</i> <br>
					without extra charges after passing the peer review.</p>
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

	</div>
</div>
<div class="main_bg">
	<div class="main">
		<h2><span><a href="#">MORE+</a></span><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/><a href="#">Fees</a></h2>
		<div class="fyhk">
			<div class="down">
				<h4>Download:</h4>
				<a href="down/REGISTRATION FORM.doc" target="_blank">REGISTRATION FORM</a>
			</div>
			<h3>Fees</h3>
			<p>Registration Fee:&nbsp;&nbsp;&nbsp;&nbsp;US $500<br>
				(Program Book, Refreshments, Lunches, Welcome Dinner)</p>
			<h3>Please send your registration fee to:</h3>
			<p>Beneficiary Banker’s name: Industrial and Commercial Bank of China, Beijing Municipal Branch, Beijing,
				PRC<br>
				Beneficiary Banker’s address: No. 48, Zhanlanguan Road, Xicheng District, Beijing 100050, PRC<br>
				Beneficiary’s Name: China Food Publishing Co. <br>
				Address: No.4 Toutiao, Luchang Street, Xicheng District, Beijing, China <br>
				Account Number: 0200049209024922112 <br>
				Swift Code: ICBKCNBJBJM</p>
		</div>
	</div>
</div>
<div class="main">
	<h2><span><a href="#">MORE+</a></span><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/><a href="#">The Conference Secretary</a></h2>
	<div class="hw_zs">
		<h3>The Conference Secretary</h3>
		<p>Ms. Zhang Rui-mei, Ms.Wu Nan<br>
			Edititor, Conference and Training Department, <i>FOOD SCIENCE</i> Journal, China Food Publishing Co.,<br>
			Address: No.4 Toutiao, Luchang Street, Xicheng District, Beijing, China<br>
			Tel:+86 10 83155446-8030、8032, Fax: +86 10 83155436, E-mail: chnfood@163.com<br>
			Website: http://www.chnfood.cn</p>
	</div>
</div>

<%@include file="/inc/en_footer.jsp"%>
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
			var trs='Notice：';
			$.each(notices, function (index, n) {
				if(notices.length==1){
					trs+="<a href='en_tz.jsp?notice="+n.id+"'>"+n.title+"</a>";
				}else{
					trs+=(index+1)+".<a href='en_tz.jsp?notice="+n.id+"'>"+n.title+"</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
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
