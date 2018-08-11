<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>API</title>
 <link href="../css/themes/default/easyui.css" rel="stylesheet" type="text/css" />
  <link href="../css/themes/icon.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
<style type="text/css">
body {
	font: 12px/20px "微软雅黑", "宋体", Arial, sans-serif, Verdana, Tahoma;
	padding: 0;
	margin: 0;
}
.layout-split-proxy-h{
	position:absolute;
	width:2px;
	background:#888;
	font-size:1px;
	cursor:e-resize;
	display:none;
	z-index:5;
}

.layout-split-north{
	border-bottom:5px solid #efefef;
}
.layout-split-south{
	border-top:5px solid #efefef;
}
.layout-split-east{
	border-left:0px solid #efefef;
}
.layout-split-west{
	border-right:0px solid #efefef;
}
a:link {
 text-decoration: none;
}
a:visited {
 text-decoration: none;
}
a:hover {
 text-decoration: underline;
}
a:active {
 text-decoration: none;
}
.cs-north {
	height:60px;
}
.cs-north-bg {
	width: 100%;
	height: 100%;
	background: url(themes/gray/images/header_bg.png) repeat-x;
}
.cs-north-logo {
	height: 40px;
	margin: 15px 0px 0px 5px;
	display: inline-block;
	color:#000000;font-size:22px;font-weight:bold;text-decoration:none
}
.cs-west {
	width:200px;padding:0px;
}
.cs-navi-tab {
	padding: 5px;
}
.cs-tab-menu {
	width:120px;
}
.cs-home-remark {
	padding: 10px;
}
.wrapper {
    float: right;
    height: 30px;
    margin-left: 10px;
}
.ui-skin-nav {
    float: right;
	padding: 0;
	margin-right: 10px;
	list-style: none outside none;
	height: 30px;
}

.ui-skin-nav .li-skinitem {
    float: left;
    font-size: 12px;
    line-height: 30px;
	margin-left: 10px;
    text-align: center;
}
.ui-skin-nav .li-skinitem span {
	cursor: pointer;
	width:10px;
	height:10px;
	display:inline-block;
}
.ui-skin-nav .li-skinitem span.cs-skin-on{
	border: 1px solid #FFFFFF;
}

.ui-skin-nav .li-skinitem span.gray{background-color:gray;}
.ui-skin-nav .li-skinitem span.default{background-color:blue;}
.ui-skin-nav .li-skinitem span.bootstrap{background-color:#D7EBF9;}
.ui-skin-nav .li-skinitem span.black{background-color:black;}
.ui-skin-nav .li-skinitem span.metro{background-color:#FFE57E;}
</style>
<script type="text/javascript">
function addTab(title, url){
	if ($('#tabs').tabs('exists', title)){
		$('#tabs').tabs('select', title);//选中并刷新
		var currTab = $('#tabs').tabs('getSelected');
		var url = $(currTab.panel('options').content).attr('src');
		if(url != undefined && currTab.panel('options').title != 'Home') {
			$('#tabs').tabs('update',{
				tab:currTab,
				options:{
					content:createFrame(url)
				}
			})
		}
	} else {
		var content = createFrame(url);
		$('#tabs').tabs('add',{
			title:title,
			content:content,
			closable:true
		});
	}
	tabClose();
}
function createFrame(url) {
	var s = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
	return s;
}
		
function tabClose() {
	/*双击关闭TAB选项卡*/
	$(".tabs-inner").dblclick(function(){
		var subtitle = $(this).children(".tabs-closable").text();
		$('#tabs').tabs('close',subtitle);
	})
	/*为选项卡绑定右键*/
	$(".tabs-inner").bind('contextmenu',function(e){
		$('#mm').menu('show', {
			left: e.pageX,
			top: e.pageY
		});

		var subtitle =$(this).children(".tabs-closable").text();

		$('#mm').data("currtab",subtitle);
		$('#tabs').tabs('select',subtitle);
		return false;
	});
}		
//绑定右键菜单事件
function tabCloseEven() {
	//刷新
	$('#mm-tabupdate').click(function(){
		var currTab = $('#tabs').tabs('getSelected');
		var url = $(currTab.panel('options').content).attr('src');
		if(url != undefined && currTab.panel('options').title != 'Home') {
			$('#tabs').tabs('update',{
				tab:currTab,
				options:{
					content:createFrame(url)
				}
			})
		}
	})
	//关闭当前
	$('#mm-tabclose').click(function(){
		var currtab_title = $('#mm').data("currtab");
		$('#tabs').tabs('close',currtab_title);
	})
	//全部关闭
	$('#mm-tabcloseall').click(function(){
		$('.tabs-inner span').each(function(i,n){
			var t = $(n).text();
			if(t != 'Home') {
				$('#tabs').tabs('close',t);
			}
		});
	});
	//关闭除当前之外的TAB
	$('#mm-tabcloseother').click(function(){
		var prevall = $('.tabs-selected').prevAll();
		var nextall = $('.tabs-selected').nextAll();		
		if(prevall.length>0){
			prevall.each(function(i,n){
				var t=$('a:eq(0) span',$(n)).text();
				if(t != 'Home') {
					$('#tabs').tabs('close',t);
				}
			});
		}
		if(nextall.length>0) {
			nextall.each(function(i,n){
				var t=$('a:eq(0) span',$(n)).text();
				if(t != 'Home') {
					$('#tabs').tabs('close',t);
				}
			});
		}
		return false;
	});
	//关闭当前右侧的TAB
	$('#mm-tabcloseright').click(function(){
		var nextall = $('.tabs-selected').nextAll();
		if(nextall.length==0){
			//msgShow('系统提示','后边没有啦~~','error');
			alert('后边没有啦~~');
			return false;
		}
		nextall.each(function(i,n){
			var t=$('a:eq(0) span',$(n)).text();
			$('#tabs').tabs('close',t);
		});
		return false;
	});
	//关闭当前左侧的TAB
	$('#mm-tabcloseleft').click(function(){
		var prevall = $('.tabs-selected').prevAll();
		if(prevall.length==0){
			alert('到头了，前边没有啦~~');
			return false;
		}
		prevall.each(function(i,n){
			var t=$('a:eq(0) span',$(n)).text();
			$('#tabs').tabs('close',t);
		});
		return false;
	});

	//退出
	$("#mm-exit").click(function(){
		$('#mm').menu('hide');
	})
}

$(function() {
	tabCloseEven();

	$('.cs-navi-tab').click(function() {
		var $this = $(this);
		var href = $this.attr('src');
		var title = $this.text();
		addTab(title, href);
	});

	var themes = {
		'gray' : 'themes/gray/easyui.css',
		'black' : 'themes/black/easyui.css',
		'bootstrap' : 'themes/bootstrap/easyui.css',
		'default' : 'themes/default/easyui.css',
		'metro' : 'themes/metro/easyui.css'
	};

	var skins = $('.li-skinitem span').click(function() {
		var $this = $(this);
		if($this.hasClass('cs-skin-on')) return;
		skins.removeClass('cs-skin-on');
		$this.addClass('cs-skin-on');
		var skin = $this.attr('rel');
		$('#swicth-style').attr('href', themes[skin]);
		setCookie('cs-skin', skin);
		skin == 'dark-hive' ? $('.cs-north-logo').css('color', '#FFFFFF') : $('.cs-north-logo').css('color', '#000000');
	});

	if(getCookie('cs-skin')) {
		var skin = getCookie('cs-skin');
		$('#swicth-style').attr('href', themes[skin]);
		$this = $('.li-skinitem span[rel='+skin+']');
		$this.addClass('cs-skin-on');
		skin == 'dark-hive' ? $('.cs-north-logo').css('color', '#FFFFFF') : $('.cs-north-logo').css('color', '#000000');
	}
});


function setCookie(name,value) {//两个参数，一个是cookie的名子，一个是值
    var Days = 30; //此 cookie 将被保存 30 天
    var exp = new Date();    //new Date("December 31, 9998");
    exp.setTime(exp.getTime() + Days*24*60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}

function getCookie(name) {//取cookies函数        
    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
     if(arr != null) return unescape(arr[2]); return null;
}
</script>
<style type="css/text">

</style>
</head>
<body class="easyui-layout">
	<div region="north" border="true" class="cs-north">
		<div class="cs-north-bg">
		<div class="cs-north-logo">
		<% String name =(String) session.getAttribute(session.getId()); %>
		<% if(name !=null){ %>
		welcome ! 
		<%=name %>
		<% } else{ %>
		jQuery EasyUI 1.3.4 API
		<%} %>
		</div>
		<ul class="ui-skin-nav">				
			<li class="li-skinitem" title="gray"><span class="gray" rel="gray"></span></li>
			<li class="li-skinitem" title="default"><span class="default" rel="default"></span></li>
			<li class="li-skinitem" title="bootstrap"><span class="bootstrap" rel="bootstrap"></span></li>
			<li class="li-skinitem" title="black"><span class="black" rel="black"></span></li>
			<li class="li-skinitem" title="metro"><span class="metro" rel="metro"></span></li>
		</ul>
		</div>
	</div>
	<div region="west" border="true" split="true" title="Navigation" class="cs-west">
		<div class="easyui-accordion" fit="true" border="false">
				<div title="Base" selected="true">
					<a href="javascript:void(0);" src="/SpringMVC/user/toAllUser" class="cs-navi-tab">userManager</a></p>
					<a href="javascript:void(0);" src="/SpringMVC/demo/tologin" class="cs-navi-tab">login</a></p>
					<a href="javascript:void(0);" src="/SpringMVC/demo/transf" class="cs-navi-tab">back2front</a></p>
					<a href="javascript:void(0);" src="/SpringMVC/demo/users/888/topics/666" class="cs-navi-tab">@PathVariable</a></p>
					<a href="javascript:void(0);" src="/SpringMVC/demo/p7" class="cs-navi-tab">匹配多方法</a></p>
					<a href="javascript:void(0);" src="/SpringMVC/demo/toSuccess" class="cs-navi-tab">uploadFile</a></p>
					<a href="javascript:void(0);" src="/SpringMVC/demo3/ex1" class="cs-navi-tab">ex1</a></p>
					<a href="javascript:void(0);" src="/SpringMVC/demo3/ex2" class="cs-navi-tab">ex2</a></p>
					<a href="javascript:void(0);" src="/SpringMVC/demo1" class="cs-navi-tab">Controller-demo1</a></p>
					<a href="javascript:void(0);" src="/SpringMVC/demo2?a=add" class="cs-navi-tab">MultiActionController-demo2-add</a></p>
					<a href="javascript:void(0);" src="/SpringMVC/demo2?a=update" class="cs-navi-tab">MultiActionController-demo2-update</a></p>
					<a href="javascript:void(0);" src="api/pagination.html" class="cs-navi-tab">pagination</a></p>
					<a href="javascript:void(0);" src="api/searchbox.html" class="cs-navi-tab">searchbox</a></p>
					<a href="javascript:void(0);" src="api/progressbar.html" class="cs-navi-tab">progressbar</a></p>
					<a href="javascript:void(0);" src="api/tooltip.html" class="cs-navi-tab">tooltip</a></p>
				</div>
				<div title="Layout">
					<a href="javascript:void(0);" src="api/panel.html" class="cs-navi-tab">panel</a></p>
					<a href="javascript:void(0);" src="api/tabs.html" class="cs-navi-tab">tabs</a></p>
					<a href="javascript:void(0);" src="api/accordion.html" class="cs-navi-tab">accordion</a></p>
					<a href="javascript:void(0);" src="api/layout.html" class="cs-navi-tab">layout</a></p>
				</div>
				<div title="Menu and Button">
					<a href="javascript:void(0);" src="api/menu.html" class="cs-navi-tab">menu</a></p>
					<a href="javascript:void(0);" src="api/menubutton.html" class="cs-navi-tab">menubutton</a></p>
					<a href="javascript:void(0);" src="api/linkbutton.html" class="cs-navi-tab">linkbutton</a></p>
					<a href="javascript:void(0);" src="api/splitbutton.html" class="cs-navi-tab">splitbutton</a></p>
				</div>
				<div title="Form">
					<a href="javascript:void(0);" src="api/form.html" class="cs-navi-tab">form</a></p>
					<a href="javascript:void(0);" src="api/validatebox.html" class="cs-navi-tab">validatebox</a></p>
					<a href="javascript:void(0);" src="api/combo.html" class="cs-navi-tab">combo</a></p>
					<a href="javascript:void(0);" src="api/combobox.html" class="cs-navi-tab">combobox</a></p>
					<a href="javascript:void(0);" src="api/combotree.html" class="cs-navi-tab">combotree</a></p>
					<a href="javascript:void(0);" src="api/combogrid.html" class="cs-navi-tab">combogrid</a></p>
					<a href="javascript:void(0);" src="api/numberbox.html" class="cs-navi-tab">numberbox</a></p>
					<a href="javascript:void(0);" src="api/datebox.html" class="cs-navi-tab">datebox</a></p>
					<a href="javascript:void(0);" src="api/datetimebox.html" class="cs-navi-tab">datetimebox</a></p>
					<a href="javascript:void(0);" src="api/calendar.html" class="cs-navi-tab">calendar</a></p>
					<a href="javascript:void(0);" src="api/spinner.html" class="cs-navi-tab">spinner</a></p>
					<a href="javascript:void(0);" src="api/timespinner.html" class="cs-navi-tab">timespinner</a></p>
					<a href="javascript:void(0);" src="api/numberspinner.html" class="cs-navi-tab">numberspinner</a></p>
					<a href="javascript:void(0);" src="api/slider.html" class="cs-navi-tab">slider</a></p>
				</div>
				<div title="Window">
					<a href="javascript:void(0);" src="api/window.html" class="cs-navi-tab">window</a></p>
					<a href="javascript:void(0);" src="api/dialog.html" class="cs-navi-tab">dialog</a></p>
					<a href="javascript:void(0);" src="api/messager.html" class="cs-navi-tab">messager</a></p>
				</div>
				<div title="DataGrid and Tree">
					<a href="javascript:void(0);" src="api/datagrid.html" class="cs-navi-tab">datagrid</a></p>
					<a href="javascript:void(0);" src="api/propertygrid.html" class="cs-navi-tab">propertygrid</a></p>
					<a href="javascript:void(0);" src="api/tree.html" class="cs-navi-tab">tree</a></p>
					<a href="javascript:void(0);" src="api/treegrid.html" class="cs-navi-tab">treegrid</a></p>
				</div>
		</div>
	</div>
	<div id="mainPanle" region="center" border="true" border="false">
		 <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
                <div title="Home">
				<div class="cs-home-remark">
					<h1>jQuery EasyUI 1.3.4 API</h1> <br>
					制作：purediy <br>
					博客：<a href="http://www.cnblogs.com/purediy" target="_blank">http://www.cnblogs.com/purediy</a><br>
					说明：jQuery EasyUI 1.3.4 API离线文档，与官网API文档完全一致。
				</div>
				</div>
        </div>
	</div>

	<div region="south" border="false" id="south"><center>@tianshaojie@foxmail.com</center></div>
	
	<div id="mm" class="easyui-menu cs-tab-menu">
		<div id="mm-tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseother">关闭其他</div>
		<div id="mm-tabcloseall">关闭全部</div>
	</div>
</body>
</html>