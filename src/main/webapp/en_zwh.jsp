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
	<title>3rd International Symposium of <i>Food Science and Human Wellness</i></title>
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
<%@include file="/inc/en_headbar.jsp" %>
<div class="main">
	<h2 style="margin-bottom:30px;"><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/>组织委员会</h2>
	<div class="zzjgbox">
		<ul class="abdtbox">
			<li class="left">Honorary Chairman</li>
			<li class="right">
				<div class="ico"></div>
				<b>Prof. Gerard Downey</b><br>
				Former President, American Association of Cereal Chemists International (AACC International), USA<br>
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
				Director, Department of Rural Science and Technology, Ministry of Science and Technology of People’s
				Republic of China, China<br>
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
				<div class="jx"></div>
			</li>
			<div class="clear"></div>
		</ul>
		<ul class="abdtbox">
			<li class="left">Chairmen</li>
			<li class="right">
				<div class="ico"></div>
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
				Secretary General, International Association for Cereal Science and Technology (ICC), Austria<br>
				<b>Prof. Pan Zhong-li</b><br>
				President, the Chinese American Food Society (CAFS), USA<br>
				Senior Research Fellow, Western Research Center, Department of Agriculture Service, US Department of
				Agriculture, USA<br>
				Department of Biological and Agricultural Engineering, University of California, Davis, USA<br>
				<b>Prof. Robert L. Cracknell</b><br>
				President, American Association of Cereal Chemists International (AACC International), USA<br>
				President, Australasian Grain Science Association (AGSA), Australia<br>
				Former President, International Association for Cereal Science and Technology (ICC), Austria<br>
				<b>Ms. Amy Hope</b><br>
				Secretary General, American Association of Cereal Chemists International (AACC International), USA<br>
				<b>Prof. Wang Feng-cheng</b><br>
				Former President, International Association for Cereal Science and Technology (ICC), Austria<br>
				Director, International Grains Institute, Henan University of Technology, China<br>
				Director, the Research Center for Cereal, Oil, and Food of the State Grain Administration of China,
				China<br>
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
				Department of Food Science and Technology, College of Agriculture and Life Sciences, Cornell University,
				USA<br>
				<b>Prof. Ho Chi-Tang</b><br>
				Academician, International Academy of Food Science and Technology (IAFoST)<br>
				Associate Editor, <i>Journal of Agricultural and Food Chemistry</i><br>
				Distinguished Professor, Department of Food Science, Rutgers University, USA<br>
				<b>Prof. Fereidoon Shahidi</b><br>
				Academician, International Academy of Food Science and Technology (IAFoST)<br>
				Academician, Royal Society of Chemistry, UK<br>
				Principal Founder and Executive Board Member, International Society for Nutraceuticals and Functional
				Foods(ISNFF) <br>
				Editor-in-Chief, <i>Journal of Functional Foods</i><br>
				Editor, <i>Food Chemistry</i><br>
				Memorial University of Newfoundland, Canada<br>
				<b>Prof. Lucy Sun</b><br>
				Academician, International Academy of Food Science and Technology (IAFoST)<br>
				Editor-in-Chief, <i>Journal of Food and Drug Analysis</i><br>
				Institute of Food Science and Technology, National Taiwan University, Taiwan, China
				<div class="jx"></div>
			</li>
			<div class="clear"></div>
		</ul>
		<ul class="abdtbox">
			<li class="left">Vice-Chairmen</li>
			<li class="right">
				<div class="ico"></div>
				<b>Ms. Zhao Yan</b><br>
				Vice President, Beijing Academy of Food Science (BAFS), China<br>
				Executive President, China Food Publishing Co., China<br>
				Director, Beijing Institute of Food Brewing, China<br>
				<b>Prof. Guo Ming-ruo</b><br>
				Dean, College of Food Science and Engineering, Jilin University, China<br>
				<b>Researcher Gao Fu-he</b><br>
				Secretary of the Party Committee, College of Food Science and Engineering, Jilin University, China<br>
				<b>Prof. Liu Jing-bo</b><br>
				Vice Dean, College of Food Science and Engineering, Jilin University, China<br>
				<b>Prof. Zhen-Yu Chen</b><br>
				Director, Food & Nutritional Sciences Programme, School of Life Sciences, Chinese University of Hong
				Kong, China<br>
				Associate Editor, <i>Journal of Agricultural and Food Chemistry</i>, USA<br>
				<b>Prof. Youling L. Xiong</b><br>
				Research Coordinator, Department of Animal and Food Sciences, College of Agriculture, University of
				Kentucky, USA<br>
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
				<div class="jx"></div>
			</li>
			<div class="clear"></div>
		</ul>
		<ul class="abdtbox">
			<li class="left">Committee Members</li>
			<li class="right">
				<div class="ico"></div>
				<b>Associate Researcher Sun Yong</b><br>
				Vice-President, China Food Publishing Co., China<br>
				Chief Editor, <i>FOOD SCIENCE</i>, China<br>
				Managing Editor, <i>Food Science and Human Wellness</i>, China<br>
				<b>Researcher Lee Yong-jun</b><br>
				Vice Dean, College of Food Science and Engineering, Jilin University, China<br>
				<b>Prof. Zhang Tie-hua</b><br>
				Vice Dean, College of Food Science and Engineering, Jilin University, China<br>
				<b>Prof. Wang Xin</b><br>
				Vice Dean, College of Food Science and Engineering, Jilin University, China<br>
				<b>Researcher Mei Shi-wei </b><br>
				Vice Dean and Deputy Secretary of the Party Committee, College of Food Science and Engineering, Jilin
				University, China<br>
				<b>Prof. IL KIM</b><br>
				Director, Department of Chemical Engineering, Polymer Science and Engineering, Pusan National
				University, Republic of Korea<br>
				Director, Brain Korea (BK) 21 PLUS Center for Advanced Chemical Technology, Republic of Korea<br>
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
				Associate Editor-in-Chief, <i>Food Science and Human Wellness</i>, China
				<div class="jx"></div>
			</li>
			<div class="clear"></div>
		</ul>
	</div>
	<a name="jwh" id="jwh"></a>
	<h2 style="margin-bottom:30px;"><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/>技术委员会</h2>
	<div class="zzjgbox">
		<ul class="abdtbox">
			<li class="left">Name list</li>
			<li class="right">
				<div class="ico"></div>
				<span style="color:#999;">Sorted by surname</span><br>
				<b>Prof. Byong H. Lee</b><br>
				Department of Food Science and Agricultural Chemistry, McGill University, Canada<br>
				<b>Prof. Dominic W. S. Wong</b><br>
				Western Regional Research Center, Academy of Agricultural Sciences, United States Department of
				Agriculture, USA<br>
				<b>Prof. Michael Tilley</b><br>
				Grain and Animal Health Research Center, United States Department of Agriculture, USA<br>
				<b>Prof. Okkyung Kim Chung</b><br>
				Kansas State University, USA<br>
				<b>Prof. Patricia Rayas-Duarte</b><br>
				Oklahoma State University, USA<br>
				<b>Prof. Perry Ng</b><br>
				Michigan State University, USA <br>
				<b>Prof. Takaharu Sakiyama</b><br>
				Department of Food Technology, Tokyo University of Marine Science and Technology, Japan<br>
				<b>Prof. Jan Willem van der Kamp</b><br>
				President of Scientific Committee, International Association for Cereal Science and Technology (ICC),
				Austria<br>
				TNO, Netherlands<br>
				<b>Dr. Roland Poms </b><br>
				Former Secretary General, International Association for Cereal Science and Technology (ICC), Austria<br>
				<b>Prof. Yacine Hemar</b><br>
				The University of Auckland, New Zealand<br>
				<b>Prof. Abdulla Abbas</b><br>
				College of Life Science and Technology, Xinjiang University, China<br>
				<b>Prof.Bi Yang</b><br>
				Vice President, Gansu Agricultural University, China<br>
				<b>Prof. Cai Hui-nong</b><br>
				College of Food and Biological Engineering, Jimei University, China<br>
				<b>Prof. Cao Min-jie</b><br>
				Vice President, Jimei University, China<br>
				<b>Prof. Chen Feng</b><br>
				Academician, International Academy of Food Sciences<br>
				Vice Dean, School of Engineering, Peking University, China<br>
				Winner of “The Recruitment Program of Global Experts”, China<br>
				Associate Editor-in-Chief, <i>Food and Function</i><br>
				<b>Prof. Chen Feng</b><br>
				Department of Food Nutrition and Packaging Science, Clemson University, USA<br>
				<b>Prof. Chen Jian-she</b><br>
				Vice Dean, College of Food and Biological Engineering, Zhejiang Gongshang University, China<br>
				<b>Prof. Chen Qing-sen</b><br>
				Vice Dean, College of Biological Engineering and Food Science, Tianjin University of Commerce, China<br>
				<b>Prof. Chen Wei</b><br>
				Dean, School of Food Science Technology, Jiangnan University, China<br>
				<b>Researcher Chen Ying</b><br>
				Vice President and Chief Engineer, China Inspection and Quarantine Research Institute<br>
				<b>Prof. Chen Yong-sheng</b><br>
				President, Inner Mongolia University for Nationalities, China<br>
				<b>Prof. Chen Yun-zhong</b><br>
				Vice President, Hubei University of Chinese Medicine, China<br>
				<b>Researcher Chu Xiao-gang</b><br>
				Director, Institute of Food Safety, Chinese Academy of Inspection and Quarantine, China<br>
				<b>Prof. Deng Fang-ming</b><br>
				Dean, College of Food Science and Technology, Hunan Agricultural University, China<br>
				<b>Prof. Deng Ze-yuan</b><br>
				School of Food Science & Technology, Nanchang University, China<br>
				<b>Prof. Dong Qing-li</b><br>
				School of Medical Device and Food Engineering, University of Shanghai for Science and Technology,
				China<br>
				<b>Prof. Dong Hai-zhou</b><br>
				Dean, College of Food Science and Engineering, Shandong Agricultural University, China<br>
				<b>Prof. Du Guo-cheng</b><br>
				Dean, Scool of Boi-technology, Jiagnan Univeristy, China<br>
				<b>Prof. Du Min</b><br>
				Washington State University, USA<br>
				<b>Prof. Du Ping-de</b><br>
				Dean, College of Human Ecology, Chia Nan University of Pharmacy & Science, Taiwan, China<br>
				<b>Prof. Du Xian-feng</b><br>
				Vice Dean, College of Tea and Food Technology, Anhui Agricultural University, China <br>
				<b>Prof. Fang Ji</b><br>
				Director, Department of Food Science and Biotechnology, National Chung Hsing University, Taiwan,
				China<br>
				<b>Prof. Fang Ya-peng</b><br>
				Dean, College of Food Science and Pharmace Engineering, Hubei Univeristy of Technology, China<br>
				<b>Prof. Fu Xiong</b><br>
				Dean, College of Light Industry and Food Science, South China University of Utechnology, China<br>
				<b>Prof. Gao Li-ping</b><br>
				Vice Director, Institute of Functional Foods and Technology, Beijing Union University, China<br>
				<b>Researcher Gao Hai-yan</b><br>
				Institute of Food Processing, Zhejiang Academy of Agricultural Sciences, China<br>
				<b>Prof. Ge Chang-rong</b><br>
				Vice President, Yunnan Agricultural University, China<br>
				<b>Prof. Guo Hong</b><br>
				Vice President, Beijing Academy of Food Science (BAFS), China<br>
				Director, Beijing Food Research Institute, China<br>
				<b>Prof. Hao Li-min</b><br>
				The Quartermaster Research Institute of General Logistics Department, Chinese Peoples’ Liberation Army,
				China<br>
				<b>Prof. He Dong-ping</b><br>
				College of Food Science and Engineering, Wuhan Polytechnic University, China<br>
				<b>Prof. He Qiang</b><br>
				Vice Dean, College of Light Industry, Textile and Food Engineering, Sichuan University, China<br>
				<b>Prof. Hou Dong-yan</b><br>
				Vice President, Anshan Normal University, China <br>
				<b>Prof. Hu Qiu-hui</b><br>
				Dean, College of Food Science & Engineering, Nanjing University of Finance and Economics, China<br>
				<b>Prof. Hu Xiao-song</b><br>
				Dean, College of Food Science & Nutritional Engineering, China Agricultural University, China<br>
				<b>Prof. Huang Guang-wei </b><br>
				Chinese American Food Society, USA<br>
				Associate Director, Food Research and Technology of the Almond Board of California, USA<br>
				<b>Prof. Huang Qing-rong</b><br>
				Rutgers University, USA<br>
				<b>Prof. Huang Yao-wen</b><br>
				University of Georgia, USA<br>
				<b>Prof. Jia Ying-min</b><br>
				Vice President, Beijing Technology and Business University, China<br>
				<b>Prof. Jiang Chang-jun</b><br>
				Dean, College of Tea and Food Technology, Anhui Agricultural University, China <br>
				<b>Prof. Jiang Lian-zhou</b><br>
				Dean, College of Food Science, Northeast Agricultural University, China<br>
				<b>Prof. Jiang Zheng-qiang</b><br>
				Vice Dean, College of Food Science and Nutritional Engineering, China Agricultural University, China<br>
				<b>Prof. Jiang Shao-tong</b><br>
				School of Bio-technology and Food Engineering, Hefei University of Technology, China<br>
				<b>Prof. Jin Chang-hai</b><br>
				Vice Dean, School of Food Science and Engineering, Yangzhou University, China<br>
				<b>Prof. Jin Zong-lian</b><br>
				College of Applied Arts and Science, Beijing Union University, China<br>
				<b>Prof. Jin Ye</b><br>
				Dean, College of Food Science and Engineering, Inner Mongolia Agricultural University, China<br>
				<b>Prof. Jin Zheng-yu</b><br>
				Vice President, Jiangnan University, China<br>
				<b>Prof. Ju Xing-rong</b><br>
				Vice President, Nanjing University of Finance and Economics, China<br>
				<b>Prof. Kang Wen-yi</b><br>
				Vice Dean, Pharmaceutical College of Henan University, China<br>
				<b>Prof. Lei Hong-tao</b><br>
				Executive Dean, College of Food Science, South China Agricultural University, China<br>
				<b>Prof. Li Dong</b><br>
				Secretary of the Party Committee, Director, Beijing Research Institute for Nutritional Resources,
				China<br>
				<b>Prof. Li Dong-sheng</b><br>
				Vice President, Hubei University of Technology, China<br>
				<b>Prof. Li Hong-jun</b><br>
				Vice Dean, Graduate School of Southwest University, China<br>
				<b>Prof. Li Hua</b><br>
				Vice President, Northwest A&F University, China<br>
				<b>Prof. Li Jian-ke</b><br>
				College of Food Engineering and Nutritional Science, Shanxi Normal University, China<br>
				<b>Prof. Li Shao-ping</b><br>
				Associate Director, Institute of Chinese Medical Sciences, University of Macau, China<br>
				<b>Prof. Li Yong</b><br>
				Director, Department of Nutrition and Food Security, School of Public Health, Peking University,
				China<br>
				<b>Prof. Li Zhong-hai</b><br>
				College of Food Science and Engineering, Central South University of Forestry and Technology, China<br>
				<b>Prof. Li Jian-rong</b><br>
				Vice President, Bohai University, China<br>
				<b>Prof. Lian Bin</b><br>
				College of Life Science, Nanjing Normal University, China<br>
				<b>Prof. Lin Hong</b><br>
				Secretary of the Party Committee, College of Food Science and Engineering, Ocean University China, China<br>
				<b>Prof. Lin Qin-lu</b><br>
				Dean, College of Food Science and Engineering, Central South University of Forestry and Technology,
				China<br>
				<b>Prof. Liu Bao-lin</b><br>
				Dean, School of Medical Instrument and Food Engineering, University of Shanghai for Science and
				Technology, China<br>
				<b>Prof. Liu Cheng-mei</b><br>
				Dean, School of Food Science and Technology, Nanchang University, China<br>
				<b>Prof. Liu Jing-sheng</b><br>
				Dean, School of Food Science and Technology, Jilin Agricultural University, China<br>
				<b>Prof. Liu Jing-bo </b><br>
				Vice Dean, College of Food Science and Engineering, Jilin University, China<br>
				<b>Prof. Liu Jing-ze</b><br>
				Vice President, Hebei Normal University, China<br>
				<b>Prof. Liu Jing</b><br>
				School of Medical Instrument and Food Engineering, University of Shanghai for Science and Technology,
				China<br>
				Winner of “The Recruitment Program of Global Experts”, China<br>
				<b>Prof. Liu Wen</b><br>
				Director, Sub-Institute of Food and Agricultural Standardization, China National Institute of
				Standardization, China<br>
				<b>Prof. Liu Xin-qi</b><br>
				School of Food and Chemical Engineering, Beijing Technology and Business University, China<br>
				Winner of “The Recruitment Program of Global Experts”, China<br>
				<b>Prof. Liu Xue-bo</b><br>
				Dean, College of Food Science and Engineering, Northwest Agriculture and Forestry University, China<br>
				<b>Prof. Lu Qi-yu</b><br>
				College of Grain and Food, Henan University of Technology, China<br>
				<b>Prof. Lu Xiang-yang</b><br>
				Vice President, Hunan Agricultural University, China<br>
				<b>Prof. Lu Xiao-li</b><br>
				College of Light Industry, Textile and Food Engineering, Sichuan University, China<br>
				<b>Prof. Lu Zhao-xin</b><br>
				College of Food Science and Technology, Nanjing Agricultural University, China<br>
				<b>Prof. Luo Jie</b><br>
				Vice Dean, Institute of Executive Development, China Food and Drug Administration, China<br>
				<b>Prof. LuoYa-guang</b><br>
				Senior Fellow, Agricultural Product Safety and Quality, US Department of Agriculture, USA<br>
				<b>Prof. LuoYun-bo</b><br>
				Academician, International Academy of Food Science and Technology (IAFoST)<br>
				College of Food Science & Nutritional Engineering, China Agricultural University, China<br>
				<b>Prof. Ma Hai-le</b><br>
				Dean, School of Food and Biological Engineering, Jiangsu University, China<br>
				<b>Prof. Nie Shao-ping</b><br>
				Vice Dean, School of Food Engineering, Nanchang University, China<br>
				<b>Prof. Ou Hong-yu</b><br>
				School of Life Science and Biotechnology, Shanghai Jiao Tong University, China <br>
				<b>Prof. Pan Li-jun</b><br>
				School of Biotechnology and Food Engineering, Hefei University of Technology, China<br>
				<b>Prof. Pan Si-yi</b><br>
				College of Food Science & Technology, Huazhong Agricultural University, China<br>
				<b>Prof. Pang Guang-chang</b><br>
				College of Biological Engineering and Food Science, Tianjin University of Commerce, China<br>
				Director, Marine Food and Drug Institute, Tianjin University of Commerce, China<br>
				<b>Prof. Pei Shi-chun</b><br>
				Dean, College of Food Science and Biological Engineering, Qiqihar University, China<br>
				<b>Prof. Pu Biao</b><br>
				College of Food Science, Sichuan Agricultural University, China<br>
				<b>Prof. Qi Bin</b><br>
				Secretary of the Party Committee, School of Bio-technology and Food Engineering, Changshu Institute of
				Technology, China<br>
				<b>Prof. Qiu Shu-yi</b><br>
				Dean, School of Liquor and Food Engineering, Guizhou University, China<br>
				<b>Researcher Shan Yang</b><br>
				Vice President, Hunan Academy of Agricultural Sciences, China<br>
				<b>Prof. Shi Yan-guo</b><br>
				Dean, College of Food Science and Technology, Harbin University of Commerce, China<br>
				<b>Prof. Sun Gui-ju</b><br>
				Director, Department of Nutrition and Food Security, School of Public Health, Southeast University,
				China <br>
				<b>Prof. Sun Qing-jie</b><br>
				Vice Dean, College of Food Science and Engineering, Qingdao Agricultural University, China<br>
				<b>Prof. Sun Yuan-ming</b><br>
				College of Food Science, South China Agricultural University, China<br>
				<b>Prof. Wang Da-wei</b><br>
				Vice Dean, College of Food Science and Engineering, Jilin Agricultural University, China<br>
				<b>Prof. Wang Jie</b><br>
				Dean, College of Food Science and Technology, Hebei Agricultural University, China<br>
				<b>Researcher Wang Qiang</b><br>
				Vice Director, Institute of Agro-Product Processing Science and Technology, Chinese Academy of
				Agricultural Sciences, China<br>
				<b>Prof. Wang Shuo</b><br>
				School of Food Engineering and Biotechnology, Tianjin University of Science and Technology, China<br>
				<b>Prof. Wang Xing-ping</b><br>
				Vice President, Hubei Minzu University, China<br>
				<b>Prof. Wang Xi-chang</b><br>
				Dean, College of Food Science, Shanghai Ocean University, China<br>
				<b>Researcher Wang Ying-kuan</b><br>
				Director, Information Center, Chinese Academy of Agricultural Engineering, China<br>
				Chief Editor, <i>International Journal of Agricultural and Bioengineering </i>(IJABE), China<br>
				<b>Prof. Wang Zhao</b><br>
				School of Medicine, Tsinghua University, China<br>
				<b>Prof. Wang Shao-yun</b><br>
				Vice Dean, School of Biological Science and Engineering, Fuzhou University, China<br>
				<b>Researcher Wei Yi-min</b><br>
				Institute of Agro-Product Processing Science and Technology, Chinese Academy of Agricultural Sciences,
				China<br>
				<b>Researcher Wu Yong-ning</b><br>
				Chief Scientist, China National Center for Food Safety Risk Assessment (CFSA), China<br>
				<b>Prof. Xia Li-qiu</b><br>
				College of Life Science, Hunan Normal University, China <br>
				<b>Prof. Xia Yan-bing</b><br>
				College of Food Science and Technology, Hunan Agricultural University, China<br>
				<b>Associate Prof. Xiao Xing</b><br>
				University of Massachusetts, USA<br>
				<b>Prof. Xie Ming-yong</b><br>
				Vice President, Nanchang University, China<br>
				<b>Prof. Xing Xin-hui</b><br>
				Vice Director, Department of Chemical Engineering, Tsinghua University, China<br>
				Editor, <i>Journal of Bioscience and Bioengineering</i><br>
				Associate Editor, <i>Biochemical Engineering Journal</i><br>
				<b>Prof. Xu Hong</b><br>
				Dean, College of Food Science and Light Industry, Nanjing Tech University, China<br>
				<b>Prof. Xu Ming-sheng</b><br>
				Dean, College of Food Science and Engineering, Jiangxi Agricultural University, China<br>
				<b>Prof. Xu Xin-lian</b><br>
				Dean, College of Food Science and Technology, Nanjing Agricultural University, China<br>
				Chairman, Chinese Association of Animal Products Processing, China<br>
				<b>Prof. Xu Zhi-min</b><br>
				Louisiana State University, USA<br>
				<b>Prof. Xue Chang-hu</b><br>
				Dean, College of Food Science and Engineering, Ocean University of China, China<br>
				<b>Prof. Yang Ming-duo</b><br>
				Vice President, Heilongjiang Association for Science and Technology, China<br>
				Harbin University of Commerce, China<br>
				<b>Prof. Yang Hai-yan</b><br>
				Dean, College of Food Science and Medical, Xinjiang Agricultural University, China<br>
				<b>Prof. Yang Xing-bin</b><br>
				Dean, College of Food Engineering and Nutritional Science, Shanxi Normal University, China <br>
				<b>Prof. Ye Xing-qian</b><br>
				Vice Dean, College of Bio-system Engineering and Food Science, Zhejiang University, China<br>
				<b>Prof. Yu Long-jiang</b><br>
				Vice Dean, College of Life Science and Technology, Huazhong University of Science and Technology,
				China<br>
				<b>Prof. Yu Wei-zu</b><br>
				Chief Scientist, Institute of Nutrition and Health, COFCO Corporation, China<br>
				Winner of “The Recruitment Program of Global Experts”, China<br>
				<b>Prof. Yu Jian-ping</b><br>
				College of Life Sciences, Guizhou University, China<br>
				<b>Prof. Yuan Qi-peng</b><br>
				Dean, College of Life Science and Technology, Beijing University of Chemical Technology, China<br>
				<b>Prof. Yue Tian-li</b><br>
				College of Food Science and Engineering, Northwest A&F University, China<br>
				<b>Prof. Zhang Chao-hua</b><br>
				Vice President, Guangdong Ocean University, China<br>
				<b>Prof. Zhang Fang-rong</b><br>
				Kaohsiung Medical University, Taiwan, China<br>
				<b>Prof. Zhang Hao</b><br>
				School of Food Science Technology, Jiangnan University, China<br>
				<b>Prof. Zhang He-ping</b><br>
				College of Food Science and Engineering,Inner Mongolia Agricultural University, China<br>
				<b>Researcher Zhang Jing-hua</b><br>
				Director, Beijing Center for Physical & Chemical Analysis, China<br>
				<b>Prof. Zhang Kun-sheng</b><br>
				Dean, College of Biological Engineering and Food Science, Tianjin University of Commerce, China<br>
				<b>Prof. Zhang Lan-wei</b><br>
				School of Chemical Engineering and Technology, Harbin Institute of Technology, China<br>
				<b>Researcher Zhang Ming-wei</b><br>
				Director, Sericulture &Agri-food Research Institute, Guangdong Academy of Agricultural Sciences,
				China<br>
				<b>Prof. Zhang Wen-sheng</b><br>
				College of Resources Science, Beijing Normal Univeristy, China<br>
				<b>Researcher Zhang Yan</b><br>
				Vice President, Hebei Food Inspection and Research Institute, China<br>
				<b>Researcher Zhang Zheng</b><br>
				Vice President, Jiangsu Institute for Food and Drug Control, China<br>
				<b>Prof. Zhang Zhi-Qiang</b><br>
				Director, Department of Food and Nutritional Sciences, the Chinese University of Hong Kong, China<br>
				<b>Prof. Zhao Guo-hua</b><br>
				Dean, College of Food Science, Southwest University, China<br>
				<b>Prof. Zheng Bao-dong</b><br>
				Dean, College of Food Science, Fujian Agriculture and Forestry University, China<br>
				<b>Prof. Zheng Lei</b><br>
				Dean, Institute of Science and Technology, Hefei University of Technology, China<br>
				<b>Prof. Zheng Xi-qun</b><br>
				Vice President, Qiqihar University, China<br>
				<b>Prof. Zhou Jian</b><br>
				Vice President, Wuhan Polytechnic University, China<br>
				<b>Prof. Zhou Xiao-bo</b><br>
				School of Food and Bioengineering, Jiangsu University, China<br>
				<b>Prof. Zhu Wen-xue</b><br>
				College of Food Bioengineering, Henan University of Science and Technology, China<br>
				<div class="jx"></div>
			</li>
			<div class="clear"></div>
		</ul>
	</div>
</div>

<%@include file="/inc/en_footer.jsp"%>
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