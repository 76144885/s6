<?php
namespace app\index\controller;
use think\Controller;
class Common extends Controller
{

    public function _initialize()
    {
    	$web=db('webtable')->where('id=1')->find();
    	$this->assign('web',$web);
    	$category=db('category')->where('status=1')->order('id asc')->select();
    	$this->assign('category',$category);
    }

    public function messagesave(){
    	$data['name']= htmlspecialchars(trim($_POST['name']));
    	$data['tel']= htmlspecialchars(trim($_POST['tel']));
    	$data1['sex']= htmlspecialchars(trim($_POST['sex']));
    	$data1['age']= htmlspecialchars(trim($_POST['age']));
    	$data1['height']= trim($_POST['height']);
    	$data1['weight']= trim($_POST['weight']);

    	$data['note']= htmlspecialchars(trim($_POST['note']));
        if (!$data['note']){
            $data['note']=json_encode($data1);
        }
    	$data['ctime']= time();
    	$r=db('message')->where("tel like '%".$data['tel']."%' and ctime>'".strtotime(date('Y-m-d'))."'")->order('ctime desc')->find();
    	if ($r){
    		echo 0;
    	}else{
    		$r=db('message')->insert($data);
    		if ($r){
    			echo 1;
    		}
    	}
    }

    public function certificatesearch(){
        $msg=['status'=>0,'msg'=>'查询失败'];
        $name=htmlspecialchars(trim($_POST['name']));
        $idcard= htmlspecialchars(trim($_POST['idcard']));
        $zscode= htmlspecialchars(trim($_POST['zscode']));
        $captcha = input('verify');
        if(!captcha_check($captcha)){
            $msg['msg']='验证码错误';
        }else{
            $r=db('certificate')->where("name='".$name."' and idcard='".$idcard."' and zscode='".$zscode."'")->find();
            if (!$r){
                $msg['msg']='未找到该用户证书';
            }else{
                $msg=['status'=>1,'msg'=>$r];
            }
        }
    }

    public function baomingsearch(){
        $msg=['status'=>0,'msg'=>'查询失败'];
        $name=htmlspecialchars(trim($_POST['name']));
        $idcard= htmlspecialchars(trim($_POST['idcard']));
        $tel= htmlspecialchars(trim($_POST['tel']));
        $captcha = input('verify');
        if(!captcha_check($captcha)){
            $msg['msg']='验证码错误';
        }else{
            $r=db('message')->where("name='".$name."' and idcard='".$idcard."' and tel='".$tel."'")->find();
            if (!$r){
                $msg['msg']='未找到该用户报名信息';
            }else{
                $msg=['status'=>1,'msg'=>$r];
            }
        }
    }
}
