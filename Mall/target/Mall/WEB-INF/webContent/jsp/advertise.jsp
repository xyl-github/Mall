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
    <title>广告位管理</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
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
            </form>
        </div>
    </div>
    <table class="table table-bordered table-hover tab-content text-center">
        <tr>
            <td>广告位id</td>
            <td>名称</td>
            <td>banner图</td>
            <td>类型</td>
            <td>跳转链接</td>
            <td>优先级</td>
            <td>操作</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <div class="cell">
                <span style="">
                    <button type="button" class="btn btn-default"
                            style="border-spacing: 1px;border-color: #ececf6" @click="top()">↑</button>
                </span>
                <span>
                    <button type="button" class="btn btn-default"
                            style="border-spacing: 1px;border-color: #ececf6" @click="botton()">↓</button>
                </span>
                </div>
            </td>
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
                            <label class="col-sm-2 control-label">名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control">
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
                                <div class="alert alert-warning col-lg-4">
                                    <span>此处建议上传图片大小尺寸</span>
                                </div>
                                <div class="has-success">
                                    <button type="button" class="btn btn-default" @click="delImg()">删除该图片</button>
                                </div>
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
                                <div class="alert alert-warning col-lg-7">
                                    <span>为了小程序的正常使用，强烈建议此处使用https安全链接</span>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" @click="login()">确定</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </div>
</div>

</body>
<script>
    // pageAdAdmin / findAds
    var v = new Vue({
        el: "#app",
        data: {
            emp: {},
            publicServiceList: {}
        },
        methods: {
            update() {
                $("#updatemodel").modal('show')
            },
            gameimg() {
                $("#gameimg").trigger("click")
            },
            login() {
                axios.post('/pageAdAdmin/modifyAds', {
                    "id": "66",
                    "name": "banner6",
                    "shopId": "39",
                    "adPositionId": "1",
                    "imageUrl": "https://images.shopin.net/wxx/1525440200403.png",
                    "url": " https://weixin.shopin.net/pdamw_pay/index.html",
                    "type": "link",
                })
                    .then(function (response) {
                        that.publicServiceList = response.responseList;
                        console.log(response);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            top() {
                axios.post('pageAdAdmin/modifyRadioBroadcastGrade', {
                    "riseId": "34"
                })
                    .then(function (response) {
                        console.log(response.data)
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            botton() {
                axios.post('pageAdAdmin/modifyRadioBroadcastGrade', {
                    "declineId": "37"
                })
                    .then(function (response) {
                        console.log(response.data)
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },

        },
        created() {
            // var that = this;
            // axios.get('/pageAdAdmin/findAds?shopId='+1)
            //     .then(function (response) {
            //         console.log(response.data)
            //         that.emp = response.data
            //     })
            //     .catch(function (error) {
            //         console.log(error);
            //     });
        }
    })
</script>
</html>
