<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:54:"F:\web\s6\public/../admin/index\view\content\edit.html";i:1526352480;s:53:"F:\web\s6\public/../admin/index\view\common\base.html";i:1526352480;}*/ ?>
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
		<input type="hidden" name="modelid" id="modelid" value="1">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>所属栏目：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
				<select name="catid" class="select">
					<option value="0">请选择..</option>
					<?php if(is_array($category_list) || $category_list instanceof \think\Collection || $category_list instanceof \think\Paginator): $i = 0; $__LIST__ = $category_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
					<option value="<?php echo $vo['id']; ?>" <?php if($rinfo['catid'] == $vo['id']): ?>selected<?php endif; ?>><?php echo $vo['title']; ?></option>
						<?php if(is_array($vo['child']) || $vo['child'] instanceof \think\Collection || $vo['child'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$voo): $mod = ($i % 2 );++$i;?>
						<option value="<?php echo $voo['id']; ?>" <?php if($rinfo['catid'] == $voo['id']): ?>selected<?php endif; ?>><br>
&nbsp;&nbsp;&nbsp;&nbsp;|-<?php echo $voo['title']; ?></option>
						<?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>
				</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="<?php echo $rinfo['title']; ?>" placeholder="" id="title" name="title">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>关键词：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="<?php echo $rinfo['keywords']; ?>" placeholder="" id="keywords" name="keywords">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>描述：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="<?php echo $rinfo['description']; ?>" placeholder="" id="description" name="description">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>导读：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea class="textarea" id="shortnote" name="shortnote"><?php echo $rinfo['shortnote']; ?></textarea>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>缩略图：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<div class="form-group">
					<input type="file" id="picfile" name="picfile" />
					<button class="btn btn-xs btn-success" id="uploadbtn" type="button">上传</button>
					<span id="picdiv"><?php if($rinfo['picurl'] != ''): ?><img src="<?php echo $rinfo['picurl']; ?>" width="200" height="80" /><?php endif; ?></span>
					<input type="hidden" name="picurl" id="images" value="<?php echo $rinfo['picurl']; ?>" />
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>内容：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea id="note" name="note" style="height:300px;width:100%"><?php echo $rinfo['note']; ?></textarea>
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

<script src="/h/lib/ajaxfileupload.js"></script>
<script type="text/javascript" src="/h/lib/ueditor/1.4.3/ueditor.config.js"></script> 
<script type="text/javascript" src="/h/lib/ueditor/1.4.3/ueditor.all.min.js"> </script> 
<script type="text/javascript" src="/h/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script>
	var ue = UE.getEditor('note');
	$("#uploadbtn").click(function(){
		pic=$('#picfile').val();
		if (pic.length==0){
			alert('请选择图片');
		}else{
			$.ajaxFileUpload({
				url:'/ht.php/common/uploadpic',            //需要链接到服务器地址
				type:'POST',
				secureuri:false,
				fileElementId:'picfile',                        //文件选择框的id属性
				dataType: 'json',  
				data:{'name':'picfile'},                                   //服务器返回的格式，可以是json
				success: function (data){
					if (data.status==1){
						$('#picdiv').html('<img width="200" height="80" src="'+data.src+'" />');
						$('#images').val(data.src);
					}else{
						$('#picdiv').txt('上传失败');
					}
				}
			});
		}
	});
	var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	function suba(){
		var d = {};
		var t = $('#form').serializeArray();
		$.each(t, function() {
		  d[this.name] = this.value;
		});
		$.post('/ht.php/content/save',d,function(data){
			if (data==1){
				layer.msg('保存成功',{icon:6});
				window.parent.location.reload(); //刷新父页面
				parent.layer.close(index);  // 关闭layer
			}else{
				layer.msg('保存失败',{icon:5});
			}
		},'json');
	}
</script>

</body>
</html>
