<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/6/26
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>上品小程序后台管理系统</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">上品小程序后台管理系统</div>
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
            <!-- 左侧垂直导航区域-->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item">
                    <a href="javascript:;" data-id="1" data-title="运营概况" data-url="/page/basicOperation"
                       class="site-demo-active" data-type="tabAdd">运营概况</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-id="1" data-title="管理员权限设置" data-url="/page/permission"
                       class="site-demo-active" data-type="tabAdd">管理员权限设置</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-id="1" data-title="门店管理" data-url="/page/shopManage"
                       class="site-demo-active" data-type="tabAdd">门店管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-id="1" data-title="营业场所管理" data-url="/page/businessPlace"
                       class="site-demo-active" data-type="tabAdd">营业场所管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-id="1" data-title="楼层平面管理" data-url="/page/floorPlane"
                       class="site-demo-active" data-type="tabAdd">楼层平面管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-id="1" data-title="品类管理" data-url="/page/category"
                       class="site-demo-active" data-type="tabAdd">品类管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-id="1" data-title="品牌管理" data-url="/page/brand"
                       class="site-demo-active" data-type="tabAdd">品牌管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-id="1" data-title="商铺类型管理" data-url="/page/shopType"
                       class="site-demo-active" data-type="tabAdd">商铺类型管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-id="1" data-title="商铺管理" data-url="/page/shops"
                       class="site-demo-active" data-type="tabAdd">商铺管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-id="1" data-title="公共服务类型管理" data-url="/page/publicServiceType"
                       class="site-demo-active" data-type="tabAdd">公共服务类型管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-id="1" data-title="公共服务场所管理" data-url="/page/publicServicePlaces"
                       class="site-demo-active" data-type="tabAdd">公共服务场所管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-id="1" data-title="停车场管理" data-url="/page/parkinglotPlaces"
                       class="site-demo-active" data-type="tabAdd">停车场管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-id="1" data-title="停车位管理" data-url="/page/parkingspace"
                       class="site-demo-active" data-type="tabAdd">停车位管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-id="1" data-title="优惠券管理" data-url="/page/coupon"
                       class="site-demo-active" data-type="tabAdd">优惠券管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-id="1" data-title="小游戏管理" data-url="/page/game"
                       class="site-demo-active" data-type="tabAdd">小游戏管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-id="1" data-title="消息通知" data-url="/page/notification"
                       class="site-demo-active" data-type="tabAdd">消息通知</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-id="1" data-title="评论管理" data-url="/page/comment"
                       class="site-demo-active" data-type="tabAdd">评论管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-id="1" data-title="意见反馈" data-url="/page/feedback"
                       class="site-demo-active" data-type="tabAdd">意见反馈</a>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">复杂页面管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" data-id="1" data-title="banner" data-url="/page/banner"
                               class="site-demo-active" data-type="tabAdd">banner</a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-id="1" data-title="链接配置" data-url="/page/linkConfig"
                               class="site-demo-active" data-type="tabAdd">链接配置</a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-id="1" data-title="站内广播" data-url="/page/broadcast"
                               class="site-demo-active" data-type="tabAdd">站内广播</a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-id="1" data-title="广告位管理" data-url="/page/advertise"
                               class="site-demo-active" data-type="tabAdd">广告位管理</a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-id="1" data-title="附近导航banner" data-url="/page/navigate"
                               class="site-demo-active" data-type="tabAdd">附近导航banner</a>
                        </dd>
                        <dd>
                            <a href="javascript:;" data-id="1" data-title="楼层管理" data-url="/page/floorManage"
                               class="site-demo-active" data-type="tabAdd">楼层管理</a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <!--tab标签-->
    <div class="layui-tab" lay-filter="demo" lay-allowclose="true" style="margin-left: 200px;">
        <ul class="layui-tab-title"></ul>
        <div class="layui-tab-content"></div>
    </div>

    <div class="layui-footer" style="text-align:center;">
        <!-- 底部固定区域 -->
        © sunway.tk XXXX业务管理平台
    </div>
</div>



<script src="/layui/layui.js"></script>
<script>
    <!--这里是放置js代码区域-->
    layui.use(['element', 'layer', 'jquery'], function () {
        var element = layui.element;
        // var layer = layui.layer;
        var $ = layui.$;
        // 配置tab实践在下面无法获取到菜单元素
        $('.site-demo-active').on('click', function () {
            var dataid = $(this);
            //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
            if ($(".layui-tab-title li[lay-id]").length <= 0) {
                //如果比零小，则直接打开新的tab项
                active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
            } else {
                //否则判断该tab项是否以及存在
                var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                $.each($(".layui-tab-title li[lay-id]"), function () {
                    //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                    if ($(this).attr("lay-id") == dataid.attr("data-id")) {
                        isData = true;
                    }
                })
                if (isData == false) {
                    //标志为false 新增一个tab项
                    active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
                }
            }
            //最后不管是否新增tab，最后都转到要打开的选项页面上
            active.tabChange(dataid.attr("data-id"));
        });

        var active = {
            //在这里给active绑定几项事件，后面可通过active调用这些事件
            tabAdd: function (url, id, name) {
                //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                element.tabAdd('demo', {
                    title: name,
                    content: '<iframe data-frameid="' + id + '" scrolling="auto" frameborder="0" src="' + url + '" style="width:100%;height:99%;"></iframe>',
                    id: id //规定好的id
                })
                FrameWH();  //计算ifram层的大小
            },
            tabChange: function (id) {
                //切换到指定Tab项
                element.tabChange('demo', id); //根据传入的id传入到指定的tab项
            },
            tabDelete: function (id) {
                element.tabDelete("demo", id);//删除
            }
        };
        function FrameWH() {
            var h = $(window).height();
            $("iframe").css("height",h+"px");
        }
    });
</script>
</body>
</html>
