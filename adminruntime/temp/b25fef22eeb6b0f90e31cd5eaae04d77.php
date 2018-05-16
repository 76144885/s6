<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:51:"F:\web\s6\public/../admin/index\view\area\edit.html";i:1526369304;s:53:"F:\web\s6\public/../admin/index\view\common\base.html";i:1526352480;}*/ ?>
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

<article class="page-container">
	<form class="form form-horizontal" id="form">
		<input type="hidden" name="id" id="id" value="<?php echo $rinfo['id']; ?>">
        <div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>所属地区：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
				<select name="rid" class="select">
					<option value="0">请选择..</option>
					<?php if(is_array($region) || $region instanceof \think\Collection || $region instanceof \think\Paginator): $i = 0; $__LIST__ = $region;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
					<option value="<?php echo $key; ?>" <?php if($rinfo['rid'] == $key): ?>selected<?php endif; ?>><?php echo $vo; ?></option>
					<?php endforeach; endif; else: echo "" ;endif; ?>
				</select>
				</span>
			</div>
        </div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>所属省：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
				<select name="fid" class="select">
					<option value="0">请选择..</option>
					<?php if(is_array($area_list) || $area_list instanceof \think\Collection || $area_list instanceof \think\Paginator): $i = 0; $__LIST__ = $area_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
					<option value="<?php echo $vo['id']; ?>" <?php if($rinfo['fid'] == $vo['id']): ?>selected<?php endif; ?>><?php echo $vo['name']; ?></option>
						<?php if(is_array($vo['child']) || $vo['child'] instanceof \think\Collection || $vo['child'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$voo): $mod = ($i % 2 );++$i;?>
						<option value="<?php echo $voo['id']; ?>" <?php if($rinfo['fid'] == $voo['id']): ?>selected<?php endif; ?>><br>
&nbsp;&nbsp;&nbsp;&nbsp;|-<?php echo $voo['name']; ?></option>
						<?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>
				</select>
				</span>
			</div>
		</div>
        <div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="<?php echo $rinfo['name']; ?>" placeholder="" id="name" name="name">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>拼音：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="<?php echo $rinfo['ename']; ?>" placeholder="" id="ename" name="ename">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>首字母：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="<?php echo $rinfo['word']; ?>" placeholder="" id="word" name="word">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="suba();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存</button>
			</div>
		</div>
	</form>
</article>

</div>
<script type="text/javascript" src="/h/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="/h/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/h/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="/h/static/h-ui.admin/js/H-ui.admin.js"></script>

<!--<script type="text/javascript" src="/h/lib/ueditor/1.4.3/ueditor.config.js"></script> 
<script type="text/javascript" src="/h/lib/ueditor/1.4.3/ueditor.all.min.js"> </script> 
<script type="text/javascript" src="/h/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>-->
<script>
	//var ue = UE.getEditor('editor');
	function suba(){
		var d = {};
		var t = $('#form').serializeArray();
		$.each(t, function() {
		  d[this.name] = this.value;
		});
		$.post('/ht.php/area/save',d,function(data){
			if (data==1){
				layer.msg('保存成功',{icon:6});
			}else{
				layer.msg('保存失败',{icon:5});
			}
		},'json');
	}
</script>

</body>
</html>
