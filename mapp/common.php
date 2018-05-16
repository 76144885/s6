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
function dvPage($curPage, $total, $pageSize, $url){
	!preg_match("/^[1-9]{1}[0-9]{0,7}$/", $curPage) && $curPage = 1;
    $arr = array();
    $arr['total'] = $total;
    $arr['curPage'] = $curPage;
    $arr['maxPage'] = ceil($total/$pageSize);
    $arr['upPage'] = $curPage - 1>0?$curPage-1:1;
    $arr['nextPage'] = $curPage+1>$arr['maxPage']?$arr['maxPage']:$curPage+1;
    $arr['startPage'] = $curPage-4>0?$curPage-4:1;
    $arr['endPage'] = $arr['startPage']+6>$arr['maxPage']?$arr['maxPage']:$arr['startPage']+6;
    $arr['code'] ='<div class="page">';
    $arr['code'] .= '<a href="'.$url.'">首页</a>';
    if ($arr['upPage']=='1') {
        $arr['code'] .='<a href="'.$url.'">上一页</a>';
    }else{
        $arr['code'] .='<a href="'.$url.$arr['upPage'].'.html">上一页</a>';
    }
    for ($i=$arr['startPage']; $i<=$arr['endPage']; $i++)
    {
        if($i==$curPage){
            $arr['code'] .= '<a class="on">'.$i.'</a>';
        }else{
            if($i==='1'){
                $arr['code'] .= '<a href="'.$url.'/">1</a>';
            }else{
                $arr['code'] .= '<a href="'.$url.$i.'.html">'.$i.'</a>';
            }
        }
    }
    if ($arr['nextPage']<2 ){
        $arr['code'] .= '<a href="'.$url.'">下一页</a>';
    }else{
        $arr['code'] .= '<a href="'.$url.$arr['nextPage'].'.html">下一页</a>';
    }
    if ($arr['maxPage']<2 ){
        $arr['code'] .= '<a href="'.$url.'">末页</a>';
    }else{
        $arr['code'] .= '<a href="'.$url.$arr['maxPage'].'.html">末页</a>';
    }
    $arr['code'] .= '<span>'.$arr['curPage'].'/'.$arr['maxPage'].' </span><span>共'.$arr['total'].'条</span></div>';
    return $arr;
}



function tree(&$data,$pid = 0,$count = 1) {
	$treeList=[];
    foreach ($data as $key => $value){
        if($value['pid']==$pid){
            $value['count'] = $count;
            $treeList []=$value;
            unset($data[$key]);
            tree($data,$value['pid'],$count+1);
        } 
    }
    return $treeList ;
}

//截取中文字符
function msubstr($str, $start=0, $length, $charset="utf-8", $suffix=true) {  
        if(function_exists("mb_substr")){
            if($suffix){
                return mb_substr($str, $start, $length, $charset)."...";  
            }else{
                return mb_substr($str, $start, $length, $charset);  
            }
        }elseif(function_exists('iconv_substr')) {  
            if($suffix){
                return iconv_substr($str,$start,$length,$charset)."...";  
            }else{
                return iconv_substr($str,$start,$length,$charset);  
            }
        }
        $re['utf-8']= "/[x01-x7f]|[xc2-xdf][x80-xbf]|[xe0-xef][x80-xbf]{2}|[xf0-xff][x80-xbf]{3}/";  
        $re['gb2312'] = "/[x01-x7f]|[xb0-xf7][xa0-xfe]/";  
        $re['gbk']= "/[x01-x7f]|[x81-xfe][x40-xfe]/";  
        $re['big5']= "/[x01-x7f]|[x81-xfe]([x40-x7e]|xa1-xfe])/";  
        preg_match_all($re[$charset], $str, $match);  
        $slice = join("",array_slice($match[0], $start, $length));  
        if($suffix) return $slice."…";  
        return $slice;
    }

/**
 * 获取客户端IP地址
 * @param integer $type 返回类型 0 返回IP地址 1 返回IPV4地址数字
 * @param boolean $adv 是否进行高级模式获取（有可能被伪装） 
 * @return mixed
 */
function get_client_ip($type = 0,$adv=false) {
    $type       =  $type ? 1 : 0;
    static $ip  =   NULL;
    if ($ip !== NULL) return $ip[$type];
    if($adv){
        if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $arr    =   explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
            $pos    =   array_search('unknown',$arr);
            if(false !== $pos) unset($arr[$pos]);
            $ip     =   trim($arr[0]);
        }elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
            $ip     =   $_SERVER['HTTP_CLIENT_IP'];
        }elseif (isset($_SERVER['REMOTE_ADDR'])) {
            $ip     =   $_SERVER['REMOTE_ADDR'];
        }
    }elseif (isset($_SERVER['REMOTE_ADDR'])) {
        $ip     =   $_SERVER['REMOTE_ADDR'];
    }
    // IP地址合法验证
    $long = sprintf("%u",ip2long($ip));
    $ip   = $long ? array($ip, $long) : array('0.0.0.0', 0);
    return $ip[$type];
}

/**
 * 发送HTTP状态
 * @param integer $code 状态码
 * @return void
 */
function send_http_status($code) {
    static $_status = array(
            // Informational 1xx
            100 => 'Continue',
            101 => 'Switching Protocols',
            // Success 2xx
            200 => 'OK',
            201 => 'Created',
            202 => 'Accepted',
            203 => 'Non-Authoritative Information',
            204 => 'No Content',
            205 => 'Reset Content',
            206 => 'Partial Content',
            // Redirection 3xx
            300 => 'Multiple Choices',
            301 => 'Moved Permanently',
            302 => 'Moved Temporarily ',  // 1.1
            303 => 'See Other',
            304 => 'Not Modified',
            305 => 'Use Proxy',
            // 306 is deprecated but reserved
            307 => 'Temporary Redirect',
            // Client Error 4xx
            400 => 'Bad Request',
            401 => 'Unauthorized',
            402 => 'Payment Required',
            403 => 'Forbidden',
            404 => 'Not Found',
            405 => 'Method Not Allowed',
            406 => 'Not Acceptable',
            407 => 'Proxy Authentication Required',
            408 => 'Request Timeout',
            409 => 'Conflict',
            410 => 'Gone',
            411 => 'Length Required',
            412 => 'Precondition Failed',
            413 => 'Request Entity Too Large',
            414 => 'Request-URI Too Long',
            415 => 'Unsupported Media Type',
            416 => 'Requested Range Not Satisfiable',
            417 => 'Expectation Failed',
            // Server Error 5xx
            500 => 'Internal Server Error',
            501 => 'Not Implemented',
            502 => 'Bad Gateway',
            503 => 'Service Unavailable',
            504 => 'Gateway Timeout',
            505 => 'HTTP Version Not Supported',
            509 => 'Bandwidth Limit Exceeded'
    );
    if(isset($_status[$code])) {
        header('HTTP/1.1 '.$code.' '.$_status[$code]);
        // 确保FastCGI模式下正常
        header('Status:'.$code.' '.$_status[$code]);
    }
}