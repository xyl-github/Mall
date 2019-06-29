<%--
  Created by IntelliJ IDEA.
  User: xyl
  Date: 2019/6/22
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>小游戏管理</title>
    <link href="/css/bootstrap.min.css?version=2019" rel="stylesheet">
    <link href="/css/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <script src="/js/jquery-3.3.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/bootstrap.min.js?version=2019" type="text/javascript" charset="utf-8"></script>
    <script src="/js/vue.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/axios.js" type="text/javascript" charset="utf-8"></script>
    <style>
        .imageClass:hover {
            cursor: pointer;
            background-color: #c7ddef;
        }
    </style>
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
                    <button type="button" class="btn btn-default" style="border-spacing: 1px;border-color: #ececf6"
                            id="m" @click="addgame()">添加小游戏
                    </button>
                </div>
            </form>
        </div>
    </div>
    <table class="table table-bordered table-hover tab-content text-center">
        <tr>

            <td>小游戏id</td>
            <td>游戏名称</td>
            <td>游戏介绍</td>
            <td>宣传图</td>
            <td>游戏规则</td>
            <td>游戏时长</td>
            <td>游戏图片</td>
            <td>背面图片</td>
            <td>跳转链接</td>
            <td>状态</td>
            <td>操作</td>
        </tr>
        <tr>
            <td>{{emp.id}}</td>
            <td>{{emp.name}}</td>
            <td>{{emp.content}}</td>
            <td>{{emp.adVertising}}</td>
            <td>{{emp.rule}}</td>
            <td>{{emp.time}}</td>
            <td>{{emp.image}}</td>
            <td>{{emp.gameUrl}}</td>
            <td>{{emp.gameUrl}}</td>
            <td>{{emp.status}}</td>
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
                            <label class="col-sm-2 control-label">游戏名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control">
                            </div>
                        </div>

                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">游戏介绍</label>
                            <div class="col-sm-10">
                                <textarea rows="3" cols="80"></textarea>
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">游戏宣传图</label>
                            <div class="col-sm-10">
                                <div class="text-center"
                                     style="width: 100px;height: 100px; border: 1px dashed black; border-radius: 5px;"
                                     @click="File();">
                                    <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                    </div>
                                </div>
                                <input id="File" type="file" style="display: none;">
                                <div class="alert-warning col-lg-7" style="border-color: #d93abb">
                                    <span>此处建议上传图片大小尺寸：宽度670px，高度370px</span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">游戏规则</label>
                            <div class="col-sm-10">
                                <textarea rows="3" cols="80"></textarea>
                            </div>
                        </div>

                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">游戏时常</label>
                            <div class="col-sm-10">
                                <div class="input-group col-lg-4">
                                    <span class="input-group-addon">➖</span>
                                    <input type="text" class="form-control" placeholder="1" style="text-align: center">
                                    <span class="input-group-addon">＋</span>
                                </div>
                                <div class="alert-warning col-lg-4">
                                    <span>此处仅限输入数字，单位是：秒</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">游戏图片</label>
                            <div class="col-sm-10">
                                <div class="text-center"
                                     style="width: 100px;height: 100px; border: 1px dashed black; border-radius: 5px;"
                                     @click="gameimage();">
                                    <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                    </div>
                                </div>
                                <input id="gameimage" type="file" style="display: none;">
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">背面图片</label>
                            <div class="col-sm-10">
                                <div class="text-center"
                                     style="width: 100px;height: 100px; border: 1px dashed black; border-radius: 5px;"
                                     @click="backImage();">
                                    <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                    </div>
                                </div>
                                <input type="file" style="display: none;" id="backImage">

                            </div>
                        </div>

                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">跳转链接</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control">
                            </div>
                        </div>

                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">状态</label>
                            <div class="col-sm-4">
                                <select class="form-control">
                                    <option>启用</option>
                                    <option>禁用</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="add()">确定</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
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
                            <label class="col-sm-2 control-label">游戏名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control">
                            </div>
                        </div>

                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">游戏介绍</label>
                            <div class="col-sm-10">
                                <textarea rows="3" cols="80"></textarea>
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">游戏宣传图</label>
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
                            <label class="col-sm-2 control-label">游戏规则</label>
                            <div class="col-sm-10">
                                <textarea rows="3" cols="80"></textarea>
                            </div>
                        </div>

                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">游戏时常</label>
                            <div class="col-sm-10">
                                <div class="input-group col-lg-4">
                                    <span class="input-group-addon">➖</span>
                                    <input type="text" class="form-control" placeholder="1" style="text-align: center">
                                    <span class="input-group-addon">＋</span>
                                </div>
                                <div class="alert alert-warning col-lg-4">
                                    <span>此处仅限输入数字，单位是：秒</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">游戏图片</label>
                            <div class="col-sm-10">
                                <div class="imageClass text-center"
                                     style="width: 100px;height: 100px; border: 1px dashed black; border-radius: 5px;"
                                     @click="gameimg();">
                                    <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                    </div>
                                </div>
                                <input id="gameimg" type="file" style="display: none;">
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">背面图片</label>
                            <div class="col-sm-10">
                                <div class="imageClass text-center"
                                     style="width: 100px;height: 100px; border: 1px dashed black; border-radius: 5px;"
                                     @click="beimian();">
                                    <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                    </div>
                                </div>
                                <input type="file" style="display: none;" id="beimian">
                            </div>

                        </div>

                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">跳转链接</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control">
                            </div>
                        </div>

                        <div class="form-group has-success">
                            <label class="col-sm-2 control-label">状态</label>
                            <div class="col-sm-4">
                                <select class="form-control">
                                    <option>启用</option>
                                    <option>禁用</option>
                                </select>
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
            emp: []
        },
        methods: {
            add() {
                var that = this;
                axios.post('/gameAdmin/addGame', {
                    name: " 拼图",
                    shopId: 39,
                    content: "拼图游戏",
                    adVertising: "https://images.shopin.net/wxx/1525443603471.png",
                    rule: "1.拼图游戏的终止时间为1分钟,\r2.在20秒内拼图成功均有随机优惠券奖励,\r3.每天仅可领取一次优惠券,\r4.参与者可根据排行榜查看自己的排名,",
                    time: 60,
                    image: "https://images.shopin.net/wxx/1525509212612.png",
                    bgImage: null,
                    gameUrl: "https://wxx.shopin.net/shopin-game-puzzle/index.html",
                    status: 0
                })
                    .then(function (response) {
                        console.log(response.data)
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            thsubUpdat() {
                var that = this;
                axios.post('/gameAdmin/modifGame', {
                    id: 14,
                    name: " 拼图",
                    shopId: 39,
                    content: "拼图游戏",
                    adVertising: "https://images.shopin.net/wxx/1525443603471.png",
                    rule: "1.拼图游戏的终止时间为1分钟,\r2.在20秒内拼图成功均有随机优惠券奖励,\r3.每天仅可领取一次优惠券,\r4.参与者可根据排行榜查看自己的排名,",
                    time: 60,
                    image: "https://images.shopin.net/wxx/1525509212612.png",
                    bgImage: null,
                    gameUrl: "https://wxx.shopin.net/shopin-game-puzzle/index.html",
                    status: 0
                })
                    .then(function (response) {
                        console.log(response.data)
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            del(){
                var that = this;
                axios.post('/gameAdmin/deleteGame', {
                    id: 14,
                })
                    .then(function (response) {
                        console.log(response.data)
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            selectFile() {
                $("#selectFile").trigger("click");
            },
            File() {
                $("#File").trigger("click");
            },
            game() {
                $("#game").trigger("click");
            },
            gameimg() {
                $("#gameimg").trigger("click");
            },
            gameimage() {
                $("#gameimage").trigger("click");
            },
            beimian() {
                $("#beimian").trigger("click");
            },
            backImage() {
                $("#backImage").trigger("click");
            },
            addgame() {
                $("#addmyModal").modal('show')
            },
            update() {
                $("#updatemyModal").modal('show')
            }
        }
        , created() {
            var that = this;
            axios.post('gameAdmin/findGames', {
                shopId: "39"
            })
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
</html>
