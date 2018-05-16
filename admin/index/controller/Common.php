<?php
namespace app\index\controller;
use think\Controller;
use think\validate;
class Common extends Controller
{
    public function _initialize()
    {
        if (!session('?userinfo')){
        	go('请重新登陆','/ht.php',2);
        }
    }

    public function uploadpic(){
    	$msg=['status'=>0,'src'=>''];
    	$file = request()->file($_POST['name']);
    	//var_dump($file);exit;
    	// 移动到框架应用根目录/public/uploads/ 目录下
    	$info = $file->validate(['size'=>2000000,'ext'=>'jpg,png,gif'])->move('./uploadfile/');
    	//print_r($info);exit;
    	if($info){
    		// 输出 jpg
    		$msg=['status'=>1,'src'=>'/uploadfile/'.$info->getSaveName()];
    	}
    	echo json_encode($msg);
    }

    public function getarea(){
        $area=area_arr();
        $list['message']="";
        $list['code']=200;
        $list['redirect']='';
        foreach ($area as $k => $v) {
            $list['value'][$k-1]=['id'=>$k,'v'=>$v];
        }
        echo json_encode($list);
    }
}
