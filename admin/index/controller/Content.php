<?php
namespace app\index\controller;
use think\Controller;
class Content extends Common
{
    public function index()
    {
        $p=isset($_GET['p'])?$_GET['p']:1;
        $pagesize=20;
        $categorylist=db('category')->order('id asc')->select();
        $category_list=tree($categorylist);
    	$this->assign('category_list',$category_list);
        $where=' 1 ';
        $catid=$_GET['catid'];
        if ($catid){
            $where.=' and catid='.$catid;
        }else{
            $where.=' and modelid in (1,2)';
        }
        $title=$_GET['title'];
        if ($title) {
            $where.=" and title like '%".$title."%'";
        }
        $list=db('content')->where($where)->order('ctime desc')->limit(($p-1)*$pagesize,$pagesize)->select();
        $count=db('content')->where($where)->count();
        $dvpage=dvPage($p, $count, $pagesize,'/ht.php/content/?catid='.$catid.'&title='.$title.'&');
        $this->assign('data',$list);
        $this->assign('countnum',$count);
        $this->assign('dvpage',$dvpage['code']);
        $this->assign('catid',$catid);
        $this->assign('title',$title);
        return $this->fetch('index');
    }

    public function edit(){
        $cid=$_GET['cid'];
        $id=@$_GET['id'];
        $modelid=$_GET['modelid'];
        $list=db('category')->order('id asc')->select();
        $category_list=tree($list);
        $this->assign('category_list',$category_list);
        if ($cid){
            $cateinfo=db('category')->where('id='.$cid)->find();
            if ($cateinfo){
                switch ($cateinfo['modelid']) {
                    case 1:
                        header('Location:/ht.php/content/index?catid='.$cid);exit;
                        break;
                    case 2:
                        header('Location:/ht.php/content/index?catid='.$cid);exit;
                        break;
                    case 3:
                        $rinfo=db('content a')->field('a.id,a.title,a.keywords,a.description,a.shortnote,a.ctime,a.catid,a.modelid,a.status,a.picurl,b.cid,b.note')->join('page_data b ',' a.id=b.cid')->where('a.catid='.$cid)->find();
                        $template='page_edit';
                        break;
                    case 4:
                        $rinfo=db('content a')->field('a.id,a.title,a.keywords,a.description,a.shortnote,a.ctime,a.catid,a.modelid,a.status,a.picurl,b.cid,b.note')->join('page_data b ',' a.id=b.cid')->where('a.catid='.$cid)->find();
                        $template='link_edit';
                        break;
                }
                if (!$rinfo){
                    $rinfo['catid']=$cid;
                }
            }
        }else{
            switch ($modelid) {
                case 2:
                    $table='pic_data';
                    $template='pic_edit';
                    $field=',b.images';
                    break;
                case 3:
                    $rinfo=db('content a')->field('a.id,a.title,a.keywords,a.description,a.shortnote,a.ctime,a.catid,a.modelid,a.status,a.picurl,b.cid,b.note')->join('page_data b ',' a.id=b.cid','left')->where('a.catid='.$cid)->find();
                    $template='page_edit';
                    break;
                case 4:
                    $rinfo=db('content a')->field('a.id,a.title,a.keywords,a.description,a.shortnote,a.ctime,a.catid,a.modelid,a.status,a.picurl,b.cid,b.note')->join('page_data b ','a.id=b.cid','left')->where('a.catid='.$cid)->find();
                    $template='link_edit';
                    break;
                default:
                    $table='news_data';
                    $template='edit';
                    break;
            }
            if ($id){
                $rinfo=db('content a')->field('a.id,a.title,a.keywords,a.description,a.shortnote,a.ctime,a.catid,a.modelid,a.status,a.picurl,b.cid,b.note'.$field)->join($table.' b ',' a.id=b.cid','left')->where('a.id='.$id)->find();
                $this->assign('id',$id);
            }
        }
        
        
        $this->assign('rinfo',$rinfo);
        return $this->fetch($template);
    }

    public function save(){
    	$id=$_POST['id'];
        $data['modelid']=$_POST['modelid'];
        $data['catid']=$_POST['catid'];
        $data['title']=$_POST['title'];
        $data1['note']=$_POST['note'];
        $data['keywords']=$_POST['keywords'];
        $data['description']=$_POST['description'];
        $data['shortnote']=$_POST['shortnote'];
        switch ($data['modelid']) {
            case 1:
                $table='news_data';
                $data['picurl']=$_POST['picurl'];
                break;
            case 2:
                $table='pic_data';
                $data['picurl']=$_POST['picurl'];
                $data1['images']=ltrim($_POST['picurl2'],'|');
                break;
            case 3:
                $table='page_data';
                break;
            case 4:
                $table='page_data';
                break;
        }
        if($id){
            $r=db('content')->where('id='.$id)->update($data);
            $r1=db($table)->where('cid='.$id)->update($data1);
        }else{
            $data['ctime']=time();
            $r=db('content')->insertGetId($data);
            $data1['cid']=$r;
            $r1=db($table)->insert($data1);
        }
    	
    	if ($r!==false && $r1!==false){
    		echo 1;
    	}
    }

    public function cdelete(){
        $id=$_POST['id'];
        if ($id){
            $r=db('content')->where('id='.$id)->delete();
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
