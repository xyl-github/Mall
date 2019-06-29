<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/6/22
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>站内广播</title>
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
                            id="n" @click="chuangjain()">创建
                    </button>
                </div>
            </form>
        </div>
    </div>
    <table class="table table-bordered table-hover tab-content text-center">
        <tr>
            <td>站内广播id</td>
            <td>广播标题</td>
            <td>广播内容</td>
            <td>广播优先级</td>
            <td>操作</td>
        </tr>
        <tr>
            <td>asd</td>
            <td></td>
            <td></td>
            <td>
                <div class="cell">
                <span style="">
                    <button type="button" class="btn btn-default"
                            style="border-spacing: 1px;border-color: #ececf6" @click="top()">↑</button>
                </span>
                    &nbsp;&nbsp;
                    <span>
                    <button type="button" class="btn btn-default"
                            style="border-spacing: 1px;border-color: #ececf6" @click="button()">↓</button>
                </span>
                </div>
            </td>
            <td>
                <button type="button" class="btn btn-success" @click="update()">修改</button>
                <button type="button" class="btn btn-danger" @click="del()">删除</button>
            </td>
        </tr>
    </table>


    <div class="modal fade bs-example-modal-lg" id="addmyModal" tabindex="-1" role="dialog"
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
                            <label class="col-sm-2 control-label">广播标题</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control">
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">广播内容</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control">
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" @click="add()">确定</button>
                        </div>
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
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


                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">广播标题</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control">
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">广播内容</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control">
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" @click="updatecast()">确定</button>
                        </div>
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </div>



</div>
</body>
<script>
    var v = new Vue({
        el: "#app",
        data: {
            // emp:{},
            updatemp:{}
        },
        methods: {
            top(){
            // “riseId”: “34”
                axios.get('pageAdAdmin/modifyRadioBroadcastGrade')
                    .then(function (response) {
                        console.log(response.data)
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            botton(){
            // “declineId”: “37”
                axios.get('pageAdAdmin/modifyRadioBroadcastGrade')
                    .then(function (response) {
                        console.log(response.data)
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            del(){
                axios.get('pageAdAdmin/deleteRadioBroadcast')
                    .then(function (response) {
                        console.log(response.data)
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },


    // {
    //     “id”: “36”,
    //     “shopId ": 39,
    //     “content”: “我是内容”,
    //     “title”: “我是标题”
    // }
            updatecast(){
                var that = this;
                axios.get('pageAdAdmin/modifyRadioBroadcast')
                    .then(function (response) {
                        console.log(response.data)
                        that.updatemp = response.data
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            update(){
                $("#updatemyModal").modal('show')
            },
            chuangjain() {
                $("#addmyModal").modal('show')
            },
            add() {
                // {
                // “shopId ": 39,
                //  “content”: “我是内容”,
                // “title”: “我是标题”
                // }
                axios.get('pageAdAdmin/addRadioBroadcast')
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
            // var that = this;
            // axios.get('pageAdAdmin/findRadioBroadcasts')
            //     .then(function (response) {
            //         // that.emp = response.data
            //         console.log(response.data)
            //     })
            //     .catch(function (error) {
            //         console.log(error);
            //     });
        }
    })
</script>
</html>
