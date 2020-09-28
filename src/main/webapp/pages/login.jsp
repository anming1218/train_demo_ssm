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

        $(function () {
            getCookie();
        });

        //登录
        function login() {
            if ($("#name").val() === "") {
                alert("请输入用户名");
                return;
            }
            if ($("#pass").val() === "") {
                alert("请输入密码");
                return;
            }

            //saveInfo();

            let form = document.getElementById("form");
            let action = "${pageContext.request.contextPath}/user/login";

            form.setAttribute("action", action);

            form.submit();
        }

        // 保存Cookie
        function saveInfo() {
            try {
                // 保存按键是否选中
                var isSave = document.getElementById('checkbox').checked;
                if (isSave) {
                    var username = $("#name").val();
                    var pass = $("#pass").val();
                    if (username !== "" && pass !== "") {
                        SetCookie(username, pass);
                    }
                } else {
                    SetCookie("", "");
                }

            } catch (e) {
            }
        }

        // 保存Cookie
        function SetCookie(username, pass) {
            const Then = new Date();
            Then.setTime(Then.getTime() + 1866240000000);
            document.cookie += ("name=" + username + "%%" + pass + ";expires=" + Then.toUTCString());
        }

        // 获取登陆的用户名和密码
        function getCookie() {
            var nmpsd;
            var nm;
            var psd;
            var cookieString = new String(document.cookie);
            var cookieHeader = "name=";
            var beginPosition = cookieString.indexOf(cookieHeader);
            cookieString = cookieString.substring(beginPosition);
            var ends = cookieString.indexOf(";");
            if (ends != -1) {
                cookieString = cookieString.substring(0, ends);
            }
            if (beginPosition > -1) {
                nmpsd = cookieString.substring(cookieHeader.length);
                if (nmpsd != "") {
                    beginPosition = nmpsd.indexOf("%%");
                    nm = nmpsd.substring(0, beginPosition);
                    psd = nmpsd.substring(beginPosition + 2);
                    $("#name").val(nm)
                    $("#pass").val(psd)

                    if (nm != "" && psd != "") {
                        document.getElementById('checkbox').checked = true;
                    }
                }
            }
        }

    </script>


    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>

</head>
<body class="col-center-block">

<div class="row">
    <div class="col-md-12">
        <br>
        <br>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-5 center-block">
                <form class="form-horizontal" action="#" method="post" id="form">
                    <div class="form-group">
                        <label for="name" class="col-md-2 control-label">用户名:</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="name" name="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pass" class="col-md-2 control-label">密码:</label>
                        <div class="col-md-5">
                            <input type="password" class="form-control" id="pass" name="pass">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="property" class="col-md-2 control-label">身份:</label>
                        <div class="col-md-5">
                            <label>
                                <select class="form-control" id="property" name="property">
                                    <option value="0">普通用户</option>
                                    <option value="1">律师</option>
                                    <option value="2">管理员</option>
                                </select>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="checkbox" id="checkbox"> 记住密码
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <label id="error">
                                <!-- 出错显示的信息框 -->
                                <strong style="color: red">${login_msg}</strong>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-info" href="javascript:void(0);" onclick="login();">
                                Sign in
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
</div>


</body>
</html>