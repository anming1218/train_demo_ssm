<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>法律援助网—援助详情</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <!--导入本地css-->
    <link href="${pageContext.request.contextPath}/css/mynews.css" rel="stylesheet" type="text/css">

    <script type="text/javascript">

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
<div class="container">
    <div class="row">
        <div class="col-md-12 fl sj " style="background-color: rgb(215,59,62);color: #ffffff">
            新闻中国欢迎您！&nbsp;&nbsp;&nbsp;&nbsp;现在时间：<span style="color: #ffffff;"><span id="nowDateTimeSpan"></span></span>
        </div>
    </div>

    <div class="row">
        <div class="col-md-3"><img src="${pageContext.request.contextPath}/images/fayuan.png"
                                   class="img-responsive center-block" alt="法援网"/></div>
        <div class="col-md-9"><img src="${pageContext.request.contextPath}/images/home.jpg" class="img-responsive "
                                   alt=""/></div>
    </div>

    <div class="row">
        <div class="col-md-3">
            <div class="row">
                <div class="col-md-12 ">
                    <img src="${pageContext.request.contextPath}/images/lawyers.jpg" alt="优秀律师" class="img-thumbnail">
                </div>
            </div>
        </div>


        <div class="col-md-9">
            <div class="row">
                <div class="nmr fr center-block">
                    <div class="wz">
                        <span>您现在的位置：<a
                                href="${pageContext.request.contextPath}/question/answerQuestion/${question.id}">首页</a>&nbsp;>&nbsp;<a>${question.type}</a></span>
                    </div>

                    <div class="nei n1">
                        <div class="con">
                            <h1>${question.pname}</h1>
                            <div class="info">
                                &nbsp;发布类型:${question.type}&nbsp;&nbsp;&nbsp;&nbsp;申请人:${question.uname}&nbsp;&nbsp;&nbsp;&nbsp;查看:${question.details}次
                            </div>
                            <div class="cont">
                                <p style="font-family: -webkit-standard,serif;">${question.details}</p>
                            </div>
                        </div>
                    </div>
                </div>
                <br>

                <c:choose>
                    <c:when test="${loginUser.grade=='1'}">
                        <div style="background: rgb(215,59,62)">
                            <a style="color: white;font-size: medium">律 师 回 复</a>
                        </div>
                        <br>
                        <div class="nei n1">
                            <div class="con">
                                <form action="${pageContext.request.contextPath}/question/answerQuestion"
                                      method="post">
                                    正文：
                                    <br>
                                    <input type="hidden" name="id" value="${question.id}" readonly="readonly"/>
                                    <label>
                                        <textarea class="form-control" rows="3" name="answer"></textarea>
                                    </label>
                                    <br>
                                    &nbsp;&nbsp;<button class="btn-danger" type="submit">提交</button>
                                </form>

                            </div>
                        </div>
                    </c:when>
                    <c:when test="${loginUser.grade=='2'}">

                    </c:when>
                    <c:otherwise>

                        <div style="background: rgb(215,59,62)">
                            <a style="color: white;font-size: medium">律 师 回 复</a>
                        </div>
                        <br>
                        <c:choose>
                            <c:when test="${question.answer==null}">
                                <div class="nei n1">
                                    <div class="con" style="line-height: 30px">
                                        <span style="font-family: 黑体;font-size: 19px">&nbsp;&nbsp;暂无回答！</span>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="nei n1">
                                    <div class="con" style="line-height: 30px">
                                        <span style="font-family: 新宋体;font-size: 17px">&nbsp;&nbsp;${question.answer}</span>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>

                    </c:otherwise>
                </c:choose>


            </div>
        </div>
    </div>
</div>

</body>
</html>