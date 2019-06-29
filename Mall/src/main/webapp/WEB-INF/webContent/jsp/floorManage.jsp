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
    <title>楼层管理</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <script src="/js/jquery-3.3.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/vue.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/axios.js" type="text/javascript" charset="utf-8"></script>
</head>
<style>
    .table tr td {
        /*width: 5px;*/
        /*height: 5px;*/
    }
</style>
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
                    <button type="button" class="btn btn-default" style="border-spacing: 1px;border-color: #ececf6"
                            id="m" @click="chuangj()">创建
                    </button>
                </div>


            </form>
        </div>
    </div>

    <table class="table table-bordered table-hover tab-content text-center">
        <tr>
            <td>楼层序号</td>
            <td>楼层样式</td>
            <td>标题</td>
            <td>副标题</td>
            <td>BANNER</td>
            <td>BANNER链接</td>
            <td>操作</td>
            <td>商户id</td>
            <td>文案</td>
            <td>优先级</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <button type="button" class="btn btn-default" style="border-spacing: 1px;border-color: #ececf6"
                        @click="update()">修改
                </button>
                <button type="button" class="btn btn-danger" @click="del()">删除</button>
                <span style="">
                    <button type="button" class="btn btn-default"
                            style="border-spacing: 1px;border-color: #ececf6" @click="top()">↑</button>
                </span>
                <span>
                    <button type="button" class="btn btn-default"
                            style="border-spacing: 1px;border-color: #ececf6" @click="button()">↓</button>
                </span>
            </td>
            <td></td>
            <td></td>
            <td>
                <span style="">
                    <button type="button" class="btn btn-default"
                            style="border-spacing: 1px;border-color: #ececf6" @click="shang()">↑</button>
                </span>
                <span>
                    <button type="button" class="btn btn-default"
                            style="border-spacing: 1px;border-color: #ececf6" @click="xia()">↓</button>
                </span>
            </td>
        </tr>
    </table>


    <div class="modal fade bs-example-modal-lg" id="Modal" tabindex="-1" role="dialog"
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
                            <label class="col-sm-2 control-label">模板样式</label>
                            <div class="col-sm-4">
                                <select class="form-control">
                                    <option>店铺</option>
                                    <option>单品OR优惠券</option>
                                </select>
                            </div>
                        </div>


                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">楼层标题</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control">
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">楼层副标题</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control">
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">楼层BANNER</label>
                            <div class="col-sm-10">
                                <div class="imageClass text-center"
                                     style="width: 100px;height: 100px; border: 1px dashed black; border-radius: 5px;"
                                     @click="games();">
                                    <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                    </div>
                                </div>
                                <input id="games" type="file" style="display: none;">
                                <div class="alert alert-warning col-lg-4">
                                    <span>此处建议上传图片大小尺寸</span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">跳转链接</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control">
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">参活店铺</label>
                            <div class="col-sm-10">
                                <table border="0" cellspacing="0" cellpadding="0" class="table">
                                    <tr>
                                        <td><span>"logo"</span><span style="color: rgb(245,108,108);">(此处建议宽度:400px,高度:400px)</span>
                                        </td>
                                        <td>店铺id</td>
                                        <td>文案</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="form-group has-success">
                                                <div class="col-sm-10">
                                                    <div class="imageClass text-center"
                                                         style="width: 100px;height: 100px; border: 1px dashed black; border-radius: 5px;"
                                                         @click="c1();">
                                                        <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                                        </div>
                                                    </div>
                                                    <input id="c1" type="file" style="display: none;">
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <input type="text" class="form-control">
                                            </div>
                                        </td>
                                        <td></td>
                                        <td>
                                            <div class="form-group">
                                                <input type="text" class="form-control">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="form-group has-success">
                                                <div class="col-sm-10">
                                                    <div class="imageClass text-center"
                                                         style="width: 100px;height: 100px; border: 1px dashed black; border-radius: 5px;"
                                                         @click="c2();">
                                                        <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                                        </div>
                                                    </div>
                                                    <input id="c2" type="file" style="display: none;">
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <input type="text" class="form-control">
                                            </div>
                                        </td>
                                        <td></td>
                                        <td>
                                            <div class="form-group">
                                                <input type="text" class="form-control">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="form-group has-success">
                                                <div class="col-sm-10">
                                                    <div class="imageClass text-center"
                                                         style="width: 100px;height: 100px; border: 1px dashed black; border-radius: 5px;"
                                                         @click="c3();">
                                                        <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                                        </div>
                                                    </div>
                                                    <input id="c3" type="file" style="display: none;">
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <input type="text" class="form-control">
                                            </div>
                                        </td>
                                        <td></td>
                                        <td>
                                            <div class="form-group">
                                                <input type="text" class="form-control">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <button type="button" class="btn btn-default"
                                                    style="border-spacing: 1px;border-color: #ececf6" @click="add()">增加
                                            </button>
                                            <button type="button" class="btn btn-default"
                                                    style="border-spacing: 1px;border-color: #ececf6" @click="del()">删除
                                            </button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="tjupdate()">提交更改</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>


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
                            <label class="col-sm-2 control-label">模板样式</label>
                            <div class="col-sm-4">
                                <select class="form-control">
                                    <option>店铺</option>
                                    <option>单品OR优惠券</option>
                                </select>
                            </div>
                        </div>


                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">楼层标题</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control">
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">楼层副标题</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control">
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">楼层BANNER</label>
                            <div class="col-sm-10">
                                <div class="imageClass text-center"
                                     style="width: 100px;height: 100px; border: 1px dashed black; border-radius: 5px;"
                                     @click="game();">
                                    <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                    </div>
                                </div>
                                <input id="game" type="file" style="display: none;">
                                <div class="alert alert-warning col-lg-4">
                                    <span>此处建议上传图片大小尺寸</span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">跳转链接</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="thsubUpdat()">提交更改</button>
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
            publicServiceList: [],
            publicList: []
        },
        methods: {
            top() {
                axios.post('/pageAdAdmin/modifyPageFloorGrade', {
                    riseId: "1",
                })
                    .then(function (response) {
                        console.log(response.data.status);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            button() {
                axios.post('/pageAdAdmin/modifyPageFloorGrade', {
                    declineId: "2",
                })
                    .then(function (response) {
                        console.log(response.data.status);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            shang() {
                axios.post('/pageAdAdmin/modifyPageStoreGrade', {
                    riseId: "110",
                })
                    .then(function (response) {
                        console.log(response.data.status);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            xia() {
                axios.post('/pageAdAdmin/modifyPageStoreGrade', {
                    declineId: "109",
                })
                    .then(function (response) {
                        console.log(response.data.status);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            del() {
                axios.post('/pageAdAdmin/deletePage', {
                    id: '53',
                })
                    .then(function (response) {
                        console.log(response.data.status);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            cjupdate() {
                axios.post('/pageAdAdmin/modifyPageFloor', {
                    id: '53',
                    shopId: "39",
                    type: 1,
                    title: "清爽一夏",
                    viceTitle: "男装/女装/童装",
                    banner: "",
                    bannerUrl: "https://weixin.shopin.net/pdamw_pay/index.html",
                })
                    .then(function (response) {
                        console.log(response.data.status);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            thsubUpdat() {
                axios.post('/pageAdAdmin/addPageFloor', {
                    shopId: "39",
                    type: 1,
                    title: "清爽一夏",
                    viceTitle: "男装/女装/童装",
                    banner: "",
                    bannerUrl: "https://weixin.shopin.net/pdamw_pay/index.html",
                })
                    .then(function (response) {
                        console.log(response.data.status);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            chuangj() {
                $("#addModal").modal('show')
            },
            game() {
                $("#game").trigger("click")
            },
            update() {
                $("#Modal").modal('show')
            }
        },
        created() {
            var that = this
            axios.post('/pageAdAdmin/getPageFloors', {
                shopId: "39",
            })
                .then(function (response) {
                    console.log(response);
                    that.publicServiceList = response.data.responseList;
                    for (var i = 0; i < publicList.id.length; i++) {
                        axios.post('/pageAdAdmin/getPageFloors', {
                            pageFloorId: "50",
                        })
                            .then(function (response) {
                                console.log(response);
                                that.publicList = response.data.responseList;

                            })
                            .catch(function (error) {
                                console.log(error);
                            });
                    }

                })
                .catch(function (error) {
                    console.log(error);
                });
        }
    })
</script>
</html>
