<?php
namespace app\index\controller;
use think\Controller;
class Project extends Common
{
    public function index($p=1)
    {
        $pagesize=100;
        $where=' 1 ';
        $list=db('project')->where($where)->order('sort desc')->limit(($p-1)*$pagesize,$pagesize)->select();
        $count=db('project')->where($where)->count();
        $page=gscpage($p, $count, $pagesize, '/project/');
        $this->assign('list',$list);
        $this->assign('page',$page['code']);
		$this->assign('p',$p);
        return $this->fetch('prolist');
    }

    public function show($etitle){
        $r=db('project')->where("etitle='".$etitle."'")->find();
        $this->assign('r',$r);
        if ($r){
            if (file_exists("./html/".$etitle."/index.html")){
                $url=file_get_contents("./html/".$etitle."/index.html");
            }
            //echo $url;
            $this->assign('url',$url);
        }else{
            send_http_status(404);
        }
        $newslist=db('news')->where('type=1 and pid='.$r['id'])->order('ctime desc')->limit(11)->select();
        $this->assign('newslist',$newslist);
        return $this->fetch('xiangmu');
    }

    public function show2($etitle,$type){
        $r=db('project')->where("etitle='".$etitle."'")->find();
        $this->assign('r',$r);
        if (!$r){
            send_http_status(404);
        }
        $template='xmjs';
        switch ($type) {
             case 'xmjs':
                $typet=1;
                $t='项目介绍';
                $title=$r['title'].'加盟介绍_'.$r['title'].'品牌介绍';
                break;
            case 'jmtj':
                $typet=2;
                $t='加盟条件';
                $title=$r['title'].'加盟条件_'.$r['title'].'加盟费多少';
                break;
            case 'jmzc':
                $typet=3;
                $t='加盟政策';
                $title=$r['title'].'加盟政策_'.$r['title'].'如何加盟';
                break;
            case 'gsjs':
                $typet=4;
                $t='公司介绍';
                $title=$r['title'].'企业简介_'.$r['title'].'公司介绍';
                break;
        }
        $rd=db('project_data')->where('pid='.$r['id'].' and type='.$typet)->find();
        $this->assign('rd',$rd);
		$this->assign('title',$title);
        $this->assign('t',$t);
        //加盟指南
        $newslist=db('news')->where('type=1')->order('ctime desc')->limit(10)->select();
        $this->assign('newslist',$newslist);


        $prolist=db('project')->order('id desc')->limit(10)->select();
        $this->assign('prolist',$prolist);

        return $this->fetch($template);
    }

    public function newslist($etitle,$p=1){
        $r=db('project')->where("etitle='".$etitle."'")->find();
        $this->assign('r',$r);
        $pagesize=15;
        $where=' 1 and pid='.$r['id'];
        $list=db('news')->order('ctime desc')->where($where)->limit(($p-1)*$pagesize,$pagesize)->select();
        $count=db('news')->where($where)->count();
        if ($p==1){
            $url='list/';
        }else{
            $url='list/';
        }
        $page=gscpage($p, $count, $pagesize, '/project/'.$etitle.'/'.$url);
        $this->assign('list',$list);
        $this->assign('page',$page['code']);

        //加盟指南
        $newslist=db('news')->where('type=1')->order('ctime desc')->limit(10)->select();
        $this->assign('newslist',$newslist);


        $prolist=db('project')->order('id desc')->limit(10)->select();
        $this->assign('prolist',$prolist);
        return $this->fetch('ppzx');
    }
}
