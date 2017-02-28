/**
 * @include "../lib/artDialog/artDialog.hs.js"
 */
$(document).ready(function(){
	var first = true;
	list(first);
});
function list(first){
	var data = [
		{name: "图表", children: [
			{name: "K线图1"},
			{name: "K线图2"}
		]},
		{name: "报表", children: [
			{name: "K线图1"},
			{name: "K线图2"}
		]},
		{name: "导航", children: [
			{name: "K线图1"},
			{name: "K线图2"}
		]},
		{name: "工具", children: [
			{name: "K线图1"},
			{name: "K线图2"}
		]},
		{name: "设置", children: [
			{name: "K线图1"},
			{name: "K线图2"}
		]},
		{name: "公司介绍"},
	];
	var setting = {
			check:{
                enable:true
            },
            data:    {
                simpleData:{
                    enable:true
                },
                key:{
            		url:"javascript:;"
            	}
            },
            view:{
            	showLine : !1,
    			selectedMulti : !1,
    			showIcon : !1
            },
            callback:{
                onCheck:checkActiveTree
            }
	};
	zTreeObj = $.fn.zTree.init($("#ztree-menu-front"), setting, data);
	first = false;
};
/**
 * 获取选中的菜单checkActiveTree
 * @return {}
 */
function checkActiveTree(){
	var display =$('#tree-front').css('display');
	var treeObj;
	if(display == 'none'){
		treeObj=$.fn.zTree.getZTreeObj("ztree-menu-behind");
	}else{
		treeObj=$.fn.zTree.getZTreeObj("ztree-menu-front");
	};
    var nodes=treeObj.getSelectedNodes();
    return nodes[0];//单选 只返回第一项即可
};
/**
 * 创建同级菜单
 */
$('#btn-add-same').click(function(e){
	var display =$('#tree-front').css('display');
	var treeObj;
	var pId;
	var catalog;
	if(display == 'none'){
		treeObj=$.fn.zTree.getZTreeObj("ztree-menu-behind");
		var nodes=treeObj.getSelectedNodes();
		nodes = nodes[0];
		catalog = 1;
		if(nodes==undefined){
			HSun.Msg.showTips({msg:'增加一级菜单！'});
			pId = '';//增加同级传父id(pId是父id)
		}else{
			pId = nodes.pId;//增加同级传父id
		}
	}else{
		treeObj=$.fn.zTree.getZTreeObj("ztree-menu-front");
		var nodes=treeObj.getSelectedNodes();
		nodes = nodes[0];
		catalog = 2;
		if(nodes==undefined){
			HSun.Msg.showTips({msg:'增加一级菜单！'});
			pId = '';//增加同级传父id
		}else{
			pId = nodes.pId;//增加同级传父id
		}
	};
    window.pId = pId;
    window.catalog = catalog;
    openwindow(path+'/admin/auth/menuAdd.jsp?time='+Math.random()*10000000000000000,"",600,600);

    //var result = HSun.dialog.open(path+'/admin/auth/menuAdd.jsp',{width:600,height:600,param:{pId:pId,catalog:catalog}});
	//if(result){
	//	HSun.Msg.showTips({msg:'成功添加菜单！'});
	//	list();
	//}
});
/**
 * 子窗口传值到父窗口  -- 用于子窗口调用
 * @param paramsDetail
 */
function returnValue(result){
    if(result){
        HSun.Msg.showTips({msg:'成功添加菜单！'});
        list();
    }
}
/**
 * 创建子级菜单
 */
$('#btn-add-son').click(function(e){
	var nodes = checkActiveTree();
	if(nodes=='undefined'){
		HSun.Msg.showTips({msg:'请先选择菜单！'});
	}else{
		var pId = nodes.id;//增加子级传id
		var catalog = nodes.catalog;

        window.pId = pId;
        window.catalog = catalog;
        openwindow(path+'/admin/auth/menuAdd.jsp?time='+Math.random()*10000000000000000,"",600,600);

        //var result = HSun.dialog.open(path+'/admin/auth/menuAdd.jsp',{width:600,height:600,param:{pId:pId,catalog:catalog}});
		//if(result){
		//	HSun.Msg.showTips({msg:'成功添加菜单！'});
		//	list();
		//}
	}
});
/**
 * 编辑菜单
 */
$('#btn-edit-menu').click(function(e){
	var nodes = checkActiveTree();
    window.nodes = nodes;
    openwindow(path+'/admin/auth/menuEdit.jsp?time='+Math.random()*10000000000000000,"",600,600);

    //var result = HSun.dialog.open(path+'/admin/auth/menuEdit.jsp',{width:600,height:600,param:nodes});
	//if(result){
	//	HSun.Msg.showTips({msg:'成功修改菜单！'});
	//	list();
	//}
});
/**
 * 删除菜单
 */
$('#btn-delete-menu').click(function(e){
	var nodes = checkActiveTree();
	var id = nodes.id;
	var cfg = {
		skin:'aero',
		msg:'是否删除此菜单！',
		params:id,
		okAction:function(cfg){
			var id = cfg.params;
			$.ajax({
				url:path+'/security/MenuAdmin_removeTree.action',
				type:'post',
				dataType:'json',
				data:{id:id},
				success:function(res){
					HSun.Msg.showTips({msg:'删除成功！'});
					list();
				}
			});
		}
	};
	HSun.Msg.showConfirmDlg(cfg);
});
/**
 * toggle按钮,切换查看前后台菜单,已作废
 */
function openToggle(){
	$('#menu-front').toggle();
	$('#menu-behind').toggle();
	$('#tree-front').toggle();
	$('#tree-behind').toggle();
	$('#head-front').toggle();
	$('#head-behind').toggle();
};
/**
 * 切换前台菜单
 */
function openFront(){
	var front = $('<span>前台菜单</span>');
	$('#menu-front').empty();
	$('#menu-front').append(front);
	var behind = '后台菜单';
	$('#menu-behind').empty();
	$('#menu-behind').append(behind);
	
	$('#tree-front').show();
	$('#tree-behind').hide();
	$('#head-front').show();
	$('#head-behind').hide();
};
/**
 * 切换前台菜单
 */
function openBehind(){
	var front = '前台菜单';
	$('#menu-front').empty();
	$('#menu-front').append(front);
	var behind = $('<span>后台菜单</span>');
	$('#menu-behind').empty();
	$('#menu-behind').append(behind);
	
	$('#tree-front').hide();
	$('#tree-behind').show();
	$('#head-front').hide();
	$('#head-behind').show();
};