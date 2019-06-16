<?php
/**
 * Created by PhpStorm.
 * User: hp
 * Date: 2019/6/16
 * Time: 20:04
 */

namespace app\admin\controller;

use app\admin\model\YouyanDevice;

use think\facade\Config;
use think\facade\Db;
use think\facade\Request;
use think\facade\View;

class MonitorData extends Base
{
    public function index()
    {

    }

    public function list()
    {
        //全局查询条件
        $where = [];

        $username = Request::param('username');
        if (!empty($username)) {
            $where[] = ['a.username|a.nickname', 'like', '%'.$username.'%'];
        }

        //显示数量
        $pageSize = Request::param('page_size', Config::get('app.page_size'));

        //查出所有数据
        $list = Db::name('youyan_device')
//            ->alias('a')
////            ->leftJoin('auth_group_access ac', 'a.id = ac.uid')
////            ->leftJoin('auth_group ag', 'ac.group_id = ag.id')
////            ->field('a.*, ac.group_id, ag.title')
            ->where($where)
            ->paginate($pageSize, false, ['query' => request()->get()]);

        $view = [
            'username' => $username,
            'pageSize' => page_size($pageSize, $list->total()),
            'page'     => $list->render(),
            'list'     => $list,
            'empty'    => empty_list(11),
        ];
        View::assign($view);
        return View::fetch('data_list');
    }

    public function add()
    {
        if(Request::isPost()){
            $data = Request::post();
//            if (empty($data['group_id'])) {
//                $this->error('请选择用户组');
//            } else {
//                $group_id = $data['group_id'];
//                unset($data['group_id']);
//            }
            //单独验证密码
            if (empty($data['deviceId'])) {
                $this->error('设备ID不能为空');
            }
            //验证
//            $result = $this->validate($data, 'Admin');
//            if (true !== $result) {
//                // 验证失败 输出错误信息
//                $this->error($result);
//            }

            $data['deviceId']  = trim($data['deviceId']);
//            $data['logintime'] = time();
//            $data['loginip']   = Request::ip();

            //添加
            $result = YouyanDevice::create($data);
            if ($result) {
//                AuthGroupAccess::create([
//                    'uid'      =>  $result->id,
//                    //'group_id' =>  $group_id
//                ]);
                $this->success('设备添加成功', 'list');
            } else {
                $this->error('设备添加失败');
            }
        } else {
//            $auth_group = AuthGroup::where('status','=',1)
//                ->select();
            $view = [
                //'authGroup' => $auth_group,
                'info'      => null
            ];
            View::assign($view);
            return View::fetch('device_add');
        }
    }

    // 设备修改
    public function edit(){
        if (Request::isPost()) {
            $data = Request::post();
//            $password = $data['password'];
//            $map[] = ['id','<>',$data['id']];
            $where['id'] = $data['id'];

//            $group_id = $data['group_id'];
//            unset($data['group_id']);
//
//            $result = $this->validate($data,'Admin');
//            if (true !== $result) {
//                $this->error($result);
//            }
//
//            if ($password) {
//                $data['password'] = input('post.password','','md5');
//            }else{
//                unset($data['password']);
//            }

            YouyanDevice::update($data, $where);
//            AuthGroupAccess::update([
//                'group_id' =>  $group_id
//            ], ['uid'=>$data['id']]);
            $this->success('设备修改成功!', 'device/list');

        } else {
            if (Request::param('id')) {
//                $auth_group = AuthGroup::select();
                $device = YouyanDevice::find(Request::param('id'));
//                $admin['group_id'] = AuthGroupAccess::where('uid', $admin['id'])
//                    ->value('group_id');

                $view = [
                    'info'      => $device,
//                    'authGroup' => $auth_group,
                ];
                View::assign($view);
                return View::fetch('device_add');
            }
        }
    }
}