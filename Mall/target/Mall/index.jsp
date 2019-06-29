<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>上品小程序后台管理系统</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/jquery-3.3.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/vue.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/axios.js" type="text/javascript" charset="utf-8"></script>
</head>

<body class="layui-layout-body layui-bg-gray">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">上品小程序后台管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img"> 贤心
                </a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="">退出</a>
                    </dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item">
                    <a href="/page/basicOperation">运营概况</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/page/permission">管理员权限设置</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/page/shopManage">门店管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/page/businessPlace">营业场所管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/page/floorPlane">楼层平面管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/page/category">品类管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/page/brand">品牌管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/page/shopType">商铺类型管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/page/shops">商铺管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/page/publicServiceType">公共服务类型管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/page/publicServicePlaces">公共服务场所管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/page/parkinglotPlaces">停车场管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/page/parkingspace">停车位管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/page/coupon">优惠券管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/page/game">小游戏管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/page/notification">消息通知</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/page/comment">评论管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/page/feedback">意见反馈</a>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">复杂页面管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="/page/banner">banner</a>
                        </dd>
                        <dd>
                            <a href="/page/linkConfig">链接配置</a>
                        </dd>
                        <dd>
                            <a href="/page/broadcast">站内广播</a>
                        </dd>
                        <dd>
                            <a href="/page/advertise">广告位管理</a>
                        </dd>
                        <dd>
                            <a href="/page/navigate">附近导航banner</a>
                        </dd>
                        <dd>
                            <a href="/page/floorManage">楼层管理</a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">

    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <div style="padding: 15px;">© layui.com</div>
        <!--© layui.com - 底部固定区域-->
    </div>
</div>
<script src="/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;

    });
</script>
</body>

</html>