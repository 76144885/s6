<?php
namespace app\index\controller;
use think\Controller;
class Category extends Common
{
    public function index()
    {
    	$list=db('category')->order('id asc')->select();
        $category_list=tree($list);
    	$this->assign('list',$category_list);
        return $this->fetch('index');
    }

    public function edit(){
        $id=@$_GET['id'];
        $fid=$_GET['fid'];
        $list=db('category')->order('id asc')->select();
        $category_list=tree($list);
        $this->assign('category_list',$category_list);
        $this->assign('id',$id);
        if ($id){
            $rinfo=db('category')->where('id='.$id)->find();
        }else{
            $rinfo['fid']=$fid;
        }
        $this->assign('rinfo',$rinfo);
        return $this->fetch('edit');
    }

    public function save(){
    	$id=input('post.id');
    	$data['name']=input('post.name');
        $data['ename']=input('post.ename');
        $data['fid']=input('post.fid');
    	$data['keyword']=input('post.keyword');
    	$data['description']=input('post.description');
    	$data['tags']=input('post.tags');
        $data['images']=input('post.images');
        if ($id){
            $r=db('category')->where('id='.$id)->update($data);
        }else{
            $r=db('category')->insert($data);
        }
    	
    	if ($r){
    		echo 1;
    	}
    }

    public function imageslist(){
        $catid=input('get.catid');
        $this->assign('catid',$catid);
        $data=db('category_images')->where('catid='.$catid)->order('id asc')->select();
        $this->assign('data',$data);
        return $this->fetch('imageslist');
    }

    public function imagesedit(){
        $id=input('get.id');
        $catid=input('get.catid');
        if($id){
            $info=db('category_images')->where('id='.$id)->find();
        }else{
            $info['catid']=$catid;
        }
        $this->assign('info',$info);
        return $this->fetch('imagesedit');
    }

    public function images_edit(){
        $id=input('post.id');
        $data['picurl']=input('post.picurl');
        $data['catid']=input('post.catid');
        if ($id){
            $res=db('category_images')->where('id='.$id)->update($data);
        }else{
            $res=db('category_images')->insert($data);
        }
        if($res) echo 1;
    }

    public function cdelete(){
        $id=$_POST['id'];
        if ($id){
            $r=db('category')->where('id in('.$id.')')->delete();
            if ($r){
                echo 1;
            }else{
                echo 0;
            }
        }else{
            echo 0;
        }

    }
}
