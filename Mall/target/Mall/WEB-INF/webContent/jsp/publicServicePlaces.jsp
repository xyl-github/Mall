<%@ taglib prefix="v-bind" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: xyl
  Date: 2019/6/22
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>公共服务场所管理</title>
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
                            @click="add()">创建
                    </button>
                </div>

            </form>


        </div>
    </div>
    <table class="table table-bordered table-hover tab-content text-center">
        <tr>
            <td>公共服务场所id</td>
            <td>公共服务场所名称</td>
            <td>服务类型</td>
            <td>营业场所</td>
            <td>楼层</td>
            <td>关键字</td>
            <td>服务介绍</td>
            <td>门头图</td>
            <td>状态</td>
            <td>二维码</td>
            <td>操作</td>
        </tr>
        <%--<tr v-for="publicService in publicServiceList">--%>
        <tr>
            <%--<td v-text="publicService.id">超级管理员</td>--%>
            <%--<td v-text="publicService.name"></td>--%>
            <%--<td v-text="publicService.storeTypeName">超级管理员</td>--%>
            <%--<td v-text="publicService.doBusinessSiteName">15010327826</td>--%>
            <%--<td v-text="publicService.floorName">admin</td>--%>
            <%--<td v-text="publicService.keywords">启用</td>--%>
            <%--<td v-text="publicService.introduce">启用</td>--%>
            <%--<td v-text="publicService.logoImageUrl">启用</td>--%>
            <%--<td><img v-bind:src="publicService.logoImageUrl" @click="show(publicService.logoImageUrl)" style="width: 60px;"/></td>--%>
            <%--<td v-if="publicService.status==0">启用</td>--%>
            <%--<td v-else>禁用</td>--%>

            <td>超级管理员</td>
            <td>超级管理员</td>
            <td>15010327826</td>
            <td>admin</td>
            <td>启用</td>
            <td>启用</td>
            <td>启用</td>
            <td>超级管理员</td>
            <td>超级管理员</td>
            <td>
                <button type="button" @click="showPicture(publicService)" class="btn btn-default"
                        style="border-spacing: 1em;border-color: #ececf6">生成
                </button>
            </td>
            <td>
                <button type="button" @click="update(publicService)" class="btn btn-default"
                        style="border-spacing: 1em;border-color: #ececf6">修改
                </button>
                <button type="button" @click="del(publicService)" class="btn btn-danger">删除</button>
            </td>
        </tr>
    </table>

    <div class="modal fade bs-example-modal-lg" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel" style="float: left;">添加/修改 公共服务场所</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">

                    <form class="form-horizontal" id="addForm" role="form" enctype="multipart/form-data">

                        <div class="form-group">
                            <label class="col-sm-4 control-label">场所名称</label>
                            <div class="col-sm-8">
                                <input type="text"
                                       class="form-control" v-model="addPublicService.name"
                                       placeholder="请输入该公共服务场所的名字"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">营业场所</label>
                            <div class="col-sm-5">
                                <select class="form-control" v-model="addPublicService.doBusinessSiteId"
                                        @change="businessChange(addShop.doBusinessSiteId)">
                                    <option v-for="business in businessList" v-bind:value="business.id">
                                        {{business.name}}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">楼层</label>
                            <div class="col-sm-5">
                                <select class="form-control">
                                    <option selected>请选择楼层</option>
                                    <option>无数据</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">类型</label>
                            <div class="col-sm-5">
                                <select class="form-control">
                                    <option selected>请选择类型</option>
                                    <option>请选择店铺类型</option>
                                    <option>联营~工厂店</option>
                                    <option>租赁</option>
                                    <option>联营~统装</option>
                                    <option>餐饮</option>
                                    <option>客服中心</option>
                                    <option>便利店</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">关键字</label>
                            <div class="col-sm-8">
                                <input type="text"
                                       class="form-control" v-model="addPublicService.keywords"
                                       placeholder="请输入关键字(关键字请以逗号隔开)"/>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-4 control-label">介绍</label>
                            <div class="col-sm-8">
                                <textarea rows="3" cols="20" placeholder="请输入介绍"
                                          v-model="addPublicService.introduce">
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
                                <input id="selectFile" type="file" style="display: none;" onchange="doUpload()"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="alert alert-danger col-sm-offset-4 col-sm-6">
                                <span>此处建议上传图片大小尺寸：宽度160px，高度120px</span>
                                <span>
                                    <button type="button" class="btn btn-default" @click="removeImages();"
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
                    <button type="button" class="btn btn-primary" @click="addService()">确定</button>
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
                    <h4 class="modal-title" style="float: left;">添加/修改 公共服务场所</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">

                    <form class="form-horizontal" id="updateForm" role="form" enctype="multipart/form-data">

                        <div class="form-group">
                            <label class="col-sm-4 control-label">场所名称</label>
                            <div class="col-sm-8">
                                <input type="text"
                                       class="form-control" v-model="updatePublicService.name"
                                />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">营业场所</label>
                            <div class="col-sm-5">
                                <select class="form-control" v-model="updatePublicService.doBusinessSiteId"
                                        @change="businessChange(updateShop.doBusinessSiteId)">
                                    <option v-for="business in businessList" v-bind:value="business.id">
                                        {{business.name}}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">楼层</label>
                            <div class="col-sm-5">
                                <select class="form-control" v-model="updatePublicService.florid"
                                        @change="floorChange(updatePublicService.florid)">
                                    <option v-for="floor in floorList" v-bind:value="floor.id">{{floor.name}}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">类型</label>
                            <div class="col-sm-5">
                                <select class="form-control" v-model="updatePublicService.storeTypeId"
                                >
                                    <option v-for="storeType in storeTypeList" v-bind:value="storeType.id">
                                        {{storeType.name}}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">关键字</label>
                            <div class="col-sm-8">
                                <input type="text"
                                       class="form-control" v-model="updatePublicService.keywords"
                                />
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-4 control-label">介绍</label>
                            <div class="col-sm-8">
                                <textarea rows="3" cols="20"
                                          v-model="updatePublicService.introduce">
                                </textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">门头图</label>
                            <div class="col-sm-8">
                                <div class="text-center" @click="selectFile2();" id="images2"
                                     v-bind:style="{backgroundImage:'url(' + updatePublicService.logoImageUrl + ')',width: '100px',height: '100px',border: '1px dashed black'}">
                                    <%--style="background-image: url(/images/test3.png);width: 100px;height: 100px; border: 1px dashed black; border-radius: 5px;">--%>
                                    <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                    </div>
                                </div>
                                <input id="selectFile2" type="file" style="display: none;" onchange="doUpload1()"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="alert alert-danger col-sm-offset-4 col-sm-5">
                                <span>此处建议上传图片大小尺寸：宽度160px，高度120px</span>
                            </div>
                            <div class="row col-sm-offset-4 col-sm-6">
                                <span>
                                    <button type="button" class="btn btn-default" @click="removeImages2();"
                                            style="border-spacing: 1em;border-color: #ececf6;">删除该图片
                                    </button>
                                </span>
                            </div>
                        </div>

                        <div class="form-group" style="margin-top: 20px">
                            <label class="col-sm-4 control-label">状态</label>
                            <div class="col-sm-4">
                                <select class="form-control" v-model="addPublicService.status">
                                    <option v-for="status in statusList" v-bind:value="status.id">{{status.name}}
                                    </option>
                                </select>
                            </div>
                        </div>

                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="updateService()">确定</button>
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
            publicServiceList: {},
            statusList: [{id: 1, name: "禁用"}, {id: 0, name: "启用"}],
            publicService: {},
            shopId: "",
            addPublicService: {},
            updatePublicService: {},
            shopIdList: {},
            businessList: {},
            floorList: {},
            storeTypeList: {},
            categoryList: {},
            brandList: {},
            img: "",
            qrcodeImage: [],
            qrcodeText: [],
        },
        methods: {
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
            showPicture: function (floor) {
                this.qrcodeImage = floor.qrcodeImage;
                this.qrcodeText = floor.qrcodeText;
                $("#showPictureModel").modal('show');
            },
            show(img) {
                this.img = img;
                $("#showModel").modal('show');
            },
            change() {
                var that = this;
                var params = new URLSearchParams();
                params.append('type', "service");
                params.append('shopId', that.shopId);
                axios
                    .post('/storeType/finds', params)
                    .then(function (response) {
                        console.log(response);
                        that.publicServiceList = response.data.responseList;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            add() {
                $("#addModal").modal('show');
            },
            update(publicService) {
                $("#updateModal").modal('show');
            },
            del(publicService) {
                var that = this;
                axios.post('/storeAdmin/delete?id='+publicService.id)
                    .then(function (response) {
                        console.log(response);
                        that.getAll();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            removeImages() {
                $("#images").css("background-image", "url()");
            },
            removeImages2() {
                $("#images2").css("background-image", "url()");
            },
            showPicture: function () {
                $("#showPictureModel").modal('show');
            },
            selectFile() {
                $("#selectFile").trigger("click");
            },
            selectFile2() {
                $("#selectFile2").trigger("click");
            },
            addService() {
                var that = this;
                var params = new URLSearchParams();
                params.append('storeTypeName', "service");
                params.append('storeTypeId', that.addPublicService.storeTypeId);
                params.append('shopId', that.shopId);
                params.append('name', that.addPublicService.name);
                params.append('introduce', that.addPublicService.introduce);
                params.append('floorId', that.addPublicService.florid);
                params.append('doBusinessSiteId', that.addPublicService.doBusinessSiteId);
                params.append('categoryId', that.addPublicService.categoryId);
                params.append('status', that.addstatus);
                params.append('keywords', that.addPublicService.keywords);
                params.append('logoImageUrl', addUrl);

                axios.post('/storeAdmin/add', params)
                    .then(function (response) {
                        $("#addModal").modal("hide");
                        console.log(response);
                        that.getAll();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });

            },
            updateService() {
                var that = this;
                var params = new URLSearchParams();
                params.append('storeTypeName', "service");
                params.append('storeTypeId', that.updatePublicService.storeTypeId);
                params.append('id', that.updatePublicService.id);
                params.append('shopId', that.shopId);
                params.append('name', that.updatePublicService.name);
                params.append('introduce', that.updatePublicService.introduce);
                params.append('floorId', that.updatePublicService.florid);
                params.append('doBusinessSiteId', that.updatePublicService.doBusinessSiteId);
                params.append('categoryId', that.updatePublicService.categoryId);
                params.append('status', that.updatePublicService.status);
                params.append('keywords', that.updatePublicService.keywords);
                params.append('logoImageUrl', updateUrl);
                axios.post('/storeAdmin/modify', params)
                    .then(function (response) {
                        $("#addModal").modal("hide");
                        console.log(response.data.status);
                        that.getAll();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });

            },
            getAll() {
                var that = this;
                axios
                    .post('/storeType/finds?type=service&shopId=1')
                    .then(function (response) {
                        that.publicServiceList = response.responseList;
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
                    console.log(response.data.responseList);
                })
                .catch(function (error) {
                    console.log(error);
                });

            axios
                .post('/storeType/finds?type=service&shopId=1')
                .then(function (response) {
                    that.publicServiceList = response.responseList;
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
