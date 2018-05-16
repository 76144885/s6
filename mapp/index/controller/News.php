<?php
namespace app\index\controller;
use think\Controller;
class News extends Common
{
    public function index($p=1,$type)
    {
        $p=isset($p)?intval($p):1;
        $type=isset($type)?intval($type):'';
        if ($type==1){
            $t=2;
            $url='news';
            $title='新闻中心';
            $ntitle='母婴加盟创业资讯-新闻中心';
            $nkeywords='创业资讯，母婴加盟资讯';
            $ndesc='母婴加盟创业资讯，让创业者更早知道创业情况和母婴店加盟资讯，时刻关注母婴店加盟动态，把握住机会。';
        }
        if ($type==2){
            $t=1;
            $url='zhinan';
            $title="创业指南";
            $ntitle='专为母婴创业者提供创业指南-创业指南';
            $nkeywords='创业指南，母婴创业指南';
            $ndesc='创业指南解决创业中出现的一切问题，想创业但没有创业经验、母婴店加盟后如何经营、母婴加盟店活动指南等，这些问题已帮创业者解决。';
        }
        if (!$type) exit('参数错误');
        $pagesize=25;
        $where=' 1 and type='.$type;
        $list=db('news')->order('ctime desc')->where($where)->limit(($p-1)*$pagesize,$pagesize)->select();
        $count=db('news')->where($where)->count();
        $page=gscpage($p, $count, $pagesize, '/'.$url.'/');
        $this->assign('list',$list);
        $this->assign('page',$page['code']);
    	//加盟指南
    	$newslist1=db('news')->where('type='.$t)->order('ctime desc')->limit(10)->select();
    	$this->assign('newslist1',$newslist1);

    	$prolist=db('project')->order('id desc')->limit(10)->select();
    	$this->assign('prolist',$prolist);
        $this->assign('title',$title);
		$this->assign('ntitle',$ntitle);
		$this->assign('nkeywords',$nkeywords);
		$this->assign('ndesc',$ndesc);
        $this->assign('p',$p);
        return $this->fetch('newslist');
    }

    public function show($id){
        if (!$id) exit('参数错误');
        $r=db('news')->where('id='.$id)->find();
        $this->assign('r',$r);
        if (!$r){
            send_http_status(404);
        }
        $rd=db('news')->where('id>'.$id)->order('ctime asc')->limit(1)->find();
        $ru=db('news')->where('id<'.$id)->order('ctime desc')->limit(1)->find();
        $this->assign('rd',$rd);
        $this->assign('ru',$ru);

        $newslist=db('news')->where('type=1')->order('ctime desc')->limit(10)->select();
        $this->assign('newslist',$newslist);

        $newslist1=db('news')->where('type=2')->order('ctime desc')->limit(10)->select();
        $this->assign('newslist1',$newslist1);

        $prolist=db('project')->order('id desc')->limit(10)->select();
        $this->assign('prolist',$prolist);
        return $this->fetch('news');
    }
}
