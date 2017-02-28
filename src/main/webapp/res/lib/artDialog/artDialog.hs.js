if(window['path']===undefined){
	var index = 0;
	if(window.location.pathname.indexOf('/')==0)index = 1;
	var url = window.location.pathname.substr(index);
	window['path']= '/'+url.substr(0,url.indexOf('/'));
}
$('#artScript').before('<link id="artStyle" rel="stylesheet" href="'+path+'/res/lib/artDialog/skins/simple.css">');
$('#artScript').before('<script src="'+path+'/res/lib/artDialog/artDialog.min.js"></script>');
$('#artScript').before('<script src="'+path+'/res/lib/artDialog/plugins/iframeTools.js"></script>');
artDialog.notice = function (options) {
	artDialog.defaults.zIndex = 9999;
    var opt = options || {},
        api, aConfig, hide, wrap, top,
        duration = 800;
        
    var config = {
        id: 'Notice',
        left: '100%',
        top: '100%',
        fixed: true,
        drag: false,
        resize: false,
        follow: null,
        lock: false,
        init: function(here){
        	$('#artStyle').attr('href',path+'/res/lib/artDialog/skins/'+artDialog.defaults.skin+'.css');
            api = this;
            aConfig = api.config;
            wrap = api.DOM.wrap;
            top = parseInt(wrap[0].style.top);
//            if(artDialog.defaults.skin=='simple')
//            	top += 20;
//            else
//            	top -= 30;
            hide = top + wrap[0].offsetHeight;
            
            wrap.css('top', hide + 'px')
                .animate({top: top + 'px'}, duration, function () {
                    opt.init && opt.init.call(api, here);
                });
        },
        close: function(here){
            wrap.animate({top: hide + 'px'}, duration, function () {
                opt.close && opt.close.call(this, here);
                aConfig.close = $.noop;
                api.close();
            });
            
            return false;
        }
    };	
    
    for (var i in opt) {
        if (config[i] === undefined) config[i] = opt[i];
    };
    
    return artDialog(config);
};

artDialog.topMessage = function (options) {
	artDialog.defaults.zIndex = 9999;
    var opt = options || {},
        api, aConfig, hide, wrap, top,
        duration = 800;
        
    var config = {
        id: 'topMessage',
        left: '50%',
        top: 10,
        fixed: true,
        drag: false,
        resize: false,
        follow: null,
        lock: false,
        init: function(here){
        	$('#artStyle').attr('href',path+'/res/lib/artDialog/skins/'+artDialog.defaults.skin+'.css');
            api = this;
            aConfig = api.config;
            wrap = api.DOM.wrap;
            top = parseInt(wrap[0].style.top);
            hide = top - wrap[0].offsetHeight;
            wrap.css('top', hide + 'px')
                .animate({top: top + 'px'}, duration, function () {
                    opt.init && opt.init.call(api, here);
                });
        },
        close: function(here){
            wrap.animate({top: hide + 'px'}, duration, function () {
                opt.close && opt.close.call(this, here);
                aConfig.close = $.noop;
                api.close();
            });
            
            return false;
        }
    };	
    
    for (var i in opt) {
        if (config[i] === undefined) config[i] = opt[i];
    };
    
    return artDialog(config);
};

var HSun = HSun || {};

HSun.Msg = HSun.Msg || {
	/**
	 * 页面右下角弹出消息通知（5秒自动消失）
	 * @param {} msg(消息内容),type(succeed,error,warning,question),time(自动消失秒数)
	 */
	showNotice : function(cfg){
		if(cfg){
			artDialog.defaults.skin = cfg.skin||'default';
			art.dialog.notice({
			    title: '系统提示',
			    width: 200,// 必须指定一个像素宽度值或者百分比，否则浏览器窗口改变可能导致artDialog收缩
			    content: cfg.msg||cfg,
			    icon: cfg.type||'succeed',
			    time: cfg.time||3
			});
		}
	},
	
	/**
	 * 顶部自动隐藏提示框
	 * @param {} cfg
	 */
	showTopMessage : function(cfg){
		if(cfg){
			artDialog.defaults.skin = cfg.skin||'default';
			art.dialog.topMessage({
			    title: '系统提示',
			    width: 200,// 必须指定一个像素宽度值或者百分比，否则浏览器窗口改变可能导致artDialog收缩
			    content: cfg.msg||cfg,
			    icon: cfg.type||'succeed',
			    time: cfg.time||3
			});
		}
	},
	
	/**
	 * 操作确认提示框
	 * @param {} cfg
	 */
	showConfirmDlg : function(cfg){
		if(cfg){
			if(cfg.skin){
				$('#artStyle').attr('href',path+'/res/lib/artDialog/skins/'+cfg.skin+'.css');
			}
			art.dialog({
				lock: true,
				fixed: true,
				follow: null,
				drag:false,
				width:300,
			    content: cfg.msg||cfg,
			    ok: function () {
			    	//this.title('3秒后自动关闭').time(3);
			    	if($.isFunction(cfg.okAction))
			    		cfg.okAction(cfg);
			        return true;
			    },
			    cancelVal: '关闭',
			    cancel: true //为true等价于function(){}
			});
//			art.dialog.confirm(cfg.msg||cfg, function () {
//				if($.isFunction(cfg.okAction))
//			    	cfg.okAction(cfg);
//			}, function () {
//				if($.isFunction(cfg.cancalAction))
//			    	cfg.cancalAction(cfg);
//			});
		}
	},
	
	/**
	 * 简单信息提示
	 * @param {} cfg
	 */
	showTips : function(cfg){
		if(cfg){
			art.dialog.tips(cfg.msg||cfg);
		}
	}
}

HSun.dialog = HSun.dialog || {
	/**
	 * 打开模式窗口
	 * @param {} url
	 * @param {} cfg
	 */
	open : function(url,cfg){
//		if(url)
//			art.dialog.open(url,cfg);
		var result;
		if(url){
			(url.indexOf('?')!=-1)?(url += '&'):(url += '?');
			url += 'time='+Math.random()*10000000000000000
			cfg = cfg || {};
			cfg.param = cfg.param || {};
			cfg.width = cfg.width || (screen.width-100);
			cfg.height = cfg.height || screen.height;
			var ui = "dialogHeight:"+cfg.height+"px;dialogWidth:"+cfg.width+"px;status:no;";
			result = window.showModalDialog(url,cfg.param,ui);
		}
		return result;
	},
	/**
	 * 窗口关闭
	 */
	close : function(){
		
	}
}

//样例
//HSun.Msg.showNotice({msg:'右下角自动消失提示框',skin:'green'});
//HSun.Msg.showTopMessage({msg:'顶部自动消失提示框',time:3,skin:'blue'});
//HSun.Msg.showConfirmDlg({msg:'您确定要删除该信息吗？',skin:'blue',okAction:function(){
//	HSun.Msg.showTips('操作成功！');
//}});