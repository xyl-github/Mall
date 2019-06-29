<%--
  Created by IntelliJ IDEA.
  User: xyl
  Date: 2019/6/22
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>停车场管理</title>
    <link href="/css/bootstrap.min.css?version=2019" rel="stylesheet">
    <link href="/css/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <script src="/js/jquery-3.3.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/bootstrap.min.js?version=2019" type="text/javascript" charset="utf-8"></script>
    <script src="/js/vue.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/axios.js" type="text/javascript" charset="utf-8"></script>
</head>

<body>
<div class="container" id="app" style="margin-top: 2%">
    <div class="container">
        <div class="row">
            <form class="form-inline" role="form">
                <div class="form-group">
                    <label for="lastname" class="control-label">门店：</label>
                    <select class="form-control" id="lastname">
                        <option value="0">上品+奥运村店</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4 "></label>
                </div>


                <div class="form-group">
                    <label class="control-label col-sm-8 "></label>
                </div>

                <div class="form-group">
                    <button type="button" class="btn btn-default" style="border-spacing: 1em;border-color: #ececf6"
                            id="n" @click="found">创建
                    </button>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4 "></label>
                </div>


                <div class="form-group">
                    <label class="control-label col-sm-8 "></label>
                </div>

                <div class="form-group">
                    <button type="button" class="btn btn-default" style="border-spacing: 1px;border-color: #ececf6"
                            id="m" @click="xzmodel()">下载模板
                    </button>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4 "></label>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-8 "></label>
                </div>

                <div class="form-group">
                    <div class="form-group">
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="firstname" name="ename" placeholder="请输入查询的停车场">
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="button" class="btn btn-primary" id="p">搜索</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <table class="table table-bordered table-hover tab-content text-center">
        <tr>
            <td>停车场id</td>
            <td>营业场所</td>
            <td>楼层</td>
            <td>停车场名字</td>
            <td>停车说明</td>
            <td>平面图</td>
            <td>操作</td>
        </tr>
        <tr>
            <td></td>
            <td>营业场所</td>
            <td>楼层</td>
            <td>停车场名字</td>
            <td>停车说明</td>
            <td>平面图</td>
            <td>
                <button type="button" class="btn btn-default" style="border-spacing: 1px;border-color: #ececf6"
                        @click="update()">修改
                </button>
                <button type="button" class="btn btn-default" style="border-spacing: 1px;border-color: #ececf6"
                        @click="yijian()">一键导入车位
                </button>
                <button id="yijian" type="button" class="btn btn-danger">删除</button>
            </td>
        </tr>
    </table>


    <!-- 模态框（Modal） -->
    <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    新增/修改 修改停车场
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>

                <div class="modal-body">

                    <form class="form-horizontal" role="form" id="add">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">营业场所</label>
                            <div class="col-sm-4">
                                <select id="" class="form-control" name="shopId">
                                    <option>请选择营业场所</option>
                                    <option>A座</option>
                                    <option>上品+花园停车场</option>
                                    <option>写字楼B3停车场</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-4">
                                <select class="form-control">
                                    <option>禁止选择店铺楼层</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label" for="">停车场名字</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="name" placeholder="请输入停车场名字">
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label" for="">停车说明</label>
                            <div class="col-sm-10">
                                <textarea rows="3" cols="80" name="introduce" placeholder="请输入停车说明"></textarea>
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label" for="">停车场平面图</label>
                            <div class="col-sm-10">
                                <div class="text-center"
                                     style="width: 100px;height: 100px; border: 1px dashed black; border-radius: 5px;"
                                     @click="selectFile();">
                                    <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                    </div>
                                </div>
                                <input id="selectFile" type="file" style="display: none;" name="image">
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label" for="">状态</label>
                            <div class="col-sm-4">
                                <select class="form-control">
                                    <option>启用</option>
                                    <option>禁用</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" @click="add()">增加</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <div class="modal fade bs-example-modal-lg" id="updatemyModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    新增/修改 修改停车场
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">

                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">营业场所</label>
                            <div class="col-sm-4">
                                <select class="form-control">
                                    <option>禁止选择</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">楼层</label>
                            <div class="col-sm-4">
                                <select class="form-control">
                                    <option>禁止选择店铺楼层</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label" for="">停车场名字</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control">
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label" for="">停车说明</label>
                            <div class="col-sm-10">
                                <textarea rows="3" cols="80"></textarea>
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label" for="">停车场平面图</label>
                            <div class="col-sm-10">
                                <div class="text-center"
                                     style="width: 100px;height: 100px; border: 1px dashed black; border-radius: 5px;"
                                     @click="updateFile();">
                                    <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                    </div>
                                </div>
                                <input id="updateFile" type="file" style="display: none;">
                            </div>
                        </div>

                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label" for="">状态</label>
                            <div class="col-sm-4">
                                <select class="form-control">
                                    <option>启用</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" @click="subUpdate()">提交更改</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

</div>
</body>
<script>


    var v = new Vue({
        el: "#app",
        data: {
            emp_list: [],
            emp: {},
            val: 148,
            findsList: [],
            id:148
        },
        methods: {
            updateFile() {
                $("#updateFile").trigger("click");
            },
            selectFile() {
                $("#selectFile").trigger("click");
            },
            xzmodel() {
                $("#selectFile").trigger("click");
            },
            yijian() {
                $("#selectFile").trigger("click");
            },
            found() {
                $("#myModal").modal('show');
            },
            update() {
                $("#updatemyModal").modal('show');
            },
            subUpdate() {
                var that = this
                axios.post('/parkingDepot/modify', {
                    id: "14",
                    status: "0",
                    shopId: "39",
                    name: "1",
                    introduce: "我是停车场的简介",
                    image: "平面图.png",
                    floorId: "133",
                    floorName: "B1",
                    doBusinessSiteName: "A座",
                    oBusinessSiteId: "55"
                })
                    .then(function (response) {
                       that.id =  response.data
                        console.log(response.data)
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            add() {
                axios.post('parkingDepot/add', {
                    status: "0",
                    shopId: "39",
                    name: "1",
                    introduce: "我是停车场的简介",
                    image: "平面图.png",
                    floorId: "133",
                    doBusinessSiteId: "55"
                })
                    .then(function (response) {
                        that.val = response.data
                        console.log(response.data)
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            }
        }
        , created() {
            var that = this;
            axios.post('parkingDepot/finds', {
                shopId: "39"
            })
                .then(function (response) {
                    console.log(response.data)
                    that.findsList = response.data
                })
                .catch(function (error) {
                    console.log(error);
                });
        }
    })
</script>
</html>