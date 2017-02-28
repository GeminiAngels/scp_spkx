/**
 * @author HwaSun.byf
 * @version 1.0
 * 获取根路径(contextPath)
 * return string  /serp
 */
function getContextPath(){
	var index = 0;
	if(window.location.pathname.indexOf('/')==0)
		index = 1;
	var url = window.location.pathname.substr(index);
	var path = '/'+url.substr(0,url.indexOf('/'));
	
	return path;
}
var path = getContextPath();

/**
 * window.open打开新页面
 * @param url 转向网页的地址
 * @param name 网页名称，可为空
 * @param iWidth 弹出窗口的宽度
 * @param iHeight 弹出窗口的高度
 */
function openwindow(url, name, iWidth, iHeight) {
	//window.screen.height获得屏幕的高，
	//window.screen.width获得屏幕的宽
	var iTop = (window.screen.height - 30 - iHeight) / 2; //获得窗口的垂直位置;
	var iLeft = (window.screen.width - 10 - iWidth) / 2; //获得窗口的水平位置;
	window.open(url, name, 'height=' + iHeight + ',,innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',toolbar=no,menubar=no,scrollbars=yes,resizeable=no,location=no,status=no');
}
/**
 * 日期格式化
 * 用法: new Date().format("yyyy-MM-dd hh:mm:ss")
 * 	alert(new Date().Format("yyyy年MM月dd日"));
 	alert(new Date().Format("MM/dd/yyyy"));
 	alert(new Date().Format("yyyyMMdd"));
 	alert(new Date().Format("yyyy-MM-dd hh:mm:ss"));
 本文原始链接：http://www.jbxue.com/article/25715.html
 * @param format
 * @returns {*}
 */
Date.prototype.format = function(format){
	var o = {
		"M+" : this.getMonth()+1, //month
		"d+" : this.getDate(), //day
		"h+" : this.getHours(), //hour
		"m+" : this.getMinutes(), //minute
		"s+" : this.getSeconds(), //second
		"q+" : Math.floor((this.getMonth()+3)/3), //quarter
		"S" : this.getMilliseconds() //millisecond
	};

	if(/(y+)/.test(format)) {
		format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
	}

	for(var k in o) {
		if(new RegExp("("+ k +")").test(format)) {
			format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
		}
	}
	return format;
};

/**
 * 本周第一天
 */
function getWeekFirstDay(day,fmt){
	var Nowdate=new Date(day);
	var weekday = Nowdate.getDay()===0?7:Nowdate.getDay();
	var WeekFirstDay=new Date(Nowdate-(weekday-1)*86400000);
	return WeekFirstDay.format(fmt||'yyyy-MM-dd hh:mm:ss.S')
}
/**
 * 本周最后一天
 */
function getWeekLastDay(day,fmt){
	var Nowdate=new Date(day);
	var weekday = Nowdate.getDay()===0?7:Nowdate.getDay();
	var WeekFirstDay=new Date(Nowdate-(weekday-1)*86400000);
	var WeekLastDay=new Date((WeekFirstDay/1000+6*86400)*1000);
	return WeekLastDay.format(fmt||'yyyy-MM-dd hh:mm:ss.S')
}
/**
 * 本月第一天
 */
function getMonthFirstDay(day,fmt){
	var Nowdate=new Date(day);
	var MonthFirstDay=new Date(Nowdate.getFullYear(),Nowdate.getMonth(),1);
	return MonthFirstDay.format(fmt||'yyyy-M-d hh:mm:ss.S')
}
/**
 * 本月最后一天
 */
function getMonthLastDay(day,fmt){
	var Nowdate=new Date(day);
	var MonthNextFirstDay=new Date(Nowdate.getFullYear(),Nowdate.getMonth()+1,1);
	var MonthLastDay=new Date(MonthNextFirstDay-86400000);
	return MonthLastDay.format(fmt||'yyyy-MM-dd hh:mm:ss.S')
}

/**
 * 本年第一天
 */
function getYearFirstDay(day,fmt){
	var Nowdate=new Date(day);
	var MonthFirstDay=new Date(Nowdate.getFullYear(),0,1);
	return MonthFirstDay.format(fmt||'yyyy-M-d hh:mm:ss.S')
}