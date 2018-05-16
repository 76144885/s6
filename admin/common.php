<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

    //跳转
    function go($msg,$url,$type=1){
    	switch ($type) {
    		case 1:
    			$t='window';
    			break;
    		case 2:
    			$t='parent';
    			break;
    		case 3:
    			$t='top';
    			break;
    	}
    	echo "<script>alert('".$msg."');".$t.".location.href='".$url."'</script>";
    }

    //分页
    function dvPage($curPage, $total, $pageSize, $url)
    {
        !preg_match("/^[1-9]{1}[0-9]{0,7}$/", $curPage) && $curPage = 1;
        $arr = array();
        $arr['total'] = $total;
        $arr['curPage'] = $curPage;
        $arr['maxPage'] = ceil($total/$pageSize);
        $arr['upPage'] = $curPage - 1>0?$curPage-1:1;
        $arr['nextPage'] = $curPage+1>$arr['maxPage']?$arr['maxPage']:$curPage+1;
        $arr['startPage'] = $curPage-4>0?$curPage-4:1;
        $arr['endPage'] = $arr['startPage']+8>$arr['maxPage']?$arr['maxPage']:$arr['startPage']+8;
        $arr['code'] ='<div class="dataTables_info">共'.$total.'条&nbsp;&nbsp;'.$arr['curPage'].'/'.$arr['maxPage'].'</div>';
        $arr['code'] .= '<div class="dataTables_paginate paging_simple_numbers"><form id="form4" name="form4" method="get" style="float:right;" action="'.$url.'">第<INPUT TYPE="text" NAME="p" id=page size="4"><INPUT TYPE="submit" value="转到"></FORM><a class="paginate_button" href="'.$url.'p='.$arr['upPage'].'">上一页</a>';
        for ($i=$arr['startPage']; $i<=$arr['endPage']; $i++)
        {
            if($i==$curPage) $arr['code'] .= '<a class="paginate_button current">'.$i.'</a>';
            else $arr['code'] .= '<a class="paginate_button" href="'.$url.'p='.$i.'">'.$i.'</a>';
        }
        if ($arr['curPage']<$arr['maxPage']){
            $arr['code'] .= '<a class="paginate_button" href="'.$url.'p='.$arr['nextPage'].'">下一页</a></div>';
        }
        return $arr;
    }

    function tree($a,$fid=0){
        $tree = array();                                //每次都声明一个新数组用来放子元素  
        foreach($a as $v){  
            if($v['fid'] == $fid){                      //匹配子记录
                $v['child'] = tree($a,$v['id']); //递归获取子记录  
                if($v['child'] == null){  
                    unset($v['child']);             //如果子元素为空则unset()进行删除，说明已经到该分支的最后一个元素了（可选）  
                }  
                $tree[] = $v;                           //将记录存入新数组  
            }  
        }  
        return $tree;                                  //返回新数组  
    }


    function modelarr($type=0){
        $array=[1=>'文章',2=>'图库',3=>'单页',4=>'外部链接'];
        if ($type>0){
            return $array[$type];
        }else{
            return $array;
        }
    }

    function uploadpic(){
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

    function getcategory($id){
        $r=db('category')->where('id='.$id)->find();
        return $r;
    }
