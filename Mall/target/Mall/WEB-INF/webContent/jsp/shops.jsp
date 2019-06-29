<%@ taglib prefix="v-bind" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: xyl
  Date: 2019/6/22
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商铺管理</title>
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
            <form class="form-inline" id="daoruForm" role="form" enctype="multipart/form-data">

                <div class="form-group">
                    <label for="lastname" class="control-label">门店：</label>
                    <select class="form-control" id="lastname" v-model="shopId" @change="change()">
                        <option v-for="shop in shopIdList" v-bind:value="shop.id" v-if="shop.status==0">{{shop.name}}
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
                            @click="add()"
                    >创建
                    </button>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4 "></label>
                </div>


                <div class="form-group">
                    <label class="control-label col-sm-8 "></label>
                </div>

                <div class="form-group">
                    <button type="button" class="btn btn-default" style="border-spacing: 1px;border-color: #ececf6"
                            @click="daochu()">下载模板
                    </button>
                    <%--<a href="/shoping/excel/shop.xls">下载模板</a>--%>
                    <input id="moban" type="file" style="display: none;"/>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4 "></label>
                </div>


                <div class="form-group">
                    <label class="control-label col-sm-8 "></label>
                </div>

                <div class="form-group">
                    <button type="button" class="btn btn-default" style="border-spacing: 1px;border-color: #ececf6"
                            @click="selectFile4()"
                    >一键导入
                    </button>
                    <input id="daoru" type="file" style="display: none;" name="file" onchange="doUpload2()"/>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4 "></label>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-8 "></label>
                </div>

                <div class="form-group">
                    <div class="form-group">
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="firstname" name="ename" placeholder="请输入要查询的商铺">
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="button" class="btn btn-primary">搜索</button>
                    </div>
                </div>
            </form>


        </div>
    </div>
    <table class="table table-bordered table-hover tab-content text-center">
        <tr>
            <td>商铺id</td>
            <td>店铺名称</td>
            <td>品类</td>
            <td>品牌</td>
            <td>店铺类型</td>
            <td>营业场所</td>
            <td>楼层</td>
            <td>标签</td>
            <td>关键字</td>
            <td>店铺介绍</td>
            <td>门头图</td>
            <td>状态</td>
            <td>二维码</td>
            <td>操作</td>
        </tr>
        <tr v-for="shop in shopList">
            <td v-text="shop.id">超级管理员</td>
            <td v-text="shop.name"></td>
            <td v-text="shop.categoryName">超级管理员</td>
            <td v-text="shop.tel">15010327826</td>
            <td v-text="shop.storeTypeName">admin</td>
            <td v-text="shop.doBusinessSiteName">启用</td>
            <td v-text="shop.floorName">启用</td>
            <td v-text="shop.storeMas">启用</td>
            <td v-text="shop.keywords">启用</td>
            <td v-text="shop.introduce">启用</td>
            <td><img v-bind:src="shop.logoImageUrl" @click="show(shop.logoImageUrl)" style="width: 60px;"/></td>
            <td v-if="floor.status==0" v-text="启用">超级管理员</td>
            <td v-else v-text="禁用">超级管理员</td>
            <td>
                <button type="button" class="btn btn-default" @click="showPicture(shop)"
                        style="border-spacing: 1em;border-color: #ececf6">生成
                </button>
            </td>
            <td>
                <button type="button" @click="update(shop)" class="btn btn-default"
                        style="border-spacing: 1em;border-color: #ececf6">修改
                </button>
                <button type="button" @click="del(shop)" class="btn btn-danger">删除</button>
            </td>
        </tr>
    </table>

    <div class="modal fade bs-example-modal-lg" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel" style="float: left;">添加/修改 店铺类型</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">

                    <form class="form-horizontal" id="addForm" role="form" enctype="multipart/form-data">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">店铺名称</label>
                            <div class="col-sm-8">
                                <input type="text"
                                       class="form-control" v-model="addShop.name"
                                       placeholder="请输入店铺名称"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">营业场所</label>
                            <div class="col-sm-8">
                                <select class="form-control" v-model="addShop.doBusinessSiteId"
                                        @change="businessChange(addShop.doBusinessSiteId)">
                                    <option v-for="business in businessList" v-bind:value="business.id">
                                        {{business.name}}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">店铺楼层</label>
                            <div class="col-sm-8">
                                <select class="form-control" v-model="addShop.florid"
                                        @change="floorChange(addShop.florid)">
                                    <option v-for="floor in floorList" v-bind:value="floor.id">{{floor.name}}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">店铺类型</label>
                            <div class="col-sm-8">
                                <select class="form-control" v-model="addShop.storeTypeId"
                                        @change="storeTypeChange(addShop.storeTypeId)">
                                    <option value="">请选择</option>
                                    <option v-for="storeType in storeTypeList" v-bind:value="storeType.id">
                                        {{storeType.name}}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">联营统装区 商铺id</label>
                            <div class="col-sm-8">
                                <input type="text"
                                       class="form-control" v-model="addShop.storeMas"
                                       placeholder="若不属于联营统装区可不写">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">品类</label>
                            <div class="col-sm-8">
                                <select class="form-control" v-model="addShop.categoryId"
                                        @change="categoryChange(addShop.categoryId)">
                                    <option v-for="category in categoryList" v-bind:value="category.id">
                                        {{category.type}}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">品牌</label>
                            <div class="col-sm-8">
                                <select class="form-control" v-model="addShop.categoryId">
                                    <option v-for="brand in brandList" v-bind:value="brand.id">{{brand.brandType}}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">标签</label>
                            <div class="col-sm-8">
                                <input type="text"
                                       class="form-control" v-model="addShop.storeMas"
                                       placeholder="请输入标签"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="alert alert-danger col-sm-offset-4 col-sm-4">
                                <span>此处建议字数：6个字以内</span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">关键字</label>
                            <div class="col-sm-8">
                                <input type="text"
                                       class="form-control" v-model="addShop.keywords"
                                       placeholder="请输入关键字(关键字请以逗号隔开)"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">店铺介绍</label>
                            <div class="col-sm-8">
                                <textarea rows="3" cols="20" placeholder="请输入店铺楼层"
                                          v-model="addShop.introduce">
                                </textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">门头图</label>
                            <div class="col-sm-8">
                                <div class="text-center" @click="selectFile();"

                                     style="width: 100px;height: 100px; border: 1px dashed black; border-radius: 5px;">
                                    <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                    </div>
                                </div>
                                <input id="selectFile" type="file" style="display: none;" name="file"
                                       onchange="doUpload()"/>
                                <span>此处建议上传图片大小尺寸：宽度165px，高度125px</span>
                                <span>
                                    <button type="button" class="btn btn-default" onclick="removeImages();"
                                            style="border-spacing: 1em;border-color: #ececf6;display: none">删除该图片
                                    </button>
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="alert alert-danger col-sm-offset-4 col-sm-6">
                                <span>此处建议上传图片大小尺寸：宽度160px，高度120px</span>
                                <span>
                                    <button type="button" class="btn btn-default" onclick="removeImages();"
                                            style="border-spacing: 1em;border-color: #ececf6;display: none;">删除该图片
                                    </button>
                                </span>
                            </div>
                        </div>

                        <div class="form-group" style="margin-top: 20px">
                            <label class="col-sm-4 control-label">状态</label>
                            <div class="col-sm-4">
                                <select class="form-control" v-model="addstatus">
                                    <option v-for="status in statusList" v-bind:value="status.id">{{status.name}}
                                    </option>
                                </select>
                            </div>
                        </div>

                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="addshop()">确定</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>

    <div class="modal fade bs-example-modal-lg" id="updateModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" style="float: left;">添加/修改 店铺类型</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">

                    <form class="form-horizontal" id="updateForm" role="form" enctype="multipart/form-data">

                        <div class="form-group">
                            <label class="col-sm-4 control-label">店铺名称</label>
                            <div class="col-sm-8">
                                <input type="text"
                                       class="form-control" v-model="updateShop.name"
                                />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">营业场所</label>
                            <div class="col-sm-8">
                                <select class="form-control" v-model="updateShop.doBusinessSiteId"
                                        @change="businessChange(updateShop.doBusinessSiteId)">
                                    <option v-for="business in businessList" v-bind:value="business.id">
                                        {{business.name}}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">店铺楼层</label>
                            <div class="col-sm-8">
                                <select class="form-control" v-model="updateShop.florid"
                                        @change="floorChange(updateShop.florid)">
                                    <option v-for="floor in floorList" v-bind:value="floor.id">{{floor.name}}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">店铺类型</label>
                            <div class="col-sm-8">
                                <select class="form-control" v-model="updateShop.storeTypeId"
                                        @change="storeTypeChange(updateShop.storeTypeId)">
                                    <option value="">请选择</option>
                                    <option v-for="storeType in storeTypeList" v-bind:value="storeType.id">
                                        {{storeType.name}}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">联营统装区 商铺id</label>
                            <div class="col-sm-8">
                                <input type="text"
                                       class="form-control" v-model="updateShop.storeMas"
                                       placeholder="若不属于联营统装区可不写">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">品类</label>
                            <div class="col-sm-8">
                                <select class="form-control" v-model="updateShop.categoryId"
                                        @change="categoryChange(updateShop.categoryId)">
                                    <option v-for="category in categoryList" v-bind:value="category.id">
                                        {{category.type}}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">品牌</label>
                            <div class="col-sm-8">
                                <select class="form-control" v-model="updateShop.categoryId">
                                    <option v-for="brand in brandList" v-bind:value="brand.id">{{brand.brandType}}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">标签</label>
                            <div class="col-sm-8">
                                <input type="text"
                                       class="form-control" v-model="updateShop.storeMas"
                                />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="alert alert-danger col-sm-offset-4 col-sm-4">
                                <span>此处建议字数：6个字以内</span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">关键字</label>
                            <div class="col-sm-8">
                                <input type="text"
                                       class="form-control" v-model="updateShop.keywords"
                                />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">店铺介绍</label>
                            <div class="col-sm-8">
                                <textarea rows="3" cols="20"
                                          v-model="updateShop.introduce">
                                </textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">门头图</label>
                            <div class="col-sm-8">
                                <div class="text-center" @click="selectFile2();" id="images"
                                     v-bind:style="{backgroundImage:'url(' + updateShop.logoImageUrl + ')',width: '100px',height: '100px',border: '1px dashed black'}">
                                    <%--style="width: 100px;height: 100px; border: 1px dashed black; border-radius: 5px;">--%>
                                    <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                    </div>
                                </div>
                                <input id="selectFile2" type="file" style="display: none;" onchange="doUpload1()"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="alert alert-danger col-sm-offset-4 col-sm-6">
                                <span>此处建议上传图片大小尺寸：宽度160px，高度120px</span>
                                <span>
                                    <button type="button" class="btn btn-default" onclick="removeImages();"
                                            style="border-spacing: 1em;border-color: #ececf6;display: none;">删除该图片
                                    </button>
                                </span>
                            </div>
                        </div>

                        <div class="form-group" style="margin-top: 20px">
                            <label class="col-sm-4 control-label">状态</label>
                            <div class="col-sm-4">
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
                        <span style="width:200px;height: 32px;color:deepskyblue;background-color:lightblue">温馨提示：鼠标放到图片-->右击-->图片另存为</span>
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
    var shopId = "";

    function doUpload() {
        var form = new FormData($("#addForm")[0]);
        form.append("oldImage", null);
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

    function doUpload2() {
        var form = new FormData($("#daoruForm")[0]);
        form.append("shopId", shopId);
        form.append("type", "store");
        $.ajax({
            type: "post",
            url: "/storeAdmin/upload",
            contentType: false,
            processData: false,
            data: form,
            success: function (response) {
                console.log(response);
            }
        });
    }

    function doUpload1() {
        var form = new FormData($("#updateForm")[0]);
        form.append("oldImage", oldImage);
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
            addstatus: "0",
            shopList: {},
            shopId: "",
            addShop: {},
            statusList: [{id: 1, name: "禁用"}, {id: 0, name: "启用"}],
            updateShop: {},
            shopIdList: {},
            businessList: {},
            floorList: {},
            storeTypeList: {},
            categoryList: {},
            brandList: {},
            img:"",
            qrcodeImage: [],
            qrcodeText: [],
        },
        methods: {
            showPicture: function (floor) {
                this.qrcodeImage = floor.qrcodeImage;
                this.qrcodeText = floor.qrcodeText;
                $("#showPictureModel").modal('show');
            },
            show(img) {
                this.img = img;
                $("#showModel").modal('show');
            },
            daochu() {
                var that = this;
                var url = "/shoping/excel/shop.xls";
                window.open(url, "blank");
            },
            change() {
                var that = this;
                var params = new URLSearchParams();
                params.append('type', "store");
                params.append('shopId', that.shopId);
                axios
                    .post('/storeAdmin/finds', params)
                    .then(function (response) {
                        that.shopList = response.data.responseList;
                        shopId = that.shopId;
                        console.log(response);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            update(shop) {
                var that = this;
                axios.post('/storeAdmin/findById?id=' + shop.id)
                    .then(function (response) {
                        console.log(response);
                        that.updateShop = response.data.responseResult;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
                oldImage = that.updateShop.logoImageUrl;
                $("#updateModal").modal('show');
            },
            updateshop() {
                var that = this;
                var params = new URLSearchParams();
                params.append('categoryId', that.addShop.categoryId);
                params.append('doBusinessSiteId', that.addShop.doBusinessSiteId);
                params.append('florid', that.addShop.florid);
                params.append('introduce', that.addShop.introduce);
                params.append('logoImageUrl', addUrl);
                params.append('name', that.addShop.name);
                params.append('shopId', that.shopId);
                params.append('storeTypeId', that.addShop.storeTypeId);
                params.append('storeTypeName', "store");
                params.append('brandIds', that.addShop.brandIds);
                params.append('keywords', that.addShop.keywords);
                params.append('storeMas', that.addShop.storeMas);
                params.append('status', that.addstatus);
                params.append('id', that.addShop.id);

                axios.post('/storeAdmin/modify', params)
                    .then(function (response) {
                        $("#updateModal").modal("hide");
                        console.log(response);
                        that.getAll();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });

            },
            del(shop) {
                var that = this;
                axios.post('/storeAdmin/delete?id='+shop.id)
                    .then(function (response) {
                        console.log("删除成功");
                        console.log(response);
                        that.getAll();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            addshop() {
                var that = this;
                var params = new URLSearchParams();
                params.append('categoryId', that.addShop.categoryId);
                params.append('doBusinessSiteId', that.addShop.doBusinessSiteId);
                params.append('florid', that.addShop.florid);
                params.append('introduce', that.addShop.introduce);
                params.append('logoImageUrl', addUrl);
                params.append('name', that.addShop.name);
                params.append('shopId', that.shopId);
                params.append('storeTypeId', that.addShop.storeTypeId);
                params.append('storeTypeName', "store");
                params.append('brandIds', that.addShop.brandIds);
                params.append('keywords', that.addShop.keywords);
                params.append('storeMas', that.addShop.storeMas);
                params.append('status', that.addstatus);
                axios.post('/storeAdmin/add', params)
                    .then(function (response) {
                        $("#addModal").modal("hide");
                        console.log(response.data.status);
                        that.getAll();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });

            },
            selectFile() {
                $("#selectFile").trigger("click");
            },
            showPicture: function () {
                $("#showPictureModel").modal('show');
            },
            selectFile3() {
                $("#moban").trigger("click");
            },
            selectFile4() {
                $("#daoru").trigger("click");
            },
            businessChange(busId) {
                var that = this;
                axios
                    .post('/floorAdmin/find/' + that.shopId + '/floors')
                    .then(function (response) {
                        that.floorList = response.data.responseList;
                        console.log(response);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });

            },
            floorChange(floorId) {
                var that = this;
                var params = new URLSearchParams();
                params.append('type', "store");
                params.append('shopId', that.shopId);
                axios
                    .post('/storeType/finds', params)
                    .then(function (response) {
                        console.log(response);
                        that.storeTypeList = response.data.responseList;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            storeTypeChange(storeTypeId) {
                var that = this;
                axios.post('/category/finds?shopId=' + that.shopId)
                    .then(function (response) {
                        console.log(response);
                        that.categoryList = response.data.responseList;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            categoryChange(cateId) {
                var that = this;
                axios
                    .post('/brandAdmin/finds?shopId=' + that.shopId)
                    .then(function (response) {
                        that.brandList = response.data.responseList;
                        console.log(response);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            add() {
                var that = this;
                axios
                    .post('/doBusinessSite/find?shopId=' + that.shopId)
                    .then(function (response) {
                        that.businessList = response.data.responseList;
                        console.log(response);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });

                $("#addModal").modal('show');
            },
            getAll() {
                var that = this;
                var params = new URLSearchParams();
                params.append('type', "store");
                params.append('shopId', "1");
                axios
                    .post('/storeAdmin/finds', params)
                    .then(function (response) {
                        that.shopList = response.data.responseList;
                        that.shopId = "1";
                        shopId = "1";
                        console.log(response);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            }
        }, created() {
            var that = this;
            axios.post('/shopAdmin/find')
                .then(function (response) {
                    that.shopIdList = response.data.responseList;
                    that.shopId = "1";
                    shopId = "1";
                    console.log(response.data.responseList);
                })
                .catch(function (error) {
                    console.log(error);
                });


            var params = new URLSearchParams();
            params.append('type', "store");
            params.append('shopId', "1");
            axios
                .post('/storeAdmin/finds', params)
                .then(function (response) {
                    that.shopList = response.data.responseList;
                    that.shopId = "1";
                    shopId = "1";
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
