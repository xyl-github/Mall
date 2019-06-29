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
    <title>评论管理</title>
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
                        <option value="39">上品+奥运村店</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4 "></label>
                </div>
                <div class="form-group">
                    <div class="form-group">
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="firstname" name="ename" placeholder="请输入要查询的评论">
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="button" class="btn btn-primary" id="p" @click="selectAll">搜索</button>

                    </div>
                </div>
            </form>
        </div>
    </div>
    <table class="table table-bordered table-hover tab-content text-center">
        <tr>

            <td>评论id</td>
            <td>用户名</td>
            <td>评论内容</td>
            <td>评分</td>
            <td>评论时间</td>
            <td>状态</td>
            <td>评论图</td>
            <td>操作</td>

        </tr>

        <tr>
            <td>a</td>
            <td>a</td>
            <td>a</td>
            <td>a</td>
            <td>a</td>
            <td>a</td>
            <td>a</td>
            <td>
                <button type="button" class="btn btn-default" style="border-spacing: 1px;border-color: #ececf6"
                        @click="select()">查看详情
                </button>
                <button type="button" class="btn btn-default" style="border-spacing: 1px;border-color: #ececf6"
                        @click="yincang()">隐藏
                </button>
                <button type="button" class="btn btn-default" style="border-spacing: 1px;border-color: #ececf6"
                        @click="zhiding()">置顶
                </button>
            </td>
        </tr>
    </table>


    <div class="modal fade bs-example-modal-lg" id="selectModal" tabindex="-1" role="dialog"
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
                            <label class="col-sm-2 control-label">用户名id</label>
                            <div class="col-sm-10">
                                <%--<input type="text" class="form-control" disabled="disabled" style="outline:none">--%>
                                <p class="form-control-static">哈哈</p>
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-10">
                                <%--<input type="text" class="form-control" disabled="disabled">--%>
                                <p class="form-control-static">哈哈</p>
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">用户评分</label>
                            <div class="col-sm-10">
                                <%--<input type="text" class="form-control" disabled="disabled">--%>
                                <p class="form-control-static">哈哈</p>
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">评分</label>
                            <div class="col-sm-10">
                                <%--<input type="text" class="form-control" disabled="disabled">--%>
                                <p class="form-control-static">哈哈</p>
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">消息标题</label>
                            <div class="col-sm-10">
                                <%--<input type="text" class="form-control" placeholder="请输入消息标题" disabled="disabled">--%>
                                <p class="form-control-static">哈哈</p>
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">消息标题</label>
                            <div class="col-sm-10">
                                <%--<input type="text" class="form-control" placeholder="请输入消息标题" disabled="disabled">--%>
                                <p class="form-control-static">哈哈</p>
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
</div>


</body>
<script>
    var v = new Vue({
        el: "#app",
        data: {
            responseResult: {}
        },
        methods: {
            //显示或隐藏或者置顶
            yincang() {
                var that = this;
                axios.post('/commentAdmin/modify', {
                    id: "222",
                    status: "0"
                })
                    .then(function (response) {
                        console.log(response.data)
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            selectAll() {
                var that = this;
                axios.post('commentAdmin/find', {
                    shopId: "39"
                })
                    .then(function (response) {

                        that.responseResult = response.data
                        console.log(response.data)
                    })
                    .catch(function (error) {

                        console.log(error);
                    });
            },
            select() {
                $("#selectModal").modal('show')
                axios.get('commentAdmin/modify')
                    .then(function (response) {
                        that.emp = response.data
                        console.log(response.data)
                    })
                    .catch(function (error) {
                        console.log(error);
                    });

            }

        },
        created() {
        }

    })
</script>
</html>
