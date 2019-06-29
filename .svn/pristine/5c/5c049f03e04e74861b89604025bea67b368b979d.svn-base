<%@ taglib prefix="v-bind" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/6/22
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>运营概况</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/jquery-3.3.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/vue.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/axios.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css">
        body {
            /*background-image: url("/images/test1.png");*/
        }
    </style>
</head>
<body>
<div class="container" id="app" style="margin-left: 15px;margin-top: 20px;font-size: 20px;">
    <h2 style="font-size: 30px;font-family: 微软雅黑">运营概况</h2>
    <div class="row">
        <form class="form-inline" role="form">
            <div class="form-group ">
                <label for="lastname" class="col-sm-3 control-label">门店：</label>
                <div class="col-sm-9">
                    <select class="form-control" id="lastname" v-model="shopId">
                        <option v-for="shop in shopIdList" v-bind:value="shop.id">{{shop.name}}</option>
                    </select>
                </div>
            </div>
        </form>
    </div>
    <div class="row">
        <form class="form-inline" role="form">
            <div class="form-group">
                <label class="control-label">运营数据批量导出：</label>
            </div>
            <div class="form-group">
                <label class="control-label" for="firstname">开始日期：</label>
                <input type="date" class="form-control" v-model="date" id="firstname">
            </div>
            <div class="form-group">
                <label class="control-label" for="nae">&nbsp;&nbsp;-&nbsp;&nbsp;结束日期：</label>
                <input type="date" class="form-control" id="nae" v-model="date2">
            </div>
            <div class="form-group">
                <label class="control-label" for="n">&nbsp;&nbsp;&nbsp;&nbsp;</label>
                <button type="button" class="btn btn-primary" id="n" @click="daochu()">一键导出</button>
            </div>
        </form>
    </div>
    <div style="opacity:0.5;text-align:center">
        <div class="row" style="width: 30%">
            <h2 style="font-size:20px;font-family:Calibri;margin-left: 15px;">当前数据：{{shopInfo.date}}</h2>
            <table class="table tab-content table-bordered">
                <tr>
                    <td>pv(浏览量)</td>
                    <td>uv(浏览量)</td>
                </tr>
                <tr>
                    <td v-text="shopInfo.pv">0</td>
                    <td v-text="shopInfo.uv">0</td>
                </tr>
            </table>
        </div>
        <div class="row" style="width: 45%">
            <h2 style="font-size:20px;font-family:Calibri;margin-left: 15px;">优惠券</h2>
            <table class="table tab-content table-bordered">
                <tr>
                    <td>游戏优惠券领取数量</td>
                    <td>首页广告优惠券领取数量</td>
                    <td>首页楼层优惠券领取数量</td>
                </tr>
                <tr>
                    <td v-text="shopInfo.gameCoupon">0</td>
                    <td v-text="shopInfo.heanCoupon">0</td>
                    <td v-text="shopInfo.floorCoupon">0</td>
                </tr>
            </table>
        </div>
        <div class="row" style="width: 10%">
            <h2 style="font-size:20px;font-family:Calibri;margin-left: 15px;">停车场</h2>
            <table class="table tab-content table-bordered">
                <tr>
                    <td>停车次数</td>
                </tr>
                <tr>
                    <td v-text="shopInfo.parking">0</td>
                </tr>
            </table>
        </div>
        <div class="row" style="width: 30%">
            <h2 style="font-size:20px;font-family:Calibri;margin-left: 15px;">评论</h2>
            <table class="table tab-content table-bordered">
                <tr>
                    <td>评论次数</td>
                    <td>意见反馈次数</td>
                </tr>
                <tr>
                    <td v-text="shopInfo.comment">0</td>
                    <td v-text="shopInfo.opinion">0</td>
                </tr>
            </table>
        </div>
        <div class="row" style="width: 30%">
            <h2 style="font-size:20px;font-family:Calibri;margin-left: 15px;">游戏</h2>
            <table class="table tab-content table-bordered">
                <tr>
                    <td>拼图PV</td>
                    <td>拼图UV</td>
                </tr>
                <tr>
                    <td v-text="shopInfo.fightfChartPV">0</td>
                    <td v-text="shopInfo.fightfChartUV">0</td>
                </tr>
                <tr>
                    <td>对对碰PV</td>
                    <td>对对碰UV</td>
                </tr>
                <tr>
                    <td v-text="shopInfo.yesYesTouchPV">0</td>
                    <td v-text="shopInfo.yesYesTouchUV">0</td>
                </tr>
            </table>
        </div>
    </div>
</div>


<script>
    var v = new Vue({
        el: "#app",
        data: {
            shopInfo: {},
            shopIdList: {},
            date: {},
            date2:{},
            shopId:"1"
        },
        methods: {
            daochu(){
                var that = this;
                var url = "/min/creatorExcel?shopId="+that.shopId+"&date="+that.date+"&date2="+that.date2;
                window.open(url,"blank");

                // var params = new URLSearchParams();
                // params.append('shopId', that.shopId);
                // params.append('date', that.date);
                // params.append('date2', that.date2);
                // axios
                //     .post('/min/creatorExcel', params)
                //     .then(function (response) {
                //         console.log("导出成功");
                //     })
                //     .catch(function (error) {
                //         console.log(error);
                //     });

            }


        }, created() {
            var that = this;

            var params2 = new URLSearchParams();
            axios.post('/shopAdmin/find', params2)
                .then(function (response) {
                    that.shopIdList = response.data.responseList;
                    console.log(response.data.responseList);
                })
                .catch(function (error) {
                    console.log(error);
                });

            var params = new URLSearchParams();
            var shopId = "1";
            var date = "2018-05-29";
            params.append('shopId', shopId);
            params.append('date', date);
            axios.post('/min/find', params)
                .then(function (response) {
                    that.shopInfo = response.responseList;
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
