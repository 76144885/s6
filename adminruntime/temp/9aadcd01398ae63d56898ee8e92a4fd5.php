<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:53:"F:\web\s6\public/../admin/index\view\login\login.html";i:1526352480;}*/ ?>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="/h/lib/html5shiv.js"></script>
<script type="text/javascript" src="/h/lib/respond.min.js"></script>
<![endif]-->
<link href="/h/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="/h/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="/h/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="/h/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="/h/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>后台登录</title>
</head>
<body>
<div class="header"></div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
	<form class="form form-horizontal" method="post">
	  <div class="row cl">
		<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
		<div class="formControls col-xs-8">
		  <input id="name" name="" type="text" placeholder="账户" class="input-text size-L">
		</div>
	  </div>
	  <div class="row cl">
		<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
		<div class="formControls col-xs-8">
		  <input id="password" name="" type="password" placeholder="密码" class="input-text size-L">
		</div>
	  </div>
	  <div class="row cl">
		<div class="formControls col-xs-8 col-xs-offset-3">
		  <input id="btn" type="button" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
		  <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
		</div>
	  </div>
	</form>
  </div>
</div>
<script type="text/javascript" src="/h/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="/h/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript">
	$('#btn').click(function(){
		name=$('#name').val();
		password=$('#password').val();
		if (name==''){
			alert('用户名不能为空');
		}
		if(password==''){
			alert('密码不能为空');
		}
		if(name && password){
			$.post('/ht.php/index/login',{'username':name,'password':password},function(data){
				if (data.status==0){
					alert(data.data);
				}else{
					window.location.href=data.data.url;
				}
			},'json');
		}
	});
</script>
</body>
</html>