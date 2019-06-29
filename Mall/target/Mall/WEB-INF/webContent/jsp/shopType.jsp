<%@ taglib prefix="v-bind" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: xyl
  Date: 2019/6/22
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商铺类型管理</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
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
                    <label for="lastname" class="control-label">门店：</label>
                    <select class="form-control" id="lastname" v-model="shopId" @change="change()">
                        <option v-for="shop in shopIdList" v-bind:value="shop.id" v-if="shop.status==0">{{shop.name}}
                        </option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4 "></label>
                </div>


                <div class="form-group">
                    <label class="control-label col-sm-8 "></label>
                </div>

                <div class="form-group">
                    <button type="button" @click="add()" class="btn btn-default"
                            style="border-spacing: 1em;border-color: #ececf6"
                            id="n">创建
                    </button>
                </div>

            </form>


        </div>
    </div>
    <table class="table table-bordered table-hover tab-content text-center">
        <tr>
            <td>商铺类型id</td>
            <td>名称</td>
            <td>状态</td>
            <td>操作</td>
        </tr>
        <tr v-for="storeType in storeTypeList">
            <td v-text="storeType.id">超级管理员</td>
            <td v-text="shopPlace.name"></td>
            <td v-text="shopPlace.status">15010327826</td>
            <td>
                <button type="button" @click="update(storeType)" class="btn btn-default"
                        style="border-spacing: 1em;border-color: #ececf6">修改
                </button>
                <button type="button" @click="del(storeType)" class="btn btn-danger">删除</button>
            </td>
        </tr>
    </table>

    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel" style="float: left;">创建/修改 商铺类型</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">

                    <form class="bs-example bs-example-form" role="form">

                        <div class="input-group" style="margin-top: 15px;">
                            <span class="input-group-addon">名称</span>
                            <input type="text"
                                   class="form-control" v-model="addStoreType.name"
                                   placeholder="请输入名称"/>
                        </div>

                        <div class="input-group col-md-4" style="margin-top: 15px;">
                            <span class="input-group-addon">状态</span>
                            <select class="form-control" v-model="addstatus">
                                <option v-for="status in statusList" v-bind:value="status.id">{{status.name}}
                                </option>
                            </select>
                        </div>

                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="addstoreType()">确定</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>

    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" style="float: left;">创建/修改 商铺类型</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">

                    <form class="bs-example bs-example-form" role="form">

                        <div class="input-group" style="margin-top: 15px;">
                            <span class="input-group-addon">名称</span>
                            <input type="text"
                                   class="form-control" v-model="updateStoreType.name"
                            />
                        </div>

                        <div class="input-group col-md-4" style="margin-top: 15px;">
                            <span class="input-group-addon">状态</span>
                            <select class="form-control" v-model="updateStoreType.status">
                                <option v-for="status in statusList" v-bind:value="status.id">{{status.name}}
                                </option>
                            </select>
                        </div>

                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="updatestoreType()">确定</button>
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
            addstatus: "0",
            statusList: [{id: 1, name: "禁用"}, {id: 0, name: "启用"}],
            addStoreType: {},
            storeTypeList: {},
            updateStoreType: {},
            shopIdList: {},
            shopId: ""
        },
        methods: {
            change() {
                var that = this;
                var params = new URLSearchParams();
                params.append('type', "store");
                params.append('shopId', that.shopId);
                axios
                    .post('/storeType/finds', params)
                    .then(function (response) {
                        console.log(response);
                        that.storeTypeList = response.data.responseList;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            update(storeType) {
                var that = this;
                axios.post('/storeType/findById?type=store&id=' + storeType.id)
                    .then(function (response) {
                        console.log(response);
                        that.updateStoreType = response.data.responseResult;
                        $("#updateModal").modal('show');
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            updatestoreType() {
                var that = this;
                var params = new URLSearchParams();
                params.append('id', that.updateStoreType.id);
                params.append('name', that.updateStoreType.name);
                params.append('stastus', that.updateStoreType.status);
                params.append('type', "store");
                params.append('shopId',that.shopId);
                axios.post('/storeType/modify', params)
                    .then(function (response) {
                        $("#updateModal").modal("hide");
                        console.log(response);
                        that.getAll();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            del(storeType) {
                var that = this;
                axios.post('/storeType/delete?id='+storeType.id)
                    .then(function (response) {
                        console.log(response);
                        console.log("删除成功");
                        that.getAll();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            add() {
                $("#addModal").modal('show');
            },
            addstoreType() {
                var that = this;
                var params = new URLSearchParams();
                params.append('name', that.addStoreType.name);
                params.append('stastus', that.addstatus);
                params.append('type', "store");
                params.append('shopId',that.shopId);
                axios.post('/storeType/add', params)
                    .then(function (response) {
                        $("#addModal").modal("hide");
                        console.log(response);
                        that.getAll();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            getAll() {
                var that = this;
                var params = new URLSearchParams();
                params.append('type', "store");
                params.append('shopId', "1");
                axios
                    .post('/storeType/finds', params)
                    .then(function (response) {
                        console.log(response);
                        that.shopId = "1";
                        that.storeTypeList = response.data.responseList;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            }
        }, created() {
            var that = this;
            axios.post('/shopAdmin/find')
                .then(function (response) {
                    that.shopIdList = response.data.responseList;
                    that.shopId = "1";
                    console.log(response.data.responseList);
                })
                .catch(function (error) {
                    console.log(error);
                });


            var params = new URLSearchParams();
            params.append('type', "store");
            params.append('shopId', "1");
            axios
                .post('/storeType/finds', params)
                .then(function (response) {
                    console.log(response);
                    that.shopId = "1";
                    that.storeTypeList = response.data.responseList;
                })
                .catch(function (error) {
                    console.log(error);
                });
        }
    })
</script>
</body>
</html>
