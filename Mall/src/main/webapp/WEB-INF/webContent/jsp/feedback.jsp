<%--
  Created by IntelliJ IDEA.
  User: xyl
  Date: 2019/6/22
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>意见反馈</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
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

            <td>反馈意见id</td>
            <td>用户名</td>
            <td>手机</td>
            <td>反馈内容</td>
            <td>图片</td>
            <td>类型</td>
            <td>操作</td>

        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>
            <button type="button" class="btn btn-default" style="border-spacing: 1px;border-color: #ececf6" @click="modify()">未读</button>
            <button type="button" class="btn btn-danger" @click="deleteOpinion">删除</button>
            </td>
        </tr>
    </table>
</div>



</body>
<script>
    var v = new Vue({
        el:"#app",
        data:{
            emp:[],
            modi:modi
        },
        methods:{
        deleteOpinion(){
            axios.get('opinionAdmin/deleteOpinion')
                .then(function (response) {
                    that.emp = response.data
                    console.log(response.data)
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
            modify(){
                // {
                // “id”: “74”
                // }
                axios.get('/opinionAdmin/deleteOpinion')
                    .then(function (response) {
                        // {
                        //     "status": "Success",
                        //     "responseResult": true,
                        //     "responseList": null
                        // }
                        that.emp = response.data
                        console.log(response.data)
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            }

        },
        created() {
            var that = this;
            // {
            // “shopId”: “39”
            // }
            axios.get('opinionAdmin/finds')
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
