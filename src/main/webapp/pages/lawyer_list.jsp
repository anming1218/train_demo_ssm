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
    <title>管理员申报管理——申报等待</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>

    <script>
        function startTime() {
            const today = new Date();//定义日期对象
            const yyyy = today.getFullYear();//通过日期对象的getFullYear()方法返回年
            let MM = today.getMonth() + 1;//通过日期对象的getMonth()方法返回年
            let dd = today.getDate();//通过日期对象的getDate()方法返回年
            const hh = today.getHours();//通过日期对象的getHours方法返回小时
            let mm = today.getMinutes();//通过日期对象的getMinutes方法返回分钟
            let ss = today.getSeconds();//通过日期对象的getSeconds方法返回秒
            // 如果分钟或小时的值小于10，则在其值前加0，比如如果时间是下午3点20分9秒的话，则显示15：20：09
            MM = checkTime(MM);
            dd = checkTime(dd);
            mm = checkTime(mm);
            ss = checkTime(ss);
            let day; //用于保存星期（getDay()方法得到星期编号）
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
</head>
<body class="col-center-block" onload="startTime()">

<%--<div th:text="${msg}" id="msg" style="display:none">--%>
<%--</div>--%>
<div class="container">
    <div class="row">
        <div class="col-md-12 fl sj " style="background-color: rgb(71,33,75);color: #ffffff">
            欢迎使用项目申报管理系统！&nbsp;&nbsp;&nbsp;&nbsp;现在时间：<span style="color: #ffffff;"><span
                id="nowDateTimeSpan"></span></span>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <img src="${pageContext.request.contextPath}/images/logo.png" alt="新闻中国"
                 class="img-responsive left"/>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 fl sj " style="background-color: rgb(71,33,75);color: #ffffff">
            <div id="status" >亲爱的管理员${loginManager.mname}，欢迎您！ &#160;&#160;&#160;&#160; <a
                    href="${pageContext.request.contextPath}/quitServlet"><span style="color: #ffffff">退出登录</span></a>
            </div>

        </div>
    </div>
    <div class="row">
        <div class="col-md-12" style="background: #ffffff">
            <ul class="nav nav-tabs">
                <li role="presentation" class="dropdown">
                    <a href="${pageContext.request.contextPath}/findNoApprovePetitionerServlet"
                       style="font-size: large;color: rgb(113,36,108)">
                        申报等待
                    </a>
                </li>

                <li role="presentation" class="dropdown">
                    <a href="${pageContext.request.contextPath}/pages/report_result_json.jsp"
                       style="font-size: large;color: rgb(113,36,108)">
                        申报结果
                    </a>
                </li>

            </ul>
        </div>
    </div>
    <div class="row">
        <div class="jumbotron">
            <h3 style="text-align: center">申报项目等待处理列表</h3>

            <form>
                <table class="table table-bordered table-hover" style="text-align: center">
                    <tr class="success">
                        <th class="text-center">编号</th>
                        <th class="text-center">问题类型</th>
                        <th class="text-center">问题标题</th>
                        <th class="text-center">姓名</th>
                        <th class="text-center">电话</th>
                        <th class="text-center">查看</th>
                    </tr>
                    <c:forEach items="${pb.list}" var="question" varStatus="s">
                        <tr class="text-center">
                            <td>${s.count}</td>
                            <td>${question.type}}</td>
                            <td>${question.pname}</td>
                            <td>${question.uname}</td>
                            <td>${question.telnumber}</td>
                            <td><a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/question/readQuestion/${question.id}">查看</a></td>
                        </tr>

                    </c:forEach>


                </table>
            </form>
            <div>
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <c:if test="${pb.pageNum == 1}">
                        <li class="disabled">
                            </c:if>

                            <c:if test="${pb.pageNum != 1}">
                        <li>
                            </c:if>


                            <a href="${pageContext.request.contextPath}/question/findAll?pages=${pb.pageNum - 1}&size=${pb.pageSize}"
                               aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>


                        <c:forEach begin="1" end="${pb.total}" var="i">


                            <c:if test="${pb.pageNum == i}">
                                <li class="active"><a
                                        href="${pageContext.request.contextPath}/question/findAll?pages=${i}&size=${pb.pageSize}">${i}</a>
                                </li>
                            </c:if>
                            <c:if test="${pb.pageNum != i}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/question/findAll?pages=${i}&size=${pb.pageSize}">${i}</a>
                                </li>
                            </c:if>

                        </c:forEach>


                        <c:if test="${pb.pageNum==pb.total}">

                        <li class="disabled">
                            <a href="${pageContext.request.contextPath}/question/findAll?pages=${pb.pageNum}&size=${pb.pageSize}"
                               aria-label="Next">
                                </c:if>

                                <c:if test="${pb.pageNum!=pb.total}">
                        <li>
                            <a href="${pageContext.request.contextPath}/question/findAll?pages=${pb.pageNum + 1}&size=${pb.pageSize}"
                               aria-label="Next">
                                </c:if>

                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <span style="font-size: 25px;margin-left: 5px;">
                    共${pb.total}条记录，共${pb.pages}页
                </span>

                    </ul>
                </nav>
            </div>
        </div>

    </div>
</div>
</body>
</html>