var version = '2.2.7';
var sp = location.pathname.lastIndexOf('/');
var ep = location.pathname.lastIndexOf('.do');
var curPage = sp < ep ? location.pathname.slice(sp + 1, ep) : 'index';
var enVersion = location.href.indexOf('-en.html') != -1;

var activeClass = {};
var loc = {};
var forkWidth = 149;
curPage = curPage.replace('-en', '');
var isExample = false;
switch (curPage) {
    case 'index' :
        activeClass[curPage] = 'active';
        loc[curPage] = '.';
        loc.feature = './doc';
        loc.example = './doc';
        loc.doc = './doc';
        loc.about = './doc';
        loc.changelog = './doc';
        loc.option = './doc';
        loc.spreadsheet = './doc';
        loc.start = './doc';
        loc.img = './doc';
        break;
    case 'feature' :
    case 'example' :
    case 'doc' :
    case 'option' :
    case 'spreadsheet' :
    case 'about' :
    case 'changelog' :
    case 'start' :
        activeClass[curPage] = 'active';
        loc.index = '..';
        break;
    case 'auth' :
        activeClass[curPage] = 'active';
        break;
    case 'chart' :
        activeClass[curPage] = 'active';
        break;
    case 'report' :
        activeClass[curPage] = 'active';
        break;
    default :
        isExample = true;
        forkWidth = 60;
        activeClass['example'] = 'active';
        var extSub = location.href.indexOf('extension') != -1 ? '../' : '';
        loc.index = extSub + '../..';
        loc.feature = extSub + '../../doc';
        loc.example = extSub + '../../doc';
        loc.doc = extSub + '../../doc';
        loc.about = extSub + '../../doc';
        loc.changelog = extSub + '../../doc';
        loc.option = extSub + '../../doc';
        loc.spreadsheet = extSub + '../../doc';
        loc.start = extSub + '../../doc';
        loc.img = extSub + '../../doc';
        break;
}

// Those pages only exist in echarts-www project,
// but not in http://ecomfe.github.io/echarts/ and doc in echarts project.
if (location.href.indexOf('.baidu.com') < 0) {
    loc.option = 'http://echarts.baidu.com/doc';
    loc.spreadsheet = 'http://echarts.baidu.com/doc';
}

$('#head')[0].innerHTML =
    '<div class="container-fluid" style="padding-left:40px;padding-right:40px;">'
        + '<div class="navbar-header">'
          + '<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">'
            + '<span class="sr-only">Toggle navigation</span>'
            + '<span class="icon-bar"></span>'
            + '<span class="icon-bar"></span>'
            + '<span class="icon-bar"></span>'
          + '</button>'
          + '<a class="navbar-brand" href="javascrpt:;">'
          + '<span class="fa-stack fa-sm">'
            + '<i class="fa fa-circle fa-stack-2x"></i>'
            + '<i class="fa fa-cloud fa-stack-1x fa-inverse"></i>'
          + '</span>'
          + '<span><b>e-Sciences+会议平台</b></span></a>'
        + '</div>'
        + '<div class="navbar-collapse collapse" id="nav-wrap">'
          + '<ul class="nav navbar-nav navbar-right" id="nav" style="max-width:100%;">'
            + '<li class="dropdown ' + (activeClass.report || '') + '">'
              + '<a href="#" class="dropdown-toggle" data-toggle="dropdown">' + (enVersion ? 'API & Doc' : '统计') + '<b class="caret"></b></a>'
              + '<ul class="dropdown-menu">'
                + '<li class=""><a href="' + (loc.index || '.') + '/report.do?method=report" target="_self">报名统计</a></li>'
              + '</ul>'
            + '</li>'
            + '<li class="dropdown ' + (activeClass.auth || '') + '">'
              + '<a href="#" class="dropdown-toggle" data-toggle="dropdown">' + (enVersion ? 'Download' : '管理') + '<b class="caret"></b></a>'
              + '<ul class="dropdown-menu">'
                + '<li><a href="./auth.do?method=register"> 会员管理</a></li>'
                + '<li><a href="./auth.do?method=signin"> 签到管理</a></li>'
                + '<li><a href="./auth.do?method=email"> 邮件管理</a></li>'
                + '<li><a href="./auth.do?method=notice"> 通知管理</a></li>'
                + '<li><a href="./auth.do?method=resource"> 资料管理</a></li>'
                // + '<li><a href="./auth.do?method=order"> 订单管理</a></li>'
                // + '<li><a href="./auth.do?method=bcorder"> 回执订单核对</a></li>'
                + '<li class="divider"></li>'
                + '<li><a href="./auth.do?method=user"> 管理人员设置</a></li>'
                + '<li><a href="./auth.do?method=role"> 角色权限管理</a></li>'
                + '<li><a href="./auth.do?method=mailSet"> 公共邮箱设置</a></li>'
                + '<li class="divider"></li>'
                + '<li><a href="./auth.do?method=func"> 后台模块管理</a></li>'
                + '<li><a href="./auth.do?method=pwd">修改个人密码</a></li>'
              + '</ul>'
            + '</li>'
            + '<li class="' + (activeClass.about || '') + '"><a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎，'+app.user.name+'<b class="caret"></b></a>'
              + '<ul class="dropdown-menu">'
                + '<li><a href="./">返回首页</a></li>'
                + '<li><a href="./auth.do?method=logout">退出系统</a></li>'
              + '</ul>'
            + '</li>'
          + '</ul>'
        + '</div><!--/.nav-collapse -->'
      + '</div>';

function back2Top() {
    $("body,html").animate({scrollTop:0},1000);
    return false;
}

function changeVersion() {
    if (!isExample) {
        window.location = curPage + (enVersion ? '' : '-en') + '.html'
    }
    else {
        window.location = curPage + '.html' + (enVersion ? '' : '#-en');
        if (enVersion) {
            window.location.hash = window.location.hash.replace('-en', '');
        }
        window.location.reload();
    }
}

var $footer = $('#footer');
if ($footer.length) {
    $footer[0].style.marginTop = '50px';
    $footer[0].innerHTML =
         '<div class="container">'
            + '<div class="row" style="padding-bottom:20px;">'
                + '<div class="col-md-3">'
                    + '<p>' + (enVersion ? 'Link' : 'ECharts团队出品') + '</p>'
                    + '<ul>'
                        + '<li><a href="http://tushuo.baidu.com/" target="_blank">Baidu 图说</a></li>'
                        + '<li><a href="' + (enVersion ? "http://ecomfe.github.io/echarts-x" : 'http://echarts.baidu.com/x/doc') + '" target="_blank">ECharts-X</a></li>'
                        + '<li><a href="http://ecomfe.github.io/zrender/index.html" target="_blank">ZRender</a></li>'
                        + '<li><a href="https://github.com/pissang/qtek" target="_blank">QTEK</a></li>'
                    + '</ul>'
                + '</div>'
                + '<div class="col-md-3">'
                    + '<p>' + (enVersion ? 'More' : '更多') + '</p>'
                    + '<ul>'
                        + '<li><a href="https://github.com/ecomfe/echarts/blob/master/LICENSE.txt" target="_blank">License</a></li>'
                        + '<li><a href="http://echarts.baidu.com/doc/changelog' + (enVersion ? '-en' : '') + '.html" target="_blank">Changelog</a></li>'
                        + '<li><a href="http://efe.baidu.com" target="_blank">Baidu EFE</a></li>'
                        + '<li><a href="http://www.oschina.net/p/echarts" target="_blank">' + (enVersion ? 'Open Source China' : '开源中国') + '</a></li>'
                    + '</ul>'
                + '</div>'
                + '<div class="col-md-3">'
                    + '<p>' + (enVersion ? 'Contact Us' : '联系我们') + '</p>'
                    + '<ul>'
                        + '<li><a href="mailto:echarts(a)baidu.com">echarts(a)baidu.com</a></li>'
                        + '<li><a href="https://github.com/ecomfe/echarts" target="_blank"> Github</a></li>'
                        + '<li><a href="http://weibo.com/echarts" target="_blank">Weibo</a></li>'
                    + '</ul>'
                + '</div>'
                + '<div class="col-md-3 flogo">'
                    + '<a href="javascript:void(0)" onclick="back2Top()" title="' + (enVersion ? 'Back to top' : '回到顶部') + '"><img src="'+ (loc.img || '.')+ '/asset/img/echarts-logo2.png" alt="ECharts"/></a>'
                + '</div>'
            + '</div>'
            + '<p class="pull-right"><a href="javascript:void(0)" onclick="back2Top()" >Back to top</a></p>'
            + '<p>&copy; 2015 <a href="http://www.baidu.com/" target="_blank">Baidu</a></p>'
        + '</div>';
}

if (document.location.href.indexOf('local') == -1) {
    var hm = document.createElement("script");
    hm.src = "//hm.baidu.com/hm.js?4bad1df23f079e0d12bdbef5e65b072f";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
}

function updatePwd(){
    alert('测试期间暂时关闭修改密码功能！');
}