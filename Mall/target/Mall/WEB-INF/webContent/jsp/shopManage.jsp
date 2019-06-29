<%@ taglib prefix="v-bind" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="v-on" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/6/22
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>门店管理</title>
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
                    <button type="button" class="btn btn-default" @click="add()"
                            style="border-spacing: 1px;border-color: #ececf6"
                    >创建新门店
                    </button>
                </div>
            </form>


        </div>
    </div>
    <table class="table table-bordered table-hover tab-content text-center">
        <tr>
            <td>门店id</td>
            <td>门店名称</td>
            <td>详细地址</td>
            <td>联系电话</td>
            <td>营业时间</td>
            <td>纬度</td>
            <td>经度</td>
            <td>门店图</td>
            <td>热搜</td>
            <td>状态</td>
            <td>二维码</td>
            <td>操作</td>
        </tr>
        <tr v-for="shop in shopList">
            <td v-text="shop.id">超级管理员</td>
            <td v-text="shop.name"></td>
            <td v-text="shop.address">超级管理员</td>
            <td v-text="shop.tel">15010327826</td>
            <td v-text="shop.businessHours">admin</td>
            <td v-text="shop.longitude">启用</td>
            <td v-text="shop.latitude">启用</td>
            <td><img v-bind:src="shop.images" @click="show(shop.images)" style="width: 60px;"/></td>
            <td v-text="shop.hotSearch">启用</td>
            <td v-text="shop.status">启用</td>
            <td>
                <button type="button" @click="showPicture(shop)" class="btn btn-default"
                        style="border-spacing: 1em;border-color: #ececf6">生成
                </button>
            </td>
            <td>
                <button type="button" @click="update(shop)" class="btn btn-default"
                        style="border-spacing: 1em;border-color: #ececf6">修改
                </button>
                <button type="button" class="btn btn-default" style="border-spacing: 1em;border-color: #ececf6">
                    设置导航路线
                </button>
                <button type="button" @click="del(shop)" class="btn btn-danger">删除</button>
            </td>
        </tr>
    </table>

    <div class="modal fade bs-example-modal-lg" id="addShopModel" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel" style="float: left;">创建/修改 新门店</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">

                    <form class="form-horizontal" id="addForm" role="form" enctype="multipart/form-data">

                        <div class="form-group">
                            <label class="col-sm-3 control-label">门店名称</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control" v-model="newShop.name"
                                       placeholder="请输入要被创建的门店名称">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">门店地址</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control" v-model="newShop.address"
                                       placeholder="请输该门店的地址"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">营业时间</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control" v-model="newShop.businessHours"
                                       placeholder="请输该门店营业时间"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">门店电话</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control" v-model="newShop.tel"
                                       placeholder="请输该门店的电话"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label"></label>
                            <div class="col-sm-9">
                                <a href="#" style="text-decoration:none;color: black;">获取经纬度的方式（打开新链接以后，右上角是经纬度，逗号前面是纬度，
                                    逗号后面是经度）</a>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">门店纬度</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control" v-model="newShop.longitude"
                                       placeholder="请输入该门店的纬度"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">门店经度</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control" v-model="newShop.latitude"
                                       placeholder="请输入该门店的经度"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">热搜</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control" v-model="newShop.hotSearch"
                                       placeholder="请输入该门店的热搜(热搜请以逗号隔开)"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">门店图</label>
                            <div class="col-sm-9">
                                <div class="text-center" @click="selectFile();"
                                     style="width: 100px;height: 100px; border: 1px dashed black; border-radius: 5px;">
                                    <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                    </div>
                                </div>
                                <input id="selectFile" type="file" style="display: none;" name="file" onchange="doUpload()">
                                <span class="input-group-btn">
                                    <button class="btn" style="color: lightcoral;background-color: #e4b9c0"
                                            type="button">此处建议上传图片大小尺寸：宽度400px，高度300px</button>
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">状态</label>
                            <div class="col-sm-3">
                                <select class="form-control" v-model="newShop.status">
                                    <option v-for="status in statusList" v-bind:value="status.id">{{status.name}}
                                    </option>
                                </select>
                            </div>
                        </div>

                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="addShop()">确定</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>

    <div class="modal fade bs-example-modal-lg" id="updateModel" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" style="float: left;">创建/修改 新门店</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">

                    <form class="form-horizontal" id="updateForm" role="form" enctype="multipart/form-data">

                        <div class="form-group">
                            <label class="col-sm-3 control-label">门店名称</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control" v-model="updateShop.name"
                                >
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">门店地址</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control" v-model="updateShop.address"
                                />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">营业时间</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control" v-model="updateShop.businessHours"
                                />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">门店电话</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control" v-model="updateShop.tel"
                                />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label"></label>
                            <div class="col-sm-9">
                                <a href="#" style="text-decoration:none;color: black;">获取经纬度的方式（打开新链接以后，右上角是经纬度，逗号前面是纬度，
                                    逗号后面是经度）</a>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">门店纬度</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control" v-model="updateShop.longitude"
                                />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">门店经度</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control" v-model="updateShop.latitude"
                                />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">热搜</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control" v-model="updateShop.hotSearch"
                                />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">门店图</label>
                            <div class="col-sm-9">
                                <div class="text-center" id="images" @click="selectFile2();"
                                     v-bind:style="{backgroundImage:'url(' + updateShop.images + ')',width: '100px',height: '100px',border: '1px dashed black'}">
                                     <%--style="background-image: url("+oldimages+")  width: 100px;height: 100px; border: 1px dashed black; border-radius: 5px;">--%>
                                    <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                    </div>
                                </div>
                                <input id="selectFile2" type="file" style="display: none;" name="file" onchange="doUpload1()">
                                <span class="input-group-btn">
                                    <button class="btn" style="color: lightcoral;background-color: #e4b9c0"
                                            type="button">此处建议上传图片大小尺寸：宽度400px，高度300px</button>
                                </span>

                            </div>
                            <span style="margin-left: 27%">
                                    <button type="button" class="btn btn-default" @click="removeImages();"
                                            style="border-spacing: 1em;border-color: #ececf6">删除该图片
                                    </button>
                                </span>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">状态</label>
                            <div class="col-sm-3">
                                <select class="form-control" v-model="updateShop.status">
                                    <option v-for="status in statusList" v-bind:value="status.id">{{status.name}}
                                    </option>
                                </select>
                            </div>
                        </div>

                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="updateshop()">确定</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>

    <div class="modal fade bs-example-modal-lg" id="showPictureModel" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <img v-bind:src="qrcodeImage"
                         style="max-width: 80%; height: auto; display: block; margin: 0px auto;"/>
                    <div class="row" style="margin-left: 33%;margin-top: 50px">
                        <%--<span style="width:200px;height: 32px;color:deepskyblue;background-color:lightblue">温馨提示：鼠标放到图片-->右击-->图片另存为</span>--%>
                        <span style="width:200px;height: 32px;color:deepskyblue;background-color:lightblue">{{qrcodeText}}</span>
                    </div>
                </div>
                <div class="modal-footer">
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>

    <div class="modal fade bs-example-modal-lg" id="showModel" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <img v-bind:src="img"
                         style="max-width: 80%; height: auto; display: block; margin: 0px auto;"/>
                </div>
                <div class="modal-footer">
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>

</div>


<script>
    var addUrl = "";
    var updateUrl = "";
    var oldImage = "";
    
    function doUpload() {
        var form = new FormData($("#addForm")[0]);
        form.append("oldImage",null);
        $.ajax({
            type: "post",
            url: "/file/uploadImage",
            contentType: false,
            processData: false,
            data: form,
            success: function (response) {
                addUrl = response.responseResult;
                console.log(response.responseResult);
            }
        });
    }

    function doUpload1() {
        var form = new FormData($("#updateForm")[0]);
        form.append("oldImage",oldImage);
        $.ajax({
            type: "post",
            url: "/file/uploadImage",
            contentType: false,
            processData: false,
            data: form,
            success: function (response) {
                updateUrl = response.responseResult;
                console.log(response.responseResult);
            }
        });
    }

    var v = new Vue({
        el: "#app",
        data: {
            shopList: {},
            newShop: {},
            updateShop: {},
            qrcodeImage: [],
            qrcodeText: [],
            statusList: [{id: 1, name: "禁用"}, {id: 0, name: "启用"}],
            img: [],
        },
        methods: {
            upload() {
                var form = new FormData($("#addForm")[0]);
                $.ajax({
                    type: "post",
                    url: "/file/uploadiImage",
                    contentType: false,
                    processData: false,
                    data: form,
                    success: function (msg) {
                        alert(msg)
                    }
                });

            },
            removeImages() {
                $("#images").css("background-image", "url()");
            },
            selectFile() {
                $("#selectFile").trigger("click");
            },
            selectFile2() {
                $("#selectFile2").trigger("click");
            },
            update(shop) {
                var that = this;
                axios.post('/shopAdmin/findById?id='+ shop.id)
                    .then(function (response) {
                        console.log(response);
                        that.updateShop = response.data.responseResult;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
                oldImage = that.updateShop.images;
                $("#updateModel").modal('show');
            },
            updateshop: function () {
                var that = this;
                var params = new URLSearchParams();
                params.append('id', that.updateShop.id);
                params.append('name', that.updateShop.name);
                params.append('address', that.updateShop.address);
                params.append('tel', that.updateShop.tel);
                params.append('businessHours', that.updateShop.businessHours);
                params.append('longitude', that.updateShop.longitude);
                params.append('latitude', that.updateShop.latitude);
                params.append('Images', updateUrl);
                params.append('status', that.updateShop.status);
                params.append('hotSearch', that.updateShop.hotSearch);
                axios.post('/shopAdmin/add', params)
                    .then(function (response) {
                        $("#updateModel").modal("hide");
                        console.log(response.data.responseResult);
                        that.getAll();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });

            },
            del(shop) {
                var that = this;
                var params = new URLSearchParams();
                params.append('id', shop.id);
                axios.post('/shopAdmin/deleteShop', params)
                    .then(function (response) {
                        console.log(response.data.responseResult);
                        that.getAll();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            showPicture: function (shop) {
                this.qrcodeImage = shop.qrcodeImage;
                this.qrcodeText = shop.qrcodeText;
                $("#showPictureModel").modal('show');
            },
            show(img) {
                this.img = img;
                $("#showModel").modal('show');
            },
            add() {
                $("#addShopModel").modal('show');
            },
            addShop: function () {
                var that = this;
                var params = new URLSearchParams();
                params.append('name', that.newShop.name);
                params.append('address', that.newShop.address);
                params.append('tel', that.newShop.tel);
                params.append('businessHours', that.newShop.businessHours);
                params.append('longitude', that.newShop.longitude);
                params.append('latitude', that.newShop.latitude);
                params.append('Images', addUrl);
                params.append('status', that.newShop.status);
                params.append('hotSearch', that.newShop.hotSearch);
                axios.post('/shopAdmin/add', params)
                    .then(function (response) {
                        $("#addShopModel").modal("hide");
                        console.log(response.data.responseResult);
                        that.getAll();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            getAll() {
                var that = this;
                axios
                    .post('/shopAdmin/find')
                    .then(function (response) {
                        that.shopList = response.data.responseList;
                        console.log(response.data.responseList);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            }
        }, created() {
            var that = this;
            axios
                .post('/shopAdmin/find')
                .then(function (response) {
                    that.shopList = response.data.responseList;
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
