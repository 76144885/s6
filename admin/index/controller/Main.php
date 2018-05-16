<?php
namespace app\index\controller;
use think\Controller;
class Main extends Common
{
    public function index()
    {
    	return $this->fetch('index');
    }

    public function welcome(){
        return view();
    }
}
