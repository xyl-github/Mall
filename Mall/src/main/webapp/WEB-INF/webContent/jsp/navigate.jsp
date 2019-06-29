<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/6/22
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>附近导航banner</title>
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

                <div class="form-group">
                    <label class="control-label col-sm-4 "></label>
                </div>


                <div class="form-group">
                    <label class="control-label col-sm-8 "></label>
                </div>

                <div class="form-group">
                    <button type="button" class="btn btn-default" style="border-spacing: 1em;border-color: #ececf6"
                            id="n" onclick="chuangjain()">创建
                    </button>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-8 "></label>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4 "></label>
                </div>
                <div class="form-group">
                    <span class="alert-warning col-lg-12">建议此处广告位是5个</span>
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
            <td @click="click()"></td>
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
                <button type="button" class="btn btn-default" style="border-spacing: 1px;border-color: #ececf6"
                        onclick="updateAs()">修改
                </button>
                <button type="button" class="btn btn-danger" @click="del()">删除</button>
            </td>
        </tr>
    </table>


    <div class="modal fade bs-example-modal-lg" id="addmodel" tabindex="-1" role="dialog"
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
                                <input type="text" class="form-control" placeholder="请输入banner名字">
                            </div>
                        </div>


                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">门头图</label>
                            <div class="col-sm-10">
                                <div class="text-center" @click="selectFile2();" id="images2"
                                     style="width: 100px;height: 100px; border: 1px dashed black; border-radius: 5px;">
                                    <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                    </div>
                                </div>
                                <input id="selectFile2" type="file" style="display: none;">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="alert alert-danger col-sm-offset-2 col-sm-5">
                                <span>此处建议上传图片大小尺寸：宽度160px，高度120px</span>
                            </div>
                            <div class="row col-sm-offset-2 col-sm-6">
                                <span>
                                    <button type="button" class="btn btn-default" @click="removeImages2();"
                                            style="border-spacing: 1em;border-color: #ececf6;">删除该图片
                                    </button>
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">类型</label>
                            <div class="col-sm-4">
                                <select class="form-control">
                                    <option>请选择类型</option>
                                    <option>链接</option>
                                    <option>图片</option>
                                </select>
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
                                <input type="text" class="form-control" placeholder="请输入banner名字">
                            </div>
                        </div>


                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">banner图</label>
                            <div class="col-sm-10">
                                <div class="text-center" @click="selectFile();" id="images"
                                     style="background-image: url(/images/test3.png);width: 100px;height: 100px; border: 1px dashed black; border-radius: 5px;">
                                    <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                    </div>
                                </div>
                                <input id="selectFile" type="file" style="display: none;">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="alert alert-danger col-sm-offset-2 col-sm-5">
                                <span>此处建议上传图片大小尺寸：宽度160px，高度120px</span>
                            </div>
                            <div class="row col-sm-offset-2 col-sm-6">
                                <span>
                                    <button type="button" class="btn btn-default" @click="removeImages2();"
                                            style="border-spacing: 1em;border-color: #ececf6;">删除该图片
                                    </button>
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">类型</label>
                            <div class="col-sm-4">
                                <select class="form-control">
                                    <option>请选择类型</option>
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
                        <button type="button" class="btn btn-primary" @click="updatlogin()">确定</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </div>


    <div class="modal fade bs-example-modal-lg" id="model" tabindex="-1" role="dialog"
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
                        <div>

                        </div>
                    </form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" @click="updatlogin()">确定</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </div>

</div>

</body>
<script>
    function chuangjain() {
        $("#addmodel").modal('show')
    }

    function updateAs() {
        $("#updatemodel").modal('show')
    }

    var v = new Vue({
        el: "#app",
        data: {
            publicServiceList: {},
            addAdsList: {},
            updateList: {}
        },
        methods: {
            click(){
              $("#model").modal('show')
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
            del() {
                var that = this
                axios.post(' /pageAdAdmin/deleteAds', {
                    "id": "66",
                })
                    .then(function (response) {
                        console.log(response);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            selectFile2() {
                $("#selectFile2").trigger("click");
            },
            selectFile() {
                $("#selectFile").trigger("click");
            },
            updatlogin() {
                var that = this
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
                        console.log(response);
                        that.updateList = response.data.responseList;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            login() {
                var that = this
                axios.post('/pageAdAdmin/addAds', {
                    "name": "banner6",
                    "shopId": "39",
                    "adPositionId": "1",
                    "imageUrl": "https://images.shopin.net/wxx/1525440200403.png",
                    "url": " https://weixin.shopin.net/pdamw_pay/index.html",
                    "type": "link",
                })
                    .then(function (response) {
                        console.log(response);
                        that.addAdsList = response.data.responseList;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            }
        },
        created() {
            var that = this
            axios.post('/pageAdAdmin/findAds', {
                "shopId": "39",
                "adPositionId": "1"
            })
                .then(function (response) {
                    console.log(response);
                    that.publicServiceList = response.data.responseList;
                })
                .catch(function (error) {
                    console.log(error);
                });
        }
    })
</script>
</html>
