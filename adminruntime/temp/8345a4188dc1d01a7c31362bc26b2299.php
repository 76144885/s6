<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:52:"F:\web\s6\public/../admin/index\view\main\index.html";i:1526352480;s:53:"F:\web\s6\public/../admin/index\view\main\header.html";i:1526352480;s:51:"F:\web\s6\public/../admin/index\view\main\menu.html";i:1526352480;}*/ ?>
﻿<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="/h/lib/html5shiv.js"></script>
<script type="text/javascript" src="/h/lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="/h/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/h/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="/h/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="/h/static/h-ui.admin/skin/green/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="/h/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="/h/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>后台管理系统</title>
</head>
<body>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"> 
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav class="nav navbar-nav">
				<ul class="cl">
					<li class="navbar-levelone current"><a href="javascript:;">系统</a></li>
					<li class="navbar-levelone"><a href="javascript:;">行业</a></li>
					<li class="navbar-levelone"><a href="javascript:;">关键词</a></li>
					<li class="navbar-levelone"><a href="javascript:;">文章</a></li>
                    <li class="navbar-levelone"><a href="javascript:;">项目</a></li>

				</li>
			</ul>
		</nav>
		<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li class="dropDown dropDown_hover">
					<a href="#" class="dropDown_A"><?php echo \think\Session::get('userinfo.realname'); ?> <i class="Hui-iconfont">&#xe6d5;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>
						<li><a onClick="changepwd()">修改密码</a></li>
						<li><a href="/ht.php/index/logout">退出</a></li>
				</ul>
			</li>
				<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
						<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
						<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
						<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
						<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
						<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
</div>
</header>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
		<ul id="menu-article">
			<li><a data-href="/ht.php/area/" data-title="地区管理" href="javascript:void(0)"><i class="Hui-iconfont">&#xe616;</i> 地区管理</a></li>
			
			<!--<dd>
				<ul>
					<li><a data-href="article-list.html" data-title="资讯管理" href="javascript:void(0)">资讯管理</a></li>
				</ul>
			</dd>-->
		</dl>
	</div>

	<div class="menu_dropdown bk_2" style="display:none">
		<dl id="menu-category">
			<dt><i class="Hui-iconfont">&#xe616;</i> 行业管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="/ht.php/category/edit/" data-title="创建行业" href="javascript:void(0)">创建行业</a></li>
					<li><a data-href="/ht.php/category/" data-title="行业列表" href="javascript:void(0)">行业列表</a></li>
				</ul>
			</dd>
		</dl>
	</div>
	<div class="menu_dropdown bk_2" style="display:none">
		<dl id="menu-keyword">
			<dt><i class="Hui-iconfont">&#xe616;</i> 关键词<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="/ht.php/content/edit/" data-title="创建关键词" href="javascript:void(0)">创建关键词</a></li>
					<li><a data-href="/ht.php/content/" data-title="关键词列表" href="javascript:void(0)">关键词列表</a></li>
				</ul>
			</dd>
		</dl>
	</div>
	<div class="menu_dropdown bk_2" style="display:none">
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe616;</i> 文章<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="/ht.php/system/baoming?type=0" data-title="创建文章" href="javascript:void(0)">创建文章</a></li>
					<li><a data-href="/ht.php/system/baoming?type=1" data-title="文章列表" href="javascript:void(0)">文章列表</a></li>
				</ul>
			</dd>
		</dl>
	</div>

	<div class="menu_dropdown bk_2" style="display:none">
		<dl id="menu-items">
			<dt><i class="Hui-iconfont">&#xe616;</i> 项目<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="/ht.php/system/zhengshu_edit/" data-title="创建项目" href="javascript:void(0)">创建项目</a></li>
					<li><a data-href="/ht.php/system/zhengshu/" data-title="项目列表" href="javascript:void(0)">项目列表</a></li>
				</ul>
			</dd>
		</dl>
	</div>

</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active">
					<span title="我的桌面" data-href="/ht.php/main/welcome">我的桌面</span>
					<em></em></li>
		</ul>
	</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="welcome.html"></iframe>
	</div>
</div>
</section>

<div class="contextMenu" id="Huiadminmenu">
	<ul>
		<li id="closethis">关闭当前 </li>
		<li id="closeall">关闭全部 </li>
</ul>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="/h/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="/h/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/h/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/h/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="/h/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
$(function(){
	/*$("#min_title_list li").contextMenu('Huiadminmenu', {
		bindings: {
			'closethis': function(t) {
				console.log(t);
				if(t.find("i")){
					t.find("i").trigger("click");
				}		
			},
			'closeall': function(t) {
				alert('Trigger was '+t.id+'\nAction was Email');
			},
		}
	});*/


	$("body").Huitab({
		tabBar:".navbar-wrapper .navbar-levelone",
		tabCon:".Hui-aside .menu_dropdown",
		className:"current",
		index:0,
	});
});
/*个人信息*/
function myselfinfo(){
	layer.open({
		type: 1,
		area: ['300px','200px'],
		fix: false, //不固定
		maxmin: true,
		shade:0.4,
		title: '查看信息',
		content: '<div>管理员信息</div>'
	});
}


</script> 

</body>
</html>