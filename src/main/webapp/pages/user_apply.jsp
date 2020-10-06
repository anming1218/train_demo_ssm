<%--
  Created by IntelliJ IDEA.
  User: wang
  Date: 2020/8/20
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>
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
    <title>法律援助平台——添加申报</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <script>
        //登录
        function add() {

            let form = document.getElementById("form");
            let action = "${pageContext.request.contextPath}/question/add";

            form.setAttribute("action", action);

            form.submit();
        }


        function startTime() {
            let today = new Date();//定义日期对象
            let yyyy = today.getFullYear();//通过日期对象的getFullYear()方法返回年
            let MM = today.getMonth() + 1;//通过日期对象的getMonth()方法返回年
            let dd = today.getDate();//通过日期对象的getDate()方法返回年
            let hh = today.getHours();//通过日期对象的getHours方法返回小时
            let mm = today.getMinutes();//通过日期对象的getMinutes方法返回分钟
            let ss = today.getSeconds();//通过日期对象的getSeconds方法返回秒
            // 如果分钟或小时的值小于10，则在其值前加0，比如如果时间是下午3点20分9秒的话，则显示15：20：09
            MM = checkTime(MM);
            dd = checkTime(dd);
            mm = checkTime(mm);
            ss = checkTime(ss);
            var day; //用于保存星期（getDay()方法得到星期编号）
            if (today.getDay() === 0) day = "星期日 "
            if (today.getDay() === 1) day = "星期一 "
            if (today.getDay() === 2) day = "星期二 "
            if (today.getDay() === 3) day = "星期三 "
            if (today.getDay() === 4) day = "星期四 "
            if (today.getDay() === 5) day = "星期五 "
            if (today.getDay() === 6) day = "星期六 "
            document.getElementById('nowDateTimeSpan').innerHTML = yyyy + "-" + MM + "-" + dd + " " + hh + ":" + mm + ":" + ss + "   " + day;
            setTimeout('startTime()', 1000);//每一秒中重新加载startTime()方法
        }

        function checkTime(i) {
            if (i < 10) {
                i = "0" + i;
            }
            return i;
        }
    </script>

    <style>
        .bg {
            background-image: url("http://cdnming.minglovejuan.club/falv/20201005091956.png");
        }
    </style>

<body class="col-center-block" onload="startTime()">
<div class="container-fluid bg">
    <div class="container">
        <div class="row">
            <div class="col-md-12 fl sj " style="background-color: rgb(91,192,222);color: #ffffff">
                欢迎使用法律援助平台！&nbsp;&nbsp;&nbsp;&nbsp;现在时间：<span style="color: #ffffff;"><span
                    id="nowDateTimeSpan"></span></span>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3"><img src="${pageContext.request.contextPath}/images/fayuan.png"
                                       class="img-responsive center-block" alt="法援网"/>
                <img src="http://cdnming.minglovejuan.club/typora/20200929093535.png"
                     class="img-responsive center-block"
                     alt="法律图片">
            </div>
            <div class="col-md-9"><img src="http://cdnming.minglovejuan.club/typora/20200929092235.png"
                                       class="img-responsive "
                                       alt="人物"/></div>
        </div>
        <div class="row">
            <div class="col-md-12 fl sj " style="background-color: rgb(91,192,222);color: #ffffff">
                <div id="status">亲爱的申请人${loginUser.username}，欢迎您！ &#160;&#160;&#160;&#160; <a
                        href="${pageContext.request.contextPath}/user/quit"><span style="color: #ffffff">退出登录</span></a>
                </div>

            </div>
        </div>
        <div class="row">
            <div class="col-md-12" style="background: #ffffff">
                <ul class="nav nav-tabs" id="headul">
                    <li role="presentation" class="dropdown">
                        <a href="${pageContext.request.contextPath}/question/myQuestion"
                           style="font-size: large;color: rgb(113,36,108)">
                            我的申请
                        </a>
                    </li>

                    <li role="presentation" class="dropdown">
                        <a href="${pageContext.request.contextPath}/pages/user_apply.jsp"
                           style="font-size: large;color: rgb(113,36,108)">
                            申请援助
                        </a>
                    </li>

                </ul>
            </div>
        </div>

        <div class="row">
            <div class="jumbotron">
                <div class="container" style="width: 400px">
                    <h3 style="text-align: center">申请援助</h3>
                    <form action="#" class="center-block" method="post" id="form">
                        <table border="1" class="table table-bordered table-hover center-block">
                            <div class="row form-group">
                                <label for="type">问题类型：</label>
                                <label>
                                    <select class="form-control" id="type" name="type">
                                        <option>请选择问题类型</option>
                                        <option value="交通事故">交通事故</option>
                                        <option value="刑事辩护">刑事辩护</option>
                                        <option value="劳动工伤">劳动工伤</option>
                                        <option value="房产纠纷">房产纠纷</option>
                                        <option value="债务债权">债务债权</option>
                                        <option value="合同事务">合同事务</option>
                                        <option value="医疗纠纷">医疗纠纷</option>
                                        <option value="公司经营">公司经营</option>
                                        <option value="知识产权">知识产权</option>
                                        <option value="婚姻家庭">婚姻家庭</option>
                                        <option value="其他">其他</option>
                                    </select>
                                </label>
                            </div>
                            <div class="row form-group">
                                <label for="pname">问题标题：</label>
                                <input type="text" class="form-control" style=" height :25px;width: 300px" id="pname"
                                       name="pname" placeholder="请输入问题标题"/>
                            </div>
                            <div class="row form-group">
                                <label for="details">问题详情：</label>
                                <textarea rows="3" cols="20" class="form-control" id="details" name="details">
                            </textarea>
                            </div>
                            <div class="row form-group">
                                <label for="uname">姓名：</label>
                                <input type="text" class="form-control" style=" height :25px;width: 300px" id="uname"
                                       name="uname" placeholder="请输入姓名"/>
                            </div>
                            <div class="row form-group">
                                <label for="telnumber">手机号码：</label>
                                <input type="text" class="form-control" style=" height :25px;width: 300px"
                                       id="telnumber"
                                       name="telnumber" placeholder="请输入手机号码"/>
                            </div>
                            <input type="hidden" name="creatby" value="1" readonly="readonly"/>

                            <div class="row form-group">
                                <button type="submit" class="btn btn-info" href="javascript:void(0);" onclick="add();">
                                    提交
                                </button>
                            </div>
                        </table>
                    </form>


                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>
