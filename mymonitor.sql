-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2019-06-16 15:55:12
-- 服务器版本： 10.3.15-MariaDB
-- PHP 版本： 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `mymonitor`
--

-- --------------------------------------------------------

--
-- 表的结构 `tp_ad`
--

CREATE TABLE `tp_ad` (
  `id` mediumint(8) NOT NULL,
  `type_id` mediumint(8) NOT NULL COMMENT '类型ID',
  `name` varchar(250) NOT NULL COMMENT '广告名称',
  `image` varchar(250) DEFAULT NULL COMMENT '图片',
  `thumb` varchar(250) DEFAULT NULL COMMENT '缩略图',
  `url` varchar(250) DEFAULT NULL COMMENT '链接地址',
  `description` varchar(250) DEFAULT NULL COMMENT '备注',
  `sort` mediumint(8) DEFAULT 50 COMMENT '排序',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `create_time` int(11) DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) DEFAULT 0 COMMENT '修改时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='广告表';

--
-- 转存表中的数据 `tp_ad`
--

INSERT INTO `tp_ad` (`id`, `type_id`, `name`, `image`, `thumb`, `url`, `description`, `sort`, `status`, `create_time`, `update_time`) VALUES
(1, 1, 'banner_1 ', '/uploads/20181225/b671c6f234a72c2e6560c63ddd9dc0ff.jpg', '/uploads/20181225/b671c6f234a72c2e6560c63ddd9dc0ff.jpg', '', '免费、开源\r\n快速、简单', 1, 1, 1541128222, 1553154525),
(2, 1, 'banner_2', '/uploads/20181225/25670f5712b4acfb61c5d2a1bce79225.jpg', '/uploads/20181225/25670f5712b4acfb61c5d2a1bce79225.jpg', '', 'banner_2', 2, 1, 1545719151, 1551937531);

-- --------------------------------------------------------

--
-- 表的结构 `tp_admin`
--

CREATE TABLE `tp_admin` (
  `id` int(20) NOT NULL,
  `username` char(20) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `logintime` int(10) DEFAULT NULL COMMENT '时间',
  `loginip` char(20) DEFAULT NULL COMMENT 'IP',
  `status` int(1) DEFAULT 0 COMMENT '状态（1 正常，0 锁定）',
  `nickname` char(100) DEFAULT NULL COMMENT '真实姓名',
  `image` varchar(200) DEFAULT NULL COMMENT '头像',
  `create_time` int(11) DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) DEFAULT 0 COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';

--
-- 转存表中的数据 `tp_admin`
--

INSERT INTO `tp_admin` (`id`, `username`, `password`, `logintime`, `loginip`, `status`, `nickname`, `image`, `create_time`, `update_time`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1560688054, '127.0.0.1', 1, 'admin', '/uploads/20181228/e5885dc546eb1369482cdf29fb07decd.jpg', 1553846932, 1553846932),
(2, 'test_admin', 'e10adc3949ba59abbe56e057f20f883e', 1560687994, '127.0.0.1', 1, '某某企业设备管理员', '', 1560391105, 1560687950);

-- --------------------------------------------------------

--
-- 表的结构 `tp_admin_log`
--

CREATE TABLE `tp_admin_log` (
  `id` int(12) UNSIGNED NOT NULL COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `username` varchar(30) DEFAULT '' COMMENT '管理员',
  `url` varchar(1500) DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) DEFAULT '' COMMENT '日志标题',
  `content` text DEFAULT NULL COMMENT '内容',
  `ip` varchar(50) DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) DEFAULT '' COMMENT 'User-Agent',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员日志表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `tp_admin_log`
--

INSERT INTO `tp_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES
(1, 1, 'admin', '/admin/login/checklogin.html', '登录成功', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560390989),
(2, 1, 'admin', '/admin/system/system.html', '[系统设置] -> [系统设置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560390995),
(3, 1, 'admin', '/admin/system/email.html', '[系统设置] -> [邮箱配置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560390996),
(4, 1, 'admin', '/admin/system/sms.html', '[系统设置] -> [短信配置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560390997),
(5, 1, 'admin', '/admin/system_group/index.html', '[系统设置] -> [系统设置分组]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560390999),
(6, 1, 'admin', '/admin/auth/adminlist.html', '[权限管理] -> [管理员管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391002),
(7, 1, 'admin', '/admin/auth/admingroup.html', '[权限管理] -> [角色组管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391003),
(8, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391005),
(9, 1, 'admin', '/admin/admin_log/index.html', '[权限管理] -> [管理员日志]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391007),
(10, 1, 'admin', '/admin/database/database.html', '[数据库管理] -> [数据库备份]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391009),
(11, 1, 'admin', '/admin/database/restore.html', '[数据库管理] -> [还原数据库]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391010),
(12, 1, 'admin', '/admin/module/index.html', '[模型管理] -> [模型列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391013),
(13, 1, 'admin', '/admin/cate/index.html', '[内容管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391015),
(14, 1, 'admin', '/admin/content/index.html', '[内容管理] -> [内容管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391022),
(15, 1, 'admin', '/admin/content/index.html?type=main', '[内容管理] -> [内容管理]', '{\"type\":\"main\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391022),
(16, 1, 'admin', '/admin/template/index.html', '[模板管理] -> [模板管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391030),
(17, 1, 'admin', '/admin/users/index.html', '[会员管理] -> [会员列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391033),
(18, 1, 'admin', '/admin/users_type/index.html', '[会员管理] -> [会员组]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391035),
(19, 1, 'admin', '/admin/database/database.html', '[数据库管理] -> [数据库备份]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391038),
(20, 1, 'admin', '/admin/auth/adminlist.html', '[权限管理] -> [管理员管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391062),
(21, 1, 'admin', '/admin/auth/adminadd.html', '[权限管理] -> [管理员管理] -> [操作-添加]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391067),
(22, 1, 'admin', '/admin/auth/adminlist.html', '[权限管理] -> [管理员管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391109),
(23, 2, 'test_admin', '/admin/login/checklogin.html', '登录成功', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391186),
(24, 2, 'test_admin', '/admin/cate/index.html', '[内容管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391198),
(25, 2, 'test_admin', '/admin/content/index.html', '[内容管理] -> [内容管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391200),
(26, 2, 'test_admin', '/admin/content/index.html?type=main', '[内容管理] -> [内容管理]', '{\"type\":\"main\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391200),
(27, 2, 'test_admin', '/admin/ad/index.html', '[网站功能] -> [ 广告管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391203),
(28, 2, 'test_admin', '/admin/ad_type/index.html', '[网站功能] -> [广告位管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391203),
(29, 2, 'test_admin', '/admin/users/index.html', '[会员管理] -> [会员列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391207),
(30, 2, 'test_admin', '/admin/users_type/index.html', '[会员管理] -> [会员组]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391214),
(31, 2, 'test_admin', '/admin/admin_log/index.html', '[权限管理] -> [管理员日志]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391222),
(32, 2, 'test_admin', '/admin/database/database.html', '[数据库管理] -> [数据库备份]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391226),
(33, 2, 'test_admin', '/admin/database/restore.html', '[数据库管理] -> [还原数据库]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391227),
(34, 2, 'test_admin', '/admin/system/system.html', '[系统设置] -> [系统设置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391254),
(35, 2, 'test_admin', '/admin/cate/index.html', '[内容管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391398),
(36, 1, 'admin', '/admin/login/checklogin.html', '登录成功', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391422),
(37, 1, 'admin', '/admin/cate/index.html', '[内容管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391432),
(38, 1, 'admin', '/admin/system/system.html', '[系统设置] -> [系统设置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391443),
(39, 1, 'admin', '/admin/system/email.html', '[系统设置] -> [邮箱配置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391452),
(40, 1, 'admin', '/admin/system/sms.html', '[系统设置] -> [短信配置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391454),
(41, 1, 'admin', '/admin/system_group/index.html', '[系统设置] -> [系统设置分组]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391456),
(42, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391465),
(43, 1, 'admin', '/admin/auth/ruleedit.html?id=1', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391486),
(44, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391537),
(45, 1, 'admin', '/admin/auth/adminlist.html', '[权限管理] -> [管理员管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391549),
(46, 1, 'admin', '/admin/auth/adminedit.html?id=2', '[权限管理] -> [管理员管理] -> [操作-修改]', '{\"id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391552),
(47, 1, 'admin', '/admin/users_type/index.html', '[会员管理] -> [会员组]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391578),
(48, 1, 'admin', '/admin/users/index.html', '[会员管理] -> [会员列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391584),
(49, 1, 'admin', '/admin/users/add.html', '[会员管理] -> [会员列表] -> [操作-添加]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391590),
(50, 1, 'admin', '/admin/users/addpost.html', '[会员管理] -> [会员列表] -> [操作-添加保存]', '{\"type_id\":\"1\",\"email\":\"test001@qq.com\",\"sex\":\"1\",\"qq\":\"\",\"mobile\":\"18210176127\",\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391608),
(51, 1, 'admin', '/admin/users_type/index.html', '[会员管理] -> [会员组]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391612),
(52, 1, 'admin', '/admin/users/add.html', '[会员管理] -> [会员列表] -> [操作-添加]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391613),
(53, 1, 'admin', '/admin/users/index.html', '[会员管理] -> [会员列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391615),
(54, 1, 'admin', '/admin/users/edit.html?id=1', '[会员管理] -> [会员列表] -> [操作-修改]', '{\"id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391618),
(55, 1, 'admin', '/admin/users/editpost.html', '[会员管理] -> [会员列表] -> [操作-修改保存]', '{\"id\":\"1\",\"email\":\"test001@qq.com\",\"type_id\":\"1\",\"sex\":\"1\",\"qq\":\"407593529\",\"mobile\":\"15840189268\",\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391622),
(56, 1, 'admin', '/admin/users/edit.html?id=1', '[会员管理] -> [会员列表] -> [操作-修改]', '{\"id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391633),
(57, 1, 'admin', '/admin/users/index.html', '[会员管理] -> [会员列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391634),
(58, 1, 'admin', '/admin/users/add.html', '[会员管理] -> [会员列表] -> [操作-添加]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391635),
(59, 1, 'admin', '/admin/users/addpost.html', '[会员管理] -> [会员列表] -> [操作-添加保存]', '{\"type_id\":\"1\",\"email\":\"test1@qq.com\",\"sex\":\"1\",\"qq\":\"\",\"mobile\":\"\",\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391648),
(60, 1, 'admin', '/admin/users/index.html', '[会员管理] -> [会员列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391651),
(61, 2, 'test_admin', '/admin/login/checklogin.html', '登录成功', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391827),
(62, 2, 'test_admin', '/admin/admin_log/index.html', '[权限管理] -> [管理员日志]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391841),
(63, 2, 'test_admin', '/admin/users/index.html', '[会员管理] -> [会员列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391852),
(64, 2, 'test_admin', '/admin/system/system.html', '[系统设置] -> [系统设置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391868),
(65, 2, 'test_admin', '/admin/system/email.html', '[系统设置] -> [邮箱配置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391888),
(66, 2, 'test_admin', '/admin/system/sms.html', '[系统设置] -> [短信配置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391890),
(67, 2, 'test_admin', '/admin/system_group/index.html', '[系统设置] -> [系统设置分组]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391893),
(68, 1, 'admin', '/admin/login/checklogin.html', '登录成功', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391915),
(69, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391929),
(70, 1, 'admin', '/admin/auth/admingroup.html', '[权限管理] -> [角色组管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391931),
(71, 1, 'admin', '/admin/auth/groupaccess.html?id=2', '[权限管理] -> [角色组管理] -> [操作-权限]', '{\"id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560391933),
(72, 1, 'admin', '/admin/login/checklogin.html', '登录成功', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560685399),
(73, 1, 'admin', '/admin/template/index.html', '[模板管理] -> [模板管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686534),
(74, 1, 'admin', '/admin/cate/index.html', '[内容管理] -> [栏目列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686540),
(75, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686550),
(76, 1, 'admin', '/admin/auth/ruleadd.html', '[权限管理] -> [菜单规则] -> [操作-添加]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686576),
(77, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686604),
(78, 1, 'admin', '/admin/auth/ruleedit.html?id=4', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686609),
(79, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686635),
(80, 1, 'admin', '/admin/auth/ruleadd.html', '[权限管理] -> [菜单规则] -> [操作-添加]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686646),
(81, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686743),
(82, 1, 'admin', '/admin/auth/adminrule.html?ref=tab', '[权限管理] -> [菜单规则]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686752),
(83, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686753),
(84, 1, 'admin', '/admin/auth/ruleadd.html?id=176', '[权限管理] -> [菜单规则] -> [操作-添加]', '{\"id\":\"176\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686812),
(85, 1, 'admin', '/admin/auth/ruleadd.html', '[权限管理] -> [菜单规则] -> [操作-添加]', '{\"pid\":\"176\",\"title\":\"\\u8bbe\\u5907\\u5217\\u8868\",\"name\":\"Device\\/index\",\"icon\":\"\",\"status\":\"1\",\"auth_open\":\"1\",\"sort\":\"50\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686829),
(86, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686846),
(87, 1, 'admin', '/admin/auth/adminrule.html?ref=tab', '[权限管理] -> [菜单规则]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686849),
(88, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686850),
(89, 1, 'admin', '/admin/device/list.html', '[设备控制] -> [设备列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686854),
(90, 1, 'admin', '/admin/auth/ruleadd.html?id=176', '[权限管理] -> [菜单规则] -> [操作-添加]', '{\"id\":\"176\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686924),
(91, 1, 'admin', '/admin/auth/ruleadd.html', '[权限管理] -> [菜单规则] -> [操作-添加]', '{\"pid\":\"176\",\"title\":\"\\u6dfb\\u52a0\\u8bbe\\u5907\",\"name\":\"Device\\/add\",\"icon\":\"\",\"status\":\"1\",\"auth_open\":\"1\",\"sort\":\"50\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686938),
(92, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686942),
(93, 1, 'admin', '/admin/auth/ruleedit.html?id=29', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"29\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686961),
(94, 1, 'admin', '/admin/auth/ruleedit.html', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"29\",\"pid\":\"0\",\"title\":\"\\u6570\\u636e\\u5e93\\u7ba1\\u7406\",\"name\":\"Database\",\"icon\":\"fa fa-database\",\"status\":\"0\",\"auth_open\":\"1\",\"sort\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686966),
(95, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686970),
(96, 1, 'admin', '/admin/device/list.html?ref=tab', '[设备控制] -> [设备列表]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686971),
(97, 1, 'admin', '/admin/device/list.html', '[设备控制] -> [设备列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686972),
(98, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686977),
(99, 1, 'admin', '/admin/auth/ruleedit.html?id=100', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"100\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686985),
(100, 1, 'admin', '/admin/auth/ruleedit.html', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"100\",\"pid\":\"0\",\"title\":\"\\u6a21\\u677f\\u7ba1\\u7406\",\"name\":\"Template\",\"icon\":\"fa fa-code\",\"status\":\"0\",\"auth_open\":\"1\",\"sort\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686989),
(101, 1, 'admin', '/admin/auth/adminrule.html?ref=tab', '[权限管理] -> [菜单规则]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686992),
(102, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560686993),
(103, 1, 'admin', '/admin/module/index.html', '[模型管理] -> [模型列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687003),
(104, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687012),
(105, 1, 'admin', '/admin/auth/ruleedit.html?id=51', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"51\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687018),
(106, 1, 'admin', '/admin/auth/ruleedit.html', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"51\",\"pid\":\"0\",\"title\":\"\\u5185\\u5bb9\\u7ba1\\u7406\",\"name\":\"Cate\",\"icon\":\"fa fa-th\",\"status\":\"0\",\"auth_open\":\"1\",\"sort\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687021),
(107, 1, 'admin', '/admin/auth/adminrule.html?ref=tab', '[权限管理] -> [菜单规则]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687024),
(108, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687025),
(109, 1, 'admin', '/admin/auth/ruleedit.html?id=39', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"39\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687035),
(110, 1, 'admin', '/admin/auth/ruleedit.html', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"39\",\"pid\":\"0\",\"title\":\"\\u6a21\\u578b\\u7ba1\\u7406\",\"name\":\"Module\",\"icon\":\"fa fa-th-list\",\"status\":\"0\",\"auth_open\":\"1\",\"sort\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687050),
(111, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687053),
(112, 1, 'admin', '/admin/auth/ruleedit.html?id=30', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"30\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687065),
(113, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687072),
(114, 1, 'admin', '/admin/auth/ruleedit.html?id=68', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"68\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687081),
(115, 1, 'admin', '/admin/auth/ruleedit.html', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"68\",\"pid\":\"60\",\"title\":\" \\u5e7f\\u544a\\u7ba1\\u7406\",\"name\":\"Ad\\/index\",\"icon\":\"fa fa-tv\",\"status\":\"0\",\"auth_open\":\"1\",\"sort\":\"62\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687084),
(116, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687087),
(117, 1, 'admin', '/admin/auth/adminrule.html?ref=tab', '[权限管理] -> [菜单规则]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687089),
(118, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687090),
(119, 1, 'admin', '/admin/auth/ruleedit.html?id=39', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"39\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687096),
(120, 1, 'admin', '/admin/auth/ruleedit.html', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"39\",\"pid\":\"0\",\"title\":\"\\u6a21\\u578b\\u7ba1\\u7406\",\"name\":\"Module\",\"icon\":\"fa fa-th-list\",\"status\":\"0\",\"auth_open\":\"1\",\"sort\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687099),
(121, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687104),
(122, 1, 'admin', '/admin/auth/ruleedit.html?id=60', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"60\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687145),
(123, 1, 'admin', '/admin/auth/ruleedit.html', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"60\",\"pid\":\"0\",\"title\":\"\\u7f51\\u7ad9\\u529f\\u80fd\",\"name\":\"Function\",\"icon\":\"fa fa-gear\",\"status\":\"0\",\"auth_open\":\"1\",\"sort\":\"6\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687148),
(124, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687151),
(125, 1, 'admin', '/admin/auth/adminrule.html?ref=tab', '[权限管理] -> [菜单规则]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687151),
(126, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687152),
(127, 1, 'admin', '/admin/auth/adminrule.html?ref=tab', '[权限管理] -> [菜单规则]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687157),
(128, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687158),
(129, 1, 'admin', '/admin/auth/ruleedit.html?id=30', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"30\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687185),
(130, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687189),
(131, 1, 'admin', '/admin/auth/ruleedit.html?id=176', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"176\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687195),
(132, 1, 'admin', '/admin/auth/ruleedit.html', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"176\",\"pid\":\"0\",\"title\":\"\\u8bbe\\u5907\\u63a7\\u5236\",\"name\":\"Device\\/index\",\"icon\":\"fa fa-server\",\"status\":\"1\",\"auth_open\":\"1\",\"sort\":\"50\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687200),
(133, 1, 'admin', '/admin/auth/adminrule.html?ref=tab', '[权限管理] -> [菜单规则]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687202),
(134, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687203),
(135, 1, 'admin', '/admin/device/add.html', '[设备控制] -> [添加设备]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687209),
(136, 1, 'admin', '/admin/device/list.html', '[设备控制] -> [设备列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687210),
(137, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687219),
(138, 1, 'admin', '/admin/users/index.html', '[会员管理] -> [会员列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687228),
(139, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687235),
(140, 1, 'admin', '/admin/auth/ruleedit.html?id=8', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687253),
(141, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687257),
(142, 1, 'admin', '/admin/auth/rulesort.html', '[权限管理] -> [菜单规则] -> [操作-排序]', '{\"id\":\"176\",\"sort\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687273),
(143, 1, 'admin', '/admin/auth/ruleedit.html?id=176', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"176\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687273),
(144, 1, 'admin', '/admin/auth/ruleedit.html', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"176\",\"pid\":\"0\",\"title\":\"\\u8bbe\\u5907\\u63a7\\u5236\",\"name\":\"Device\\/index\",\"icon\":\"fa fa-server\",\"status\":\"1\",\"auth_open\":\"1\",\"sort\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687276),
(145, 1, 'admin', '/admin/auth/adminrule.html?ref=tab', '[权限管理] -> [菜单规则]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687279),
(146, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687279),
(147, 1, 'admin', '/admin/system/system.html', '[系统设置] -> [系统设置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687291),
(148, 1, 'admin', '/admin/system/systempost.html', '[系统设置] -> [系统设置] -> [操作-修改保存]', '{\"name\":\"\\u626c\\u5c18\\u5728\\u7ebf\\u76d1\\u63a7\\u5e73\\u53f0\",\"logo\":\"\\/uploads\\/20181226\\/a3a4245ec095da4903c6c81123fd480d.png\",\"file\":\"\",\"icp\":\"\\u8fbdICP\\u590712345678\\u53f7-1\",\"copyright\":\"Copyright \\u00a9 SIYUCMS 2019.All right reserved.Powered by SIYUCMS\",\"url\":\"www.xxx.com\",\"address\":\"\\u8fbd\\u5b81\\u7701\\u6c88\\u9633\\u5e02\\u94c1\\u897f\\u533a\\u91cd\\u5de5\\u8857XX\\u8defXX\\u53f71-1-1\",\"contacts\":\"X\\u5148\\u751f\",\"tel\":\"010-8888 7777\",\"mobile_phone\":\"158 4018 8888\",\"fax\":\"010-8888 9999\",\"email\":\"407593529@qq.com\",\"qq\":\"407593529\",\"qrcode\":\"\\/uploads\\/20181226\\/cb7a4c21d6443bc5e7a8d16ac2cbe242.png\",\"title\":\"SIYUCMS \\u5b98\\u7f51\",\"key\":\"SIYUCMS\\uff0cSIYUCMS\\u5185\\u5bb9\\u7ba1\\u7406\\u7cfb\\u7edf\\uff0cphp\\uff0cThinkPHP CMS\\uff0cThinkPHP\\u5efa\\u7ad9\\u7cfb\\u7edf\",\"des\":\"SIYUCMS \\u662f\\u4e00\\u6b3e\\u57fa\\u4e8e ThinkPHP + AdminLTE \\u7684\\u5185\\u5bb9\\u7ba1\\u7406\\u7cfb\\u7edf\\u3002\\u540e\\u53f0\\u754c\\u9762\\u91c7\\u7528\\u54cd\\u5e94\\u5f0f\\u5e03\\u5c40\\uff0c\\u6e05\\u723d\\u3001\\u6781\\u7b80\\u3001\\u7b80\\u5355\\u3001\\u6613\\u7528\\uff0c\\u662f\\u505a\\u5f00\\u53d1\\u7684\\u6700\\u4f73\\u9009\\u62e9\\u3002\",\"mobile\":\"0\",\"code\":\"0\",\"message_code\":\"0\",\"message_send_mail\":\"0\",\"label_opening\":\"1\",\"template_opening\":\"1\",\"template\":\"default\",\"html\":\"html\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687320),
(149, 1, 'admin', '/admin/system/system.html', '[系统设置] -> [系统设置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687323),
(150, 1, 'admin', '/admin/system/system.html?ref=tab', '[系统设置] -> [系统设置]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687324),
(151, 1, 'admin', '/admin/system/system.html', '[系统设置] -> [系统设置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687325),
(152, 1, 'admin', '/admin/system/systempost.html', '[系统设置] -> [系统设置] -> [操作-修改保存]', '{\"name\":\"\\u626c\\u5c18\\u5728\\u7ebf\\u76d1\\u63a7\\u5e73\\u53f0\",\"logo\":\"\\/uploads\\/20190616\\/c8cb9ef7befe1f8470999e663c7157d6.jpg\",\"file\":\"\",\"icp\":\"\\u5180ICP\\u590718030882\\u53f7-1\",\"copyright\":\"Copyright \\u00a9 SIYUCMS 2019.All right reserved.Powered by SIYUCMS\",\"url\":\"www.hanhouai.com\",\"address\":\"\\u6cb3\\u5317\\u7701\\u90af\\u90f8\\u5e02\\u90af\\u5c71\\u533a\\u58eb\\u5a01\\u5927\\u53a61005\\u5ba4\",\"contacts\":\"\\u5b59\\u5973\\u58eb\",\"tel\":\"0310-8070726\",\"mobile_phone\":\"15100000941\",\"fax\":\"\",\"email\":\"\",\"qq\":\"\",\"qrcode\":\"\\/uploads\\/20181226\\/cb7a4c21d6443bc5e7a8d16ac2cbe242.png\",\"title\":\"\\u626c\\u5c18\\u5728\\u7ebf\\u76d1\\u6d4b\\u5e73\\u53f0\",\"key\":\"\\u626c\\u5c18\\uff0c\\u626c\\u5c18\\u5728\\u7ebf\\u76d1\\u6d4b\\uff0c\\u73af\\u4fdd\\u76d1\\u6d4b\",\"des\":\"\\u626c\\u5c18\\u5728\\u7ebf\\u76d1\\u6d4b\\u5e73\\u53f0\",\"mobile\":\"0\",\"code\":\"0\",\"message_code\":\"0\",\"message_send_mail\":\"0\",\"label_opening\":\"1\",\"template_opening\":\"1\",\"template\":\"default\",\"html\":\"html\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687533),
(153, 1, 'admin', '/admin/system/system.html?ref=tab', '[系统设置] -> [系统设置]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687537),
(154, 1, 'admin', '/admin/system/system.html', '[系统设置] -> [系统设置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687537),
(155, 1, 'admin', '/admin/system/email.html', '[系统设置] -> [邮箱配置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687559),
(156, 1, 'admin', '/admin/system/sms.html', '[系统设置] -> [短信配置]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687567),
(157, 1, 'admin', '/admin/system_group/index.html', '[系统设置] -> [系统设置分组]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687577),
(158, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687584),
(159, 1, 'admin', '/admin/auth/ruleedit.html?id=157', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"157\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687591),
(160, 1, 'admin', '/admin/auth/ruleedit.html', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"157\",\"pid\":\"1\",\"title\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\\u5206\\u7ec4\",\"name\":\"SystemGroup\\/index\",\"icon\":\"fa  fa-cubes\",\"status\":\"0\",\"auth_open\":\"1\",\"sort\":\"14\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687594),
(161, 1, 'admin', '/admin/auth/admingroup.html', '[权限管理] -> [角色组管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687599),
(162, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687600),
(163, 1, 'admin', '/admin/auth/adminlist.html', '[权限管理] -> [管理员管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687603),
(164, 1, 'admin', '/admin/device/add.html', '[设备控制] -> [添加设备]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687651),
(165, 1, 'admin', '/admin/device/list.html', '[设备控制] -> [设备列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687652),
(166, 1, 'admin', '/admin/device/add.html', '[设备控制] -> [添加设备]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687694),
(167, 1, 'admin', '/admin/users/index.html', '[会员管理] -> [会员列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687710),
(168, 1, 'admin', '/admin/users_type/index.html', '[会员管理] -> [会员组]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687713),
(169, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687716),
(170, 1, 'admin', '/admin/auth/ruleedit.html?id=81', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"81\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687728),
(171, 1, 'admin', '/admin/auth/ruleedit.html', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"81\",\"pid\":\"0\",\"title\":\"\\u4f1a\\u5458\\u7ba1\\u7406\",\"name\":\"Users\",\"icon\":\"fa fa-user\",\"status\":\"0\",\"auth_open\":\"1\",\"sort\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687732),
(172, 1, 'admin', '/admin/auth/adminrule.html?ref=tab', '[权限管理] -> [菜单规则]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687734),
(173, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687735),
(174, 1, 'admin', '/admin/auth/admingroup.html', '[权限管理] -> [角色组管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687764),
(175, 1, 'admin', '/admin/auth/adminlist.html', '[权限管理] -> [管理员管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687766),
(176, 1, 'admin', '/admin/auth/adminedit.html?id=1', '[权限管理] -> [管理员管理] -> [操作-修改]', '{\"id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687772),
(177, 1, 'admin', '/admin/auth/admingroup.html', '[权限管理] -> [角色组管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687778),
(178, 1, 'admin', '/admin/auth/groupedit.html?id=2', '[权限管理] -> [角色组管理] -> [操作-修改]', '{\"id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687780),
(179, 1, 'admin', '/admin/auth/groupedit.html', '[权限管理] -> [角色组管理] -> [操作-修改]', '{\"id\":\"2\",\"title\":\"\\u5404\\u4f01\\u4e1a\\u7ba1\\u7406\\u5458\",\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687795),
(180, 1, 'admin', '/admin/auth/admingroup.html', '[权限管理] -> [角色组管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687799),
(181, 1, 'admin', '/admin/auth/adminedit.html?id=1', '[权限管理] -> [管理员管理] -> [操作-修改]', '{\"id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687800),
(182, 1, 'admin', '/admin/auth/admingroup.html', '[权限管理] -> [角色组管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687800),
(183, 1, 'admin', '/admin/auth/groupaccess.html?id=2', '[权限管理] -> [角色组管理] -> [操作-权限]', '{\"id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687804),
(184, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687849),
(185, 1, 'admin', '/admin/auth/adminrule.html?ref=tab', '[权限管理] -> [菜单规则]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687851),
(186, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687852),
(187, 1, 'admin', '/admin/auth/admingroup.html', '[权限管理] -> [角色组管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687855),
(188, 1, 'admin', '/admin/auth/groupaccess.html?id=2', '[权限管理] -> [角色组管理] -> [操作-权限]', '{\"id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687858),
(189, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687871),
(190, 1, 'admin', '/admin/auth/adminlist.html', '[权限管理] -> [管理员管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687875),
(191, 1, 'admin', '/admin/auth/groupaccess.html?id=2', '[权限管理] -> [角色组管理] -> [操作-权限]', '{\"id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687877),
(192, 1, 'admin', '/admin/auth/admingroup.html', '[权限管理] -> [角色组管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687885),
(193, 1, 'admin', '/admin/auth/groupaccess.html?id=1', '[权限管理] -> [角色组管理] -> [操作-权限]', '{\"id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687886),
(194, 1, 'admin', '/admin/auth/admingroup.html?ref=tab', '[权限管理] -> [角色组管理]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687914),
(195, 1, 'admin', '/admin/auth/admingroup.html', '[权限管理] -> [角色组管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687915),
(196, 1, 'admin', '/admin/auth/adminlist.html', '[权限管理] -> [管理员管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687917),
(197, 1, 'admin', '/admin/auth/adminedit.html?id=2', '[权限管理] -> [管理员管理] -> [操作-修改]', '{\"id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687924),
(198, 1, 'admin', '/admin/auth/adminedit.html', '[权限管理] -> [管理员管理] -> [操作-修改]', '{\"id\":\"2\",\"group_id\":\"2\",\"username\":\"test_admin\",\"image\":\"\",\"file\":\"\",\"nickname\":\"\\u67d0\\u67d0\\u4f01\\u4e1a\\u8bbe\\u5907\\u7ba1\\u7406\\u5458\",\"status\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687949),
(199, 1, 'admin', '/admin/auth/adminlist.html', '[权限管理] -> [管理员管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687953);
INSERT INTO `tp_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES
(200, 1, 'admin', '/admin/device/list.html', '[设备控制] -> [设备列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687965),
(201, 1, 'admin', '/admin/device/add.html', '[设备控制] -> [添加设备]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687967),
(202, 2, 'test_admin', '/admin/login/checklogin.html', '登录成功', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687994),
(203, 2, 'test_admin', '/admin/device/list.html', '[设备控制] -> [设备列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687997),
(204, 2, 'test_admin', '/admin/device/add.html', '[设备控制] -> [添加设备]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560687998),
(205, 2, 'test_admin', '/admin/device/list.html', '[设备控制] -> [设备列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560688001),
(206, 2, 'test_admin', '/admin/device/add.html', '[设备控制] -> [添加设备]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560688024),
(207, 1, 'admin', '/admin/login/checklogin.html', '登录成功', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560688054),
(208, 1, 'admin', '/admin/auth/adminedit.html?id=1', '[权限管理] -> [管理员管理] -> [操作-修改]', '{\"id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560688061),
(209, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560688075),
(210, 1, 'admin', '/admin/auth/admingroup.html', '[权限管理] -> [角色组管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560688078),
(211, 1, 'admin', '/admin/auth/groupaccess.html?id=2', '[权限管理] -> [角色组管理] -> [操作-权限]', '{\"id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560688081),
(212, 1, 'admin', '/admin/device/list.html', '[设备控制] -> [设备列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560688115),
(213, 1, 'admin', '/admin/auth/adminlist.html', '[权限管理] -> [管理员管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560688118),
(214, 1, 'admin', '/admin/auth/groupaccess.html?id=2', '[权限管理] -> [角色组管理] -> [操作-权限]', '{\"id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560688127),
(215, 1, 'admin', '/admin/auth/adminlist.html', '[权限管理] -> [管理员管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560688129),
(216, 1, 'admin', '/admin/device/list.html', '[设备控制] -> [设备列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560688215),
(217, 1, 'admin', '/admin/device/list.html?ref=tab', '[设备控制] -> [设备列表]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560688282),
(218, 1, 'admin', '/admin/device/list.html', '[设备控制] -> [设备列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560688283),
(219, 1, 'admin', '/admin/device/list.html?ref=tab', '[设备控制] -> [设备列表]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560688809),
(220, 1, 'admin', '/admin/device/list.html', '[设备控制] -> [设备列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560688810),
(221, 1, 'admin', '/admin/device/add.html', '[设备控制] -> [添加设备]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560688817),
(222, 1, 'admin', '/admin/auth/adminlist.html', '[权限管理] -> [管理员管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560688821),
(223, 1, 'admin', '/admin/auth/adminadd.html', '[权限管理] -> [管理员管理] -> [操作-添加]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560688823),
(224, 1, 'admin', '/admin/device/add.html', '[设备控制] -> [添加设备]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560688954),
(225, 1, 'admin', '/admin/auth/adminlist.html', '[权限管理] -> [管理员管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560689034),
(226, 1, 'admin', '/admin/auth/adminadd.html', '[权限管理] -> [管理员管理] -> [操作-添加]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560689036),
(227, 1, 'admin', '/admin/device/add.html', '[设备控制] -> [添加设备]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560689052),
(228, 1, 'admin', '/admin/device/add.html?ref=tab', '[设备控制] -> [添加设备]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560689313),
(229, 1, 'admin', '/admin/device/add.html', '[设备控制] -> [添加设备]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560689314),
(230, 1, 'admin', '/admin/device/add.html?ref=tab', '[设备控制] -> [添加设备]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560689694),
(231, 1, 'admin', '/admin/device/add.html', '[设备控制] -> [添加设备]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560689695),
(232, 1, 'admin', '/admin/device/add.html?ref=tab', '[设备控制] -> [添加设备]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560689768),
(233, 1, 'admin', '/admin/device/add.html', '[设备控制] -> [添加设备]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560689768),
(234, 1, 'admin', '/admin/device/add.html?ref=tab', '[设备控制] -> [添加设备]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560689841),
(235, 1, 'admin', '/admin/device/add.html', '[设备控制] -> [添加设备]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560689842),
(236, 1, 'admin', '/admin/device/list.html', '[设备控制] -> [设备列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560689844),
(237, 1, 'admin', '/admin/device/add.html', '[设备控制] -> [添加设备]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560689845),
(238, 1, 'admin', '/admin/device/list.html', '[设备控制] -> [设备列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560689914),
(239, 1, 'admin', '/admin/device/list.html?ref=tab', '[设备控制] -> [设备列表]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560689983),
(240, 1, 'admin', '/admin/device/list.html', '[设备控制] -> [设备列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560689984),
(241, 1, 'admin', '/admin/device/list.html?ref=tab', '[设备控制] -> [设备列表]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690009),
(242, 1, 'admin', '/admin/device/list.html', '[设备控制] -> [设备列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690010),
(243, 1, 'admin', '/admin/device/add.html', '[设备控制] -> [添加设备]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690015),
(244, 1, 'admin', '/admin/device/list.html', '[设备控制] -> [设备列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690056),
(245, 1, 'admin', '/admin/device/add.html?ref=tab', '[设备控制] -> [添加设备]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690060),
(246, 1, 'admin', '/admin/device/add.html', '[设备控制] -> [添加设备]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690061),
(247, 1, 'admin', '/admin/device/list.html', '[设备控制] -> [设备列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690069),
(248, 1, 'admin', '/admin/auth/adminedit.html?id=1', '[权限管理] -> [管理员管理] -> [操作-修改]', '{\"id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690074),
(249, 1, 'admin', '/admin/device/add.html?ref=tab', '[设备控制] -> [添加设备]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690124),
(250, 1, 'admin', '/admin/device/add.html', '[设备控制] -> [添加设备]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690125),
(251, 1, 'admin', '/admin/device/list.html', '[设备控制] -> [设备列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690127),
(252, 1, 'admin', '/admin/auth/adminlist.html', '[权限管理] -> [管理员管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690135),
(253, 1, 'admin', '/admin/auth/adminedit.html?id=2', '[权限管理] -> [管理员管理] -> [操作-修改]', '{\"id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690138),
(254, 1, 'admin', '/admin/auth/adminlist.html?ref=tab', '[权限管理] -> [管理员管理]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690315),
(255, 1, 'admin', '/admin/auth/adminlist.html', '[权限管理] -> [管理员管理]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690315),
(256, 1, 'admin', '/admin/device/list.html', '[设备控制] -> [设备列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690318),
(257, 1, 'admin', '/admin/device/list.html?ref=tab', '[设备控制] -> [设备列表]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690352),
(258, 1, 'admin', '/admin/device/list.html', '[设备控制] -> [设备列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690352),
(259, 1, 'admin', '/admin/device/list.html?ref=tab', '[设备控制] -> [设备列表]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690885),
(260, 1, 'admin', '/admin/device/list.html', '[设备控制] -> [设备列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690886),
(261, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690961),
(262, 1, 'admin', '/admin/auth/ruleadd.html', '[权限管理] -> [菜单规则] -> [操作-添加]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560690971),
(263, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691012),
(264, 1, 'admin', '/admin/auth/adminrule.html?ref=tab', '[权限管理] -> [菜单规则]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691014),
(265, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691015),
(266, 1, 'admin', '/admin/auth/ruleedit.html?id=176', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"176\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691038),
(267, 1, 'admin', '/admin/auth/ruleedit.html', '[权限管理] -> [菜单规则] -> [操作-修改]', '{\"id\":\"176\",\"pid\":\"0\",\"title\":\"\\u8bbe\\u5907\\u7ba1\\u7406\",\"name\":\"Device\\/index\",\"icon\":\"fa fa-server\",\"status\":\"1\",\"auth_open\":\"1\",\"sort\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691046),
(268, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691050),
(269, 1, 'admin', '/admin/auth/adminrule.html?ref=tab', '[权限管理] -> [菜单规则]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691051),
(270, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691052),
(271, 1, 'admin', '/admin/auth/ruleadd.html?id=179', '[权限管理] -> [菜单规则] -> [操作-添加]', '{\"id\":\"179\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691070),
(272, 1, 'admin', '/admin/auth/ruleadd.html', '[权限管理] -> [菜单规则] -> [操作-添加]', '{\"pid\":\"179\",\"title\":\"\\u6570\\u636e\\u7edf\\u8ba1\",\"name\":\"MonitorData\\/statistic\",\"icon\":\"\",\"status\":\"1\",\"auth_open\":\"1\",\"sort\":\"50\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691132),
(273, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691136),
(274, 1, 'admin', '/admin/auth/adminrule.html?ref=tab', '[权限管理] -> [菜单规则]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691139),
(275, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691140),
(276, 1, 'admin', '/admin/monitor_data/statistic.html', '[监控数据] -> [数据统计]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691143),
(277, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691151),
(278, 1, 'admin', '/admin/auth/ruleadd.html?id=179', '[权限管理] -> [菜单规则] -> [操作-添加]', '{\"id\":\"179\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691159),
(279, 1, 'admin', '/admin/auth/ruleadd.html', '[权限管理] -> [菜单规则] -> [操作-添加]', '{\"pid\":\"179\",\"title\":\"\\u6570\\u636e\\u5217\\u8868\",\"name\":\"MonitorData\\/list\",\"icon\":\"\",\"status\":\"1\",\"auth_open\":\"1\",\"sort\":\"50\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691175),
(280, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691179),
(281, 1, 'admin', '/admin/auth/adminrule.html?ref=tab', '[权限管理] -> [菜单规则]', '{\"ref\":\"tab\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691184),
(282, 1, 'admin', '/admin/auth/adminrule.html', '[权限管理] -> [菜单规则]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691185),
(283, 1, 'admin', '/admin/monitor_data/statistic.html', '[监控数据] -> [数据统计]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691189),
(284, 1, 'admin', '/admin/monitor_data/list.html', '[监控数据] -> [数据列表]', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', 1560691191);

-- --------------------------------------------------------

--
-- 表的结构 `tp_ad_type`
--

CREATE TABLE `tp_ad_type` (
  `id` mediumint(8) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` mediumint(8) DEFAULT 50 COMMENT '排序',
  `status` int(1) DEFAULT 0 COMMENT '状态',
  `create_time` int(11) DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) DEFAULT 0 COMMENT '修改时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='广告位表';

--
-- 转存表中的数据 `tp_ad_type`
--

INSERT INTO `tp_ad_type` (`id`, `name`, `description`, `sort`, `status`, `create_time`, `update_time`) VALUES
(1, '【首页】顶部通栏', '导航下的焦点图', 1, 1, 0, 1551936878),
(2, '【内页】顶部通栏', '内页顶部通栏', 2, 1, 0, 1551936840);

-- --------------------------------------------------------

--
-- 表的结构 `tp_article`
--

CREATE TABLE `tp_article` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'ID',
  `cate_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '栏目',
  `title` varchar(70) NOT NULL DEFAULT '' COMMENT '标题',
  `title_style` varchar(225) NOT NULL DEFAULT '' COMMENT '标题样式',
  `thumb` varchar(225) NOT NULL DEFAULT '' COMMENT '缩略图',
  `keywords` varchar(80) NOT NULL DEFAULT '' COMMENT '关键词',
  `description` mediumtext NOT NULL COMMENT 'SEO简介',
  `content` text NOT NULL COMMENT '内容',
  `template` varchar(80) NOT NULL DEFAULT '' COMMENT '模板',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 100 COMMENT '排序',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击次数',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `image` varchar(80) NOT NULL DEFAULT '' COMMENT '缩略图',
  `images` mediumtext NOT NULL COMMENT '图片集',
  `download` varchar(80) NOT NULL DEFAULT '' COMMENT '文件下载',
  `author` varchar(50) NOT NULL DEFAULT 'Admin' COMMENT '作者',
  `source` varchar(255) NOT NULL DEFAULT '' COMMENT '来源',
  `summary` text NOT NULL COMMENT '摘要'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章模型表';

--
-- 转存表中的数据 `tp_article`
--

INSERT INTO `tp_article` (`id`, `cate_id`, `title`, `title_style`, `thumb`, `keywords`, `description`, `content`, `template`, `status`, `sort`, `hits`, `create_time`, `update_time`, `image`, `images`, `download`, `author`, `source`, `summary`) VALUES
(5, 9, 'PHP是什么', '', '', '', '', '<p>PHP（外文名:PHP: Hypertext Preprocessor，中文名：“超文本预处理器”）是一种通用开源脚本语言。语法吸收了C语言、Java和Perl的特点，利于学习，使用广泛，主要适用于Web开发领域。</p><p>用PHP做出的动态页面与其他的编程语言相比，PHP是将程序嵌入到HTML（标准通用标记语言下的一个应用）文档中去执行，执行效率比完全生成HTML标记的CGI要高许多；PHP还可以执行编译后代码，编译可以达到加密和优化代码运行，使代码运行更快。</p><p>全球市场分析</p><p>目前PHP在全球网页市场、手机网页市场还有为手机提供API（程序接口）排名第一。</p><p>在中国微信开发大量使用PHP来进行开发。</p><p>北京、上海的用人需求</p><p style=\"text-align: center;\">上海2016年11月份中某一天用人低峰的招聘量：</p><p style=\"text-align: center;\"><img src=\"/uploads/ueditor/image/20181224/1545620471.png\" title=\"1545620471.png\" alt=\"2.png\"/></p><p><br/></p><p style=\"text-align: center;\">北京2016年11月份中某一天用人低峰的招聘量：</p><p><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/ueditor/image/20181224/1545620478.png\" title=\"1545620478.png\" alt=\"1.png\"/></p>', '', 1, 100, 52, 1540451280, 0, '/uploads/20181224/fc3112ab0fab9f255726674dc1fd0d17.jpg', '[{\"image\":\"\\/uploads\\/20181025\\/0138d7987d3e56758ab4d49c57002401.jpg\",\"title\":\"3.jpg\"}]', '', '未知', 'php中文网', 'PHP（外文名:PHP: Hypertext Preprocessor，中文名：“超文本预处理器”）是一种通用开源脚本语言。语法吸收了C语言、Java和Perl的特点，利于学习，使用广泛，主要适用于Web开发领域。'),
(4, 9, '为什么学习PHP？', '', '', '', '', '<p>回答本书的几个问题吧。你到底，为什么要学习PHP？</p><p>全国都缺PHP人才，非常好就业，PHP现在的工资水平很高，刚毕业可以拿到5000-9000每个月，特别优秀还可以破万。并且有非常多的就业机会。</p><p>PHP入门简单，学习入门易入手。</p><p>很多人反馈上完大学的C语言课程、java课程不会写任何东西。<br/>诚然，中国的大学都以C语言作为主要的入门语言。但是，我们认为PHP是最简单入门，也是最合适入门的语言。</p><p>你将学习到编程的思路，更加程序化的去处理问题。处理问题，将会更加规范化。</p><p>如果你要创业，如果你要与互联网人沟通。未来互联网、移动互联网、信息化将会进一步围绕在你身边。你需要与人沟通，与人打交道。</p><p>还有机会进入BAT（百度、阿里、腾讯），BAT这些企业他们在用PHP。国内和国外超一线的互联网公司，在超过90%在使用PHP来做手机API或者是网站。连微信等开放平台中的公众号的服务端也可以使用到PHP。</p><p>大并发，还能免费。一天1个亿的访问量怎么办？PHP拥有大量优秀的开发者，在一定数据量的情况下完全能满足你的需求。国内外一线的互联网公司，很多将自己的大并发方案进行开源了。你可以免费获得很多成熟的、免费的、开源的大并发解决方案。</p><p>开源更加节约成本也更加安全。windows很多都要收取授权费用，而使用linux的LAMP架构或者LNMP架构会更加安全。全球的黑客在帮你找漏洞。全球的工程师在帮忙修复漏洞。你发现一个他人已经消灭10个。</p>', '', 1, 100, 0, 1539850020, 0, '/uploads/20181224/168eb2135c7abbc3f2efcad91c7106e3.jpg', '', '', '未知', 'php中文网', '回答本书的几个问题吧。你到底，为什么要学习PHP？\r\n全国都缺PHP人才，非常好就业，PHP现在的工资水平很高，刚毕业可以拿到5000-9000每个月，特别优秀还可以破万。并且有非常多的就业机会。'),
(6, 9, '零基础也能学习', '', '', '', '', '<p>学习PHP前很多人担心PHP是不是能真的学会。</p><p>学习PHP学历要求不高，数学水平要求也不高，只需要会下面这些，你就可以跟着PHP中文网，开始愉快、高薪的PHP学习之旅：</p><p>有一台电脑</p><p>初中及以上文化水平</p><p>必须会打字（五笔、拼音均可）</p><p>会word（微软的office办公软件中的文字编辑软件）</p><p>会上网（QQ，写邮件，玩微信，看小说，看电影，注册网站帐号，网上购物等）</p><p>有一颗坚持的心</p><p>如果会一点html就更好了.学习HTML可以去看我们开源的另外一本HTML入门书籍。</p><p>不会HTML怎么办？也可以学习我们免费的HTML入门视频。</p>', '', 1, 100, 0, 1540452240, 0, '/uploads/20181224/894485902f96b13551b5450c7ddca081.jpg', '', '', '未知', 'php中文网', '学习PHP前很多人担心PHP是不是能真的学会。\r\n\r\n学习PHP学历要求不高，数学水平要求也不高，只需要会下面这些，你就可以跟着PHP中文网，开始愉快、高薪的PHP学习之旅：\r\n有一台电脑'),
(7, 9, '为什么有些人学不会', '', '', '', '', '<p>互联网进入到人们生活中的方方面面了，世界首富比尔盖茨多次提到青少年编程，而编程是一种思维习惯的转化。</p><p>作为写了10几年程序的人，我听到过一些说编程不好学的抱怨。</p><p>从目前见到的数据统计，主要是因为在大学学习时遇到了C语言，学完后还不知道能干什么。很多人大学上完也就这么糊涂、恐惧的就过来了。</p><p>只有很少的不到1%的人学不会，这部份往往是专业的艺术家，在艺术家里面极少一部份人外，他们的思维模式和我们遇到的大多数人不太一样，并且不进行编程思维的训练，所以学不会。</p><p>而造成这个原因主要是因为社会、文化、背景、生活圈子多方面造成的。而不是因为笨。</p><p>那我们绝大多数的人是哪些原因学不会的呢？</p><p>1. 不相信自己能学会</p><p>这一块很多人可能不相信，涉及到很深的心理学知识。与心理暗示、诅咒的原理一样。</p><p>如果不相信自己能够学好，心里潜意识的念头里如果总是：PHP很难，我学不会。那么这个人肯定很难学会。</p><p>把不相信自己能学会的负面情绪和观念给抛掉。</p><p>只要你每天练习代码并相信自己。你肯定能学会，并且能学得很好，代码写的很成功，成为大牛！</p><p>2. 懒</p><p>人的天性有善有恶，而学不好程序的人，身上的一个通病，只有一个字就是————懒！<br/>基本语法，需要去背<br/>函数需要去默写</p><p>3. 自以为是</p><p>一看就会，一写就错。以为自己是神童。</p><p>4. 英文单词</p><p>计算机里面常用的英文单词就那么一些。</p><p>不要找英语的借口。本书会把英语单词都会跟你标注出来。看到不会的，就去翻一翻。</p><p>5. 不坚持</p><p>学着学着就放弃了。</p><p>6. 不去提问，不会提问，不去思考</p><p>解决问题前，先去搜索</p><p>搜索解决不了再去提问</p><p>PHP学院为大家准备了视频，也为大家准备了问答中心。</p><p>大多数的人，不把问题详述清楚，不把错误代码贴完整。</p><p>张嘴就来提问。我想神仙也不知道你的问题是什么吧？问题发出来前。换位思考一下自己看不看得懂这个问题。</p><p>7. 你还需要自我鼓励</p><p>在学习过程中，你会否定自己。其实任何人都会。大多数人都会遇到跟你一样的困难。只不过他们在克服困难，而一些人在逃避困难。</p><p>学累的时候，放松一会儿。再去多读几遍。不断的告诉自己，你就是最棒的！</p><p>学会交流和倾诉而非抱怨，并且不断的自我鼓励</p>', '', 1, 100, 25, 1540452720, 0, '/uploads/20181224/b640f82ccf862c3b34e11f792220a1f5.jpg', '', '', '未知', 'php中文网', '互联网进入到人们生活中的方方面面了，世界首富比尔盖茨多次提到青少年编程，而编程是一种思维习惯的转化。\r\n作为写了10几年程序的人，我听到过一些说编程不好学的抱怨。'),
(8, 9, '开发环境是什么？', '', '', '', '', '<p>PHP是一门开发语言。而开发语言写出来的代码，通常需要在指定的软件下才能运行。因此，我们写好的代码需要（运行）显示出来看到，就需要安装这几个软件来运行代码。</p><p>我们把运行我们写代码的几个软件和运行代码的软件统一都可称为开发环境。</p><p>新手学习前常遇到的环境问题</p><p>很多朋友最开始学习的时候，听说某个环境好就安装某些软件。由于缺乏相关知识，所以没有主见。陷入人云即云的怪圈里。今天换这个，明天换那个。</p><p>当前验证真理的唯一标准，请始终保证一点：</p><p>环境能满足你的学习需求。不要在环境上面反复纠结，耽误宝贵的学习时间。</p><p>我们认为环境只要能满足学习要求即可。等学会了后，再去着磨一些更加复杂的互联网线上的、生产环境中的具体配置。</p>', '', 1, 100, 210, 1540605000, 0, '/uploads/20181224/a11e9ab3e8dc289dca70a105a7f177ee.jpg', '[{\"image\":\"\\/uploads\\/20181026\\/c90a371acbfc377a3ebb781b9e6c22af.jpg\",\"title\":\"4.jpg\"},{\"image\":\"\\/uploads\\/20181026\\/02afd01ca8661ce5ec14d60abd48673d.jpg\",\"title\":\"3.jpg\"}]', '', '未知', 'php中文网', 'PHP是一门开发语言。而开发语言写出来的代码，通常需要在指定的软件下才能运行。因此，我们写好的代码需要（运行）显示出来看到，就需要安装这几个软件来运行代码。'),
(9, 9, 'windows环境安装', '', '', '', '', '<p>所谓服务器：不要把它想的太过于高深，不过就是提供一项特殊功能（服务）的电脑而已。</p><p>显示网页的叫网页(web)服务器（server）。</p><p>帮我们代为收发电子邮件(Email)的服务器叫邮件服务器。</p><p>帮我们把各个游戏玩家连接在一起的叫游戏服务器。</p><p>帮我们存储数据的叫数据库服务器</p><p>... ...等等</p><p>我们现在使用的一部手机的性能比10年前的一台电脑和服务器的性能还要强劲、给力。</p><p>而我们的学习过程当中完全可以把自己使用的这一台windows电脑作为服务器来使用。</p><p>原来如此，一讲就通了吧？</p><p>我们大多数人使用的电脑通常是windows操作系统的电脑。而我们的讲解主要在windows电脑上进行。</p><p>你不需要去理解所谓高深的电脑知识、操作系统原型等。在这一章节当中，你只需要会安装QQ、杀毒软件一样，点击：下一步、下一步即可完成本章的学习。</p><p>在最开始学习时，我们强烈建议初学者使用集成环境包进行安装。</p><p>什么是集成环境包？</p><p>我们学习PHP要安装的东西有很多。例如：网页服务器、数据库服务器和PHP语言核心的解释器。</p><p>我们可以分开安装各部份，也可以合在一起安装一个集成好的软件。</p><p>将这些合在一起的一个软件我们就叫作：集成环境包。</p><p>这个过程需要修改很多配置文件才能完成。并且每个人的电脑情况，权限，经常容易操作出错。</p><p>很容易因为环境问题影响到心情，我们的学习计划在初期非常绝对化：</p><p>请使用集成环境包完成最开始的学习。</p><p>等你学好PHP NB后，你爱用啥用啥，网上成堆的文章教你配置各种环境。</p><p>选用什么样的集成环境包？</p><p>集成环境包比较多。以下的这些全是各种英文名。只不过代表的是不同集成环境包的名字，不用去深纠。如下所示：</p><p>AppServ</p><p>PHPStudy</p><p>APMserv</p><p>XAMPP</p><p>WAMPServer<br/>... ...等等</p><p>对于我们才入门的学习者来说，选择集成环境包的原则：</p><p>更新快，版本比较新</p><p>操作简单易于上手</p><p>选择项不要过多</p><p>因此，我们下面使用的集成环境包是：PHPstudy。当然，如果你对此块很熟悉了，也可以自行选择选择集成环境包。</p><p>可以以在官方网址下载：<br/>http://www.phpstudy.net/&nbsp;</p><p>也可以在百度中搜索：*PHPstudy *&nbsp;&nbsp;这个5个字文字母进行下载。</p><p>对学习PHP的新手来说，WINDOWS下PHP环境配置是一件很困难的事，就是老手也是一件烦琐的事。因此，无论你是新手还是老手，phpStudy 2016都是一个不错的选择，该程序集成Apache+PHP+MySQL+phpMyAdmin+ZendOptimizer，最新版本已集成最新的&nbsp;PHP7。</p>', '', 1, 100, 22, 1544593260, 0, '/uploads/20181224/f5421f965b0f46d9c1b8f1a927df7894.jpg', '', '', '未知', 'php中文网', '所谓服务器：不要把它想的太过于高深，不过就是提供一项特殊功能（服务）的电脑而已。\r\n显示网页的叫网页(web)服务器（server）。'),
(13, 9, 'php中的变量－读过初中你就会变量', '', '', '', '', '<p>大家在读初中的时候呀。老师经常会这么教大家。</p><p>请问，李磊和韩梅梅同学，假如：</p><p>x&nbsp;=&nbsp;5<br/>y&nbsp;=&nbsp;6<br/></p><p>那么x + y 等于多少呢？大家会义无反顾的回答。x + y 等于11。</p><p>接下来我们看下面的初中的数学知识，请问x + y 的结果是多少？</p><p>x&nbsp;=&nbsp;5<br/>y&nbsp;=&nbsp;6<br/>x&nbsp;＝&nbsp;8<br/></p><p>我估计大家也会义无反顾的回答：x + y 的结果为14。</p><p>这就是变量！</p><p>变量的几个特点：</p><p>1.x = 5 将右边值5，赋值给左边的x</p><p>2.第二段x ＝ 8，最后x + y 的结果等于14，说明x在从上到下的运算（执行）中，可以被重新赋值。</p><p>我们在PHP中的变量也是如此。不过有几个特点：</p><p>1.必须要以$开始。如变量x必须要写成$x</p><p>2.变量的首字母不能以数字开始</p><p>3.变量的名字区分大小写</p><p>4.变量不要用特殊符号、中文，_不算特殊符号</p><p>5.变量命名要有意义（别写xxx，aaa，ccc这种 变量名）</p><p>错误举列：</p><p>错误：变量以数字开始</p><p>&lt;?php<br/>$123&nbsp;=&nbsp;345;<br/>?&gt;<br/></p><p>错误：变量中有特殊字符，中文</p><p>&lt;?php<br/>//$a*d&nbsp;=&nbsp;345;<br/><br/>//$中国&nbsp;=&nbsp;123;<br/>?&gt;<br/></p><p>错误：变量命名没有意义aaa容易数错，也没有含意</p><p>&lt;?php<br/>$aaaaaaa&nbsp;=&nbsp;345;<br/>?&gt;<br/></p><p>错误：变量严格区分大小写 $dog 和 $Dog是PHP学院的变量,尝试将$dog的值改为8.结果D写成了大写。</p><p>&lt;?php<br/>$dog&nbsp;=&nbsp;5;<br/>//重新修改$dog的值，将$dog改为8<br/>$Dog&nbsp;=&nbsp;8;<br/>?&gt;<br/></p><p>正确举例：</p><p>正确：变量不能以数字开始,但是数字可以夹在变量名中间和结尾</p><p>&lt;?php<br/>$iphone6&nbsp;=&nbsp;5880;<br/>$iphone6plus&nbsp;=&nbsp;6088;<br/>?&gt;<br/></p><p>正确：变量不能有特殊符号，但是_(下划线不算特殊符号)</p><p>&lt;?php<br/>$_cup&nbsp;=&nbsp;123;<br/>?&gt;<br/></p><p>注：你会发现代码是从上向下执行的。</p><p>$ 叫作美元符，英文单词：dollar。PHP的变量必须以美元符开始。说明搞PHP有“钱”途。</p><p>dollar<br/>读音：[&#39;dɒlə(r)]<br/>解释：美元</p><p><br/></p>', '', 1, 100, 6, 1545620940, 0, '', '', '', '未知', 'php中文网', '大家在读初中的时候呀。老师经常会这么教大家。\r\n请问，李磊和韩梅梅同学，假如：'),
(10, 9, 'Linux环境安装', '', '', '', '', '<p>这一个章节是本书中永远不会写的一个章节，很多人被一些市面上的书籍误导，认为学习PHP前要学习Linux。结果，一看Linux，就对人生和学习失去了希望。我们作为有过10年以上开发经验和内部训经验的专业人士告戒各位：</p><p>Linux学习与PHP学习没有必然的联系，这是两个不同的知识体系。</p><p>作为有多年开发经验和教学经验的我们。</p><p>我们强烈不建议没有接触过Linux的学生，为了学习PHP而去安装Linux环境</p><p>如果您有经验，我们相信你一定能解决，如果解决不了。</p><p>请加QQ群和访问官网：PHP中文网&nbsp;学习视频和提问。</p>', '', 1, 100, 0, 1545620820, 0, '/uploads/20181224/5cd61fb68c8bc8fe6d24be4229ec0ca5.jpg', '', '', '未知', 'php中文网', '这一个章节是本书中永远不会写的一个章节，很多人被一些市面上的书籍误导，认为学习PHP前要学习Linux。结果，一看Linux，就对人生和学习失去了希望。我们作为有过10年以上开发经验和内部训经验的专业人士告戒各位：'),
(11, 9, '其他开发环境', '', '', '', '', '<p>对本章不感兴趣，可以略过，只是介绍和说明。</p><p>其他开发环境有很多：</p><p>1，比如 苹果电脑的系统 Mac os</p><p>2，比如 &nbsp;在线环境（你使用了百度、新浪、阿里等云计算环境）</p><p>3，其他更多... ...</p><p>当然，你甚至可以使用安卓手机和苹果手机来部署你的开发环境。就像有些人可以在各种复杂的环境，甚至U衣酷的试衣间里M..L。我想，这应该不是正常人类该进行的尝试吧。</p><p>如果你在使用这些环境遇到了问题，相信你已经有过一定的开发经验和处理问题的经验了，这不是刚开始学习编程该掌握的内容。</p><p>但是，如果你真遇到了这些问题。你可以上PHP中文网来提问。</p>', '', 1, 100, 0, 1545620880, 0, '', '', '', '未知', 'php中文网', '对本章不感兴趣，可以略过，只是介绍和说明。\r\n其他开发环境有很多：\r\n1，比如 苹果电脑的系统 Mac os\r\n2，比如  在线环境（你使用了百度、新浪、阿里等云计算环境）\r\n3，其他更多... ...'),
(12, 9, '写代码的工具选择', '', '', '', '', '<p>写代码的工具有很多。对于刚开始学习PHP的朋友来说。选择工具有几个原则：</p><p>1，不要使用带自动提示的工具（例如eclipse、zend studio等PHP开发工具集）</p><p>2，写完的代码必须要有颜色高亮显示。（不能使用：txt文本编辑器等无代码颜色显示的编辑器）</p><p>你可能想问，为什么呀？</p><p>我们发现电视、电影和现实生活中的编程高手，噼里哗啦就写一堆代码，一点都不报错，点击就能运行。而我们对着他们的代码抄袭反倒抄错。这种感觉特别不好！！！</p><p>——传说中的这些高手，他们都曾经在基础代码上反复练习过，所以他们不会写错。</p><p>而我们需要高手之境界，在学习初期就不能使用先进的工具。这样会浪费我们保贵的练习代码的机会、调试错误的机会。</p><p>因为先进的编辑器通常有很多先进的功能，例如：</p><p>代码自动显示错误</p><p>代码自动换行</p><p>这些先进的工具，对于开始入门学习的你，不利于新手产生独立解决问题的能力！</p><p>推荐的开发工具</p><p>1. NotePad++&nbsp;</p><p>https://notepad-plus-plus.org/&nbsp;由于某些不可抗的原因，请使用百度搜索NotePad++&nbsp;</p><p>2.phpstorm（强烈推荐）</p><p>https://www.jetbrains.com/phpstorm/&nbsp;</p><p>这些工具，你只需要下载下来，一直点击下一步，安装到你的电脑上即可。</p>', '', 1, 100, 2, 1545620880, 0, '', '', '', '未知', 'php中文网', '写代码的工具有很多。对于刚开始学习PHP的朋友来说。选择工具有几个原则：\r\n1，不要使用带自动提示的工具（例如eclipse、zend studio等PHP开发工具集）\r\n2，写完的代码必须要有颜色高亮显示。（不能使用：txt文本编辑器等无代码颜色显示的编辑器）'),
(14, 9, 'echo 显示命令', '', '', '', '', '<p>echo 是在PHP里面最常用的一个输出、显示功能的命令。</p><p>我们可以让他显示任何可见的字符。</p><p>&lt;?php<br/><br/>echo&nbsp;123;<br/><br/>?&gt;<br/>&lt;?php<br/><br/>$iphone&nbsp;=&nbsp;6088;<br/><br/>echo&nbsp;$iphone;<br/><br/>?&gt;<br/></p><p>你可以对着做做实验。等下一章，我们讲数据类型的时候，我教大家输出中文和用PHP显示网页内容。</p><p>单词：</p><p>*echo *&nbsp;读音： [&#39;ekoʊ]<br/>解释：发出回声；回响。<br/>功能解释：输出、显示</p>', '', 1, 100, 0, 1545621000, 0, '', '', '', '未知', 'php中文网', 'echo 是在PHP里面最常用的一个输出、显示功能的命令。\r\n我们可以让他显示任何可见的字符。'),
(15, 9, 'php注释的学习', '', '', '', '', '<p>注释的功能很强大</p><p>所谓注释，汉语解释可以为：注解。更为准确一些。<br/>因为代码是英文的、并且代码很长，时间长了人会忘。<br/>所以我们会加上注释。</p><p>注释的功能有很多：</p><p>&nbsp;&nbsp;&nbsp;&nbsp;1.对重点进行标注</p><p>&nbsp;&nbsp;&nbsp;&nbsp;2.时间长了容易忘快速回忆，方便查找</p><p>&nbsp;&nbsp;&nbsp;&nbsp;3.让其他人看的时候快速看懂</p><p>&nbsp;&nbsp;&nbsp;&nbsp;4.还可以生成文档，代码写完相关的文档就写完了，提高工作效率</p><p>&nbsp;&nbsp;&nbsp;&nbsp;5.注释、空行、回车之后的代码看起来更优美</p><p>&nbsp;&nbsp;&nbsp;&nbsp;6.注释可用来排错。不确定代码中哪一块写错了，可以将一大段注释，确定错误区间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;7.注释中间的部份的内容，电脑不会执行它</p><p>先给大家看看我们觉得优美的代码，整齐、规范、说明清楚、一看就懂。（不需要理解代码的含义）：</p><p><br/></p><p>再看看我们眼中觉得丑陋的代码，对齐丑陋不说，并且没有功能说明（不需要理解代码的含义）：</p><p><br/></p><p>我们了解了注释的好处，接下来我们来说PHP的注释，注释分别：</p><p>单行注释（只注释一行）</p><p>多行注释（注释多行）</p><p>单行注释</p><p>//&nbsp;&nbsp;&nbsp;表示单行注释<br/>#&nbsp;&nbsp;&nbsp;&nbsp;#号也表示单行注释，用的比较少<br/></p><p>多行注释</p><p>/*&nbsp;<br/>多行注释&nbsp;这里是注释区域代码<br/>&nbsp;*/<br/></p><p>单行注释举例：</p><p>&lt;?php<br/><br/>//声明一部iphone6手机的价格变量<br/>$iphone6_price&nbsp;=&nbsp;6088;<br/><br/>//显示输出手机价格<br/>echo&nbsp;$iphone6_price;<br/>?&gt;<br/></p><p>注：通过上例我们知道，注释通常写代码上面。</p><p>多行注释举例：</p><p>&lt;?php<br/>/*<br/>作者：PHP中文网<br/>时间：2048.12.23<br/>功能：这是一个假的多行注释的例子<br/>*/<br/><br/>/*<br/>&nbsp;&nbsp;声明一个爱情变量<br/>&nbsp;&nbsp;$love&nbsp;是指爱情<br/>&nbsp;&nbsp;爱情是一个变量，因为人的爱总是在发生变化<br/>&nbsp;&nbsp;所以，爱情变量的值为250<br/>*/<br/>$love&nbsp;=&nbsp;250;<br/><br/>?&gt;<br/></p><p>注：通过上面的例子我们发现，我们要写上很多注释的时候，释用多行注释。</p><p>注：暂进不讲解如何通过专门的工具生成注释</p><p><br/></p>', '', 1, 100, 3, 1545621060, 0, '/uploads/20181224/2d208c7893a9981a6216b83ef9fcb11f.jpg', '', '', '', '', '注释的功能很强大\r\n所谓注释，汉语解释可以为：注解。更为准确一些。\r\n因为代码是英文的、并且代码很长，时间长了人会忘。'),
(16, 9, 'php整型就是整数', '', '', '', '', '<p>我&nbsp; &nbsp;一直在讲，不要被名词的含义所吓唬住。</p><p>到底什么是整型呀？</p><p>所谓整型，就是大家数学中所学的整数。</p><p>整型——整数也，英文称之:integer。英文简写：int</p><p>整型分为：</p><p>&nbsp;&nbsp;&nbsp;&nbsp;1.10进行</p><p>&nbsp;&nbsp;&nbsp;&nbsp;2.8进制 （了解，基本不用）</p><p>&nbsp;&nbsp;&nbsp;&nbsp;3.16进制（了解，基本不用）</p><p>整型（整数）在计算机里面是有最大值和最小值范围的。</p><p>【了解知识点，开发中不常用】大家经常听说32位计算机，也就是32位计算机一次运算处理的最大范围为-232至232-1。<br>64位计算机呢？——</p><p>10 进制声明：</p><p>&lt;?php<br>//为了方便大家记忆和前期学习，英文不好的朋友也可用拼音来声明变量。以后再用英文来声明变量也无所谓<br>//声明变量&nbsp;整数，英文&nbsp;int<br>//$int&nbsp;=&nbsp;1000;<br>$zhengshu&nbsp;=&nbsp;1000;<br>echo&nbsp;$zhengshu;<br>?&gt;<br></p><p>8进制声明：&nbsp;以0开始，后面跟0-7的整数（了解知识点）</p><p>&lt;?php<br>//8进制的取值范围最大为0-7,即0,1,2,3,4,5,6,7<br><br>$bajingzhi&nbsp;=&nbsp;&nbsp;033145;<br>echo&nbsp;$bajingzhi;<br><br>?&gt;<br></p><p>16进制声明：&nbsp;以0x开始，后面跟0-f的，0x的abcdef不区分大小写。（了解知识点）</p><p>&lt;?php<br>//16进制的取值范围最大为0-f,即0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f<br>$shiliu&nbsp;=&nbsp;&nbsp;0x6ff;<br>echo&nbsp;$shiliu;<br>?&gt;<br></p><p>本章学习重点，学会如何声明10制制整数即可。了解8制制和16进制的声明，实在不会也不要紧。</p><p>思维误区：容易去考虑8进制和16进制到底是怎么产生的。</p><p><br></p>', '', 1, 100, 5, 1545621120, 0, '/uploads/20181224/588ac2b0eca6de73b61c125db692e020.jpg', '', '', '未知', 'php中文网', '我一直在讲，不要被名词的含义所吓唬住。\r\n到底什么是整型呀？\r\n所谓整型，就是大家数学中所学的整数。'),
(17, 13, 'PHP中的流程控制', '', '', '', '', '<p>流程控制就是人类社会的做事和思考和处理问题的方式和方法。通过本章，你将会发现采用计算机的思维去考虑问题，我们在做事的过程当中会更加严谨。</p><p>我们通过一个一个的场景来去推理流程：</p><p>有一个高富帅，他姓王。他的名字叫——王。王同学计划要投资一个项目。如果这个项目计划开始，为了这个投资项目每周往返一次北京和大连。什么时候王思总同学不再往返呢？项目失败后或者万（da）集团临时除知除外，他就可以不再这么每周往返了。</p><p>王同学呢，有一个好习惯，就是每次往返的时候，害怕自己到底一年往返了多少次。王同学都会在自己的记事本上记上往返的次数，第一次就写上一，第2次就写上2... ...直至最后项目停止。</p><p>王同学家里头特别有钱，所以他的行程方式和正常人的又有些不同。不仅有更多的方式，而且王同学还迷信。</p><p>他的出行方式呢有6种，如下：</p><p>1，司机开车<br/>2，民航<br/>3，自己家的专机<br/>4，火车动车<br/>5，骑马<br/>6，游轮</p><p>每次王同学，都自己会在骰子上写上1，2，3，4，5，6。摇到哪种方式，王同学就会采用哪种方式进行往返两地。</p><p>并且呢，王同学是生活极度充满娱乐化和享受生活的人。他抵达北京或者大连的时候不同，他抵达后做的事情都不同，如下：</p><p>半夜到达，先去夜店参加假面舞会<br/>早上抵达，爱在酒店泡个澡<br/>中午到达，会吃上一份神户牛肉<br/>晚上到达，总爱去找朋友去述说一下心中的寂寞</p><p>王同学在出行和项目中也是极度有计划性。他给自己的生活秘书和工作秘书分别指派了出差的行程：</p><p>生活上：<br/>先查天气，下雨带雨具和毛巾。不下雨要带防晒霜<br/>雨具、毛巾和防晒霜的情况要提前检查，如果没有要及时买</p><p>工作上：<br/>要提前沟通去大连前的工作计划，准备好了要及时检查，检查合格，要提前打印现来。<br/>及时没有及时准备好的情况下，要列出主要的项目沟通议题。</p>', '', 1, 100, 0, 1545628260, 0, '', '', '', '未知', 'php中文网', '流程控制就是人类社会的做事和思考和处理问题的方式和方法。通过本章，你将会发现采用计算机的思维去考虑问题，我们在做事的过程当中会更加严谨。我们通过一个一个的场景来去推理流程：'),
(18, 13, 'php流程控制之if条件结构流程', '', '', '', '', '<p>if条件结构流程</p><p>if和else 语句，在之前的3.2.5章节中已经做了说明。我们配合王思总同学的例子，再次进行说明，方便大家对此章节的理解。</p><p>本章的知识点为：【默写级】</p><p>基本语法，不能有半点马乎，完全是语法规范规定的，不这么写就错！</p><p>&lt;?php&nbsp;<br/>$week=date(&quot;4&quot;);<br/>//判断星期小于6，则输出：还没到周末，继续上班.....<br/>if&nbsp;($week&lt;&quot;6&quot;)&nbsp;{<br/>&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;&quot;还没到周末，继续上班.....&quot;;<br/>}&nbsp;<br/>?&gt;<br/></p><p>在之前我们也讲过，因此if的结构可以根据人类思维推理出来两种结构：</p><p>//if单行判断<br/>if(布尔值判断)<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;只写一句话;<br/>后续代码<br/>//if多行判断<br/>if(布尔值判断){<br/>&nbsp;&nbsp;&nbsp;&nbsp;可以写多句话;<br/>}<br/>后续代码<br/></p><p><br/></p>', '', 1, 100, 0, 1545628260, 0, '', '', '', '未知', 'php中文网', 'if条件结构流程\r\nif和else 语句，在之前的3.2.5章节中已经做了说明。我们配合王思总同学的例子，再次进行说明，方便大家对此章节的理解。\r\n本章的知识点为：【默写级】'),
(19, 13, 'PHP流程控制之if语句', '', '', '', '', '<p>我们为了加强大家对代码的理解，我们串了一个故事恶搞了一个王思总同学。</p><p>在4.1和3.2.5这两个章节中我们都介绍到了if和if...else结构。并且我们讲解的很清楚。</p><p>我们现在来用if...else结构来写一个小东西，加强大家对逻辑的理解。</p><p>我们配合之前的知识点来写一个计算器：</p><p>&lt;form&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&lt;input&nbsp;type=&quot;text&quot;&nbsp;name=&quot;num1&quot;&gt;<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&lt;select&nbsp;name=&quot;fh&quot;&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;option&nbsp;value=&quot;jia&quot;&gt;&nbsp;+&nbsp;&lt;/option&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;option&nbsp;value=&quot;jian&quot;&gt;&nbsp;-&nbsp;&lt;/option&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;option&nbsp;value=&quot;c&quot;&gt;&nbsp;x&nbsp;&lt;/option&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;option&nbsp;value=&quot;chu&quot;&gt;&nbsp;/&nbsp;&lt;/option&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;option&nbsp;value=&quot;qy&quot;&gt;&nbsp;%&nbsp;&lt;/option&gt;<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&lt;/select&gt;<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&lt;input&nbsp;type=&quot;text&quot;&nbsp;name=&quot;num2&quot;&gt;<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&lt;input&nbsp;type=&quot;submit&quot;&nbsp;value=&quot;运算&quot;&nbsp;/&gt;<br/><br/><br/>&lt;/form&gt;<br/><br/>&lt;?php<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;$num1&nbsp;=&nbsp;$_GET[&#39;num1&#39;];<br/>&nbsp;&nbsp;&nbsp;&nbsp;$num2&nbsp;=&nbsp;$_GET[&#39;num2&#39;];<br/>&nbsp;&nbsp;&nbsp;&nbsp;$fh&nbsp;=&nbsp;$_GET[&#39;fh&#39;];<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;if(!is_numeric($num1)&nbsp;||&nbsp;!is_numeric($num2)){<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;&#39;请输入数值类型&#39;;<br/>&nbsp;&nbsp;&nbsp;&nbsp;}<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;if($fh&nbsp;==&nbsp;&#39;jia&#39;){<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;$num1&nbsp;.&nbsp;&#39;+&#39;&nbsp;.&nbsp;$num2&nbsp;.&nbsp;&#39;=&#39;&nbsp;.&nbsp;($num1+$num2);<br/>&nbsp;&nbsp;&nbsp;&nbsp;}<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;if($fh==&#39;jian&#39;){<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;$num1&nbsp;.&nbsp;&#39;-&#39;&nbsp;.&nbsp;$num2&nbsp;.&nbsp;&#39;=&#39;&nbsp;.&nbsp;($num1-$num2);<br/>&nbsp;&nbsp;&nbsp;&nbsp;}<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;if($fh==&#39;c&#39;){<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;$num1&nbsp;.&nbsp;&#39;x&#39;&nbsp;.&nbsp;$num2&nbsp;.&nbsp;&#39;=&#39;&nbsp;.&nbsp;($num1*$num2);<br/>&nbsp;&nbsp;&nbsp;&nbsp;}<br/>&nbsp;&nbsp;&nbsp;&nbsp;if($fh==&#39;chu&#39;){<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;$num1&nbsp;.&nbsp;&#39;/&#39;&nbsp;.&nbsp;$num2&nbsp;.&nbsp;&#39;=&#39;&nbsp;.&nbsp;($num1/$num2);<br/>&nbsp;&nbsp;&nbsp;&nbsp;}<br/>&nbsp;&nbsp;&nbsp;&nbsp;if($fh==&#39;qy&#39;){<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;$num1&nbsp;.&nbsp;&#39;%&#39;&nbsp;.&nbsp;$num2&nbsp;.&nbsp;&#39;=&#39;&nbsp;.&nbsp;($num1%$num2);<br/>&nbsp;&nbsp;&nbsp;&nbsp;}<br/><br/>?&gt;<br/></p><p>作业：<br/>写一个平年、闰年计算器。写一个form表单，通过get将年份给传来过来，判断传进来的年份是否为数值类型。并且要求，如果是闰年就提示这是闰年，如果是平年就提示这一年是平年。</p><p>平年闰年规则：年份能被4整除，但是不能被100整除。 &nbsp;或者能被400整除，即为闰年，其他情况全为平年</p>', '', 1, 100, 11, 1545628320, 0, '', '', '', '未知', 'php中文网', '我们为了加强大家对代码的理解，我们串了一个故事恶搞了一个王思总同学。\r\n在4.1和3.2.5这两个章节中我们都介绍到了if和if...else结构。并且我们讲解的很清楚。\r\n我们现在来用if...else结构来写一个小东西，加强大家对逻辑的理解。'),
(20, 13, 'PHP流程控制之嵌套if...else...elseif结构', '', '', '', '', '<p>还记得本章开篇我们讲了一个王思总同学的例子：</p><p>王同学是生活极度充满娱乐化和享受生活的人。他抵达北京或者大连的时候做的事，他抵达后做的事情，如下：</p><p>半夜到达，先去夜店参加假面舞会<br/>&nbsp;早上抵达，爱在酒店泡个澡<br/>&nbsp;中午到达，会吃上一份神户牛肉<br/>&nbsp;晚上到达，总爱去找朋友去述说一下心中的寂寞</p><p>我们来了解一下他的语法规则【知识点要求：默写】</p><p>&lt;?php<br/>if（判断语句1）{<br/>&nbsp;&nbsp;&nbsp;&nbsp;执行语句体1<br/>}elseif(判断语句2){<br/>&nbsp;&nbsp;&nbsp;&nbsp;执行语句体2<br/>}else&nbsp;if(判断语句n){<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;执行语句体n<br/>}else{<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最后的else语句可选<br/>}<br/><br/>//后续代码<br/>?&gt;<br/></p><p>上述结构表示：<br/>如果判断语句1的值为真，则执行语句体 1。执行完成后进入后续代码段。<br/>否则转入后面的判断语句2（elsif），判断语句2若为真，则执行语句体 2。<br/>否则转入后面的判断语句n（elsif），判断语句2若为真，则执行语句体 n。<br/>如果均不匹配则执行else语句。这种循环嵌套可以不含else语句，即只含有if、elseif语句。</p><p>注：elseif()也可以写成else if()</p><p>我们把上面的代码用流程图的形式表示清楚就如下图了：<br/></p><p>我们可以把王思总同学的例子通过PHP代码表示出来，代码表示结果如下：</p><p>&lt;?php<br/>//定义一个随机变量，抵达时间,随机0点至23点<br/>$dida&nbsp;=&nbsp;rand(0,23);<br/><br/>if($dida&nbsp;&gt;&nbsp;6&nbsp;&amp;&amp;&nbsp;$dida&nbsp;&lt;&nbsp;10){<br/>&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;&#39;我爱泡澡&#39;;<br/>}else&nbsp;if($dida&nbsp;&gt;10&nbsp;&amp;&amp;&nbsp;$dida&nbsp;&lt;&nbsp;14){<br/>&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;&#39;吃神户牛肉&#39;;<br/>}else&nbsp;if($dida&nbsp;&gt;=19&nbsp;&amp;&amp;&nbsp;$dida&nbsp;&lt;&nbsp;22){<br/>&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;&#39;找一个朋友聊聊内心的寂寞&#39;;<br/>}elseif($dida&nbsp;&gt;&nbsp;22&nbsp;&amp;&amp;&nbsp;$dida&nbsp;&lt;=&nbsp;23){<br/>&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;&#39;泡澡&#39;;<br/><br/>}elseif($dida&nbsp;&gt;=&nbsp;1&nbsp;&amp;&amp;&nbsp;$dida&nbsp;&lt;3){<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;&#39;泡澡&#39;;<br/>}else{<br/>&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;&#39;睡觉或者工作&#39;;<br/>}<br/><br/><br/>?&gt;<br/></p><p>作业：<br/>写一个网页cj.html，向panduan.php页面以post方式提交分数段。分数段和显示的结果如下，要求如下：</p><p>0----60以下，不及格</p><p>60---70及格了，要努力</p><p>70---80 &nbsp;还不错</p><p>80---90 &nbsp; 上清华有希望</p><p>90---100 &nbsp; 你这辈子没希望了</p><p>100 &nbsp; &nbsp; &nbsp; &nbsp; 更没希望了</p><p>100分以上 &nbsp; &nbsp;爱因斯坦转世啊，思密达！</p><p>不是一个数值类型或者小于0 &nbsp;请输入正确的分数。</p>', '', 1, 100, 5, 1545628380, 0, '', '', '', '未知', 'php中文网', '还记得本章开篇我们讲了一个王思总同学的例子：\r\n王同学是生活极度充满娱乐化和享受生活的人。他抵达北京或者大连的时候做的事，他抵达后做的事情，如下：\r\n半夜到达，先去夜店参加假面舞会');

-- --------------------------------------------------------

--
-- 表的结构 `tp_auth_group`
--

CREATE TABLE `tp_auth_group` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `rules` text DEFAULT NULL,
  `create_time` int(11) DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) DEFAULT 0 COMMENT '修改时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_auth_group`
--

INSERT INTO `tp_auth_group` (`id`, `title`, `status`, `rules`, `create_time`, `update_time`) VALUES
(1, '超级管理员', 1, '0,1,4,5,38,107,126,108,157,158,159,160,161,162,163,165,164,176,178,177,6,7,10,11,12,14,13,8,15,16,17,18,19,20,21,9,22,23,24,25,28,27,26,29,', 1537944508, 1560687911),
(2, '各企业管理员', 1, '0,176,178,177,', 1536304526, 1560687841);

-- --------------------------------------------------------

--
-- 表的结构 `tp_auth_group_access`
--

CREATE TABLE `tp_auth_group_access` (
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  `create_time` int(11) DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) DEFAULT 0 COMMENT '修改时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_auth_group_access`
--

INSERT INTO `tp_auth_group_access` (`uid`, `group_id`, `create_time`, `update_time`) VALUES
(1, 1, 1553846932, 1553846932),
(2, 2, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tp_auth_rule`
--

CREATE TABLE `tp_auth_rule` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `pid` mediumint(8) NOT NULL DEFAULT 0 COMMENT '父栏目ID',
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `condition` char(100) NOT NULL DEFAULT '',
  `sort` mediumint(8) NOT NULL DEFAULT 0 COMMENT '排序',
  `auth_open` tinyint(2) DEFAULT 1,
  `icon` char(50) DEFAULT NULL,
  `create_time` int(11) DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) DEFAULT 0 COMMENT '修改时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_auth_rule`
--

INSERT INTO `tp_auth_rule` (`id`, `pid`, `name`, `title`, `type`, `status`, `condition`, `sort`, `auth_open`, `icon`, `create_time`, `update_time`) VALUES
(1, 0, 'System', '系统设置', 1, 1, '', 1, 1, 'fa fa-cogs', 1536819134, 1536819134),
(4, 1, 'System/system', '系统设置', 1, 1, '', 11, 1, 'fa fa-cog', 1536327129, 1547520976),
(5, 1, 'System/email', '邮箱配置', 1, 1, '', 12, 1, 'fa  fa-mail-forward', 1536327444, 1536327838),
(6, 0, 'Auth', '权限管理', 1, 1, '', 2, 1, 'fa fa-group', 1536327468, 1547520856),
(7, 6, 'Auth/adminList', '管理员管理', 1, 1, '', 21, 1, 'fa fa-user', 1536327753, 1547523425),
(8, 6, 'Auth/adminGroup', '角色组管理', 1, 1, '', 22, 1, 'fa fa-group', 1536327787, 1547520881),
(9, 6, 'Auth/adminRule', '菜单规则', 1, 1, '', 23, 1, 'fa fa-bars', 1536327826, 1547520923),
(10, 7, 'Auth/adminAdd', '操作-添加', 1, 1, '', 211, 1, '', 1536327882, 1536327952),
(11, 7, 'Auth/adminEdit', '操作-修改', 1, 1, '', 212, 1, '', 1536327906, 1536327955),
(12, 7, 'Auth/adminDel', '操作-删除', 1, 1, '', 213, 1, '', 1536327924, 1536327959),
(13, 7, 'Auth/adminState', '操作-状态', 1, 1, '', 215, 1, '', 1536327944, 1536328025),
(14, 7, 'Auth/adminSelectDel', '操作-批量删除', 1, 1, '', 214, 1, '', 1536328014, 1536328028),
(15, 8, 'Auth/groupAdd', '操作-添加', 1, 1, '', 221, 1, '', 1536329901, 1536329910),
(16, 8, 'Auth/groupEdit', '操作-修改', 1, 1, '', 222, 1, '', 1536329944, 1536329944),
(17, 8, 'Auth/groupDel', ' 操作-删除', 1, 1, '', 223, 1, '', 1536329962, 1536329986),
(18, 8, 'Auth/groupSelectDel', '操作-批量删除', 1, 1, '', 224, 1, '', 1536330024, 1536330033),
(19, 8, 'Auth/groupState', '操作-状态', 1, 1, '', 225, 1, '', 1536330069, 1536330069),
(20, 8, 'Auth/groupAccess', '操作-权限', 1, 1, '', 226, 1, '', 1536330111, 1536330111),
(21, 8, 'Auth/groupRunaccess', '操作-保存权限', 1, 1, '', 227, 1, '', 1536330174, 1536330179),
(22, 9, 'Auth/ruleAdd', '操作-添加', 1, 1, '', 231, 1, '', 1536330209, 1536330455),
(23, 9, 'Auth/ruleEdit', '操作-修改', 1, 1, '', 232, 1, '', 1536330222, 1536330462),
(24, 9, 'Auth/ruleDel', '操作-删除', 1, 1, '', 233, 1, '', 1536330236, 1536330463),
(25, 9, 'Auth/ruleSelectDel', '操作-批量删除', 1, 1, '', 234, 1, '', 1536330261, 1536330465),
(26, 9, 'Auth/ruleState', '操作-菜单状态', 1, 1, '', 237, 1, '', 1536330275, 1536330933),
(27, 9, 'Auth/ruleOpen', ' 操作-是否验证', 1, 1, '', 236, 1, '', 1536330318, 1536330480),
(28, 9, 'Auth/ruleSort', '操作-排序', 1, 1, '', 235, 1, '', 1536330434, 1536330478),
(29, 0, 'Database', '数据库管理', 1, 0, '', 3, 1, 'fa fa-database', 1536635655, 1536636028),
(30, 29, 'Database/database', '数据库备份', 1, 1, '', 31, 1, 'fa fa-server', 1536635724, 1536635724),
(31, 29, 'Database/restore', '还原数据库', 1, 1, '', 32, 1, 'fa fa-recycle', 1536635740, 1536635740),
(32, 30, 'Database/repair', '操作-修复', 1, 1, '', 311, 1, '', 1536635767, 1536635767),
(33, 30, 'Database/optimize', '操作-优化', 1, 1, '', 312, 1, '', 1536635780, 1536635780),
(34, 30, 'Database/backup', '操作-备份', 1, 1, '', 50, 1, '', 1536635798, 1553763716),
(35, 31, 'Database/import', '操作-还原', 1, 1, '', 321, 1, '', 1536635831, 1536635831),
(36, 31, 'Database/downFile', '操作-下载', 1, 1, '', 322, 1, '', 1536635860, 1536635860),
(37, 31, 'Database/delSqlFiles', '操作-删除', 1, 1, '', 323, 1, '', 1536635871, 1536635871),
(38, 5, 'System/trySend', '操作-测试邮件发送', 1, 1, '', 122, 1, '', 1536653622, 1551863852),
(39, 0, 'Module', '模型管理', 1, 0, '', 4, 1, 'fa fa-th-list', 1536806647, 1536807712),
(40, 39, 'Module/index', '模型列表', 1, 1, '', 41, 1, 'fa fa-bolt', 1536806669, 1536806669),
(41, 40, 'Module/add', '操作-添加', 1, 1, '', 411, 1, '', 1536806738, 1536806738),
(42, 40, 'Module/edit', '操作-修改', 1, 1, '', 413, 1, '', 1536806774, 1553760852),
(43, 40, 'Module/del', '操作-删除', 1, 1, '', 415, 1, '', 1536806788, 1553760858),
(44, 40, 'Module/moduleState', '操作-状态', 1, 1, '', 416, 1, '', 1536806809, 1553760862),
(45, 40, 'Module/field', '模型字段', 1, 1, '', 417, 1, '', 1536806827, 1553760866),
(46, 45, 'Module/fieldAdd', '操作-添加', 1, 1, '', 4171, 1, '', 1536806876, 1553761041),
(47, 45, 'Module/fieldEdit', '操作-修改', 1, 1, '', 4173, 1, '', 1536806894, 1553761048),
(48, 45, 'Module/listOrder', '操作-排序', 1, 1, '', 4175, 1, '', 1536806907, 1553761056),
(49, 45, 'Module/fieldStatus', '操作-状态', 1, 1, '', 4176, 1, '', 1536806921, 1553761059),
(50, 45, 'Module/fieldDel', '操作-删除', 1, 1, '', 4177, 1, '', 1536806938, 1553761061),
(51, 0, 'Cate', '内容管理', 1, 0, '', 5, 1, 'fa fa-th', 1537932344, 1537932720),
(52, 51, 'Cate/index', '栏目列表', 1, 1, '', 51, 1, 'fa  fa-navicon', 1537932760, 1537932760),
(53, 52, 'Cate/add', '操作-添加', 1, 1, '', 511, 1, '', 1537932869, 1537932869),
(54, 52, 'Cate/edit', '操作-修改', 1, 1, '', 513, 1, '', 1537932909, 1553760586),
(55, 52, 'Cate/del', '操作-删除', 1, 1, '', 515, 1, '', 1537932950, 1553760595),
(56, 52, 'Cate/selectDel', '操作-批量删除', 1, 1, '', 516, 1, '', 1537932981, 1553760597),
(57, 52, 'Cate/sort', '操作-排序', 1, 1, '', 517, 1, '', 1537933010, 1553760598),
(58, 52, 'Cate/isMenu', '操作-导航显示', 1, 1, '', 518, 1, '', 1537933076, 1553760602),
(59, 52, 'Cate/isNext', '操作-跳转下级', 1, 1, '', 519, 1, '', 1537933111, 1553760603),
(60, 0, 'Function', '网站功能', 1, 0, '', 6, 1, 'fa fa-gear', 1540965627, 1540966350),
(61, 60, 'Link/index', '友情链接', 1, 1, '', 61, 1, 'fa fa-link', 1540966407, 1540966418),
(62, 61, 'Link/add', '操作-添加', 1, 1, '', 611, 1, '', 1540966465, 1540966465),
(63, 61, 'Link/edit', '操作-修改', 1, 1, '', 613, 1, '', 1540966488, 1551929946),
(64, 61, 'Link/state', '操作-状态', 1, 1, '', 615, 1, '', 1540966534, 1551930026),
(65, 61, 'Link/del', '操作-删除', 1, 1, '', 616, 1, '', 1540966564, 1551930029),
(66, 61, 'Link/selectDel', '操作-批量删除', 1, 1, '', 617, 1, '', 1540966605, 1551930033),
(67, 61, 'Link/sort', '操作-排序', 1, 1, '', 616, 1, '', 1540967631, 1540967631),
(68, 60, 'Ad/index', ' 广告管理', 1, 0, '', 62, 1, 'fa fa-tv', 1541120280, 1551936480),
(69, 60, 'AdType/index', '广告位管理', 1, 1, '', 63, 1, 'fa  fa-desktop', 1541120316, 1551936598),
(70, 68, 'Ad/add', '操作-添加', 1, 1, '', 621, 1, '', 1541120344, 1551936492),
(71, 68, 'Ad/edit', '操作-修改', 1, 1, '', 623, 1, '', 1541120377, 1551936511),
(72, 68, 'Ad/del', '操作-删除', 1, 1, '', 625, 1, '', 1541120423, 1551936530),
(73, 68, 'Ad/sort', '操作-排序', 1, 1, '', 628, 1, '', 1541120532, 1551936356),
(74, 68, 'Ad/state', '操作-状态', 1, 1, '', 627, 1, '', 1541120573, 1551936544),
(75, 68, 'Ad/selectDel', '操作-批量删除', 1, 1, '', 626, 1, '', 1541120586, 1551936538),
(76, 69, 'AdType/add', '操作-添加', 1, 1, '', 631, 1, '', 1541120670, 1551936612),
(77, 69, 'AdType/edit', '操作-修改', 1, 1, '', 633, 1, '', 1541120703, 1551936647),
(78, 69, 'AdType/del', '操作-删除', 1, 1, '', 635, 1, '', 1541120724, 1551936721),
(79, 69, 'AdType/selectDel', '操作-批量删除', 1, 1, '', 636, 1, '', 1541120754, 1551936734),
(80, 69, 'AdType/sort', '操作-排序', 1, 1, '', 638, 1, '', 1541120809, 1551936816),
(81, 0, 'Users', '会员管理', 1, 0, '', 9, 1, 'fa fa-user', 1541399456, 1551774271),
(82, 81, 'Users/index', '会员列表', 1, 1, '', 91, 1, 'fa fa-user', 1541399506, 1551774272),
(83, 81, 'UsersType/index', '会员组', 1, 1, '', 92, 1, 'fa fa-users', 1541399529, 1551835915),
(84, 82, 'Users/add', '操作-添加', 1, 1, '', 911, 1, '', 1541399593, 1551774275),
(85, 82, 'Users/edit', '操作-修改', 1, 1, '', 913, 1, '', 1541399618, 1551849024),
(86, 82, 'Users/del', '操作-删除', 1, 1, '', 915, 1, '', 1541399639, 1551849072),
(87, 82, 'Users/selectDel', '操作-批量删除', 1, 1, '', 916, 1, '', 1541399652, 1551849077),
(88, 82, 'Users/state', '操作-状态', 1, 1, '', 915, 1, '', 1541399712, 1551774281),
(89, 83, 'UsersType/add	', '操作-添加', 1, 1, '', 921, 1, '', 1541399760, 1551835957),
(90, 83, 'UsersType/addPost', '操作-添加保存', 1, 1, '', 922, 1, '', 1541399771, 1551835996),
(91, 83, 'UsersType/edit', '操作-修改', 1, 1, '', 923, 1, '', 1541399787, 1551836024),
(92, 83, 'UsersType/editPost', '操作-修改保存', 1, 1, '', 924, 1, '', 1541399799, 1551836049),
(93, 83, 'UsersType/del', '操作-删除', 1, 1, '', 925, 1, '', 1541399809, 1551836070),
(94, 82, 'Users/download', '操作-下载', 1, 1, '', 917, 1, '', 1541482111, 1551849111),
(95, 60, 'Debris/index', '碎片管理', 1, 1, '', 64, 1, 'fa fa-gift', 1545728477, 1545728477),
(96, 95, 'Debris/add', '操作-添加', 1, 1, '', 641, 1, '', 1545728513, 1545728513),
(97, 95, 'Debris/edit', '  操作-修改', 1, 1, '', 643, 1, '', 1545728548, 1551930413),
(98, 95, 'Debris/del', '操作-删除', 1, 1, '', 645, 1, '', 1545728564, 1551930402),
(99, 95, 'Debris/selectDel', '操作-批量删除', 1, 1, '', 646, 1, '', 1545728706, 1551930405),
(100, 0, 'Template', '模板管理', 1, 0, '', 8, 1, 'fa fa-code', 1545898118, 1551774253),
(101, 100, 'Template/index', '模板管理', 1, 1, '', 81, 1, 'fa fa-file-code-o', 1545898150, 1551774256),
(102, 101, 'Template/add', '  操作-添加', 1, 1, '', 811, 1, '', 1545898173, 1553760044),
(103, 101, 'Template/edit', '操作-修改', 1, 1, '', 813, 1, '', 1545898195, 1553760052),
(104, 101, 'Template/delete', '操作-删除', 1, 1, '', 815, 1, '', 1545898234, 1553760059),
(105, 101, 'Template/img', '媒体文件-列表', 1, 1, '', 816, 1, '', 1545962259, 1553760061),
(106, 101, 'Template/imgDel', '媒体文件-删除', 1, 1, '', 817, 1, '', 1545962287, 1553760065),
(107, 1, 'System/sms', '短信配置', 1, 1, '', 13, 1, 'fa fa-send', 1548400960, 1548400980),
(108, 107, 'System/trySms', '操作-测试短信发送', 1, 1, '', 132, 1, '', 1548401007, 1551864103),
(109, 0, 'Addons', '插件管理', 1, 0, '', 7, 1, 'fa fa-plug', 1551774339, 1551774539),
(119, 83, 'UsersType/selectDel', '操作-批量删除', 1, 1, '', 926, 1, '', 1551836092, 1551836092),
(120, 83, 'UsersType/sort', '操作-排序', 1, 1, '', 927, 1, '', 1551836104, 1551836104),
(121, 83, 'UsersType/state', '操作-状态', 1, 1, '', 928, 1, '', 1551836132, 1551836132),
(122, 82, 'Users/addPost', '操作-添加保存', 1, 1, '', 912, 1, '', 1551848993, 1551848993),
(123, 82, 'Users/editPost', '操作-修改保存', 1, 1, '', 914, 1, '', 1551849010, 1551849040),
(124, 4, 'System/systemPost', '操作-修改保存', 1, 1, '', 111, 1, '', 1551863272, 1551863272),
(125, 5, 'System/emailPost', '操作-修改保存', 1, 1, '', 121, 1, '', 1551863826, 1551863826),
(126, 107, 'System/smsPost', '操作-修改保存', 1, 1, '', 131, 1, '', 1551864090, 1551864090),
(127, 61, 'Link/addPost', '操作-添加保存', 1, 1, '', 612, 1, '', 1551929778, 1551929778),
(128, 61, 'Link/editPost', '操作-修改保存', 1, 1, '', 614, 1, '', 1551930004, 1551930017),
(129, 95, 'Debris/addPost', '操作-添加保存', 1, 1, '', 642, 1, '', 1551930385, 1551930385),
(130, 95, 'Debris/editPost', '操作-修改保存', 1, 1, '', 644, 1, '', 1551930435, 1551930435),
(131, 95, 'Debris/sort', '操作-排序', 1, 1, '', 647, 1, '', 1551930477, 1551930477),
(132, 95, 'Debris/state', '操作-状态', 1, 1, '', 648, 1, '', 1551930531, 1551930531),
(133, 68, 'Ad/addPost', '操作-添加保存', 1, 1, '', 622, 1, '', 1551936291, 1551936504),
(134, 68, 'Ad/editPost', '操作-修改保存', 1, 1, '', 624, 1, '', 1551936330, 1551936518),
(135, 69, 'AdType/addPost', '操作-添加保存', 1, 1, '', 632, 1, '', 1551936630, 1551936630),
(136, 69, 'AdType/editPost', '操作-修改保存', 1, 1, '', 634, 1, '', 1551936663, 1551936663),
(137, 69, 'AdType/state', '操作-状态', 1, 1, '', 637, 1, '', 1551936803, 1551936814),
(138, 109, 'Addons/index', '插件管理', 1, 1, '', 71, 1, '', 1552455295, 1552455295),
(144, 101, 'Template/addPost', '操作-添加保存', 1, 1, '', 812, 1, '', 1553759995, 1553760047),
(145, 101, 'Template/editPost', '操作-修改保存', 1, 1, '', 814, 1, '', 1553760016, 1553760056),
(146, 52, 'Cate/addPost', '操作-添加保存', 1, 1, '', 512, 1, '', 1553760556, 1553760556),
(147, 52, 'Cate/editPost', '操作-修改保存', 1, 1, '', 514, 1, '', 1553760573, 1553760589),
(148, 40, 'Module/addPost', '操作-添加保存', 1, 1, '', 412, 1, '', 1553760823, 1553760823),
(149, 40, 'Module/editPost', '操作-修改保存', 1, 1, '', 414, 1, '', 1553760841, 1553760855),
(150, 45, 'Module/fieldAddPost', '操作-添加保存', 1, 1, '', 4172, 1, '', 1553761010, 1553761046),
(151, 45, 'Module/fieldEditPost', '操作-修改保存', 1, 1, '', 4174, 1, '', 1553761029, 1553761053),
(152, 6, 'AdminLog/index', '管理员日志', 1, 1, '', 24, 1, ' fa fa-book', 1553845141, 1553845141),
(153, 152, 'AdminLog/del', '操作-删除', 1, 1, '', 241, 1, '', 1553845181, 1553845181),
(154, 152, 'AdminLog/selectDel', '操作-批量删除', 1, 1, '', 242, 1, '', 1553845204, 1553845204),
(155, 152, 'AdminLog/edit', '操作-查看', 1, 1, '', 243, 1, '', 1553848110, 1553848110),
(156, 152, 'AdminLog/download', '操作-下载', 1, 1, '', 244, 1, '', 0, 0),
(157, 1, 'SystemGroup/index', '系统设置分组', 1, 0, '', 14, 1, 'fa  fa-cubes', 0, 0),
(158, 157, 'SystemGroup/add', '操作-添加', 1, 1, '', 141, 1, '', 0, 0),
(159, 157, 'SystemGroup/addPost', '操作-添加保存', 1, 1, '', 142, 1, '', 0, 0),
(160, 157, 'SystemGroup/edit', '操作-修改', 1, 1, '', 143, 1, '', 0, 0),
(161, 157, 'SystemGroup/editPost', '操作-修改保存', 1, 1, '', 144, 1, '', 0, 0),
(162, 157, 'SystemGroup/del', '修改-删除', 1, 1, '', 145, 1, '', 0, 0),
(163, 157, 'SystemGroup/selectDel', '修改-批量删除', 1, 1, '', 146, 1, '', 0, 0),
(164, 157, 'SystemGroup/sort', '修改-排序', 1, 1, '', 147, 1, '', 0, 0),
(165, 157, 'SystemGroup/state', '修改-状态', 1, 1, '', 147, 1, '', 0, 0),
(166, 4, 'System/index', '操作-字段列表', 1, 1, '', 112, 1, '', 0, 0),
(167, 4, 'System/add', '操作-字段添加', 1, 1, '', 113, 1, '', 0, 0),
(168, 4, 'System/addPost', '操作-字段添加保存', 1, 1, '', 114, 1, '', 0, 0),
(169, 4, 'System/edit', '操作-字段修改', 1, 1, '', 115, 1, '', 0, 0),
(170, 4, 'System/editPost', '操作-字段修改保存', 1, 1, '', 116, 1, '', 0, 0),
(171, 4, 'System/del', '操作-字段删除', 1, 1, '', 117, 1, '', 0, 0),
(172, 4, 'System/selectDel', '操作-字段批量删除', 1, 1, '', 118, 1, '', 0, 0),
(173, 4, 'System/sort', '操作-字段排序', 1, 1, '', 119, 1, '', 0, 0),
(174, 4, 'System/state', '操作-字段状态', 1, 1, '', 120, 1, '', 0, 0),
(175, 51, 'Content/index', '内容管理', 1, 1, '', 52, 1, '', 0, 0),
(176, 0, 'Device/index', '设备管理', 1, 1, '', 2, 1, 'fa fa-server', 0, 0),
(177, 176, 'Device/list', '设备列表', 1, 1, '', 50, 1, '', 0, 0),
(178, 176, 'Device/add', '添加设备', 1, 1, '', 50, 1, '', 0, 0),
(179, 0, 'MonitorData/index', '监控数据', 1, 1, '', 5, 1, '', 0, 0),
(180, 179, 'MonitorData/statistic', '数据统计', 1, 1, '', 50, 1, '', 0, 0),
(181, 179, 'MonitorData/list', '数据列表', 1, 1, '', 50, 1, '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tp_cate`
--

CREATE TABLE `tp_cate` (
  `id` mediumint(8) NOT NULL,
  `catname` char(100) NOT NULL COMMENT '栏目名称',
  `enname` char(100) DEFAULT NULL COMMENT '栏目英文名称',
  `catdir` char(100) DEFAULT NULL COMMENT '目录',
  `parentid` int(20) NOT NULL DEFAULT 0 COMMENT '父栏目ID',
  `moduleid` int(20) DEFAULT 1 COMMENT '类型',
  `sort` mediumint(8) DEFAULT 50 COMMENT '排序',
  `url` varchar(255) DEFAULT NULL COMMENT '跳转链接',
  `content` text DEFAULT NULL COMMENT '内容',
  `image` char(255) DEFAULT NULL COMMENT '图片',
  `icoimage` char(255) DEFAULT NULL COMMENT '小图片',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键词',
  `description` varchar(800) DEFAULT NULL COMMENT '描述',
  `summary` varchar(800) DEFAULT NULL COMMENT '简介',
  `template_list` char(100) DEFAULT NULL,
  `template_show` char(100) DEFAULT NULL,
  `pagesize` int(4) DEFAULT 20 COMMENT '分页显示数量',
  `is_menu` int(2) NOT NULL DEFAULT 1 COMMENT '是否导航显示',
  `is_next` int(2) NOT NULL DEFAULT 0 COMMENT '是否跳转到下级栏目',
  `is_blank` int(2) DEFAULT 0 COMMENT '是否新窗口打开',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '状态（前后台状态）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目表';

--
-- 转存表中的数据 `tp_cate`
--

INSERT INTO `tp_cate` (`id`, `catname`, `enname`, `catdir`, `parentid`, `moduleid`, `sort`, `url`, `content`, `image`, `icoimage`, `title`, `keywords`, `description`, `summary`, `template_list`, `template_show`, `pagesize`, `is_menu`, `is_next`, `is_blank`, `status`) VALUES
(6, '关于我们', 'About Us', 'about', 0, 1, 1, '', NULL, '/uploads/20181224/65ea8dcb1cbd16c8dc46144069afeaf5.jpg', '', '', '', '', '', 'page_list.html', '', 0, 1, 0, 0, 1),
(7, '公司介绍', 'Company Introduction', 'introduction', 6, 1, 11, '', NULL, '', '', '', '', '', '', 'page_list.html', '', 0, 1, 0, 0, 1),
(8, '新闻中心', 'News Center', 'news', 0, 2, 2, '', NULL, '/uploads/20181224/65ea8dcb1cbd16c8dc46144069afeaf5.jpg', '', '', '', '', '', '', '', 0, 1, 0, 0, 1),
(9, '公司新闻', '', '', 8, 2, 21, '', NULL, '', '', '', '', '', '', NULL, NULL, 0, 1, 0, 0, 1),
(10, '公司文化', '', 'culture', 6, 1, 12, '', NULL, '', '', '', '', '', '', NULL, NULL, 0, 1, 0, 0, 1),
(11, '资质荣誉', 'Qualifications & Honours', 'honours', 0, 3, 3, '', NULL, '/uploads/20181224/bf913edfcd8dcdeeec910860f12a0542.jpg', '', '', '', '', '', '', '', 0, 1, 0, 0, 1),
(13, '行业资讯', 'Industry Information', 'information', 8, 2, 22, '', NULL, '', '', '', '', '', '', 'article_list.html', 'article_show.html', 0, 1, 0, 0, 1),
(14, '产品中心', 'Pdoduct  Center', 'product', 0, 4, 4, '', NULL, '/uploads/20181224/643f5b9e297a0bd3accd79981ce347a1.jpg', '', '', '', '', '', 'product_list.html', 'product_show.html', 0, 1, 0, 0, 1),
(15, '精选产品', '', '', 14, 4, 41, '', NULL, '', '', '', '', '', '', 'product_list.html', 'product_show.html', 0, 1, 0, 0, 1),
(16, '热销产品', '', '', 14, 4, 42, '', NULL, '', '', '', '', '', '', 'product_list.html', 'product_show.html', 0, 1, 0, 0, 1),
(17, '资料下载', 'Download', '', 0, 5, 5, '', NULL, '/uploads/20181224/f4ef6f5df6abac86e8c685b2f2549079.jpg', '', '', '', '', '', 'download_list.html', 'download_show.html', 0, 1, 0, 0, 1),
(18, '优秀团队', 'Team', 'team', 0, 6, 6, '', NULL, '/uploads/20181224/bf3d6e8ff8f21760572ac25dd216daf9.jpg', '', '', '', '', '', 'team_list.html', 'team_show.html', 0, 1, 0, 0, 1),
(19, '联系我们', 'Contact Us', 'contact', 0, 7, 7, '', NULL, '/uploads/20181224/65ea8dcb1cbd16c8dc46144069afeaf5.jpg', '', '', '', '', '', 'message_list.html', '', 0, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tp_config`
--

CREATE TABLE `tp_config` (
  `id` smallint(6) UNSIGNED NOT NULL COMMENT '表id',
  `name` varchar(50) DEFAULT NULL COMMENT '配置的key键名',
  `value` varchar(512) DEFAULT NULL COMMENT '配置的val值',
  `inc_type` varchar(64) DEFAULT NULL COMMENT '配置分组',
  `desc` varchar(50) DEFAULT NULL COMMENT '描述'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='配置表';

--
-- 转存表中的数据 `tp_config`
--

INSERT INTO `tp_config` (`id`, `name`, `value`, `inc_type`, `desc`) VALUES
(60, 'smtp_server', 'smtp.qq.com', 'smtp', '0'),
(61, 'smtp_port', '465', 'smtp', '0'),
(62, 'smtp_user', '407593529@qq.com', 'smtp', '0'),
(63, 'smtp_pwd', '', 'smtp', '0'),
(64, 'regis_smtp_enable', '1', 'smtp', '0'),
(65, 'test_eamil', '', 'smtp', '0'),
(94, 'test_mobile', '', 'sms', NULL),
(93, 'signName', '', 'sms', NULL),
(92, 'templateCode', '', 'sms', NULL),
(91, 'accessKeySecret', '', 'sms', NULL),
(90, 'accessKeyId', 'LTAIqinwPNwEawUK', 'sms', NULL),
(88, 'email_id', 'SIYUCMS', 'smtp', '0'),
(89, 'test_eamil_info', ' 您好！这是一封来自SIYUCMS的测试邮件！', 'smtp', '0');

-- --------------------------------------------------------

--
-- 表的结构 `tp_debris`
--

CREATE TABLE `tp_debris` (
  `id` mediumint(8) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `name` varchar(255) DEFAULT NULL COMMENT '调用',
  `content` text DEFAULT NULL COMMENT '内容',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `sort` mediumint(8) DEFAULT 50 COMMENT '排序',
  `status` int(1) DEFAULT 0 COMMENT '状态（1 正常，0 锁定）',
  `create_time` int(11) DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) DEFAULT 0 COMMENT '修改时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='碎片表';

--
-- 转存表中的数据 `tp_debris`
--

INSERT INTO `tp_debris` (`id`, `title`, `name`, `content`, `url`, `image`, `description`, `sort`, `status`, `create_time`, `update_time`) VALUES
(1, '关于我们', 'AboutUs', '<p>SIYUCMS内容管理系统，包含系统设置，权限管理，模型管理，数据库管理，栏目管理，会员管理，网站功能，模版管理，微信管理等相关模块。<br>SIYUCMS内容管理系统，包含系统设置，权限管理，模型管理，数据库管理，栏目管理，会员管理，网站功能，模版管理，微信管理等相关模块。&nbsp;&nbsp;</p><p><br></p>', '12', '', '3', 1, 1, 1545729604, 1551930573);

-- --------------------------------------------------------

--
-- 表的结构 `tp_download`
--

CREATE TABLE `tp_download` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'ID',
  `cate_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '栏目',
  `title` varchar(70) NOT NULL DEFAULT '' COMMENT '标题',
  `title_style` varchar(225) NOT NULL DEFAULT '' COMMENT '标题样式',
  `thumb` varchar(225) NOT NULL DEFAULT '' COMMENT '缩略图',
  `keywords` varchar(80) NOT NULL DEFAULT '' COMMENT '关键词',
  `description` mediumtext NOT NULL COMMENT 'SEO简介',
  `content` text NOT NULL COMMENT '内容',
  `template` varchar(80) NOT NULL DEFAULT '' COMMENT '模板',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 100 COMMENT '排序',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击次数',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `image` varchar(80) NOT NULL DEFAULT '' COMMENT '缩略图',
  `images` mediumtext NOT NULL COMMENT '图片集',
  `download` varchar(80) NOT NULL DEFAULT '' COMMENT '文件下载',
  `author` varchar(50) NOT NULL DEFAULT 'Admin' COMMENT '作者',
  `source` varchar(255) NOT NULL DEFAULT '' COMMENT '来源',
  `summary` text NOT NULL COMMENT '摘要'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='下载模型表';

--
-- 转存表中的数据 `tp_download`
--

INSERT INTO `tp_download` (`id`, `cate_id`, `title`, `title_style`, `thumb`, `keywords`, `description`, `content`, `template`, `status`, `sort`, `hits`, `create_time`, `update_time`, `image`, `images`, `download`, `author`, `source`, `summary`) VALUES
(10, 17, '招聘表格下载', '', '', '', '', '', '', 1, 100, 0, 1545633670, 0, '/uploads/20181224/6b449574a2358edd20c10f10f64bd09c.jpg', '', '/uploads/20181224/06d08f008e54d9ac4eae3d0a6d53cff7.rar', '管理员', '本站', ''),
(11, 17, '报名表格下载', '', '', '', '', '', '', 1, 100, 0, 1545635098, 0, '/uploads/20181224/d6df5528408d8974777ae29280428ad6.jpg', '', '/uploads/20181224/4d3569541beb373334582df5aaaa126b.rar', '管理员', '本站', ''),
(12, 17, '供应商表格下载', '', '', '', '', '', '', 1, 100, 0, 1545635131, 0, '/uploads/20181224/363944f333897882e4424bacb186e693.jpg', '', '/uploads/20181224/d21fb51f503d487d67a4c8c10577c458.rar', '管理员', '本站', '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_field`
--

CREATE TABLE `tp_field` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `moduleid` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `field` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `tips` varchar(150) NOT NULL DEFAULT '',
  `required` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `minlength` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxlength` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pattern` varchar(255) NOT NULL DEFAULT '',
  `errormsg` varchar(255) NOT NULL DEFAULT '',
  `class` varchar(20) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `setup` text DEFAULT NULL,
  `ispost` tinyint(1) NOT NULL DEFAULT 0,
  `unpostgroup` varchar(60) NOT NULL DEFAULT '',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `issystem` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='模型字段表';

--
-- 转存表中的数据 `tp_field`
--

INSERT INTO `tp_field` (`id`, `moduleid`, `field`, `name`, `tips`, `required`, `minlength`, `maxlength`, `pattern`, `errormsg`, `class`, `type`, `setup`, `ispost`, `unpostgroup`, `sort`, `status`, `issystem`) VALUES
(1, 2, 'cate_id', '栏目', '', 1, 1, 6, '', '必须选择一个栏目', '', 'cate', '', 1, '', 1, 1, 1),
(2, 2, 'title', '标题', '', 1, 1, 70, '', '标题必须为1-80个字符', '', 'title', '', 1, '', 2, 1, 1),
(3, 2, 'keywords', '关键词', '', 0, 0, 80, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 1, '', 15, 1, 1),
(4, 2, 'description', 'SEO简介', '', 0, 0, 1200, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'mediumtext\',\n  \'default\' => \'发3\',\n)', 1, '', 16, 1, 1),
(5, 2, 'content', '内容', '', 0, 0, 0, '', '', '', 'editor', 'array (\n  \'edittype\' => \'ckeditor\',\n)', 1, '', 5, 1, 1),
(6, 2, 'create_time', '添加时间', '', 1, 0, 0, 'date', '', 'createtime', 'datetime', '', 1, '', 10, 1, 1),
(7, 2, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  \'options\' => \'显示|1\r\n隐藏|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', 1, '', 11, 1, 1),
(8, 2, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n)', 1, '', 12, 1, 1),
(10, 2, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 14, 1, 1),
(13, 2, 'image', '缩略图', '', 0, 0, 120, '', '', '', 'image', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', 0, '', 7, 1, 0),
(14, 2, 'images', '图片集', '', 0, 0, 0, '', '', '', 'images', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', 0, '', 8, 1, 0),
(15, 2, 'download', '文件下载', '', 0, 0, 0, '', '', '', 'file', 'array (\n  \'upload_allowext\' => \'zip|rar|doc|ppt\',\n)', 0, '', 9, 1, 0),
(29, 2, 'source', '来源', '', 0, 0, 0, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 4, 1, 0),
(28, 2, 'author', '作者', '', 0, 0, 50, '', '', '', 'text', 'array (\n  \'default\' => \'Admin\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 3, 1, 0),
(21, 2, 'sort', '排序', '', 1, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'100\',\n)', 0, '', 13, 1, 1),
(22, 1, 'cate_id', '栏目', '', 1, 0, 0, '', '', '', 'cate', NULL, 0, '', 0, 1, 0),
(23, 1, 'title', '标题', '', 1, 0, 0, '', '', '', 'title', NULL, 0, '', 0, 1, 0),
(24, 1, 'keywords', '关键词', '', 0, 0, 0, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 0, 1, 0),
(25, 1, 'description', 'SEO简介', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'text\',\n  \'default\' => \'\',\n)', 0, '', 0, 1, 0),
(26, 1, 'content', '内容', '', 0, 0, 0, '', '', '', 'editor', 'array (\n  \'edittype\' => \'ckeditor\',\n)', 0, '', 0, 1, 0),
(27, 1, 'hits', '点击次数', '', 1, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'100\',\n)', 0, '', 0, 1, 0),
(30, 3, 'cate_id', '栏目', '', 1, 1, 6, '', '必须选择一个栏目', '', 'cate', '', 1, '', 1, 1, 1),
(31, 3, 'title', '标题', '', 1, 1, 70, '', '标题必须为1-80个字符', '', 'title', '', 1, '', 2, 1, 1),
(32, 3, 'keywords', '关键词', '', 0, 0, 80, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 1, '', 15, 1, 1),
(33, 3, 'description', 'SEO简介', '', 0, 0, 1200, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'mediumtext\',\n  \'default\' => \'发3\',\n)', 1, '', 16, 1, 1),
(34, 3, 'content', '内容', '', 0, 0, 0, '', '', '', 'editor', 'array (\n  \'edittype\' => \'ckeditor\',\n)', 1, '', 5, 1, 1),
(35, 3, 'create_time', '添加时间', '', 1, 0, 0, 'date', '', 'createtime', 'datetime', '', 1, '', 10, 1, 1),
(36, 3, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  \'options\' => \'显示|1\r\n隐藏|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', 1, '', 11, 1, 1),
(37, 3, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n)', 1, '', 12, 1, 1),
(38, 3, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 14, 1, 1),
(39, 3, 'image', '缩略图', '', 0, 0, 120, '', '', '', 'image', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', 0, '', 7, 1, 0),
(40, 3, 'images', '图片集', '', 0, 0, 0, '', '', '', 'images', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', 0, '', 8, 1, 0),
(41, 3, 'download', '文件下载', '', 0, 0, 0, '', '', '', 'file', 'array (\n  \'upload_allowext\' => \'zip|rar|doc|ppt\',\n)', 0, '', 9, 1, 0),
(42, 3, 'source', '来源', '', 0, 0, 0, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 4, 1, 0),
(43, 3, 'author', '作者', '', 0, 0, 50, '', '', '', 'text', 'array (\n  \'default\' => \'Admin\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 3, 1, 0),
(44, 3, 'sort', '排序', '', 1, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'100\',\n)', 0, '', 13, 1, 1),
(45, 4, 'cate_id', '栏目', '', 1, 1, 6, '', '必须选择一个栏目', '', 'cate', '', 1, '', 1, 1, 1),
(46, 4, 'title', '标题', '', 1, 1, 70, '', '标题必须为1-80个字符', '', 'title', '', 1, '', 2, 1, 1),
(47, 4, 'keywords', '关键词', '', 0, 0, 80, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 1, '', 15, 1, 1),
(48, 4, 'description', 'SEO简介', '', 0, 0, 1200, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'mediumtext\',\n  \'default\' => \'发3\',\n)', 1, '', 16, 1, 1),
(49, 4, 'content', '内容', '', 0, 0, 0, '', '', '', 'editor', 'array (\n  \'edittype\' => \'ckeditor\',\n)', 1, '', 5, 1, 1),
(50, 4, 'create_time', '添加时间', '', 1, 0, 0, 'date', '', 'createtime', 'datetime', '', 1, '', 10, 1, 1),
(51, 4, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  \'options\' => \'显示|1\r\n隐藏|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', 1, '', 11, 1, 1),
(52, 4, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n)', 1, '', 12, 1, 1),
(53, 4, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 14, 1, 1),
(54, 4, 'image', '缩略图', '', 0, 0, 120, '', '', '', 'image', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', 0, '', 7, 1, 0),
(55, 4, 'images', '图片集', '', 0, 0, 0, '', '', '', 'images', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', 0, '', 8, 1, 0),
(56, 4, 'download', '文件下载', '', 0, 0, 0, '', '', '', 'file', 'array (\n  \'upload_allowext\' => \'zip|rar|doc|ppt\',\n)', 0, '', 9, 1, 0),
(57, 4, 'source', '来源', '', 0, 0, 0, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 4, 1, 0),
(58, 4, 'author', '作者', '', 0, 0, 50, '', '', '', 'text', 'array (\n  \'default\' => \'Admin\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 3, 1, 0),
(59, 4, 'sort', '排序', '', 1, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'100\',\n)', 0, '', 13, 1, 1),
(60, 5, 'cate_id', '栏目', '', 1, 1, 6, '', '必须选择一个栏目', '', 'cate', '', 1, '', 1, 1, 1),
(61, 5, 'title', '标题', '', 1, 1, 70, '', '标题必须为1-80个字符', '', 'title', '', 1, '', 2, 1, 1),
(62, 5, 'keywords', '关键词', '', 0, 0, 80, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 1, '', 15, 1, 1),
(63, 5, 'description', 'SEO简介', '', 0, 0, 1200, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'mediumtext\',\n  \'default\' => \'发3\',\n)', 1, '', 16, 1, 1),
(64, 5, 'content', '内容', '', 0, 0, 0, '', '', '', 'editor', 'array (\n  \'edittype\' => \'ckeditor\',\n)', 1, '', 5, 1, 1),
(65, 5, 'create_time', '添加时间', '', 1, 0, 0, 'date', '', 'createtime', 'datetime', '', 1, '', 10, 1, 1),
(66, 5, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  \'options\' => \'显示|1\r\n隐藏|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', 1, '', 11, 1, 1),
(67, 5, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n)', 1, '', 12, 1, 1),
(68, 5, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 14, 1, 1),
(69, 5, 'image', '缩略图', '', 0, 0, 120, '', '', '', 'image', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', 0, '', 7, 1, 0),
(70, 5, 'images', '图片集', '', 0, 0, 0, '', '', '', 'images', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', 0, '', 8, 1, 0),
(71, 5, 'download', '文件下载', '', 0, 0, 0, '', '', '', 'file', 'array (\n  \'upload_allowext\' => \'zip|rar|doc|ppt\',\n)', 0, '', 9, 1, 0),
(72, 5, 'source', '来源', '', 0, 0, 0, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 4, 1, 0),
(73, 5, 'author', '作者', '', 0, 0, 50, '', '', '', 'text', 'array (\n  \'default\' => \'Admin\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 3, 1, 0),
(74, 5, 'sort', '排序', '', 1, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'100\',\n)', 0, '', 13, 1, 1),
(75, 6, 'cate_id', '栏目', '', 1, 1, 6, '', '必须选择一个栏目', '', 'cate', '', 1, '', 1, 1, 1),
(76, 6, 'title', '标题', '', 1, 1, 70, '', '标题必须为1-80个字符', '', 'title', '', 1, '', 2, 1, 1),
(77, 6, 'keywords', '关键词', '', 0, 0, 80, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 1, '', 15, 1, 1),
(78, 6, 'description', 'SEO简介', '', 0, 0, 1200, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'mediumtext\',\n  \'default\' => \'发3\',\n)', 1, '', 16, 1, 1),
(79, 6, 'content', '内容', '', 0, 0, 0, '', '', '', 'editor', 'array (\n  \'edittype\' => \'ckeditor\',\n)', 1, '', 5, 1, 1),
(80, 6, 'create_time', '添加时间', '', 1, 0, 0, 'date', '', 'createtime', 'datetime', '', 1, '', 10, 1, 1),
(81, 6, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  \'options\' => \'显示|1\r\n隐藏|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)', 1, '', 11, 1, 1),
(82, 6, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n)', 1, '', 12, 1, 1),
(83, 6, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 14, 1, 1),
(84, 6, 'image', '缩略图', '', 0, 0, 120, '', '', '', 'image', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', 0, '', 7, 1, 0),
(85, 6, 'images', '图片集', '', 0, 0, 0, '', '', '', 'images', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', 0, '', 8, 1, 0),
(86, 6, 'download', '文件下载', '', 0, 0, 0, '', '', '', 'file', 'array (\n  \'upload_allowext\' => \'zip|rar|doc|ppt\',\n)', 0, '', 9, 1, 0),
(87, 6, 'source', '来源', '', 0, 0, 0, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 4, 1, 0),
(88, 6, 'author', '作者', '', 0, 0, 50, '', '', '', 'text', 'array (\n  \'default\' => \'Admin\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 3, 1, 0),
(89, 6, 'sort', '排序', '', 1, 0, 8, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'100\',\n)', 0, '', 13, 1, 1),
(90, 2, 'summary', '摘要', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'text\',\n  \'default\' => \'\',\n)', 0, '', 6, 1, 0),
(91, 3, 'summary', '摘要', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'text\',\n  \'default\' => \'\',\n)', 0, '', 6, 1, 0),
(92, 4, 'summary', '摘要', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'text\',\n  \'default\' => \'\',\n)', 0, '', 6, 1, 0),
(93, 5, 'summary', '摘要', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'text\',\n  \'default\' => \'\',\n)', 0, '', 6, 1, 0),
(94, 6, 'summary', '摘要', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  \'fieldtype\' => \'text\',\n  \'default\' => \'\',\n)', 0, '', 6, 1, 0),
(95, 7, 'cate_id', '栏目', '', 0, 1, 6, '', '必须选择一个栏目', '', 'cate', '', 1, '', 1, 1, 1),
(96, 7, 'title', '标题', '', 1, 1, 80, '', '标题必须为1-80个字符', '', 'title', '', 1, '', 2, 1, 1),
(106, 7, 'contact', '联系方式', '', 1, 0, 0, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 9, 1, 0),
(99, 7, 'content', '内容', '', 0, 0, 0, '', '', '', 'editor', 'array (\n  \'edittype\' => \'ckeditor\',\n)', 1, '', 3, 1, 1),
(100, 7, 'create_time', '添加时间', '', 1, 0, 0, 'date', '', 'createtime', 'datetime', '', 1, '', 4, 1, 1),
(101, 7, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  \'options\' => \'已处理|1\r\n未处理|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'default\' => \'1\',\n)', 1, '', 5, 1, 1),
(104, 7, 'name', '姓名', '', 1, 0, 0, '', '', '', 'text', 'array (\n  \'default\' => \'\',\n  \'fieldtype\' => \'varchar\',\n)', 0, '', 8, 1, 0),
(105, 7, 'hits', '点击次数', '', 0, 0, 0, '', '', '', 'number', 'array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n)', 0, '', 7, 1, 0),
(103, 7, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 6, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tp_link`
--

CREATE TABLE `tp_link` (
  `id` mediumint(8) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '网站名称',
  `url` varchar(255) NOT NULL COMMENT '网站地址',
  `logo` varchar(255) DEFAULT NULL COMMENT '网站logo',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `sort` mediumint(8) DEFAULT 50 COMMENT '排序',
  `status` int(1) DEFAULT 0 COMMENT '状态（1 正常，0 锁定）',
  `create_time` int(11) DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) DEFAULT 0 COMMENT '修改时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情链接表';

--
-- 转存表中的数据 `tp_link`
--

INSERT INTO `tp_link` (`id`, `name`, `url`, `logo`, `description`, `sort`, `status`, `create_time`, `update_time`) VALUES
(1, 'SIYUCMS', 'http://www.siyucms.com', '', '', 2, 1, 1548727536, 1551930738);

-- --------------------------------------------------------

--
-- 表的结构 `tp_message`
--

CREATE TABLE `tp_message` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'ID',
  `cate_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '栏目',
  `title` varchar(120) NOT NULL DEFAULT '' COMMENT '标题',
  `title_style` varchar(225) NOT NULL DEFAULT '' COMMENT '标题样式',
  `thumb` varchar(225) NOT NULL DEFAULT '' COMMENT '缩略图',
  `content` text NOT NULL COMMENT '内容',
  `template` varchar(40) NOT NULL DEFAULT '' COMMENT '模板',
  `status` tinyint(3) NOT NULL DEFAULT 1 COMMENT '状态',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击次数',
  `contact` varchar(255) NOT NULL DEFAULT '' COMMENT '联系方式'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';

-- --------------------------------------------------------

--
-- 表的结构 `tp_module`
--

CREATE TABLE `tp_module` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '模型名称',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '表名',
  `description` varchar(200) NOT NULL DEFAULT '' COMMENT '描述',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `issystem` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `listfields` varchar(255) NOT NULL DEFAULT '' COMMENT '列表页字段',
  `sort` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='模型表';

--
-- 转存表中的数据 `tp_module`
--

INSERT INTO `tp_module` (`id`, `title`, `name`, `description`, `type`, `issystem`, `listfields`, `sort`, `status`) VALUES
(1, '单页模型', 'page', '单页面', 1, 0, '*', 0, 1),
(2, '文章模型', 'article', '新闻文章', 1, 0, '*', 0, 1),
(3, '图片模型', 'picture', '图片展示', 1, 0, '*', 0, 1),
(4, '产品模型', 'product', '产品展示', 1, 0, '*', 0, 1),
(5, '下载模型', 'download', '文件下载', 1, 0, '*', 0, 1),
(6, '团队模型', 'team', '员工展示', 1, 0, '*', 0, 1),
(7, '在线留言', 'message', '在线留言', 1, 0, '*', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tp_page`
--

CREATE TABLE `tp_page` (
  `id` mediumint(8) NOT NULL,
  `cate_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '栏目',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键词',
  `description` text DEFAULT NULL COMMENT 'SEO简介',
  `content` text DEFAULT NULL COMMENT '内容',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 100 COMMENT '点击次数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='单页模型表';

--
-- 转存表中的数据 `tp_page`
--

INSERT INTO `tp_page` (`id`, `cate_id`, `title`, `keywords`, `description`, `content`, `hits`) VALUES
(1, 7, '公司介绍', 'asdf ', '', '', 100),
(2, 6, '关于我们', '', '', '<p>ThinkPHP是一个免费开源的，快速、简单的面向对象的轻量级PHP开发框架，是为了敏捷WEB应用开发和简化企业应用开发而诞生的。ThinkPHP从诞生以来一直秉承简洁实用的设计原则，在保持出色的性能和至简的代码的同时，也注重易用性。遵循Apache2开源许可协议发布，意味着你可以免费使用ThinkPHP，甚至允许把你基于ThinkPHP开发的应用开源或商业产品发布/销售。</p><p>ThinkPHP5.1在5.0的基础上对底层架构做了进一步的改进，引入新特性，并提升版本要求。另外一个事实是，5.1版本看起来对开发者更加友好，表现在目录结构更直观、调试输出更直观和代码提示更直观。</p><p>ThinkPHP5.1运行环境要求PHP5.6+，虽然不支持5.0的无缝升级，但升级过程并不复杂（请参考升级指导），5.1.*版本基本上可以支持无缝升级。</p><p><br/></p>', 100),
(3, 10, '公司文化', '', '', '', 100);

-- --------------------------------------------------------

--
-- 表的结构 `tp_picture`
--

CREATE TABLE `tp_picture` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'ID',
  `cate_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '栏目',
  `title` varchar(70) NOT NULL DEFAULT '' COMMENT '标题',
  `title_style` varchar(225) NOT NULL DEFAULT '' COMMENT '标题样式',
  `thumb` varchar(225) NOT NULL DEFAULT '' COMMENT '缩略图',
  `keywords` varchar(80) NOT NULL DEFAULT '' COMMENT '关键词',
  `description` mediumtext NOT NULL COMMENT 'SEO简介',
  `content` text NOT NULL COMMENT '内容',
  `template` varchar(80) NOT NULL DEFAULT '' COMMENT '模板',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 100 COMMENT '排序',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击次数',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `image` varchar(80) NOT NULL DEFAULT '' COMMENT '缩略图',
  `images` mediumtext NOT NULL COMMENT '图片集',
  `download` varchar(80) NOT NULL DEFAULT '' COMMENT '文件下载',
  `author` varchar(50) NOT NULL DEFAULT 'Admin' COMMENT '作者',
  `source` varchar(255) NOT NULL DEFAULT '' COMMENT '来源',
  `summary` text NOT NULL COMMENT '摘要'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图片模型表';

--
-- 转存表中的数据 `tp_picture`
--

INSERT INTO `tp_picture` (`id`, `cate_id`, `title`, `title_style`, `thumb`, `keywords`, `description`, `content`, `template`, `status`, `sort`, `hits`, `create_time`, `update_time`, `image`, `images`, `download`, `author`, `source`, `summary`) VALUES
(10, 11, '资质荣誉一', '', '', '', '', '<p style=\"text-indent: 2em;\">2017年7月12日，国资委正式发布2016年度中央企业负责人经营业绩考核结果。51家央企位列2016年度考核Ａ级，占全部中央企业的50%。集团公司2016年度经营业绩考核综合得分为135.26分，考核结果为A级，在51家A级企业中排名第25位，排名较上年提高8个位次，这是XX集团公司第六次被评为年度经营业绩考核A级企业。</p>', '', 1, 100, 2, 1545628800, 0, '/uploads/20181224/df4a0aaf70da70634efb8c682c50a8df.jpg', '', '', '管理员', '本站', '2017年7月12日，国资委正式发布2016年度中央企业负责人经营业绩考核结果。51家央企位列2016年度考核Ａ级，占全部中央企业的50%。集团公司2016年度经营业绩考核综合得分为135.26分，考核结果为A级，在51家A级企业中排名第25位，排名较上年提高8个位次，这是XX集团公司第六次被评为年度经营业绩考核A级企业。'),
(11, 11, '资质荣誉二', '', '', '', '', '<p style=\"text-indent: 2em;\">2017年7月12日，国资委正式发布2016年度中央企业负责人经营业绩考核结果。51家央企位列2016年度考核Ａ级，占全部中央企业的50%。集团公司2016年度经营业绩考核综合得分为135.26分，考核结果为A级，在51家A级企业中排名第25位，排名较上年提高8个位次，这是XX集团公司第六次被评为年度经营业绩考核A级企业。</p>', '', 1, 100, 0, 1545629302, 0, '/uploads/20181224/acb269b78bf5a08dda27ae155768e688.jpg', '', '', '管理员', '本站', '2017年7月12日，国资委正式发布2016年度中央企业负责人经营业绩考核结果。51家央企位列2016年度考核Ａ级，占全部中央企业的50%。集团公司2016年度经营业绩考核综合得分为135.26分，考核结果为A级，在51家A级企业中排名第25位，排名较上年提高8个位次，这是XX集团公司第六次被评为年度经营业绩考核A级企业。'),
(12, 11, '资质荣誉三', '', '', '', '', '<p style=\"text-indent: 2em;\">2017年7月12日，国资委正式发布2016年度中央企业负责人经营业绩考核结果。51家央企位列2016年度考核Ａ级，占全部中央企业的50%。集团公司2016年度经营业绩考核综合得分为135.26分，考核结果为A级，在51家A级企业中排名第25位，排名较上年提高8个位次，这是XX集团公司第六次被评为年度经营业绩考核A级企业。</p>', '', 1, 100, 1, 1545629346, 0, '/uploads/20181224/dd30ed06a39d73f8bbc8012741a3010a.jpg', '', '', '管理员', '本站', '2017年7月12日，国资委正式发布2016年度中央企业负责人经营业绩考核结果。51家央企位列2016年度考核Ａ级，占全部中央企业的50%。集团公司2016年度经营业绩考核综合得分为135.26分，考核结果为A级，在51家A级企业中排名第25位，排名较上年提高8个位次，这是XX集团公司第六次被评为年度经营业绩考核A级企业。'),
(13, 11, '资质荣誉四', '', '', '', '', '<p><span style=\"text-indent: 32px;\">2017年7月12日，国资委正式发布2016年度中央企业负责人经营业绩考核结果。51家央企位列2016年度考核Ａ级，占全部中央企业的50%。集团公司2016年度经营业绩考核综合得分为135.26分，考核结果为A级，在51家A级企业中排名第25位，排名较上年提高8个位次，这是XX集团公司第六次被评为年度经营业绩考核A级企业。</span></p>', '', 1, 100, 4, 1545629373, 0, '/uploads/20181224/10ba9f34431727269dbeadae6dc786f8.jpg', '', '', '管理员', '本站', '2017年7月12日，国资委正式发布2016年度中央企业负责人经营业绩考核结果。51家央企位列2016年度考核Ａ级，占全部中央企业的50%。集团公司2016年度经营业绩考核综合得分为135.26分，考核结果为A级，在51家A级企业中排名第25位，排名较上年提高8个位次，这是XX集团公司第六次被评为年度经营业绩考核A级企业。'),
(14, 11, '资质荣誉五', '', '', '', '', '2017年7月12日，国资委正式发布2016年度中央企业负责人经营业绩考核结果。51家央企位列2016年度考核Ａ级，占全部中央企业的50%。集团公司2016年度经营业绩考核综合得分为135.26分，考核结果为A级，在51家A级企业中排名第25位，排名较上年提高8个位次，这是XX集团公司第六次被评为年度经营业绩考核A级企业。', '', 1, 100, 3, 1545629405, 0, '/uploads/20181224/1806bd7cc4c2beaf6be64833a891671b.jpg', '', '', '管理员', '本站', '2017年7月12日，国资委正式发布2016年度中央企业负责人经营业绩考核结果。51家央企位列2016年度考核Ａ级，占全部中央企业的50%。集团公司2016年度经营业绩考核综合得分为135.26分，考核结果为A级，在51家A级企业中排名第25位，排名较上年提高8个位次，这是XX集团公司第六次被评为年度经营业绩考核A级企业。'),
(15, 11, '资质荣誉六', '', '', '', '', '<p><span style=\"text-indent: 32px;\">2017年7月12日，国资委正式发布2016年度中央企业负责人经营业绩考核结果。51家央企位列2016年度考核Ａ级，占全部中央企业的50%。集团公司2016年度经营业绩考核综合得分为135.26分，考核结果为A级，在51家A级企业中排名第25位，排名较上年提高8个位次，这是XX集团公司第六次被评为年度经营业绩考核A级企业。</span></p>', '', 1, 100, 3, 1545629485, 0, '/uploads/20181224/97e072ae3a03895617e6b8ef6dc73529.jpg', '', '', '管理员', '本站', '2017年7月12日，国资委正式发布2016年度中央企业负责人经营业绩考核结果。51家央企位列2016年度考核Ａ级，占全部中央企业的50%。集团公司2016年度经营业绩考核综合得分为135.26分，考核结果为A级，在51家A级企业中排名第25位，排名较上年提高8个位次，这是XX集团公司第六次被评为年度经营业绩考核A级企业。');

-- --------------------------------------------------------

--
-- 表的结构 `tp_product`
--

CREATE TABLE `tp_product` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'ID',
  `cate_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '栏目',
  `title` varchar(70) NOT NULL DEFAULT '' COMMENT '标题',
  `title_style` varchar(225) NOT NULL DEFAULT '' COMMENT '标题样式',
  `thumb` varchar(225) NOT NULL DEFAULT '' COMMENT '缩略图',
  `keywords` varchar(80) NOT NULL DEFAULT '' COMMENT '关键词',
  `description` mediumtext NOT NULL COMMENT 'SEO简介',
  `content` text NOT NULL COMMENT '内容',
  `template` varchar(80) NOT NULL DEFAULT '' COMMENT '模板',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 100 COMMENT '排序',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击次数',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `image` varchar(80) NOT NULL DEFAULT '' COMMENT '缩略图',
  `images` mediumtext NOT NULL COMMENT '图片集',
  `download` varchar(80) NOT NULL DEFAULT '' COMMENT '文件下载',
  `author` varchar(50) NOT NULL DEFAULT 'Admin' COMMENT '作者',
  `source` varchar(255) NOT NULL DEFAULT '' COMMENT '来源',
  `summary` text NOT NULL COMMENT '摘要'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品模型表';

--
-- 转存表中的数据 `tp_product`
--

INSERT INTO `tp_product` (`id`, `cate_id`, `title`, `title_style`, `thumb`, `keywords`, `description`, `content`, `template`, `status`, `sort`, `hits`, `create_time`, `update_time`, `image`, `images`, `download`, `author`, `source`, `summary`) VALUES
(10, 15, '一本书', '', '', '', '', '', '', 1, 100, 0, 1545631116, 0, '/uploads/20181224/065928f94ebe13ab1fbdc09cdd28a18b.jpg', '', '', '管理员', '本站', ''),
(11, 15, '一支笔', '', '', '', '', '', '', 1, 100, 0, 1545631526, 0, '/uploads/20181224/f05f564a79e650d566251152fa4fa75e.jpg', '', '', '管理员', '本站', ''),
(12, 15, '一支铅笔', '', '', '', '', '', '', 1, 100, 0, 1545631559, 0, '/uploads/20181224/d5e07bd3fdd9f3cbb0bdc798ccdba178.jpg', '', '', '管理员', '本站', ''),
(13, 15, '背包', '', '', '', '', '', '', 1, 100, 0, 1545631583, 0, '/uploads/20181224/8852280b4dc3365af4855c779e4239c6.jpg', '', '', '管理员', '本站', ''),
(14, 15, '笔记本', '', '', '', '', '', '', 1, 100, 2, 1545631621, 0, '/uploads/20181224/d42552c77b14805f6d48e00b7a38f2e8.jpg', '', '', '管理员', '本站', ''),
(15, 15, '一支笔', '', '', '', '', '', '', 1, 100, 8, 1545631658, 0, '/uploads/20181224/47f793345aa44161161aeaa4409a52f8.jpg', '', '', '管理员', '本站', ''),
(16, 15, '铅笔盒', '', '', '', '', '', '', 1, 100, 2, 1545631695, 0, '/uploads/20181224/c89c7634f5bcd3b60884da427bc0b384.jpg', '', '', '管理员', '本站', ''),
(17, 15, '钢笔', '', '', '', '', '<p>钢笔</p>', '', 1, 100, 7, 1545631680, 0, '/uploads/20181224/0e9e92ee9cab513ff99f0189fea24a2e.jpg', '', '', '管理员', '本站', '');

-- --------------------------------------------------------

--
-- 表的结构 `tp_system`
--

CREATE TABLE `tp_system` (
  `id` int(8) NOT NULL,
  `group_id` int(8) NOT NULL COMMENT '系统设置分组id',
  `field` varchar(255) NOT NULL COMMENT '字段名',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '别名',
  `required` tinyint(1) DEFAULT 0 COMMENT '是否必填',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示信息',
  `type` varchar(20) DEFAULT NULL COMMENT '字段类型',
  `setup` text DEFAULT NULL COMMENT '配置信息',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `status` tinyint(1) DEFAULT 0 COMMENT '状态',
  `value` text DEFAULT NULL COMMENT '字段值',
  `create_time` int(11) DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) DEFAULT 0 COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统设置表';

--
-- 转存表中的数据 `tp_system`
--

INSERT INTO `tp_system` (`id`, `group_id`, `field`, `name`, `required`, `tips`, `type`, `setup`, `sort`, `status`, `value`, `create_time`, `update_time`) VALUES
(1, 1, 'name', '网站名称', 0, '', 'text', 'array (\n  \'edittype\' => \'ckeditor\',\n)', 1, 1, '扬尘在线监控平台', 1557964941, 1560687320),
(2, 1, 'logo', ' 网站LOGO', 0, '', 'image', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', 2, 1, '/uploads/20190616/c8cb9ef7befe1f8470999e663c7157d6.jpg', 1557968436, 1560687533),
(3, 1, 'icp', '备案号', 0, '', 'text', NULL, 3, 1, '冀ICP备18030882号-1', 1557968883, 1560687533),
(4, 1, 'copyright', '版权信息', 0, '', 'textarea', NULL, 4, 1, 'Copyright © SIYUCMS 2019.All right reserved.Powered by SIYUCMS', 1557968923, 1557986040),
(5, 1, 'address', '公司地址', 0, '', 'text', NULL, 6, 1, '河北省邯郸市邯山区士威大厦1005室', 1557968979, 1560687533),
(6, 1, 'contacts', '联系人', 0, '', 'text', NULL, 7, 1, '孙女士', 1557969011, 1560687533),
(7, 1, 'tel', '联系电话', 0, '', 'text', NULL, 8, 1, '0310-8070726', 1557969048, 1560687533),
(8, 1, 'mobile_phone', '手机号码', 0, '', 'text', NULL, 9, 1, '15100000941', 1557969066, 1560687533),
(9, 1, 'fax', '传真号码', 0, '', 'text', NULL, 10, 1, '', 1557969093, 1560687533),
(10, 1, 'email', '邮箱账号', 0, '', 'text', NULL, 11, 1, '', 1557969113, 1560687533),
(11, 1, 'qq', 'QQ', 0, '', 'text', NULL, 12, 1, '', 1557969147, 1560687533),
(12, 1, 'qrcode', '二维码', 0, '', 'image', 'array (\n  \'upload_allowext\' => \'jpg|jpeg|gif|png\',\n)', 13, 1, '/uploads/20181226/cb7a4c21d6443bc5e7a8d16ac2cbe242.png', 1557969170, 1557986111),
(13, 2, 'title', 'SEO标题', 0, '', 'text', NULL, 21, 1, '扬尘在线监测平台', 1557969266, 1560687533),
(14, 2, 'key', 'SEO关键字', 0, '', 'textarea', NULL, 22, 1, '扬尘，扬尘在线监测，环保监测', 1557969297, 1560687533),
(15, 2, 'des', 'SEO描述', 0, '', 'textarea', NULL, 23, 1, '扬尘在线监测平台', 1557969320, 1560687533),
(16, 3, 'mobile', '手机端', 0, '开启后自动跳转到mobile，自适应网站或无手机端网站请关闭', 'radio', 'array (\n  \'options\' => \'开启|1\r\n关闭|0\',\n)', 31, 1, '0', 1557969425, 1557986182),
(17, 3, 'code', '后台验证码', 0, '后台登录时是否需要验证码', 'radio', 'array (\n  \'options\' => \'开启|1\r\n关闭|0\',\n)', 32, 1, '0', 1557969468, 1557986161),
(18, 3, 'message_code', '前台验证码', 0, '前台留言等是否需要验证码', 'radio', 'array (\n  \'options\' => \'开启|1\r\n关闭|0\',\n)', 33, 1, '0', 1557969501, 1557986161),
(19, 3, 'message_send_mail', '留言邮件提醒', 0, '前台留言时是否需要邮件提醒，如开启请先进行邮箱配置', 'radio', 'array (\n  \'options\' => \'开启|1\r\n关闭|0\',\n)', 34, 1, '0', 1557969526, 1557986161),
(20, 4, 'template', '选择模板', 0, 'PC , MOBILE 等都会在该模板中', 'template', NULL, 41, 1, 'default', 1557969864, 1557985790),
(21, 4, 'html', 'Html目录', 0, '用于模板文件防盗', 'text', NULL, 42, 1, 'html', 1557969903, 1557986194),
(22, 1, 'url', '网站地址', 0, '', 'text', NULL, 5, 1, 'www.hanhouai.com', 1557986088, 1560687533),
(23, 3, 'label_opening', '后台多标签', 0, '开启后后台启用多标签模式', 'radio', 'array (\n  \'options\' => \'开启|1\r\n关闭|0\',\n)', 35, 1, '1', 1558656395, 1558656444),
(24, 3, 'template_opening', '模板修改备份', 0, '开启后后台模板管理中修改文件时会进行自动备份', 'radio', 'array (\n  \'options\' => \'开启|1\r\n关闭|0\',\n)', 36, 1, '1', 1558756191, 1558756247);

-- --------------------------------------------------------

--
-- 表的结构 `tp_system_group`
--

CREATE TABLE `tp_system_group` (
  `id` int(8) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '分组名称',
  `description` text DEFAULT NULL COMMENT '备注',
  `sort` mediumint(8) DEFAULT 50 COMMENT '排序',
  `status` int(1) DEFAULT 0 COMMENT '状态（1 正常，0 锁定）',
  `create_time` int(11) DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) DEFAULT 0 COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统设置分组表';

--
-- 转存表中的数据 `tp_system_group`
--

INSERT INTO `tp_system_group` (`id`, `name`, `description`, `sort`, `status`, `create_time`, `update_time`) VALUES
(1, '基础设置', '基础设置', 1, 1, 1557903491, 1557903491),
(2, 'SEO设置', 'SEO设置', 2, 1, 1557903521, 1557903521),
(3, '开关设置', '开关设置', 3, 1, 1557903537, 1557903537),
(4, '模板设置', '模板设置', 4, 1, 1557903562, 1557903567),
(5, '自定义', '自定义系统设置信息', 5, 1, 1557905966, 1557906261);

-- --------------------------------------------------------

--
-- 表的结构 `tp_team`
--

CREATE TABLE `tp_team` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'ID',
  `cate_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '栏目',
  `title` varchar(70) NOT NULL DEFAULT '' COMMENT '标题',
  `title_style` varchar(225) NOT NULL DEFAULT '' COMMENT '标题样式',
  `thumb` varchar(225) NOT NULL DEFAULT '' COMMENT '缩略图',
  `keywords` varchar(80) NOT NULL DEFAULT '' COMMENT '关键词',
  `description` mediumtext NOT NULL COMMENT 'SEO简介',
  `content` text NOT NULL COMMENT '内容',
  `template` varchar(80) NOT NULL DEFAULT '' COMMENT '模板',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 100 COMMENT '排序',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击次数',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `image` varchar(80) NOT NULL DEFAULT '' COMMENT '缩略图',
  `images` mediumtext NOT NULL COMMENT '图片集',
  `download` varchar(80) NOT NULL DEFAULT '' COMMENT '文件下载',
  `author` varchar(50) NOT NULL DEFAULT 'Admin' COMMENT '作者',
  `source` varchar(255) NOT NULL DEFAULT '' COMMENT '来源',
  `summary` text NOT NULL COMMENT '摘要'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='团队模型表';

--
-- 转存表中的数据 `tp_team`
--

INSERT INTO `tp_team` (`id`, `cate_id`, `title`, `title_style`, `thumb`, `keywords`, `description`, `content`, `template`, `status`, `sort`, `hits`, `create_time`, `update_time`, `image`, `images`, `download`, `author`, `source`, `summary`) VALUES
(10, 18, '总设计师', '', '', '', '', '', '', 1, 100, 4, 1545635580, 0, '/uploads/20181224/6d003cbc391614dda73fbb2ab2bb109c.jpg', '', '', '管理员', '本站', '多年从业经验，精益求精，客户至上，您的满意是我们不懈的追求！'),
(11, 18, '销售总监', '', '', '', '', '', '', 1, 100, 2, 1545636240, 0, '/uploads/20181224/02e41d74e1ec2531fede0b3196ae953b.jpg', '', '', '管理员', '本站', '多年从业经验，精益求精，客户至上，您的满意是我们不懈的追求！'),
(12, 18, '技术总监', '', '', '', '', '', '', 1, 100, 1, 1545636300, 0, '/uploads/20181224/7ea6c84dc1454ab28a4d54c90655e6e0.jpg', '', '', '管理员', '本站', '多年从业经验，精益求精，客户至上，您的满意是我们不懈的追求！'),
(13, 18, '网络总监', '', '', '', '', '', '', 1, 100, 2, 1545636300, 0, '/uploads/20181224/afd088573e24003aadddb5744649dda9.jpg', '', '', '管理员', '本站', '多年从业经验，精益求精，客户至上，您的满意是我们不懈的追求！');

-- --------------------------------------------------------

--
-- 表的结构 `tp_users`
--

CREATE TABLE `tp_users` (
  `id` mediumint(8) NOT NULL,
  `email` varchar(100) NOT NULL COMMENT '邮箱帐号',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `sex` tinyint(1) NOT NULL COMMENT '1男 0女',
  `last_login_time` int(10) DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(15) DEFAULT NULL COMMENT '最后登录IP',
  `qq` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机',
  `mobile_validated` tinyint(3) DEFAULT 0 COMMENT '是否验证手机 1 验证 0 未验证',
  `email_validated` tinyint(3) DEFAULT 0 COMMENT '是否验证手机 1 验证 0 未验证',
  `type_id` tinyint(3) DEFAULT NULL COMMENT '类型',
  `status` tinyint(1) DEFAULT 1 COMMENT '状态',
  `create_ip` varchar(15) DEFAULT NULL COMMENT '注册IP',
  `update_time` int(10) DEFAULT 0 COMMENT '修改时间',
  `create_time` int(10) DEFAULT 0 COMMENT '注册时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员表';

--
-- 转存表中的数据 `tp_users`
--

INSERT INTO `tp_users` (`id`, `email`, `password`, `sex`, `last_login_time`, `last_login_ip`, `qq`, `mobile`, `mobile_validated`, `email_validated`, `type_id`, `status`, `create_ip`, `update_time`, `create_time`) VALUES
(1, 'test001@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 1553138106, '127.0.0.1', '407593529', '15840189268', 0, 0, 1, 1, '127.0.0.1', 1541405155, 1541405155),
(2, 'test002@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 1541405185, '127.0.0.1', '407593529', '15840189627', 0, 0, 2, 1, '127.0.0.1', 1541405155, 1541405185),
(3, 'test003@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 1546060654, '127.0.0.1', '', '', 0, 0, 1, 1, '127.0.0.1', 1541405155, 1546060654),
(4, 'test004@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 1546060666, '127.0.0.1', '', '', 0, 0, 1, 1, '127.0.0.1', 1541405155, 1546060666),
(5, 'test005@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 1546060680, '127.0.0.1', '', '15840189625', 0, 0, 1, 1, '127.0.0.1', 1541405155, 1546060680),
(6, 'test007@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 1546061841, '127.0.0.1', NULL, NULL, 0, 0, 1, 1, '127.0.0.1', 1541405155, 1546061841),
(7, 'test008@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 0, 1546062123, '127.0.0.1', '123', '', 0, 0, 1, 1, '127.0.0.1', 1551844614, 1546061953),
(13, 'test1@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 1560391677, '127.0.0.1', '', '', 0, 0, 1, 1, '127.0.0.1', 1560391648, 1560391648);

-- --------------------------------------------------------

--
-- 表的结构 `tp_users_type`
--

CREATE TABLE `tp_users_type` (
  `id` smallint(4) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '会员组名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `sort` mediumint(8) DEFAULT 50 COMMENT '排序',
  `status` tinyint(1) DEFAULT 1 COMMENT '状态',
  `create_time` int(10) DEFAULT 0 COMMENT '添加时间',
  `update_time` int(10) DEFAULT 0 COMMENT '修改时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员类型表';

--
-- 转存表中的数据 `tp_users_type`
--

INSERT INTO `tp_users_type` (`id`, `name`, `description`, `sort`, `status`, `create_time`, `update_time`) VALUES
(1, '注册会员', '注册会员', 1, 1, 1541405155, 1541405155),
(2, 'VIP会员', 'VIP会员', 2, 1, 1541405155, 1541405155);

-- --------------------------------------------------------

--
-- 表的结构 `tp_youyan_device`
--

CREATE TABLE `tp_youyan_device` (
  `id` int(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `deviceId` varchar(100) NOT NULL,
  `company` varchar(100) NOT NULL,
  `create_time` date NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tp_youyan_device`
--

INSERT INTO `tp_youyan_device` (`id`, `name`, `deviceId`, `company`, `create_time`, `status`) VALUES
(1, '测试设备', '12321312112', '测试', '0000-00-00', 0),
(2, '测试设备', '12321312112', '测试', '0000-00-00', 0),
(3, '测试设备1', '12321312112', '测试', '0000-00-00', 0);

--
-- 转储表的索引
--

--
-- 表的索引 `tp_ad`
--
ALTER TABLE `tp_ad`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `tp_admin`
--
ALTER TABLE `tp_admin`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `tp_admin_log`
--
ALTER TABLE `tp_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`username`);

--
-- 表的索引 `tp_ad_type`
--
ALTER TABLE `tp_ad_type`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `tp_article`
--
ALTER TABLE `tp_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`id`,`status`,`sort`),
  ADD KEY `cate_id` (`id`,`cate_id`,`status`),
  ADD KEY `sort` (`id`,`cate_id`,`status`,`sort`);

--
-- 表的索引 `tp_auth_group`
--
ALTER TABLE `tp_auth_group`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `tp_auth_group_access`
--
ALTER TABLE `tp_auth_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- 表的索引 `tp_auth_rule`
--
ALTER TABLE `tp_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- 表的索引 `tp_cate`
--
ALTER TABLE `tp_cate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`parentid`) USING BTREE;

--
-- 表的索引 `tp_config`
--
ALTER TABLE `tp_config`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `tp_debris`
--
ALTER TABLE `tp_debris`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `tp_download`
--
ALTER TABLE `tp_download`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`id`,`status`,`sort`),
  ADD KEY `cate_id` (`id`,`cate_id`,`status`),
  ADD KEY `sort` (`id`,`cate_id`,`status`,`sort`);

--
-- 表的索引 `tp_field`
--
ALTER TABLE `tp_field`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `tp_link`
--
ALTER TABLE `tp_link`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `tp_message`
--
ALTER TABLE `tp_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`id`,`status`,`sort`),
  ADD KEY `cate_id` (`id`,`cate_id`,`status`),
  ADD KEY `sort` (`id`,`cate_id`,`status`,`sort`);

--
-- 表的索引 `tp_module`
--
ALTER TABLE `tp_module`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `tp_page`
--
ALTER TABLE `tp_page`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `tp_picture`
--
ALTER TABLE `tp_picture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`id`,`status`,`sort`),
  ADD KEY `cate_id` (`id`,`cate_id`,`status`),
  ADD KEY `sort` (`id`,`cate_id`,`status`,`sort`);

--
-- 表的索引 `tp_product`
--
ALTER TABLE `tp_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`id`,`status`,`sort`),
  ADD KEY `cate_id` (`id`,`cate_id`,`status`),
  ADD KEY `sort` (`id`,`cate_id`,`status`,`sort`);

--
-- 表的索引 `tp_system`
--
ALTER TABLE `tp_system`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `tp_system_group`
--
ALTER TABLE `tp_system_group`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `tp_team`
--
ALTER TABLE `tp_team`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`id`,`status`,`sort`),
  ADD KEY `cate_id` (`id`,`cate_id`,`status`),
  ADD KEY `sort` (`id`,`cate_id`,`status`,`sort`);

--
-- 表的索引 `tp_users`
--
ALTER TABLE `tp_users`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `tp_users_type`
--
ALTER TABLE `tp_users_type`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `tp_youyan_device`
--
ALTER TABLE `tp_youyan_device`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `tp_ad`
--
ALTER TABLE `tp_ad`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `tp_admin`
--
ALTER TABLE `tp_admin`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `tp_admin_log`
--
ALTER TABLE `tp_admin_log`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=285;

--
-- 使用表AUTO_INCREMENT `tp_ad_type`
--
ALTER TABLE `tp_ad_type`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `tp_article`
--
ALTER TABLE `tp_article`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=21;

--
-- 使用表AUTO_INCREMENT `tp_auth_group`
--
ALTER TABLE `tp_auth_group`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `tp_auth_rule`
--
ALTER TABLE `tp_auth_rule`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- 使用表AUTO_INCREMENT `tp_cate`
--
ALTER TABLE `tp_cate`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- 使用表AUTO_INCREMENT `tp_config`
--
ALTER TABLE `tp_config`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表id', AUTO_INCREMENT=95;

--
-- 使用表AUTO_INCREMENT `tp_debris`
--
ALTER TABLE `tp_debris`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `tp_download`
--
ALTER TABLE `tp_download`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `tp_field`
--
ALTER TABLE `tp_field`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- 使用表AUTO_INCREMENT `tp_link`
--
ALTER TABLE `tp_link`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `tp_message`
--
ALTER TABLE `tp_message`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `tp_module`
--
ALTER TABLE `tp_module`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `tp_page`
--
ALTER TABLE `tp_page`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `tp_picture`
--
ALTER TABLE `tp_picture`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `tp_product`
--
ALTER TABLE `tp_product`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `tp_system`
--
ALTER TABLE `tp_system`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- 使用表AUTO_INCREMENT `tp_system_group`
--
ALTER TABLE `tp_system_group`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `tp_team`
--
ALTER TABLE `tp_team`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `tp_users`
--
ALTER TABLE `tp_users`
  MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `tp_users_type`
--
ALTER TABLE `tp_users_type`
  MODIFY `id` smallint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `tp_youyan_device`
--
ALTER TABLE `tp_youyan_device`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
