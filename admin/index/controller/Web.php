<?php
namespace app\index\controller;
use think\Controller;
class Web extends Common
{
    public function index()
    {
    	$rinfo=db('webtable')->order('id desc')->find();
    	$this->assign('rinfo',$rinfo);
        return $this->fetch('index');
    }

    public function save(){
    	$id=$_POST['id'];
    	$data['webname']=input('post.webname');
        $data['title']=input('post.title');
    	$data['keywords']=input('post.keywords');
    	$data['description']=input('post.description');
    	$data['copyright']=input('post.copyright');
    	$data['tjcode']=input('post.tjcode');
        if ($id){
            $r=db('webtable')->where('id='.$id)->update($data);
        }else{
            $r=db('webtable')->insert($data);
        }
    	
    	if ($r){
    		echo 1;
    	}
    }
}
