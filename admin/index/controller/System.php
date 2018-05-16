<?php
namespace app\index\controller;
use think\Controller;
class System extends Common
{
    public function baoming()
    {
    	$type=isset($_GET['type'])?$_GET['type']:0;
        $p=isset($_GET['p'])?intval($_GET['p']):1;
        $pagesize=20;
        $where=' 1 ';
        $tel=trim($_GET['tel']);
        if ($title){
            $where.=" and tel like '".$tel."'";
        }
        $time=strtotime($_GET['ctime']);
        if ($time){
            $where.=" and ctime between '".$time."' and '".($time+86400)."'";
        }
        $list=db('message')->where($where)->limit(($p-1)*$pagesize,$pagesize)->order('id desc')->select();
        $count=db('message')->where($where)->count();
        $page=dvpage($p, $count, $pagesize, '/ht.php/system/baoming?tel='.$tel.'&time='.date('Y-m-d',$time));
        $this->assign('list',$list);
        $this->assign('page',$page['code']);
        return $this->fetch('baoming');
    }

    public function baomingeditsave(){
        $id=@$_GET['id'];
        if ($id){
            $this->assign('id',$id);
            $r=db('message')->where('id='.$id)->find();
            $this->assign('r',$r);
        }
        return $this->fetch('messageedit');
    }
    public function baomingsave(){
        $id=$_POST['id'];
        $data['name']=$_POST['name'];
        $data['tel']=$_POST['tel'];
        $data['idcard']=$_POST['idcard'];
        $data['type']=$_POST['type'];
        if ($id) die('请重新打开页面');
        $r=db('baoming')->where('id='.$id)->update($data);
        if ($r){
            echo 1;
        }
    }

    public function zhengshu(){
        $p=isset($_GET['p'])?intval($_GET['p']):1;
        $pagesize=20;
        $where=' 1 ';
        $name=trim($_GET['name']);
        if ($name){
            $where.=" and name like '%".$name."%'";
        }
        $idcard=trim($_GET['idcard']);
        if ($code){
            $where.=" and idcard like '%".$idcard."%'";
        }
        $list=db('certificate')->where($where)->limit(($p-1)*$pagesize,$pagesize)->order('id desc')->select();
        $count=db('certificate')->where($where)->count();
        $page=dvpage($p, $count, $pagesize, '/ht.php/system/zhengshu?idcard='.$code.'&idcard='.$name.'&');
        $this->assign('list',$list);
        $this->assign('page',$page['code']);
        return $this->fetch('zhengshu');
    }

    public function zhengshu_edit(){
        $id=$_GET['id'];
        if ($id){
            $this->assign('id',$id);
            $rinfo=db('certificate')->where('id='.$id)->find();
            $this->assign('rinfo',$rinfo);
        }
        return $this->fetch('zhengshuedit');
    }

    public function zhengshuedit(){
        $id=$_POST['id'];
        $data['name']=$_POST['name'];
        $data['type']=$_POST['type'];
        $data['idcard']=$_POST['idcard'];
        $data['zscode']=$_POST['zscode'];
        if ($id){
            $r=db('certificate')->where('id='.$id)->update($data);
        }else{
            $r=db('certificate')->insert($data);
        }
        if ($r) echo 1;
    }

    public function zdelete(){
        $id=$_POST['id'];
        if ($id){
            $r=db('certificate')->where('id='.$id)->delete();
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
