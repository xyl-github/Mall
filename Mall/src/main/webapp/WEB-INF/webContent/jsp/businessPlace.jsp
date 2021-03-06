<%@ taglib prefix="v-bind" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/6/22
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>营业场所管理</title>
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
                        <option v-for="shop in shopIdList" v-bind:value="shop.id" v-if="shop.status==0">{{shop.name}}</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4 "></label>
                </div>


                <div class="form-group">
                    <label class="control-label col-sm-8 "></label>
                </div>

                <div class="form-group">
                    <button type="button" class="btn btn-default"
                            style="border-spacing: 1em;border-color: #ececf6" @click="add()"
                    >创建
                    </button>
                </div>

            </form>


        </div>
    </div>
    <table class="table table-bordered table-hover tab-content text-center">
        <tr>
            <td>营业场所id</td>
            <td>营业场所名称</td>
            <td>简介</td>
            <td>状态</td>
            <td>操作</td>
        </tr>
        <tr v-for="shopPlace in shopPlaceList">
            <td v-text="shopPlace.id">超级管理员</td>
            <td v-text="shopPlace.name"></td>
            <td v-text="shopPlace.introduce">超级管理员</td>
            <td v-text="shopPlace.status">15010327826</td>
            <td>
                <button type="button" @click="update(shopPlace)" class="btn btn-default"
                        style="border-spacing: 1em;border-color: #ececf6">修改
                </button>
                <button type="button" @click="del(shopPlace)" class="btn btn-danger">删除</button>
            </td>
        </tr>
    </table>

    <div class="modal fade bs-example-modal-lg" id="addPlaceModel" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel" style="float: left;">创建/修改 营业场所</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <form class="form-horizontal" method="post" role="form">
                    <div class="modal-body">

                        <div class="form-group">
                            <label class="col-sm-3 control-label">名字</label>
                            <div class="col-sm-7">
                                <input type="text"
                                       class="form-control" v-model="addShop.name"
                                       placeholder="请输入营业场所的名字">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">简介</label>
                            <div class="col-sm-7">
                                <input type="text"
                                       class="form-control" v-model="addShop.introduce"
                                       placeholder="请输入营业场所的简介">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">状态</label>
                            <div class="col-sm-3">
                                <select class="form-control" v-model="addShop.status">
                                    <option v-for="status in statusList" v-bind:value="status.id">{{status.name}}
                                    </option>
                                </select>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" @click="addshop()">确定</button>
                    </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>

    <div class="modal fade bs-example-modal-lg" id="updatePlaceModel" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" style="float: left;">创建/修改 营业场所</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <form class="form-horizontal" method="post" role="form">
                    <div class="modal-body">

                        <div class="form-group">
                            <label class="col-sm-3 control-label">名字</label>
                            <div class="col-sm-7">
                                <input type="text"
                                       class="form-control" v-model="updateShop.name"
                                >
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">简介</label>
                            <div class="col-sm-7">
                                <input type="text"
                                       class="form-control" v-model="updateShop.introduce"
                                >
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">状态</label>
                            <div class="col-sm-3">
                                <select class="form-control" v-model="updateShop.status">
                                    <option v-for="status in statusList" v-bind:value="status.id">{{status.name}}
                                    </option>
                                </select>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" @click="updateshop()">确定</button>
                    </div>
                </form>
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
            shopPlaceList: {},
            shopIdList: {},
            shopId: "",
            addShop: {},
            updateShop: {},
            statusList: [{id: 1, name: "禁用"}, {id: 0, name: "启用"}],
        },
        methods: {
            change() {
                var that = this;
                axios.post('/doBusinessSite/find?shopId='+that.shopId)
                    .then(function (response) {
                        console.log(response.data.responseList);
                        that.shopPlaceList = response.data.responseList;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            update(shop) {
                this.updateShop = shop;
                var that = this;
                axios.post('/doBusinessSite/findById?id='+shop.id)
                    .then(function (response) {
                        console.log(response);
                        that.updateShop = response.data.responseResult
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
                $("#updatePlaceModel").modal('show');
            },
            del(shop) {
                var that = this;
                axios.post('/doBusinessSite/delete?id='+shop.id)
                    .then(function (response) {
                        console.log(response.data.responseResult);
                        that.getAll();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            add: function () {
                $("#addPlaceModel").modal('show');
            },
            addshop: function () {
                var that = this;
                var params = new URLSearchParams();
                params.append('name', that.addShop.name);
                params.append('status', that.addShop.status);
                params.append('introduce', that.addShop.introduce);
                params.append('shopId', that.shopId);
                axios.post('/doBusinessSite/add', params)
                    .then(function (response) {
                        $("#addPlaceModel").modal("hide");
                        console.log(response.data.responseResult);
                        that.getAll();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            updateshop: function () {
                var that = this;
                var params = new URLSearchParams();
                params.append('id', that.updateShop.id);
                params.append('name', that.updateShop.name);
                params.append('status', that.updateShop.status);
                params.append('introduce', that.updateShop.introduce);
                params.append('shopId', that.shopId);
                axios.post('/doBusinessSite/change', params)
                    .then(function (response) {
                        $("#updatePlaceModel").modal("hide");
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
                    .post('/doBusinessSite/find?shopId=1')
                    .then(function (response) {
                        that.shopId = 1;
                        that.shopPlaceList = response.data.responseList;
                        console.log(response.data.responseList);
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
                    console.log(response.data.responseList);
                })
                .catch(function (error) {
                    console.log(error);
                });

            axios
                .post('/doBusinessSite/find?shopId=1')
                .then(function (response) {
                    that.shopId = 1;
                    that.shopPlaceList = response.data.responseList;
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
