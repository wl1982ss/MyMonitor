<?php
/**
 * Created by PhpStorm.
 * User: hp
 * Date: 2019/6/18
 * Time: 15:44
 */

namespace app\admin\controller;

use app\admin\model\Admin;
use app\admin\model\AuthGroup;
use app\admin\model\AuthGroupAccess;

use think\facade\Request;
use think\facade\View;

class Profile extends Base
{
    // 管理员修改
    public function edit(){
        if (Request::isPost()) {
            $data = Request::post();
            $password = $data['password'];
            $map[] = ['id','<>',$data['id']];
            $where['id'] = $data['id'];

//            $group_id = $data['group_id'];
//            unset($data['group_id']);

            $result = $this->validate($data,'Admin');
            if (true !== $result) {
                $this->error($result);
            }

            if ($password) {
                $data['password'] = input('post.password','','md5');
            }else{
                unset($data['password']);
            }

            Admin::update($data, $where);
//            AuthGroupAccess::update([
//                'group_id' =>  $group_id
//            ], ['uid'=>$data['id']]);
            $this->success('资料修改成功!', 'Index/main');

        } else {
            if (Request::param('id')) {
                $auth_group = AuthGroup::select();
                $admin = Admin::find(Request::param('id'));
                $admin['group_id'] = AuthGroupAccess::where('uid', $admin['id'])
                    ->value('group_id');

                $view = [
                    'info'      => $admin,
                    'authGroup' => $auth_group,
                ];
                View::assign($view);
                return View::fetch('edit');
            }
        }
    }
}