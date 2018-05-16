<?php
namespace app\index\controller;
use think\Controller;
class Index extends Common
{
    public function index()
    {
    	// $focuslist=db('pic')->where('type=1')->order('sort desc')->select();
    	// $this->assign('focuslist',$focuslist);
    	
    	//学院动态
    	$xydt=db('content')->where('catid=8')->order('ctime desc')->limit(5)->select();
    	$this->assign('xydt',$xydt);
    	//硬件设施
        $yjss=db('content')->where('catid=9')->order('ctime desc')->limit(10)->select();
        $this->assign('yjss',$yjss);
        //学员风采
        $xyfc=db('content')->where('catid=10')->order('ctime desc')->limit(4)->select();
        $this->assign('xyfc',$xyfc);
        //权威证书
        $qwzs=db('content')->where('catid=11')->order('ctime desc')->limit(6)->select();
        $this->assign('qwzs',$qwzs);
        //最新动态
        $zxdt=db('content')->where('catid=12')->order('ctime desc')->limit(10)->select();
        $this->assign('zxdt',$zxdt);
        //专业课程
        $zykc=db('content')->where('catid=2')->order('ctime desc')->limit(20)->select();
        $this->assign('zykc',$zykc);
        //导师团队
        $dstd=db('content')->where('catid=3')->order('ctime desc')->limit(6)->select();
        $this->assign('dstd',$dstd);
        //就业明星
        $jymx=db('content')->where('catid=4')->order('ctime desc')->limit(6)->select();
        $this->assign('jymx',$jymx);
        //合作单位
        $hzdw=db('content')->where('catid=13')->order('ctime desc')->select();
        $this->assign('hzdw',$hzdw);

        $zlgg=db('content')->where('catid=16')->find();
        $this->assign('zlgg',$zlgg);

    	// $flink=db('flink')->select();
    	// $this->assign('flink',$flink);
        return $this->fetch('index/index');
    }

    public function apply(){
        return $this->fetch('index/apply');
    }
}
