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
    <title>中国法律援助平台</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="../css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="../js/jquery-3.3.1.js" type="text/javascript"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../css/mynews.css" type="text/javascript"></script>
    <script>
        function startTime() {
            const today = new Date();//定义日期对象
            const yyyy = today.getFullYear();//通过日期对象的getFullYear()方法返回年
            let MM = today.getMonth() + 1;//通过日期对象的getMonth()方法返回月
            let dd = today.getDate();//通过日期对象的getDate()方法返回日
            // 如果分钟或小时的值小于10，则在其值前加0，比如如果时间是下午3点20分9秒的话，则显示15：20：09
            MM = checkTime(MM);
            dd = checkTime(dd);
            let day; //用于保存星期（getDay()方法得到星期编号）
            if (today.getDay() === 0) day = "星期日 "
            if (today.getDay() === 1) day = "星期一 "
            if (today.getDay() === 2) day = "星期二 "
            if (today.getDay() === 3) day = "星期三 "
            if (today.getDay() === 4) day = "星期四 "
            if (today.getDay() === 5) day = "星期五 "
            if (today.getDay() === 6) day = "星期六 "
            document.getElementById('nowDateTimeSpan').innerHTML = yyyy + "-" + MM + "-" + dd + " " + day;
            setTimeout('startTime()', 1000);//每一秒中重新加载startTime()方法
        }

        function checkTime(i) {
            if (i < 10) {
                i = "0" + i;
            }
            return i;
        }

    </script>

    <style type="text/css">
        .divcolor:hover {
            background-color: rgb(215, 59, 62);

        }

        .divcolor span:hover {
            color: rgb(255, 255, 255);
        }

        .bg {
            background-image: url("http://cdnming.minglovejuan.club/falv/20201005091956.png");
        }
    </style>
</head>
<body onload="startTime()">
<div class="container-fluid bg">
    <div class="container">
        <!-- 页面顶端 -->
        <div class="row">
            <div class="col-md-11 fl sj bg"
                 style="background-color: rgb(245,245,245);color: rgb(36,36,36);height: 30px">
                <a href="../pages/home.html"><span
                        style="font-size: 18px;line-height: 30px;color: #0f0f0f">返回中国法院网</span></a>
            </div>
            <div class="col-md-1 sj bg" style="background-color: rgb(245,245,245);color: rgb(36,36,36);height: 30px">
            <span style="font-size: 18px;line-height: 30px"><a href="../pages/login.jsp"
                                                               style="color: #0f0f0f">登录</a></span>
            </div>
        </div>

        <!-- 页面顶端图片 -->
        <div class="row">
            <div class="col-md-2">
                <a href="../pages/home.html"><img src="http://cdnming.minglovejuan.club/falv/20200930094135.png"
                                                  class="img-responsive" alt="中国法院网"/></a>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-6 bg">
                <img src="http://cdnming.minglovejuan.club/falv/20200930094729.png" class="img-responsive" alt="民法典"/>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-2">
                <div class="row">
                    <div class="col-md-12">
                        <span style="font-size: 18px;line-height: 50px" id="nowDateTimeSpan"></span>
                    </div>
                    <div class="col-md-12">
                        <span style="font-size: 18px;line-height: 50px">设为首页    |    收藏本页</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- 导航栏 -->
        <div class="row">
            <div class="col-md-1" style="height: 30px">
            </div>
            <div class="col-md-2" style="height: 30px">
                <a href="../pages/home.html"
                   style="color: #0f0f0f;font-size: 18px;line-height: 30px"><span>首页</span></a>
            </div>
            <div class="col-md-2" style="height: 30px">
                <a href="../pages/question_list.jsp"
                   style="color: #0f0f0f;font-size: 18px;line-height: 30px"><span>法律援助</span></a>
            </div>
            <div class="col-md-2" style="height: 30px">
                <a href="../pages/home.html" style="color: #0f0f0f;font-size: 18px;line-height: 30px"><span>普法知识</span></a>
            </div>
            <div class="col-md-12">
                <hr style=" border:0; border-bottom:7px solid red;"/>
            </div>
        </div>

        <!-- 正文 -->
        <div class="row">
            <div class="panel-footer col-md-12">
                <ul class="list-group">
                    <c:forEach items="${pb.list}" var="konwledgeList">
                        <a href="${pageContext.request.contextPath}/knowledge/findKnowledgeById/${konwledgeList.id}"
                           class="list-group-item">
                            <h4 class="list-group-item-heading" style="font-family: 黑体">
                                <img src="http://cdnming.minglovejuan.club/falv/20201006162555.png" width="20"
                                     height="18" alt="小图标">
                                [${konwledgeList.topic}]&nbsp${konwledgeList.title}</h4>
                            <p class="list-group-item-text" style="font-family: 新宋体">${konwledgeList.summary}</p>
                        </a>
                    </c:forEach>
                </ul>
                <div>
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <c:if test="${pb.pageNum == 1}">
                            <li class="disabled">
                                </c:if>

                                <c:if test="${pb.pageNum != 1}">
                            <li>
                                </c:if>


                                <a href="${pageContext.request.contextPath}/knowledge/findKnow?pageNum=${pb.pageNum - 1}&size=8"
                                   aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>


                            <c:forEach begin="1" end="${pb.pages}" var="i">


                                <c:if test="${pb.pageNum == i}">
                                    <li class="active"><a
                                            href="${pageContext.request.contextPath}/knowledge/findKnow?pages=${i}&size=8">${i}</a>
                                    </li>
                                </c:if>
                                <c:if test="${pb.pageNum != i}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/knowledge/findKnow?pages=${i}&rows=8">${i}</a>
                                    </li>
                                </c:if>

                            </c:forEach>


                            <c:if test="${pb.pageNum==pb.pages}">
                            <li class="disabled">
                                    </c:if>

                                    <c:if test="${pb.pageNum!=pb.pages}">
                            <li>
                                <a href="${pageContext.request.contextPath}/knowledge/findKnow?pages=${pb.pageNum + 1}&size=8"
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
</div>
</body>
</html>