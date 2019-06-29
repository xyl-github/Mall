<%@ taglib prefix="v-bind" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: xyl
  Date: 2019/6/22
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>公共服务类型管理</title>
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
                    <button type="button" class="btn btn-default" @click="add()"
                            style="border-spacing: 1em;border-color: #ececf6" id="n">添加
                    </button>
                </div>

            </form>


        </div>
    </div>
    <table class="table table-bordered table-hover tab-content text-center">
        <tr>
            <td>公共服务类型id</td>
            <td>服务类型</td>
            <td>状态</td>
            <td>操作</td>
        </tr>
        <tr v-for="publicServiceType in publicServiceTypeList">
            <td v-text="publicServiceType.id">超级管理员</td>
            <td v-text="publicServiceType.name"></td>
            <td v-text="publicServiceType.status">15010327826</td>
            <td>
                <button type="button" @click="update(publicServiceType)" class="btn btn-default"
                        style="border-spacing: 1em;border-color: #ececf6">修改
                </button>
                <button type="button" @click="del(publicServiceType)" class="btn btn-danger">删除</button>
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
                                   class="form-control" v-model="addPublicService.name"
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
                    <button type="button" class="btn btn-primary" @click="addpublicServiceType()">确定</button>
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
                                   class="form-control" v-model="updatePublicService.name"
                            />
                        </div>

                        <div class="input-group col-md-4" style="margin-top: 15px;">
                            <span class="input-group-addon">状态</span>
                            <select class="form-control" v-model="updatePublicService.status">
                                <option v-for="status in statusList" v-bind:value="status.id">{{status.name}}
                                </option>
                            </select>
                        </div>

                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="updatepublicServiceType()">确定</button>
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
            addPublicService: {},
            publicServiceTypeList: {},
            updatePublicService: {},
            shopId: "",
            shopIdList: {},
            statusList: [{id: 1, name: "禁用"}, {id: 0, name: "启用"}],
        },
        methods: {
            change() {
                var that = this;
                axios.post('/storeType/finds?type=service&shopId=' + that.shopId)
                    .then(function (response) {
                        console.log(response);
                        that.publicServiceTypeList = response.data.responseList;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            change() {
                var that = this;
                axios.post('/floorAdmin/find/' + that.shopId + '/floors')
                    .then(function (response) {
                        console.log(response.data.responseList);
                        that.floorList = response.data.responseList;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            update(publicServiceType) {
                var that = this;
                axios.post('/storeType/findById?type=service&id=' + publicServiceType.id)
                    .then(function (response) {
                        that.updatePublicService = response.data.responseResult;
                        $("#updateModal").modal('show');
                        console.log(response);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            updatepublicServiceType() {
                var that = this;
                var params = new URLSearchParams();
                params.append('type', "service");
                params.append('shopId', that.shopId);
                params.append('status', that.updatePublicService.status);
                params.append('name', that.updatePublicService.name);
                params.append('id', that.updatePublicService.id);
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
            del(publicServiceType) {
                var that = this;
                axios.post('/storeType/delete?id='+publicServiceType.id)
                    .then(function (response) {
                        console.log(response);
                        that.getAll();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            add() {
                $("#addModal").modal('show');
            },
            addpublicServiceType() {
                var that = this;
                var params = new URLSearchParams();
                params.append('type', "service");
                params.append('shopId', that.shopId);
                params.append('status', that.addstatus);
                params.append('name', that.addPublicService.name);
                axios.post('/storeType/add', params)
                    .then(function (response) {
                        $("#addModal").modal("hide");
                        console.log(response);
                        that.getAll();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
                $("#addModal").modal('hide');
            },
            getAll() {
                var that = this;
                axios
                    .post('/storeType/finds?type=service&shopId=1')
                    .then(function (response) {
                        that.publicServiceTypeList = response.data.responseList;
                        that.shopId = "1";
                        console.log(response);
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

            axios
                .post('/storeType/finds?type=service&shopId=1')
                .then(function (response) {
                    that.publicServiceTypeList = response.data.responseList;
                    console.log(response);
                })
                .catch(function (error) {
                    console.log(error);
                });
        }
    })
</script>
</body>
</html>
