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
	<title>3rd International Symposium of <i>Food Science and Human Wellness</i></title>
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
<%@include file="/inc/en_headbar.jsp" %>
<div class="main">
	<h2 style="margin-bottom:30px;"><img src="<%=path%>/static/spkx/images/ico_tt.png" alt=""/>Meeting Profile</h2>
	<div class="hyjs" style="padding-bottom:50px;">
		<p class="jj"><img src="<%=path%>/static/spkx/images/pic02.png" alt=""/>It is self-evident that food is much important to human wellness. In China, it has been the traditional lifestyle to utilize the medicinal properties of food in daily diets to regulate body’s nutrition level and to ensure health since ancient times. Li Shi-Zhen, the most distinguished medicinal scientist in Ming Dynasty, had highly generalized the health role of diets as people’s lifeblood. An assessment report about the factors affecting human wellness by World Health Organization (WHO) recently also showed that dietary nutrition factor (13%) was listed after the 1st ranking -genetic factor (15%), and considerably higher than medical treatment factor (only 8%). The rapid development of food Science and Technology has greatly promoted the diversification of the types of food and much healthier balance of nutrients, which not only develops the food industry into prosperity, but also prolongs human life and improves the quality of life. In recent years, along with the fast development of the new scientific and technological revolution, especially in the fields of information, life science and nanotechnology, an enormous food Science and Technology revolution broke out, which vigorously promotes the application of advanced Science and Technology in the food industry. With the accelerated process of industrialization, urbanization and aging in China, the incidence of chronic diseases shows a sustained and rapid growth trend. These include obesity, high blood pressure, diabetes, coronary heart disease and etc. How to provide consumers with more nutritious and healthier food, has become an important subject of our country and even the whole world. However, a series of major food safety events occur globally, highlighting the severe challenge of the technological progress and social development to food quantity, food quality and food safety, which have been related to the health and security of human beings and our next generation as well. To ensure food safety has become an important policy issue about protecting human life and health, improving life quality, boosting food trade and keeping social stabilization and harmony. Therefore, there is still a long way to go in the development of food science, so that we need to continue to deal with all the challenges.</p>
		<p class="jj">In order to further promote the development of food science and drive technological innovation in food industry, also to better protect human health and improve the quality of life, on the basis of successful holding of the past nine international symposiums of Food Science, two International Symposium of Food Science and Human Wellness and other conferences on food, together with the 6<sup>th</sup> anniversary of <i>Food Science and Human Wellness</i>, Beijing Academy of Food Sciences and <i>FOOD SCIENCE</i> will hold the 3<sup>rd</sup> International Symposium of <i>Food Science and Human Wellness</i> during August 5<sup>th</sup>-6<sup>th</sup>, 2017 in Jilin, Changchun, China with the great support from International Association for Cereal Science and Technology (ICC), American Association of Cereal Chemists International (AACC International), the Chinese American Food Society (CAFS), <i>Journal of Food Science</i>, <i>Journal of Agricultural and Food Chemistry</i>, <i>Food and Bioprocess Technology</i>, <i>Journal of Food and Drug Analysis</i>, <i>Journal of Functional Foods</i>, <i>Food Chemistry</i>. The symposium will explore in depth the key theoretical research of food sciences and nutritional health involving food biochemistry, food microbiology, food nutriology, food immunology, food functional components and activity evaluation, as well as food safety and toxicology. Through providing an opportunity to communicate advanced experience, lay out the latest research accomplishments, and construct an industry-university-research cooperation platform, new research ideas and development direction will be provided to both food professionals and producers. </p>
		<p class="jj">Professionals and entrepreneurs from universities, research institutes and food industry all over the world are welcome to attend this symposium to share their knowledge and achievement. This symposium also provides an exhibition platform for food enterprises and instrument manufacturers who are seeking for cooperation. The symposium will last for 2 days from August 5<sup>th</sup> to August 6<sup>th</sup>, 2017 in Changchun, Jilin, China. The 7<sup>th</sup> Senior Training Course of High Quality SCI (Science Citation Index) Academic Papers Writing and Skills on Food Science and Biology will be held in Changchun, Jilin, before the symposium.</p>
		<div class="clear"></div>
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
	});
</script>
</body>
</html>