<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/6/22
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员权限设置</title>
    <link href="/css/bootstrap.min.css?version=2019" rel="stylesheet">
    <script src="/js/jquery-3.3.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/vue.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/axios.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div class="container" id="app" style="margin-top: 2%">
    <div class="container">
        <div class="row">
            <form class="form-inline" role="form">

                <div class="form-group">
                    <button type="button" @click="add()" class="btn btn-default"
                            style="border-spacing: 1px;border-color: #ececf6"
                    >添加管理员
                    </button>
                </div>

            </form>
        </div>
    </div>
    <table class="table table-bordered table-hover tab-content text-center">
        <tr>
            <td>管理员类型</td>
            <td>权限</td>
            <td>管理员姓名</td>
            <td>管理员电话</td>
            <td>账号</td>
            <td>状态</td>
            <td>操作</td>
        </tr>
        <tr v-for="admin in adminList">
            <td v-text="admin.type">超级管理员</td>
            <td v-text="admin.type"></td>
            <td v-text="admin.name">超级管理员</td>
            <td v-text="admin.tel">15010327826</td>
            <td v-text="admin.user">admin</td>
            <td v-text="admin.status">启用</td>
            <td>
                <button type="button" @click="update(admin)" class="btn btn-default"
                        style="border-spacing: 1em;border-color: #ececf6">修改
                </button>
                <button type="button" @click="del(admin)" class="btn btn-danger">删除</button>
            </td>
        </tr>
    </table>

    <div class="modal fade bs-example-modal-lg" id="updateModel" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel" style="float: left;">添加/修改 管理员</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">

                    <form class="form-horizontal" role="form">

                        <div class="form-group">
                            <label class="col-sm-3 control-label">管理员类型</label>
                            <div class="col-sm-3">
                                <select class="form-control" v-model="updateAdmin.type">
                                    <option v-bind:value="updateAdmin.type">超级管理员</option>
                                    <option v-bind:value="updateAdmin.type">门店管理员</option>
                                    <option v-bind:value="updateAdmin.type">运营管理员</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">管理员姓名</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control"
                                       v-model="updateAdmin.name"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">管理员手机号</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control"
                                       v-model="updateAdmin.tel"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">管理员账号</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control"
                                       v-model="updateAdmin.user"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">管理员密码</label>
                            <div class="col-sm-9">
                                <input type="password"
                                       class="form-control"
                                       v-model="updateAdmin.password"
                                       placeholder="请输入管理员密码"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">状态</label>
                            <div class="col-sm-3">
                                <select class="form-control" v-model="updateAdmin.status">
                                    <option>启用</option>
                                    <option>禁用</option>
                                </select>
                            </div>
                        </div>
                    </form>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="updateadmin()">确定</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>

    <div class="modal fade bs-example-modal-lg" id="addModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" style="float: left;">添加/修改 管理员</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">

                    <form class="form-horizontal" role="form">

                        <div class="form-group">
                            <label class="col-sm-3 control-label">管理员类型</label>
                            <div class="col-sm-3">
                                <select class="form-control" v-model="addAdmin.type">
                                    <option selected="selected">请选择管理员类型</option>
                                    <option v-bind:value="addAdmin.type">超级管理员</option>
                                    <option v-bind:value="addAdmin.type">门店管理员</option>
                                    <option v-bind:value="addAdmin.type">运营管理员</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">门店</label>
                            <div class="col-sm-3">
                                <select class="form-control" v-model="addAdmin.shopIds">
                                    <option selected="selected" v-bind:value="addAdmin.shopIds">请选择门店</option>
                                    <option v-bind:value="addAdmin.shopIds">上品+奥运村店</option>
                                    <option v-bind:value="addAdmin.shopIds">门店管理员</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">管理员姓名</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control" v-model="addAdmin.name"
                                       placeholder="请输入管理员姓名"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">管理员手机号</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control" v-model="addAdmin.tel"
                                       placeholder="请输入管理员手机号(仅限于数字)"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">管理员账号</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control" v-model="addAdmin.user"
                                       placeholder="请输入管理员账号"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">管理员密码</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control" v-model="addAdmin.password"
                                       placeholder="请输入管理员密码"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">状态</label>
                            <div class="col-sm-3">
                                <select class="form-control" v-model="addAdmin.status">
                                    <option value="0" v-bind:value="addAdmin.status">启用</option>
                                    <option value="1" v-bind:value="addAdmin.status">禁用</option>
                                </select>
                            </div>
                        </div>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="addadmin()">确定</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>


</div>


<script>
    var v = new Vue({
        el: "#app",
        data: {
            adminList: {},
            updateAdmin: {},
            addAdmin: {}
        },
        methods: {
            update(admin) {
                this.updateAdmin = admin;
                $("#updateModel").modal('show');
            },
            del(admin) {
                axios.post('/min/deleteAdmin', {
                    id: 117
                })
                    .then(function (response) {
                        console.log(response.data.responseResult);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            add() {
                $("#addModel").modal('show');
            },
            updateadmin() {
                var id = this.updateAdmin.id;
                var type = this.updateAdmin.type;
                var shopIds = this.updateAdmin.shopIds;
                var name = this.updateAdmin.name;
                var tel = this.updateAdmin.tel;
                var user = this.updateAdmin.user;
                var status = this.updateAdmin.status;
                var password = this.updateAdmin.password;
                var that = this;
                axios.post('/min/changeAdmin', {
                    id: 117,
                    type: "%E8%B6%85%E7%BA%A7%E7%AE%A1%E7%90%86%E5%91%98",
                    shopId: "",
                    name: "1",
                    tel: "2",
                    user: "3",
                    status: "0",
                    password: "4"
                })
                    .then(function (response) {
                        $("#updateModal").modal("hide");
                        console.log(response.data.responseResult);
                        that.getAll();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            addadmin: function () {
                var type = this.addAdmin.type;
                var shopIds = this.addAdmin.shopIds;
                var name = this.addAdmin.name;
                var tel = this.addAdmin.tel;
                var user = this.addAdmin.user;
                var status = this.addAdmin.status;
                var password = this.addAdmin.password;
                var that = this;
                axios.post('/min/addUser', {
                    type: "%E8%B6%85%E7%BA%A7%E7%AE%A1%E7%90%86%E5%91%98",
                    shopIds: "",
                    name: "1",
                    tel: "2",
                    user: "3",
                    status: "0",
                    password: "4"
                })
                    .then(function (response) {
                        $("#updateModal").modal("hide");
                        console.log(response.data.responseResult);
                        that.getAll();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            getAll() {
                var that = this;
                axios
                    .post('/min/findAdmin',{
                        index:0,
                        max:100
                    })
                    .then(function (response) {
                        that.adminList = response.data.responseList;
                        console.log(response);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            }
        }, created() {
            var that = this;
            axios
                .get('/min/findAdmin',{
                        params: {
                            index:0,
                            max:100
                        }
                    })
                .then(function (response) {
                    that.adminList = response.data.responseList;
                    console.log(response.data.responseList);
                })
                .catch(function (error) {
                    console.log(error);
                });
        }
    })
</script>
</body>
</html>
