<?php
namespace app\index\controller;
use think\Controller;
class Content extends Common
{
    public function list($p=1,$etitle)
    {
    	$categoryinfo=db('category')->where("etitle='".$etitle."'")->find();

    	switch ($etitle) {
    		case 'lesson':
    			$pagesize=21;
    			break;
    		case 'teacher':
    			$pagesize=6;
    			break;
    		case 'student':
    			$pagesize=9;
    			break;
    		default:
    			$pagesize=8;
    			break;
    	}
    	switch ($categoryinfo['modelid']) {
            case 2:
                $table='pic_data';
                $list=db('content a')->field('a.id,a.title,a.keywords,a.description,a.shortnote,a.ctime,a.catid,a.modelid,a.status,a.picurl,b.cid,b.note,b.images')->join($table.' b ',' a.id=b.cid','left')->where('a.catid='.$categoryinfo['id'])->limit(($p-1)*$pagesize,$pagesize)->select();
                $count=db('content a')->join($table.' b ',' a.id=b.cid','left')->where('a.catid='.$categoryinfo['id'])->count();
                $dvpage=dvPage($p, $count, $pagesize,'/'.$etitle.'/');
		        $this->assign('data',$list);
		        $this->assign('countnum',$count);
		        $this->assign('dvpage',$dvpage['code']);
    			$this->assign('list',$list);
                break;
            case 3:
                $table='page_data';
                $rinfo=db('content a')->field('a.id,a.title,a.keywords,a.description,a.shortnote,a.ctime,a.catid,a.modelid,a.status,a.picurl,b.cid,b.note')->join($table.' b ',' a.id=b.cid','left')->where('a.catid='.$categoryinfo['id'])->find();
    			$this->assign('rinfo',$rinfo);
                break;
            case 4:
                $table='page_data';
                $rinfo=db('content a')->field('a.id,a.title,a.keywords,a.description,a.shortnote,a.ctime,a.catid,a.modelid,a.status,a.picurl,b.cid,b.note')->join($table.' b ',' a.id=b.cid','left')->where('a.catid='.$categoryinfo['id'])->find();
                header('Location:'.$rinfo['note']);
                break;
            default:
                $table='news_data';
                $list=db('content a')->field('a.id,a.title,a.keywords,a.description,a.shortnote,a.ctime,a.catid,a.modelid,a.status,a.picurl,b.cid,b.note')->join($table.' b ',' a.id=b.cid')->where('a.catid='.$categoryinfo['id'])->limit(($p-1)*$pagesize,$pagesize)->select();
                $count=db('content a')->join($table.' b ',' a.id=b.cid')->where('a.catid='.$categoryinfo['id'])->count();
                $dvpage=dvPage($p, $count, $pagesize,'/'.$etitle.'/');
		        $this->assign('data',$list);
		        $this->assign('countnum',$count);
		        $this->assign('dvpage',$dvpage['code']);
    			$this->assign('list',$list);
                break;
        }
    	$this->assign('cinfo',$categoryinfo);
        if (in_array($etitle, ['news','anews'])){
            $etitle='news';
        }
        return $this->fetch('index:'.$etitle);
    }

    public function show($id){
    	$rinfo=db('content')->where('id='.$id)->find();
    	if (!$rinfo) {
    		send_http_status(404);exit;
    	}else{
            $rinfo['shortnote']=str_replace("\n","<br>",$rinfo['shortnote']);
    		$cinfo=db('category')->where('id='.$rinfo['catid'])->find();
    		switch ($cinfo['modelid']) {
    			case 2:
                $table='pic_data';
                break;
            case 3:
                $table='page_data';
                break;
            case 4:
                $table='page_data';
                break;
            default:
                $table='news_data';
                break;
    		}
    		switch ($cinfo['etitle']) {
    			case 'lesson':
    				$template=$cinfo['etitle']."show";
    				break;
    			case 'teacher':
    				$template=$cinfo['etitle']."show";
    				break;
    			case 'student':
    				$template=$cinfo['etitle']."show";
    				break;
    			default:
    				$template="newsshow";
    				break;
    		}
    		$note=db($table)->where('cid='.$rinfo['id'])->find();
    		$rinfo['data']=$note;
    		$this->assign('rinfo',$rinfo);
    		return $this->fetch('index:'.$template);
    	}

    }
}
