<%--
  Created by IntelliJ IDEA.
  User: xyl
  Date: 2019/6/22
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>消息通知</title>
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
                    <select class="form-control" id="lastname">
                        <%--v-model="shopId"--%>
                        <option value="39">上品+奥运村店</option>
                        <%--v-bind:value="39"--%>
                    </select>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4 "></label>
                </div>


                <div class="form-group">
                    <button type="button" class="btn btn-default" style="border-spacing: 1px;border-color: #ececf6"
                            id="m" @click="add()">添加
                    </button>
                </div>
            </form>
        </div>
    </div>
    <table class="table table-bordered table-hover tab-content text-center">
        <tr>

            <td>消息id</td>
            <td>消息标题</td>
            <td>消息内容</td>
            <td>发送时间</td>
            <td>创建人</td>
            <td>操作</td>

        </tr>
        <%--<tr v-for="em in emp">--%>
        <%--<td>{{em.id}}</td>--%>
        <%--<td>{{em.title}</td>--%>
        <%--<td>{{em.content}}</td>--%>
        <%--<td>{{em.sendDate}}</td>--%>
        <%--<td>{{em.creator}}</td>--%>
        <%--<td>--%>
        <%--<button type="button" class="btn btn-default" style="border-spacing: 1px;border-color: #ececf6" @click="update()">修改--%>
        <%--</button>--%>
        <%--<button type="button" class="btn btn-success">已发布</button>--%>
        <%--<button type="button" class="btn btn-danger">删除</button>--%>
        <%--</td>--%>
        <%--</tr>--%>
        <tr>
            <td>a</td>
            <td>a</td>
            <td>a</td>
            <td>a</td>
            <td>a</td>
            <td>
                <button type="button" class="btn btn-default" style="border-spacing: 1px;border-color: #ececf6"
                        @click="update()">修改
                </button>
                <button type="button" class="btn btn-success">已发布</button>
                <button type="button" class="btn btn-danger">删除</button>
            </td>
        </tr>
    </table>


    <div class="modal fade bs-example-modal-lg" id="addModal" tabindex="-1" role="dialog"
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

                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">消息标题</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="请输入消息标题">
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">内容</label>
                            <div class="col-sm-10">
                                <textarea rows="3" cols="80" placeholder="请输入消息内容"></textarea>
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">创建人</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="超级管理员" disabled="disabled">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="addlogin()">确定</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>


    <div class="modal fade bs-example-modal-lg" id="updateModal" tabindex="-1" role="dialog"
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

                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">消息标题</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="请输入消息标题">
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">内容</label>
                            <div class="col-sm-10">
                                <textarea rows="3" cols="80" placeholder="请输入消息内容"></textarea>
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">创建人</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="超级管理员" disabled="disabled">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="updatelo()">确定</button>
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
            emp: [],
        },
        methods: {
            update() {
                $("#updateModal").modal('show')
            },
            add() {
                $("#addModal").modal('show')
            },

            addlogin() {
                axios.get('messageAdmin/add', {
                    shopId: "39",
                    title: "18周年大促销",
                    content: "全场8折优惠1111222",
                    creator: "zhanglei",
                    status: "1"
                })
                    .then(function (response) {
                        console.log(response.data)
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            updatelo() {
                axios.post('messageAdmin/modify', {
                    "id": "49",
                    "shopId": "39",
                    "title": "18周年大促销",
                    "content": "全场8折优惠1111222",
                    "creator": "zhanglei",
                    "status": "1"
                })
                    .then(function (response) {
                        that.emp = response.data
                        console.log(response.data)
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            }
        }
        , created() {
            var that = this;
            axios.post('messageAdmin/finds', {
                "shopId": 39
            })
                .then(function (response) {
                    console.log(response.data)
                    that.emp = response.data
                })
                .catch(function (error) {
                    console.log(error);
                });
        }
    })
</script>
</html>
