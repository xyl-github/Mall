<%--
  Created by IntelliJ IDEA.
  User: xyl
  Date: 2019/6/22
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <script src="/js/jquery-3.3.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/vue.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/axios.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css">
        body{
            background-image: url("/images/test1.png");
        }
    </style>
</head>
<body style="margin: 0;background-repeat: no-repeat;background-size: cover;">

<div id="app" class="container"
     style="width: 30%;margin-top: 100px;background-color: white;padding-bottom: 30px;border-radius: 10px;">
    <form id="login_form" class="form-signin" role="form">
        <h2 class="form-signin-heading text-center">登录</h2>
        <div class="input-group" style="margin-top: 15px;">
            <span class="input-group-addon"><i class="fa fa-user fa-fw"></i></span>
            <input type="text" v-model="user" class="form-control" placeholder="请输入账号"
                   required autofocus>
        </div>
        <div class="input-group" style="margin-top: 15px;">
            <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
            <input v-model="pass" type="password" class="form-control" placeholder="请输入密码"
                   required>
        </div>
        <div class="row">
            <div class="col-md-12" >
                <button @click="login()" class="btn btn-md btn-primary btn-block" style="margin-top: 15px;" type="button">
                    登录
                </button>
            </div>
        </div>
        <div class="alert alert-danger" id="msg" style="display: none;"></div>
    </form>
</div>


<script type="text/javascript">

    <!--创建一个vue的对象-->
    var v = new Vue({
        el: '#app',
        data: {
            user:[],
            pass:[]
        },
        methods: {
            login:function () {
                var that = this;
                var params = new URLSearchParams();
                params.append('user', that.user);
                params.append('password', that.pass);
                axios.post('/min/login', params)
                    .then(function (response) {
                        console.log(response);
                        window.location.href="/page/index";
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            }
        },
        created() {
        }
    })


</script>
</body>
</html>
