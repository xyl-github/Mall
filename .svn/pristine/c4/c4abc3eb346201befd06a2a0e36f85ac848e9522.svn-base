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
    <title>停车位管理</title>
    <script src="/js/jquery-3.3.1.min.js" type="text/javascript" charset="utf-8"></script>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/bootstrap-table.min.css" rel="stylesheet">
    <script src="/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/bootstrap-table.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/bootstrap-table-zh-CN.min.js" type="text/javascript" charset="utf-8"></script>
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
                            id="n" onclick="found()">创建
                    </button>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-1 "></label>
                </div>

                <div class="form-group">
                    <div class="form-group">
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="firstname" name="ename" placeholder="请输入查询的停车场">
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="button" class="btn btn-primary" id="p" @click='search()'>搜索</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <table class="table table-bordered table-hover tab-content text-center">
        <tr>
            <td>停车位id</td>
            <td>停车场</td>
            <td>车位号</td>
            <td>车位二维码</td>
            <td>状态</td>
            <td>操作</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <button type="button" @click="showPicture()" class="btn btn-default"
                        style="border-spacing: 1em;border-color: #ececf6">生成
                </button>
            </td>
            <td></td>
            <td>
                <button type="button" class="btn btn-default" style="border-spacing: 1px;border-color: #ececf6"
                        @click="updateAs()">修改
                </button>
                <button type="button" class="btn btn-danger" @click="del()">删除</button>
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
                            <label class="col-sm-2 control-label">停车场</label>
                            <div class="col-sm-4">
                                <select id="" class="form-control" name="shopId">
                                    <option>请选择停车场</option>
                                    <option>花园停车场</option>
                                    <option>B3停车场</option>
                                </select>
                            </div>
                        </div>


                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label" for="">车位号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="name" placeholder="请输入车位号">
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


    <div class="modal fade bs-example-modal-lg" id="showPictureModel" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <img src="/images/test3.png"
                         style="max-width: 80%; height: auto; display: block; margin: 0px auto;"/>
                    <div class="row" style="margin-left: 33%;margin-top: 50px">
                        <span style="width:200px;height: 32px;color:deepskyblue;background-color:lightblue">温馨提示：鼠标放到图片-->右击-->图片另存为</span>
                    </div>
                </div>
                <div class="modal-footer">
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>


    <!-- 模态框（Modal） -->
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

                    <form class="form-horizontal" role="form" id="a">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">停车场</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="shopId">
                                    <option>请选择停车场</option>
                                    <option>花园停车场</option>
                                    <option>B3停车场</option>
                                </select>
                            </div>
                        </div>


                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label" for="">车位号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="name" placeholder="请输入停车场名字">
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
                    <button type="button" class="btn btn-primary" @click="updateList()">修改</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>


</div>


</body>
<script>
    function found() {
        $("#myModal").modal('show')
    }

    var v = new Vue({
        el: "#app",
        data: {
            publicServiceList: [],
            publicList: {}
        },
        methods: {
            search(){

            },

            del(){

                var that = this
                axios.post('/parkingAdmin/delete', {
                    id: "434"
                })
                    .then(function (response) {
                        console.log(response);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },

            updateList() {
                var that = this
                axios.post('/parkingAdmin/modify', {
                    id: "434",
                    shopId: "39",
                    floorId: "72",
                    parkingDepotId: "143",
                    name: "222222",
                    status: "0"
                })
                    .then(function (response) {
                        console.log(response);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            updateAs() {
                $("#updatemyModal").modal('show')
            },
            showPicture() {
                $("#showPictureModel").modal('show')
            },
            add() {
                var that = this
                axios.post('/parkingAdmin/add', {
                    shopId: "39",
                    floorId: "72",
                    parkingDepotId: "143",
                    name: "222222",
                    status: "0"
                })
                    .then(function (response) {
                        console.log(response);
                        that.publicList = response.data.responseList;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            }
        },
        create() {
            var that = this
            axios.post('/parkingAdmin/finds', {
                shopId: "39",
            })
                .then(function (response) {
                    console.log(response);
                    that.publicServiceList = response.data.responseList;
                })
                .catch(function (error) {
                    console.log(error);
                });
        }
    })
</script>

</html>
