<%@ taglib prefix="v-bind" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="v-on" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: xyl
  Date: 2019/6/22
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>品牌管理</title>
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
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4 "></label>
                </div>


                <div class="form-group">
                    <label class="control-label col-sm-8 "></label>
                </div>

                <div class="form-group">
                    <button type="button" class="btn btn-default" style="border-spacing: 1px;border-color: #ececf6"
                            onclick="selectFile4()"
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
                            <input type="text" class="form-control" v-model="issue_content" v-on:input="inputFunc"
                                   placeholder="请输入要查询的品牌">
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="button" class="btn btn-primary" id="p">搜索</button>
                    </div>
                </div>
            </form>


        </div>
    </div>
    <table class="table table-bordered table-hover tab-content text-center">
        <thead>
        <tr>
            <td>品牌id</td>
            <td>品牌</td>
            <td>logo</td>
            <td>状态</td>
            <td>操作</td>
        </tr>
        </thead>
        <%--<tbody v-show="serch_result_issue" class="serch_result">--%>
        <tbody>
        <tr v-for="brand in brandList">
            <td v-text="brand.id">超级管理员</td>
            <td v-text="brand.brandType"></td>
            <td><img v-bind:src="brand.logo" @click="show(brand.logo)" style="width: 60px;"/></td>
            <td v-if="brand.status==0">启用</td>
            <td v-else>禁用</td>
            <td>
                <button type="button" @click="update(brand)" class="btn btn-default"
                        style="border-spacing: 1em;border-color: #ececf6">修改
                </button>
                <button type="button" @click="del(brand)" class="btn btn-danger">删除</button>
            </td>
        </tr>
        </tbody>
    </table>

    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel" style="float: left;">添加/修改 品牌</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="addForm" role="form" enctype="multipart/form-data">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">品牌</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control" v-model="addBrand.brandType"
                                       placeholder="请输入添加的品牌"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">logo</label>
                            <div class="col-sm-9">
                                <div class="text-center" onclick="selectFile();"
                                     style="width: 100px;height: 100px; border: 1px dashed black; border-radius: 5px;">
                                    <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                    </div>
                                </div>
                                <input id="selectFile" type="file" style="display: none;" name="file"
                                       onchange="doUpload()"/>
                                <span>此处建议上传图片大小尺寸：宽度165px，高度125px</span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">状态</label>
                            <div class="col-sm-3">
                                <select class="form-control" v-model="addstatus">
                                    <option v-for="status in statusList" v-bind:value="status.id">{{status.name}}
                                    </option>
                                </select>
                            </div>
                        </div>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="addbrand()">确定</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>

    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" style="float: left;">添加/修改 品牌</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="updateForm" role="form" enctype="multipart/form-data">

                        <div class="form-group">
                            <label class="col-sm-3 control-label">品牌</label>
                            <div class="col-sm-9">
                                <input type="text"
                                       class="form-control" v-model="updateBrand.brandType"
                                />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">logo</label>
                            <div class="col-sm-9">
                                <div class="text-center" onclick="selectFile2();" id="images"
                                     v-bind:style="{backgroundImage:'url(' + updateBrand.logo + ')',width: '100px',height: '100px',border: '1px dashed black'}">
                                    <div class="fa fa-plus" style="margin-top:42%; color:gray;">
                                    </div>
                                </div>
                                <input id="selectFile2" type="file" style="display: none;" name="file"
                                       onchange="doUpload1()">
                                <span>此处建议上传图片大小尺寸：宽度165px，高度125px</span>
                                <span>
                                    <button type="button" class="btn btn-default" onclick="removeImages();"
                                            style="border-spacing: 1em;border-color: #ececf6">删除该图片
                                    </button>
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">状态</label>
                            <div class="col-sm-3">
                                <select class="form-control" v-model="updateBrand.status">
                                    <option v-for="status in statusList" v-bind:value="status.id">{{status.name}}
                                    </option>
                                </select>
                            </div>
                        </div>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="updatebrand()">确定</button>
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
        $.ajax({
            type: "post",
            url: "/brandAdmin/upload",
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

    function selectFile() {
        $("#selectFile").trigger("click");
    }

    function selectFile2() {
        $("#selectFile2").trigger("click");
    }

    function selectFile4() {
        $("#daoru").trigger("click");
    }

    function removeImages() {
        $("#images").css("background-image", "url()");
    }

    var v = new Vue({
        el: "#app",
        data: {
            addstatus: "0",
            statusList: [{id: 1, name: "禁用"}, {id: 0, name: "启用"}],
            shopIdList: {},
            shopId: "",
            brandList: {},
            shopId: {},
            id: "1",
            img: [],
            updateBrand: {},
            addBrand: {},
            issue_content: "", //输入框中的内容
            serch_result_issue: false,//控制搜索的问题显示隐藏
        },
        methods: {
            daochu() {
                var that = this;
                var url = "/shoping/excel/brand.xls";
                window.open(url, "blank");
            },
            change() {
                var that = this;
                axios.post('/brandAdmin/finds?shopId=' + that.shopId)
                    .then(function (response) {
                        console.log(response.data.responseList);
                        that.brandList = response.data.responseList;
                        shopId = that.shopId;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            add() {
                $("#addModal").modal('show');
            },
            addbrand() {
                var that = this;
                var params = new URLSearchParams();
                params.append('shopId', that.shopId);
                params.append('logo', addUrl);
                params.append('brandType', that.addBrand.brandType);
                params.append('status', that.addstatus);
                axios.post('/brandAdmin/add', params)
                    .then(function (response) {
                        $("#addModal").modal("hide");
                        console.log(response.data.responseResult);
                        that.getAll();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            update: function (brand) {
                var that = this;
                axios.post('/brandAdmin/findBrandById?id=' + brand.id)
                    .then(function (response) {
                        console.log(response);
                        that.updateBrand = response.data.responseResult;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
                oldImage = that.updateBrand.logo;
                $("#updateModal").modal('show');
            },
            updatebrand() {
                var that = this;
                var params = new URLSearchParams();
                params.append('id', that.updateBrand.id);
                params.append('shopId', that.shopId);
                params.append('logo', updateUrl);
                params.append('brandType', that.updateBrand.brandType);
                params.append('status', that.updateBrand.status);
                axios.post('/brandAdmin/add', params)
                    .then(function (response) {
                        $("#updateModal").modal("hide");
                        console.log(response.data.responseResult);
                        that.getAll();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            del(brand) {
                var that = this;
                axios.post('/brandAdmin/delete?id=' + brand.id)
                    .then(function (response) {
                        console.log(response.data.responseResult);
                        that.getAll();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
                console.log("删除成功");
            },
            getAll() {
                var that = this;
                axios
                    .post('/brandAdmin/finds?shopId=1')
                    .then(function (response) {
                        that.brandList = response.data.responseList;
                        shopId = 1;
                        console.log(response.data);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            //监听输入事件，当input中有内容时，下面的搜索列表显示出来
            inputFunc() {
                if (this.issue_content.length > 0) {
                    this.serch_result_issue = true;
                } else {
                    this.serch_result_issue = false
                }
            }
        }, created() {
            var that = this;
            axios.post('/shopAdmin/find')
                .then(function (response) {
                    that.shopIdList = response.data.responseList;
                    console.log(response.data.responseList);
                })
                .catch(function (error) {
                    console.log(error);
                });

            axios
                .post('/brandAdmin/finds?shopId=1')
                .then(function (response) {
                    that.shopId = 1;
                    shopId = 1;
                    that.brandList = response.data.responseList;
                    console.log(response.data.responseList);
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
        //计算属性，当输入内容的时候下面的方法就会根据你输入的内容来过滤serch_result数组中的数据
        computed: {
            searchData() {
                var issue_content = this.issue_content;
                if (issue_content) {
                    return this.serch_result.filter(function (product) {
                        return Object.keys(product).some(function (key) {
                            return String(product[key]).toLowerCase().indexOf(issue_content) > -1
                        })
                    })
                }
                return this.products;
            }
        }
    })
</script>
</body>
</html>
