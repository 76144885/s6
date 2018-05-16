<?php
namespace app\index\controller;
use think\Controller;
class Lc extends Common
{
    public function index($p=1)
    {
        return $this->fetch('common:lc');
    }

}
