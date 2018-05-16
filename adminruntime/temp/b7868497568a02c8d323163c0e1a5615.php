<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:56:"F:\web\s6\public/../admin/index\view\category\index.html";i:1526352480;s:53:"F:\web\s6\public/../admin/index\view\common\base.html";i:1526352480;}*/ ?>
<!DOCTYPE HTML>
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
<link href="/h/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="/h/static/h-ui.admin/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="/h/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />

<!--[if IE 6]>
<script type="text/javascript" src="/h/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>空白页</title>


</head>

<body>
<div class="pd-20">

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 行业管理 <span class="c-gray en">&gt;</span> 行业列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a class="btn btn-primary radius" onClick="article_edit('创建行业','/ht.php/category/edit')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> &nbsp;创建行业</a></span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			<thead>
				<tr class="text-c">
					<th width="80">ID</th>
					<th>栏目名称</th>
					<th>简拼</th>
					<th>功能</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
            	<?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
				<tr class="text-c">
					<td><?php echo $vo['id']; ?></td>
					<td class="text-l"><?php echo $vo['name']; ?></td>
					<td><?php echo $vo['ename']; ?></td>
					<td class="text-l">
                    	<a class="ml-5" onClick="article_edit('创建二级行业','/ht.php/category/edit?pid=<?php echo $vo['id']; ?>')" href="javascript:;" title="创建二级行业">创建二级行业</a>&nbsp;
                        <a sclass="ml-5" onClick="article_edit('图片管理','/ht.php/category/imageslist?catid=<?php echo $vo['id']; ?>')" href="javascript:;" title="图片管理">图片管理</a>&nbsp;
                    </td>
					<td class="f-14 td-manage">
                    	<a style="text-decoration:none" class="ml-5" onClick="article_edit('编辑','/ht.php/category/edit?id=<?php echo $vo['id']; ?>')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> 
                        <a style="text-decoration:none" class="ml-5" onClick="article_del(this,<?php echo $vo['id']; ?>)" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
                    </td>
				</tr>
                <?php if(is_array($vo['child']) || $vo['child'] instanceof \think\Collection || $vo['child'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$voo): $mod = ($i % 2 );++$i;?>
				<tr class="text-c">
					<td><?php echo $voo['id']; ?></td>
					<td class="text-l">|---<?php echo $voo['name']; ?></td>
					<td><?php echo $voo['ename']; ?></td>
					<td class="text-l"><a style="text-decoration:none" class="ml-5" onClick="article_edit('图片管理','/ht.php/category/imageslist?catid=<?php echo $voo['id']; ?>')" href="javascript:;" title="图片管理">图片管理</a></td>
					<td class="f-14 td-manage"><a class="ml-5" onClick="article_edit('编辑','/ht.php/category/edit?id=<?php echo $voo['id']; ?>')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="article_del(this,<?php echo $voo['id']; ?>)" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
				</tr>
                <?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>
				
			</tbody>
		</table>
	</div>
</div>

</div>
<script type="text/javascript" src="/h/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="/h/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/h/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="/h/static/h-ui.admin/js/H-ui.admin.js"></script>

<script>
function article_edit(title,url,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
function article_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '/ht.php/category/cdelete',
			data:{'id':id},
			dataType: 'json',
			success: function(data){
				layer.msg('已删除!',{icon:1,time:1000});
				window.location.reload();
			},
			error:function(data) {
				layer.msg('操作失败!',{icon:2,time:1000});
			},
		});		
	});
}

</script>

</body>
</html>
