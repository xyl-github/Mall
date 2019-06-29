<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/6/22
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>链接配置</title>
    <link href="/css/bootstrap.min.css?version=2019" rel="stylesheet">
    <link href="/css/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <script src="/js/jquery-3.3.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/vue.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/axios.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>

<div class="container" id="app" style="margin-top: 2%">

    <table class="table table-bordered table-hover tab-content text-center">
        <tr>
            <td>序号</td>
            <td>名称</td>
            <td>图片</td>
            <td>链接</td>
            <td>操作</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <button type="button" class="btn btn-default" style="border-spacing: 1px;border-color: #ececf6"
                        @click="update()">修改
                </button>
            </td>
        </tr>
    </table>


    <div class="modal fade bs-example-modal-lg" id="updatemodel" tabindex="-1" role="dialog"
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
                            <label class="col-sm-2 control-label">名字</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" disabled="disabled" value="会员club">
                            </div>
                        </div>

                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">游戏图片</label>
                            <div class="col-sm-10">
                                <div class="text-center"
                                     style="width: 100px;height: 100px; border: 1px dashed black; border-radius: 5px;"
                                     @click="gameimg();">
                                    <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                    </div>
                                </div>
                                <input id="gameimg" type="file" style="display: none;">
                                <span>
                                    <button type="button" class="btn btn-default" @click="delImg()">删除该图片</button>
                                </span>
                            </div>

                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">类型</label>
                            <div class="col-sm-4">
                                <select class="form-control">
                                    <option>链接</option>
                                    <option>图片</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">链接</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control">
                            </div>
                        </div>
                    </form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" @click="queding()">确定</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </div>


</div>
<script>
    var v = new Vue({
        el: "#app",
        data: {
            emp:{},
            emps:{}
        },
        methods: {
    // {
    // “id": 1,
    // }
            queding(){
                axios.get('memberClub/modify')
                    .then(function (response) {
                        that.emps = response.data
                        console.log(response.data)
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            gameimg() {
                $("#gameimg").trigger("click")
            },
            update() {
                $("#updatemodel").modal('show')
            }
        },
        created(){

            var that = this;
            axios.get('memberClub/finds')
                .then(function (response) {
                    that.emp = response.data
                    console.log(response.data)
                })
                .catch(function (error) {
                    console.log(error);
                });
        }
    })
</script>

</body>
</html>
