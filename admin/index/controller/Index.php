<?php
namespace app\index\controller;
use think\Controller;
class Index extends Controller
{
    public function index()
    {
        return view('login/login');
    }

    public function login(){
    	$msg=['status'=>0,'data'=>'登陆失败'];
    	$u=input('post.username');
    	$p=input('post.password');
    	if (!$u){
    		$msg['data']='用户名不能为空';
    	}
    	if (!$p){
    		$msg['data']='密码不能为空';
    	}
    	if ($u && $p){
    		$r=db('admin')->where("username='".$u."'")->find();
    		if (!$r){
    			$msg['data']='用户名密码错误';
    		}else{
    			if (md5(md5($p))!==$r['password']){
    				$msg['data']='密码错误';
    			}else{
    				session('userinfo',$r);
    				$msg['status']=1;
    				$msg['data']=['msg'=>'登陆成功','url'=>'/ht.php/main/'];
    			}
    		}
    	}
    	return $msg;
    }

    public function logout(){
    	session('userinfo','');
    	go('退出成功','/ht.php',2);
    }
}
