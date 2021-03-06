<%@ taglib prefix="v-bind" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: xyl
  Date: 2019/6/22
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>品类管理</title>
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
                        <option v-for="men in mendian" v-bind:value="men.id" v-if="men.status==0">
                            {{men.name}}
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
                    <button type="button" class="btn btn-default" style="border-spacing: 1em;border-color: #ececf6"
                            @click="add()">创建
                    </button>
                </div>

            </form>


        </div>
    </div>
    <table class="table table-bordered table-hover tab-content text-center">
        <tr>
            <td>品类id</td>
            <td>品类</td>
            <td>状态</td>
            <td>品类优先级</td>
            <td>操作</td>
        </tr>
        <tr v-for="category in categoryList">
            <td v-text="category.id">品类id</td>
            <td v-text="category.type">品类</td>
            <td v-if="category.status==0">启用</td>
            <td v-else>禁用</td>
            <td>
                <div class="cell">
                <span style="">
                    <%--<botton type="botton" style="border-spacing: 2px;border-color: #ececf6">↑</botton>--%>
                    <button type="button" class="btn btn-default"
                            style="border-spacing: 1px;border-color: #ececf6" @click="top(category.riseid)">↑</button>
                </span>
                    &nbsp;&nbsp;
                    <span>
                    <%--<botton type="botton">↓</botton>--%>
                    <button type="button" class="btn btn-default"
                            style="border-spacing: 1px;border-color: #ececf6" @click="button(category.declineId)">↓</button>
                </span>
                </div>
            </td>
            <td>
                <button type="button" @click="update(category)" class="btn btn-default"
                        style="border-spacing: 1em;border-color: #ececf6">修改
                </button>
                <button type="button" @click="del(category.id)" class="btn btn-danger">删除</button>
            </td>
        </tr>
    </table>

    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" style="float: left;">添加/修改 品类</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">

                    <form class="bs-example bs-example-form" role="form">

                        <div class="input-group col-md-9" style="margin-top: 15px;">
                            <span class="input-group-addon">品类</span>
                            <input type="text"
                                   class="form-control" v-model="addCategory.type"
                                   placeholder="请输入添加的品类"/>
                            <span class="input-group-btn">
                            <button class="btn" style="color: lightcoral;background-color: #e4b9c0" type="button">此处建议字数限制：2~4</button>
                        </span>
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
                    <button type="button" class="btn btn-primary" @click="addCategorys()">增加</button>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal -->
        </div>
    </div>

    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" style="float: left;">添加/修改 品类</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">

                    <form class="bs-example bs-example-form" role="form">

                        <div class="input-group col-md-9" style="margin-top: 15px;">
                            <span class="input-group-addon">品类</span>
                            <input type="text"
                                   class="form-control" v-model="updateCategory.type"
                            />
                            <span class="input-group-btn">
                            <button class="btn" style="color: lightcoral;background-color: #e4b9c0" type="button">此处建议字数限制：2~4</button>
                        </span>
                        </div>

                        <div class="input-group col-md-4" style="margin-top: 15px;">
                            <span class="input-group-addon">状态</span>
                            <select class="form-control" v-model="updateCategory.status">
                                <option v-for="status in statusList" v-bind:value="status.id">{{status.name}}
                                </option>
                            </select>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="updatecategory()">修改</button>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal -->
        </div>

    </div>
</div>

<script>
    var v = new Vue({
        el: "#app",
        data: {
            categoryList: [],
            shopId: "",
            addstatus:"0",
            addCategory: {},
            updateCategory: {},
            mendian: {},
            statusList: [{id: 1, name: "禁用"}, {id: 0, name: "启用"}],
            // priority:[riseId,declineId]
        },
        methods: {
            // top(value){
            //     var that = this;
            //     axios.post('/category/modify/priority?riseId='+value)
            //         .then(function (response) {
            //             console.log(response.data.responseList);
            //             that.categoryList = response.data.responseList;
            //         })
            //         .catch(function (error) {
            //             console.log(error);
            //         });
            // },
            // button(value){
            //     var that = this;
            //     axios.post('/category/modify/priority?declineId='+value)
            //         .then(function (response) {
            //             console.log(response.data.responseList);
            //             that.categoryList = response.data.responseList;
            //         })
            //         .catch(function (error) {
            //             console.log(error);
            //         });
            // },
            change() {
                var that = this;
                axios.post('/category/finds?shopId='+that.shopId)
                    .then(function (response) {

                        console.log(response.data.responseList);
                        that.categoryList = response.data.responseList;
                        // location.reload()
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            update(category) {
                var that = this;
                axios.post('/category/findById?id=' + category.id)
                    .then(function (response) {
                        console.log(response);
                        that.updateCategory = response.data.responseResult;
                        $("#updateModal").modal('show');
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            updatecategory() {

                var that = this;
                var params = new URLSearchParams();
                params.append('id', that.updateCategory.id);
                params.append('shopId', that.updateCategory.shopId);
                params.append('status', that.updateCategory.status);
                params.append('type', that.updateCategory.type);
                axios.post('/category/modify',params)
                    .then(function (response) {
                        alert("修改成功")
                        $("#updateModal").modal("hide");
                        console.log(response.data.status);
                        location.reload()
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            del(id) {
                // var that = this;
                axios.post('/category/delete?id='+id )
                    .then(function (response) {
                        console.log(response.data.responseResult);
                        // that.getAll();
                        location.reload()
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
                console.log("删除成功");
            },
            add() {
                $("#addModal").modal('show');
            },
            addCategorys() {
                var that = this;
                var paramter = new URLSearchParams();
                paramter.append("shopId", that.shopId)
                paramter.append("type", that.addCategory.type)
                paramter.append("status",that.addstatus)
                axios.post('/category/add', paramter)
                    .then(function (response) {
                        console.log(response.data);
                        $("#addPlaceModel").modal("hide");
                        location.reload()
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            // getAll() {
            //     var that = this;
            //     axios
            //         .post('/category/finds', {
            //             shopId: "1"
            //         })
            //         .then(function (response) {
            //             that.categoryList = response.data.responseList;
            //             console.log(response.data.responseList);
            //         })
            //         .catch(function (error) {
            //             console.log(error);
            //         });
            // }

        }, created() {
            var that2 = this;
            axios.post('/shopAdmin/find')
                .then(function (response) {
                    console.log(response.data.responseList);
                    that2.shopId = 1;
                    that2.mendian = response.data.responseList;
                })
                .catch(function (error) {
                    console.log(error);
                });

            axios.post('/category/finds?shopId=1')
                .then(function (response) {
                    console.log(response.data);
                    that2.shopId = 1;
                    that2.categoryList = response.data.responseList;
                })
                .catch(function (error) {
                    console.log(error);
                });
        }
    })
</script>
</body>
</html>
