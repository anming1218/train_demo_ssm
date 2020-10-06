<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>登录</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        //注册
        function login() {
            if ($("#name").val() === "") {
                alert("请输入用户名");
                return;
            }
            if ($("#pass").val() === "") {
                alert("请输入密码");
                return;
            }

            let form = document.getElementById("form");
            let action = "${pageContext.request.contextPath}/user/registered";

            form.setAttribute("action", action);

            form.submit();
        }

        function changeOnColor(obj) {
            obj.style.backgroundColor = "rgb(29,64,118)";
        }

        function changeOutColor(obj) {
            obj.style.backgroundColor = "rgb(30,75,144)";
        }

    </script>


    <style type="text/css">
        td, th {
            text-align: center;
        }

        .bg {
            background-image: url("http://cdnming.minglovejuan.club/falv/20201005155305.jpg");
        }
    </style>

</head>
<body class="col-center-block">

<div class="container-fluid">

    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-2">
            <a href="../pages/home.html"><img src="http://cdnming.minglovejuan.club/falv/20200930094135.png"
                                              class="img-responsive" alt="中国法院网"/></a>
        </div>
        <div class="col-md-3 text-right" style="padding-top: 40px">

            <a style="font-family: 新宋体;font-size: 40px;color: #ceced0">|</a>&nbsp;&nbsp;<a
                style="font-family: 黑体;font-size: 40px;color: #0f0f0f">统一认证中心</a>

        </div>

    </div>
    <div class="row bg" style="width: 1536px;height: 462px">
        <div class="col-md-12">
            <br>
            <br>
            <div class="row">
                <div class="col-md-8"></div>
                <div class="col-md-4 center-block"
                     style="width: 450px;height: 400px;background-color: rgba(254,254,254,0.4)">
                    <br>
                    <br>
                    <form class="form-horizontal" action="#" method="post" id="form">
                        <div class="form-group">
                            <label for="name" class="col-md-3 control-label">用户名:</label>
                            <div class="col-md-7">
                                <input type="text" style="border: 1px solid rgb(77,180,238);" class="form-control"
                                       id="name" name="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pass" class="col-md-3 control-label">密码:</label>
                            <div class="col-md-7">
                                <input type="password" style="border: 1px solid rgb(77,180,238);" class="form-control"
                                       id="pass" name="pass">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">性别：</label>
                            <div class="col-md-7">
                                <label>
                                    <input type="radio" name="gender" value="男" checked/>
                                </label>男
                                <label>
                                    <input type="radio" name="gender" value="女"/>
                                </label>女
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="birthday" class="col-md-3 control-label">生日:</label>
                            <div class="col-md-7">
                                <input type="date" style="border: 1px solid rgb(77,180,238);" class="form-control"
                                       id="birthday" name="birthday">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10 text-center"
                                 style="width: 320px;height:50px;background-color: rgb(30,75,144)" onclick="login()"
                                 onmousemove="changeOnColor(this)" onmouseout="changeOutColor(this)">
                                <span style="color: white;line-height: 50px;outline-width: 320px;font-size: 20px">注册</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-8"></div>
                            <div class="col-md-4">
                                <a href="../pages/login.jsp" style="color:black;font-size: 15px">返回登录</a>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </div>

</div>

</body>
</html>